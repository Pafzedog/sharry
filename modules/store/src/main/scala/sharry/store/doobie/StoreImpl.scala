package sharry.store.doobie

import bitpeace.{Bitpeace, BitpeaceConfig, TikaMimetypeDetect}
import cats.effect.Effect
import cats.implicits._
import sharry.common.Ident
import sharry.store.migrate.FlywayMigrate
import sharry.store.{AddResult, JdbcConfig, Store}
import doobie._
import doobie.implicits._

final class StoreImpl[F[_]: Effect](jdbc: JdbcConfig, xa: Transactor[F])
    extends Store[F] {
  val bitpeaceCfg =
    BitpeaceConfig(
      "filemeta",
      "filechunk",
      TikaMimetypeDetect,
      Ident.randomId[F].map(_.id)
    )

  def migrate: F[Int] =
    FlywayMigrate.run[F](jdbc)

  def transact[A](prg: doobie.ConnectionIO[A]): F[A] =
    prg.transact(xa)

  def transact[A](prg: fs2.Stream[doobie.ConnectionIO, A]): fs2.Stream[F, A] =
    prg.transact(xa)

  def bitpeace: Bitpeace[F] =
    Bitpeace(bitpeaceCfg, xa)

  def add(insert: ConnectionIO[Int], exists: ConnectionIO[Boolean]): F[AddResult] =
    for {
      save  <- transact(insert).attempt
      exist <- save.swap.traverse(ex => transact(exists).map(b => (ex, b)))
    } yield exist.swap match {
      case Right(_) => AddResult.Success
      case Left((_, true)) =>
        AddResult.EntityExists("Adding failed, because the entity already exists.")
      case Left((ex, _)) => AddResult.Failure(ex)
    }
}
