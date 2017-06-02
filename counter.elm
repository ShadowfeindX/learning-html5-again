import Html exposing (..)
import Html.Events exposing (..)

-- SETUP
main =
    Html.beginnerProgram {
        model = init
        , view = display
        , update = controller
    }

-- END SETUP



-- INIT
type alias Model =
    {
        counter : Int
    }

init =
    {
        counter = 0
    }

-- END INIT

-- DISPLAY
display model = 
    div [  ]
        [ div [] [ text (toString model.counter) ]
        , button [ onClick Dec ] [ text "-" ]
        , button [ onClick Inc ] [ text "+" ]
        , button [ onClick Reset ] [ text "Reset" ]
        ]

-- END DISPLAY

-- CONTROLLER
type Msg = Reset | Inc | Dec

controller msg model = 
    case msg of
        Reset -> init
        Inc -> { counter = model.counter + 1 }
        Dec -> { counter = model.counter - 1 }

-- END CONTROLLER




