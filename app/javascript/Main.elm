module Main exposing (..)

import Browser
import Html exposing (Html, Attribute, div, h1, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MODEL


type alias Model =
  { content : String
  }
-- INIT

init : Model
init =
  { content = "" }

-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Company name", value model.content, onInput Change ] []
    , div [] [ text ("Slug: " ++ slugger model.content) ]
    ]

-- MESSAGE

type Message
  = None

-- UPDATE
type Msg
  = Change String


slugger : String -> String
slugger name = 
  name 
  |> String.toLower
  |> String.toList
  |> List.filter Char.isAlpha
  |> String.fromList

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }

-- SUBSCRIPTIONS

-- MAIN

main =
  Browser.sandbox
    {
      init = init,
      view = view,
      update = update
    }
