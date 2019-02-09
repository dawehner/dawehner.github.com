module Main exposing (main)

import Browser
import Html
import Html.Attributes
import Json.Decode as JD


type alias Model =
    Result JD.Error (List Podcast)


type alias Podcast =
    { title : String
    , url : String
    }


decodePodcasts : JD.Decoder (List Podcast)
decodePodcasts =
    JD.list
        (JD.map2 Podcast
            (JD.field "text" JD.string)
            (JD.field "xmlurl" JD.string)
        )


init : JD.Value -> ( Model, Cmd () )
init flags =
    ( JD.decodeValue decodePodcasts flags
    , Cmd.none
    )


update : () -> Model -> ( Model, Cmd () )
update msg model =
    ( model, Cmd.none )


view : Model -> Html.Html ()
view model =
    case model of
        Err err -> JD.errorToString err |> Html.text

        Ok podcasts ->
            Html.ul [] <|
                List.map
                    (\podcast ->
                        Html.li []
                            [(
                              Html.a [Html.Attributes.href podcast.url] [
                                Html.text podcast.title
                              ]
                              )]
                    )
                    podcasts


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = view
        }
