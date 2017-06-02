import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

-- STATE
main =
    Html.beginnerProgram {
        model = init
        , view = display
        , update = controller
    }

-- END STATE

-- INIT
init =
    {
        content = ""
    }

-- END INIT

-- DISPLAY
display state = 
    div [  ]
        [ input [ placeholder "Text to Reverse", onInput Change ] []
        , button [ onClick Reset ] [ text "Reset" ]
        , hr [][]
        , div [] [ text (String.reverse state.content)]
        ]

-- END DISPLAY

-- CONTROLLER
type Msg = Reset | Change String

controller msg state = 
    case msg of
        Reset -> init
        Change new_content -> { content = new_content }

-- END CONTROLLER




