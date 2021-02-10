___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Microsoft Clarity - Official",
  "categories": ["ANALYTICS", "HEAT_MAP", "SESSION_RECORDING"],
  "brand": {
    "id": "Microsoft",
    "displayName": "Microsoft",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACABAMAAAAxEHz4AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAElBMVEUAAADyUCJ/ugAApO//uQD///8951e2AAAAAXRSTlMAQObYZgAAAAFiS0dEBfhv6ccAAAAHdElNRQfkCgUWITsZUDiiAAAAS0lEQVRo3u3MQQ3AIAAEsMuCAGZhCkiwgH9NOLj3Hq2A5q1m8nxVBAKBQCAQCAQCgUAgEPSAP9jVSsapBAKBQCAQCAQCgUAgEPTgAruK0CdlWNSzAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTEwLTA1VDIyOjMzOjU5KzAwOjAwPT1n8QAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0xMC0wNVQyMjozMzo1OSswMDowMExg300AAAAASUVORK5CYII\u003d"
  },
  "description": "Clarity is a user behavior analytics tool, which helps you understand how users are interacting with your website. Supported features include:\nSession Recordings\nHeatmaps\nML Insights",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "projectId",
    "displayName": "Clarity Project Id",
    "simpleValueType": true,
    "help": "Copy your clarity project Id here. You can find it in the project Url from the browser. Example: https://clarity.microsoft.com/projects/view/\"projectId\"/",
    "valueValidators": [
      {
        "type": "NON_EMPTY",
        "errorMessage": "You must provide a clarity project Id"
      },
      {
        "type": "REGEX",
        "args": [
          "[0-9a-z]+"
        ],
        "errorMessage": "Incorrect project Id. You can find it in the project Url from the browser. Example: https://clarity.microsoft.com/projects/view/\"projectId\"/"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Require the necessary APIs
const injectScript = require('injectScript');
const queryPermission = require('queryPermission');
const createArgumentsQueue = require('createArgumentsQueue');
const encodeUri = require('encodeUri');

//Create clarity const
const clarity = createArgumentsQueue('clarity', 'clarity.q');

// Reconstruct customer clarity script URL
const url = "https://www.clarity.ms/tag/"+encodeUri(data.projectId);

// Handle Success
const onCustomerSuccess = () => {
  data.gtmOnSuccess();
};

// Handle Failure
const onCustomerFailure = () => {
  data.gtmOnFailure();
};


// If the URL input by the user matches the permissions set for the template,
// inject the script with the onSuccess and onFailure methods as callbacks.
if (queryPermission('inject_script', "https://www.clarity.ms")) {
  injectScript(url, onCustomerSuccess, onCustomerFailure);
} else {
  data.gtmOnFailure();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.clarity.ms/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "clarity"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "clarity.q"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 2/2/2021, 12:41:15 PM


