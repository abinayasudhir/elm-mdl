import MDL exposing (..)
import Html exposing (div, button, text, br)
import Html.Attributes exposing (..)


main = page <| div [] 
    [ button [btnClsShorthand "icon accent ripple"]  [icon "mood"]
    , br [] []
    , button [btnClsShorthand "raised accent ripple"]  [text "Submit"]
    , br [] []
    , button [class "mdl-button mdl-js-button", disabled True]  [text "Delete"]
    ]