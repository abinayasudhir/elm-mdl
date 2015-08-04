module Mdl (page, icon, btnClsShorthand) where 

{-| This library provides shortcuts for Material Design Lite library.

# Definition
@docs icon, btnClsShorthand, page


-}

import Html 
import Html.Attributes exposing (..)
import String exposing (contains, trim, split, join, isEmpty)

mdl_styles = """
@import url(https://storage.googleapis.com/code.getmdl.io/1.0.2/material.indigo-pink.min.css);
@import url(https://fonts.googleapis.com/icon?family=Material+Icons);
@import url(https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en)
"""
mdl_js = "https://storage.googleapis.com/code.getmdl.io/1.0.2/material.min.js"


{-| material-icons shortcut.

    icon "add"
-}
icon : String -> Html.Html
icon name = Html.i [class "material-icons"] [Html.text name]


{-| shorthand for creating button classes

    btnClsShorthand "raised primary ripple" 
-}


btnClsShorthand : String -> Html.Attribute  
btnClsShorthand s = 
    let 
        base = "mdl-button mdl-js-button " 
        tcls = split " " s 
        |> List.filter (\s -> not (isEmpty <| trim s)) 
        |> List.filter (\x -> not <| contains "ripple" x) 
        --|> List.filter (\x -> not <| contains "disabled" x) 
        |> List.map (\x -> " mdl-button--" ++ (trim x)) 
        |> join ""
        |> (++) (if (contains "mini-fab" s) then " mdl-button--fab" else "") 
        |> (++) (if contains "ripple" s then " mdl-js-ripple-effect" else "")
        
        cls = base ++ tcls

    in  
        class cls 


{-| helper function to load the CSS, Fonts and JS of Material Design Lite

    page content
-}
page : Html.Html -> Html.Html 
page content = 
    Html.div [] 
    [ Html.node "style" [type' "text/css"] [Html.text mdl_styles]
    , Html.node "script" [src mdl_js] []
    , content
    ]