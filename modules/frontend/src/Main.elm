module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Events as Events



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { count : Int
    }


init : flags -> ( Model, Cmd Msg )
init _ =
    ( { count = 0 }, Cmd.none )



-- UPDATE


type Msg
    = Increment


update : Msg -> Model -> ( Model, Cmd Msg )
update Increment model =
    ( { model | count = model.count + 1 }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.span [] [ Html.text (Debug.toString model.count) ]
        , Html.button [ Events.onClick Increment ] [ Html.text "Increment" ]
        ]
