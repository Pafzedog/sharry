module Messages.AliasForm exposing
    ( Texts
    , de
    , gb
    , fr
    )

import Html exposing (..)
import Messages.ValidityField
import Messages.YesNoDimmer


type alias Texts =
    { id : String
    , noteToIdsHead : String
    , noteToIds : Html Never
    , name : String
    , validity : String
    , enabled : String
    , submit : String
    , back : String
    , delete : String
    , yesNo : Messages.YesNoDimmer.Texts
    , validityField : Messages.ValidityField.Texts
    }


gb : Texts
gb =
    { id = "Id"
    , noteToIdsHead = "Note to Ids"
    , noteToIds =
        p []
            [ text "This ID is part of the url where "
            , em [] [ text "everyone" ]
            , text " can upload files. It is recommended to use"
            , text " something random. The id can be changed to "
            , text "any value, but if it is left empty, a random "
            , text "one will be generated."
            ]
    , name = "Name"
    , validity = "Validity"
    , enabled = "Enabled"
    , submit = "Submit"
    , back = "Back"
    , delete = "Delete"
    , yesNo = Messages.YesNoDimmer.gb
    , validityField = Messages.ValidityField.gb
    }


de : Texts
de =
    { id = "Id"
    , noteToIdsHead = "Zu IDs"
    , noteToIds =
        p []
            [ text "Die ID ist Teil der URL, über welche "
            , em [] [ text "jeder" ]
            , text " Dateien hochladen kann. Es ist empfohlen hier"
            , text " etwas Zufälliges zu nehmen. Die ID kann zwar zu  "
            , text " irgendeinen Wert geändert werden, ist das Feld aber leer,"
            , text " wird eine zufällige ID erzeugt."
            ]
    , name = "Name"
    , validity = "Gültigkeit"
    , enabled = "Aktiv"
    , submit = "Speichern"
    , back = "Zurück"
    , delete = "Löschen"
    , yesNo = Messages.YesNoDimmer.de
    , validityField = Messages.ValidityField.de
    }

fr : Texts
fr =
    { id = "Id"
    , noteToIdsHead = "À propos des Ids"
    , noteToIds =
        p []
            [ text "L'Id fait partie de l'url où "
            , em [] [ text "quiconque" ]
            , text " peut envoyer des fichiers. Il est recommandé d'utiliser "
            , text " quelque chose d'aléatoire. L'Id peut être modifiée à "
            , text "n'importe quelle valeur, mais si elle est laissée vide, "
            , text "une valeur aléatoire sera générée."
            ]
    , name = "Nom"
    , validity = "Validité"
    , enabled = "Activé"
    , submit = "Envoyer"
    , back = "Retour"
    , delete = "Supprimer"
    , yesNo = Messages.YesNoDimmer.fr
    , validityField = Messages.ValidityField.fr
    }
