module MDL where 

{-| This library provides shortcuts for Material Design Lite library.

# Definition
@docs icon


-}

import Html exposing (Html, node, text, button, i)
import Html.Attributes exposing (class, disabled, style)


{-| material-icons shortcut.

    icon "add"
-}
icon : String -> Html
icon name = i [class "material-icons"] [text name]