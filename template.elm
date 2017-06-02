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
    {    }

-- END INIT

-- DISPLAY
display state = 
    div [  ]
        [  ]

-- END DISPLAY

-- CONTROLLER
type Msg = Reset

controller msg state = 
    case msg of
        Reset -> init

-- END CONTROLLER
