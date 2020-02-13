module Main exposing (..)

import Browser
import Html exposing (Html, div, section, label, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MODEL


type alias Model =
  { name : String
  , slug : String
  }
-- INIT

init : Model
init =
  { name = ""
  , slug = "" }

-- VIEW


view : Model -> Html Msg
view model =
  div [] [
    div [] [ label [for "company_name"] [ text "Name"], input [ type_ "text", id "company_name", name "company[name]", value model.name, onInput Change ] [] ],
    div [] [ label [for "company_slug"] [ text "Slug"], input [ type_ "text", name "company[slug]", value (slugger model.name)] [] ]
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
      { model | name = newContent }

-- SUBSCRIPTIONS

-- MAIN

main =
  Browser.sandbox
    {
      init = init,
      view = view,
      update = update
    }
