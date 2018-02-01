module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode

api : String
api =
    "https://swapi.co/api/"

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

-- MODEL

type alias Model =
    { planetName : String
    , api : String}

type Msg = SetPlanetName String

model : Model
model =
    {planetName = "Endor"
    , api = api}

-- UPDATE

update : Msg -> Model -> Model
update msg model = 
    case msg of 
        SetPlanetName string -> 
            { model | planetName = string }

-- VIEW

view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "width", "85vw" )
            , ( "height", "85vh" )
            , ( "padding", "20px" )
            , ( "margin", "20px" )
            , ( "border", "1px solid black" )
            , ( "border-radius", "15px" )
            ]
        ]
        [ h1 [ style [ ( "text-align", "center" ) ] ] [ text "Welcome to the Star Wars Universe" ]
        , div [] [ label [] [text "Enter the name of a planet"] ]
        , input [ placeholder "Tatooine", onInput SetPlanetName, value model.planetName ] []
        , div [] []
        ]