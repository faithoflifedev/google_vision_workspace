# Google Vision REST API CLI

A command line interface for making API requests to the Google Vision service with cli commands.


## Installation

Install using `dart pub`:

```sh
dart pub global activate google_vision
```

Install using `brew`:

```sh
brew tap faithoflifedev/google_vision
brew install vision
```

Run the following command to see help:

```sh
vision --help
```

Result,

```text
A command line interface for making API requests to the Google Vision service with cli commands.

Usage: vision <command> [arguments]

Global options:
-h, --help                                       Print this usage information.
    --credential-file=<credentials file path>    (defaults to "/Users/chris/.vision/credentials.json")

Available commands:
  detect      Run image detection and annotation for images.
  highlight   Draw a box to highlight any objects detected.
  score       For OBJECT_LOCALIZATION, get the score(s) for the object specified with "look-for".
```

| command   | description |
| --------- | ----------- |
| detect    | Run image detection and annotation for images. |
| highlight | Draw a box to highlight any objects detected. |
| score     | For OBJECT_LOCALIZATION, get the score(s) for the object specified with "look-for". |

Just like the main library, any responses provided by the above commands will be given in the JSON format.  So ideally you will want to use a command line json parser to interpret the results.  The recommended json parser for this purpose is [_jq_](https://stedolan.github.io/jq/).  With _jq_ you can process the results of a command as follows:


Just like the main library, any responses provided by the above commands will be given in the JSON format.  So ideally, you will want to use a command line json parser to interpret the results.  The recommended json parser for this purpose is [_jq_](https://stedolan.github.io/jq/).  With _jq_ you can process the results of a command as follows:

## Quick start

```sh
# step 1 - setup default default JWT credentials
cp my_credentials.json ~/.vision/credentials.json

# step 2
vision highlight --features OBJECT_LOCALIZATION --image-file my_source_image.jpg --output-file result.jpg
```

## detect

```sh
prompt>vision detect --help
Run image detection and annotation for an images.

Usage: vision detect [arguments]
-h, --help                                        Print this usage information.
    --image-file=<image file path> (mandatory)    The path to the file that will be processed.
    --features (mandatory)                        Comma separated list of detections to be done on the image. See [https://cloud.google.com/vision/docs/reference/rest/v1/Feature#Type]
    --max-results=<number>                        The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 10.
                                                  (defaults to "10")
```

## highlight

```sh
prompt>vision highlight --help
Draw a box to highlight any objects detected.

Usage: vision highlight [arguments]
-h, --help                                         Print this usage information.
    --image-file=<image file path> (mandatory)     The path to the file that will be processed.
    --output-file=<image file path> (mandatory)    The path to the image file that will display the detected objects highlighted
    --features                                     Comma separated list of detections to be done on the image. See [https://cloud.google.com/vision/docs/reference/rest/v1/Feature#Type]
    --look-for                                     Comma separated list of Objects to provide a core for
    --max-results=<int>                            The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 10.
                                                   (defaults to "10")
```

## score

```sh
prompt>vision score --help
For OBJECT_LOCALIZATION, get the score(s) for the object specified with "look-for".

Usage: vision score [arguments]
-h, --help                                        Print this usage information.
    --image-file=<image file path> (mandatory)    The path to the file that will be processed.
    --features (mandatory)                        Comma separated list of detections to be done on the image. See [https://cloud.google.com/vision/docs/reference/rest/v1/Feature#Type]
    --look-for                                    Comma separated list of Objects to provide a score for
    --max-results=<int>                           The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 10.
                                                  (defaults to "10")
```
