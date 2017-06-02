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
    { counter = 0
    , text_reverse = ""
    , login_info = ("", "", "")
    }

-- END INIT

-- DISPLAY
display state = 
    div [  ]
        [ display_Counter state
        , hr [][]
        , display_TextReverse state
        , hr [][]
        , display_LoginInfo state
        ]

display_Counter state = 
    div [] 
        [ button [ onClick Dec ] [ text "-" ]
        , text (toString state.counter)
        , button [ onClick Inc ] [ text "+" ]
        , button [ onClick (Reset Counter) ] [ text "Reset" ]
        ]

display_TextReverse state = 
    div []
        [ input [ placeholder "Text to Reverse", onInput Reverse, value state.text_reverse ] []
        , button [ onClick (Reset TextReverse) ] [ text "Reset" ]
        , div [] [ text (String.reverse state.text_reverse)] 
        ]

display_LoginInfo state = 
    let
        (u, p, pa) = state.login_info
        
        (red, green) = ([style [("color", "red")]], [style [("color", "green")]])

        (color, message) = 
            if u == "" then
                (red, [text "Invalid Username!"])
            else if p == pa then
                (green, [text "OK!"])
            else
                (red, [text "Password Mismatch!"])
    in
        div []
            [ text "Username: "
            , input [ placeholder "Enter Username", onInput (Update Username) ] []
            , br [] []
            , text "Password: "
            , input [ type_ "password", placeholder "Enter Password", onInput (Update Password) ] []
            , br [] []
            , text "Confirm Password: "
            , input [ type_ "password", placeholder "Enter Password", onInput (Update PasswordAgain) ] []
            , br [] []
            , button [] [ text "Submit" ]
            , span color message
            ]

-- END DISPLAY

-- CONTROLLER
type Model = Counter | TextReverse | LoginInfo
type UserData = Username | Password | PasswordAgain
type Msg = Reset Model | Reverse String | Inc | Dec | Update UserData String

controller msg state = 
    case msg of
        Reset Counter -> { state | counter = init.counter }
        Reset TextReverse -> { state | text_reverse = init.text_reverse }
        Reset LoginInfo -> { state | login_info = init.login_info }
        Reverse new_content -> { state | text_reverse = new_content }
        Inc -> { state | counter = state.counter + 1 }
        Dec -> { state | counter = state.counter - 1 }
        Update field data -> { state | login_info = (update_login state.login_info field data) }

update_login info field data = 
    let
        (u, p, pa) = info
    in
        case field of
            Username -> (data, p, pa)
            Password -> (u, data, pa)
            PasswordAgain -> (u, p, data)

-- END CONTROLLER




