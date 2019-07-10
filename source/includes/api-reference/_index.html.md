<!-- Generator: Widdershins v3.6.6 -->

<h1 id="asana">API Reference</h1>

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

This is the interface for interacting with the [Asana Platform](https://asana.com/developers/). Our API reference is generated from our [OpenAPI spec] (https://github.com/Asana/developer-docs/blob/master/defs/asana_oas.json).

Base URLs:

* <a href="https://app.asana.com/api/1.0">https://app.asana.com/api/1.0</a>

    * **version** - The version of the API to use. Default: 1.0

        * 1.0

<a href="https://asana.com/terms">Terms of service</a>
Web: <a href="https://asana.com/support">Asana Support</a> 
License: <a href="https://www.apache.org/licenses/LICENSE-2.0">Apache 2.0</a>

# Authentication

- HTTP Authentication, scheme: bearer A personal access token allows access to the api for the user who created it. This should be kept a secret and be treated like a password.

- oAuth2 authentication. We require that applications designed to access the Asana API on behalf of multiple users implement OAuth 2.0.
Asana supports both the Authorization Code Grant flow, and the Implicit Grant flows.

    - Flow: authorizationCode
    - Authorization URL = [https://app.asana.com/-/oauth_authorize](https://app.asana.com/-/oauth_authorize)
    - Token URL = [https://app.asana.com/-/oauth_token](https://app.asana.com/-/oauth_token)

    - Flow: implicit
    - Authorization URL = [https://app.asana.com/-/oauth_authorize](https://app.asana.com/-/oauth_authorize)

<h1 id="asana-attachments">Attachments</h1>

An *attachment* object represents any file attached to a task in Asana, whether it’s an uploaded file or one associated via a third-party service such as Dropbox or Google Drive.

## Get an attachment

<a id="opIdgetAttachment"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/attachments/{attachment_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/attachments/{attachment_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/attachments/{attachment_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/attachments/{attachment_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/attachments/{attachment_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/attachments/{attachment_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /attachments/{attachment_gid}`

Get the full record for a single attachment.

<h3 id="get-an-attachment-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|attachment_gid|path|integer|true|Globally unique identifier for the attachment.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "attachment",
    "name": "Screenshot.png",
    "created_at": "2012-02-22T02:06:58.147Z",
    "download_url": "https://www.dropbox.com/s/123/Screenshot.png?dl=1",
    "host": "dropbox",
    "parent": null,
    "view_url": "https://www.dropbox.com/s/123/Screenshot.png"
  }
}
```

<h3 id="get-an-attachment-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the record for a single attachment.|[Attachment](#schemaattachment)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get attachments for a task

<a id="opIdgetAttachmentsForTask"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/attachments \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/attachments',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tasks/{task_gid}/attachments', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tasks/{task_gid}/attachments', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/attachments");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tasks/{task_gid}/attachments',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tasks/{task_gid}/attachments`

Returns the compact records for all attachments on the task.

<h3 id="get-attachments-for-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|task_gid|path|integer|true|Globally unique identifier for the task.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "attachment",
      "name": "Screenshot.png"
    }
  ]
}
```

<h3 id="get-attachments-for-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the compact records for all attachments on the task.|[Attachment](#schemaattachment)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Upload an attachment

<a id="opIduploadAttachmentToTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/attachments \
  -H 'Content-Type: multipart/form-data' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "file": "string"
}';
const headers = {
  'Content-Type':'multipart/form-data',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/attachments',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'multipart/form-data',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/attachments', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'multipart/form-data',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/attachments', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/attachments");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'multipart/form-data',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/attachments',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/attachments`

Upload an attachment.

This method uploads an attachment to a task and returns the compact
record for the created attachment object. It is not possible to attach
files from third party services such as Dropbox, Box & Google Drive via
the API. You must download the file content first and then upload it as
any other attachment.

The 100MB size limit on attachments in Asana is enforced on this endpoint.

This endpoint expects a multipart/form-data encoded request containing
the full contents of the file to be uploaded.

Below is an example of what a well formed multipart/form-data encoded
request might look like.

```
Authorization: Basic <BASE64_ENCODED_API_KEY>
Content-Type: multipart/form-data; boundary=<UNIQUE_BOUNDARY>
User-Agent: Java/1.7.0_76
Host: localhost
Accept: */*
Connection: keep-alive
Content-Length: 141

--<UNIQUE_BOUNDARY>
Content-Disposition: form-data; name="file"; filename="example.txt"
Content-Type: text/plain

<RAW_FILE_DATA>

--<UNIQUE_BOUNDARY>--
```

Requests made should follow the HTTP/1.1 specification that line
terminators are of the form `CRLF` or `\r\n` outlined
[here](http://www.w3.org/Protocols/HTTP/1.1/draft-ietf-http-v11-spec-01#Basic-Rules)
in order for the server to reliably and properly handle the request.

> Body parameter

```yaml
file: string

```

<h3 id="upload-an-attachment-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The file you want to upload.|
|task_gid|path|integer|true|Globally unique identifier for the task.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Detailed descriptions

**body**: The file you want to upload.

**Note when using curl:**

Be sure to add an `‘@’` before the file path, and use the `—form`
option instead of the `-d` option.

When uploading PDFs with curl, force the content-type to be pdf by
appending the content type to the file path: `—form
“file=@file.pdf;type=application/pdf”`.

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "attachment",
    "name": "Screenshot.png",
    "created_at": "2012-02-22T02:06:58.147Z",
    "download_url": "https://www.dropbox.com/s/123/Screenshot.png?dl=1",
    "host": "dropbox",
    "parent": null,
    "view_url": "https://www.dropbox.com/s/123/Screenshot.png"
  }
}
```

<h3 id="upload-an-attachment-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully uploaded the attachment to the task.|[Attachment](#schemaattachment)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-batch-api">Batch API</h1>

There are many cases where you want to accomplish a variety of work in the Asana API but want to minimize the number of HTTP requests you make. For example:

* Modern browsers limit the number of requests that a single web page can
  make at once.
* Mobile apps will use more battery life to keep the cellular radio on
  when making a series of requests.
* There is an overhead cost to developing software that can make multiple
  requests in parallel.
* Some cloud platforms handle parallelism poorly, or disallow it
  entirely.
* To make development easier in these use cases, Asana provides a **batch
  API** that enables developers to perform multiple “actions” by making
  only a single HTTP request.

### Making a Batch Request
To make a batch request, send a `POST` request to `/batch`. Like other `POST` endpoints, the body should contain a `data` envelope. Inside this envelope should be a single `actions` field, containing a list of “action” objects.  Each action represents a standard request to an existing endpoint in the Asana API.
**The maximum number of actions allowed in a single batch request is 10**. Making a batch request with no actions in it will result in a `400 Bad Request`.
When the batch API receives the list of actions to execute, it will dispatch those actions to the already-implemented endpoints specified by the `relative_path` and `method` for each action. This happens in parallel, so all actions in the request will be processed simultaneously. There is no guarantee of the execution order for these actions, nor is there a way to use the output of one action as the input of another action (such as creating a task and then commenting on it).
The response to the batch request will contain (within the `data` envelope) a list of result objects, one for each action. The results are guaranteed to be in the same order as the actions in the request, e.g., the first result in the response corresponds to the first action in the request.
The batch API will always attempt to return a `200 Success` response with individual result objects for each individual action in the request. Only in certain cases (such as missing authorization or malformed JSON in the body) will the entire request fail with another status code. Even if every individual action in the request fails, the batch API will still return a `200 Success` response, and each result object in the response will contain the errors encountered with each action.
### Rate Limiting
The batch API fully respects all of our rate limiting. This means that a batch request counts against *both* the standard rate limiter and the concurrent request limiter as though you had made a separate HTTP request for every individual action. For example, a batch request with five actions counts as five separate requests in the standard rate limiter, and counts as five concurrent requests in the concurrent request limiter. The batch request itself incurs no cost.
If any of the actions in a batch request would exceed any of the enforced limits, the *entire* request will fail with a `429 Too Many Requests` error. This is to prevent the unpredictability of which actions might succeed if not all of them could succeed.
### Restrictions
Not every endpoint can be accessed through the batch API. Specifically, the following actions cannot be taken and will result in a `400 Bad Request` for that action:

* Uploading attachments
* Creating, getting, or deleting organization exports
* Any SCIM operations
* Nested calls to the batch API

## Submit parallel requests

<a id="opIdbatchRequest"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/batch \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "actions": [
      {}
    ]
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/batch',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/batch', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/batch', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/batch");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/batch',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /batch`

Make multiple requests in parallel to Asana's API.

> Body parameter

```json
{
  "data": {
    "actions": [
      {}
    ]
  }
}
```

<h3 id="submit-parallel-requests-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The requests to batch together via the Batch API.|
|» data|body|object|false|none|
|»» actions|body|[[BatchRequest](#schemabatchrequest)]|false|[A request object for use in a batch request.]|
|»»» relative_path|body|string|true|The path of the desired endpoint relative to the API’s base URL. Query parameters are not accepted here; put them in `data` instead.|
|»»» method|body|string|true|The HTTP method you wish to emulate for the action.|
|»»» data|body|object|false|For `GET` requests, this should be a map of query parameters you would have normally passed in the URL. Options and pagination are not accepted here; put them in `options` instead. For `POST`, `PATCH`, and `PUT` methods, this should be the content you would have normally put in the data field of the body.|
|»»» options|body|object|false|Pagination (`limit` and `offset`) and output options (`fields` or `expand`) for the action. “Pretty” JSON output is not an available option on individual actions; if you want pretty output, specify that option on the parent request.|
|»»»» limit|body|integer|false|Pagination limit for the request.|
|»»»» offset|body|integer|false|Pagination offset for the request.|
|»»»» fields|body|[string]|false|The fields to retrieve in the request.|
|»»»» expand|body|string|false|The expansion path for the request.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| method|get|
| method|post|
| method|put|
| method|delete|
| method|patch|
| method|head|

> 200 Response

```json
{
  "data": [
    {
      "status_code": 200,
      "headers": {},
      "body": {}
    }
  ]
}
```

<h3 id="submit-parallel-requests-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully completed the requested batch API operations.|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h3 id="submit-parallel-requests-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
| data|[[BatchResponse](#schemabatchresponse)]|false|none|[A response object returned from a batch request.]|
| status_code|integer|false|none|The HTTP status code that the invoked endpoint returned.|
| headers|object|false|none|A map of HTTP headers specific to this result. This is primarily used for returning a `Location` header to accompany a `201 Created` result.  The parent HTTP response will contain all common headers.|
| body|object|false|none|The JSON body that the invoked endpoint returned.|

<h1 id="asana-custom-fields">Custom Fields</h1>

In the Asana application, Tasks can hold user-specified Custom Fields which provide extra information; for example, a priority value or a number representing the time required to complete a Task. This lets a user define the type of information that each Task within a Project can contain in addition to the built-in fields that Asana provides.

**Note:** Custom Fields are a premium feature. Integrations which work with Custom Fields need to handle an assortment of use cases for free and premium users in context of free and premium organizations. For a detailed examination of to what data users will have access in different circumstances, read the section below on [access control](#access-control).

The characteristics of Custom Fields are:

* There is metadata that defines the Custom Field. This metadata is shared across an entire organization or workspace. * Projects can have Custom Fields associated with them individually. This is conceptually akin to adding columns in a database or a spreadsheet: every Task (row) in the Project (table) can contain information for that field, including "blank" values, i.e. `null` data. * Tasks have Custom Field _values_ assigned to them.

A brief example: let's imagine that an organization has defined a Custom Field for "Priority". This field is of `enum` type and can have user-defined values of `Low`, `Medium`, or `High`. This is the field metadata, and it is visible within, and shared across, the entire organization.

A Project is then created in the organization, called "Bugs", and the "Priority" Custom Field is associated with that Project. This will allow all Tasks within the "Bugs" Project to have an associated "Priority".

A new Task is created within "Bugs". This Task, then, has a field named "Priority" which can take on the Custom Field value of one of `[null]`, `Low`, `Medium`, and `High`.

These Custom Fields are accessible via the API through a number of endpoints at the top level (e.g. `/custom_fields` and `/custom_field_settings`) and through calls on Workspaces, Projects, and Tasks resources. The API also provides a way to fetch both the metadata and data which define each particular Custom Field, so that a client application may render proper UI to display or edit the values.

Custom Field aware integrations need to be aware of the basic types that Custom Fields can adopt. These types are:

* `text` - an arbitrary, relatively short string of text * `number` - a number with a defined level of precision * `enum` - a selection from a defined list of options

Text fields are currently limited to 1024 characters. On Tasks, their Custom Field value will have a `text_value` property to represent this field.

Number fields can have an arbitrary `precision` associated with them; for example, a precision of `2` would round its value to the second (hundredths) place, i.e. 1.2345 would round to 1.23. On Tasks, the Custom Field value will have a `number_value` property to represent this field.

Enum fields represent a selection from a list of options. On the metadata, they will contain all of the options in an array. Each option has 4 properties:

* `id` - the id of this enum option. Note that this is the id of the _option_ - the Custom Field itself has a separate `id`. * `name` - the name of the option, e.g. "Choice #1" * `enabled` - whether this field is enabled. Disabled fields are not available to choose from when disabled, and are visually hidden in the Asana application, but they remain in the metadata for Custom Field values which were set to the option before the option was disabled. * `color` - a color associated with this choice.

On the Task's Custom Field value, the enum will have an `enum_value` property which will be the same as one of the choices from the list defined in the Custom Field metadata.

The [Custom Field API Reference](/developers/api-reference/custom_fields) contains information about the specifics of how to use Custom Fields in conjunction with Asana's API.

## Create a custom field

<a id="opIdcreateCustomField"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/custom_fields \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Bug Task",
    "type": "text",
    "enum_options": [
      {}
    ],
    "enum_value": null,
    "enabled": true,
    "text_value": "Some Value",
    "description": "Development team priority",
    "precision": 2,
    "workspace": 1331
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/custom_fields',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/custom_fields', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/custom_fields', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/custom_fields");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/custom_fields',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /custom_fields`

Creates a new custom field in a workspace. Every custom field is required
to be created in a specific workspace, and this workspace cannot be
changed once set.

A custom field’s name must be unique within a workspace and not conflict
with names of existing task properties such as ‘Due Date’ or ‘Assignee’.
A custom field’s type must be one of ‘text’, ‘enum’, or ‘number’.

Returns the full record of the newly created custom field.

> Body parameter

```json
{
  "data": {
    "name": "Bug Task",
    "type": "text",
    "enum_options": [
      {}
    ],
    "enum_value": null,
    "enabled": true,
    "text_value": "Some Value",
    "description": "Development team priority",
    "precision": 2,
    "workspace": 1331
  }
}
```

<h3 id="create-a-custom-field-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The custom field object to create.|
|» data|body|any|false|none|
|»» *anonymous*|body|[CustomField](#schemacustomfield)|false|Custom Fields store the metadata that is used in order to|
|»»» id|body|integer(int64)|false|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|body|string|false|Globally unique ID of the object, as a string.|
|»»» resource_type|body|string|false|The base type of this resource.|
|»»» name|body|string|false|The name of the object.|
|»»» resource_subtype|body|string|false|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|»»» type|body|string|false|**Deprecated: new integrations should prefer the resource_subtype field.** The type of the custom field. Must be one of the given values.|
|»»» enum_options|body|[object]|false|**Conditional**. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](https://asana.com/developers/api-reference/custom_fields#enum-options).|
|»»»» id|body|integer(int64)|false|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»»» gid|body|string|false|Globally unique ID of the object, as a string.|
|»»»» resource_type|body|string|false|The base type of this resource.|
|»»»» name|body|string|false|The name of the enum option.|
|»»»» enabled|body|boolean|false|The color of the enum option. Defaults to ‘none’.|
|»»»» color|body|string|false|Whether or not the enum option is a selectable value for the custom field.|
|»»» enum_value|body|any|false|none|
|»»» enabled|body|boolean|false|**Conditional**. Determines if the custom field is enabled or not.|
|»»» text_value|body|string|false|**Conditional**. This string is the value of a text custom field.|
|»»» description|body|string|false|[Opt In](/developers/documentation/getting-started/input-output-options). The description of the custom field.|
|»»» precision|body|integer|false|Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.|
|»» *anonymous*|body|object|false|none|
|»»» workspace|body|integer|true|The workspace to create a custom field in.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Detailed descriptions

** *anonymous***: Custom Fields store the metadata that is used in order to
add user-specified information to tasks in Asana. Be sure
to reference the [Custom Fields]
(https://asana.com/developers/documentation/getting-started/custom-fields)
developer documentation for more information about how custom fields
relate to various resources in Asana.

Users in Asana can [lock custom fields]
(https://asana.com/guide/help/premium/custom-fields#gl-lock-fields),
which will make them read-only when accessed by other users.
Attempting to edit a locked custom field will return HTTP error code
`403 Forbidden`.

#### Enumerated Values

|Parameter|Value|
|---|---|
| type|text|
| type|enum|
| type|number|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "custom_field",
    "name": "Bug Task",
    "resource_subtype": "milestone",
    "type": "text",
    "enum_options": [
      {}
    ],
    "enum_value": null,
    "enabled": true,
    "text_value": "Some Value",
    "description": "Development team priority",
    "precision": 2
  }
}
```

<h3 id="create-a-custom-field-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Custom field successfully created.|[CustomField](#schemacustomfield)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a custom field definition

<a id="opIdgetCustomField"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/custom_fields/{custom_field_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /custom_fields/{custom_field_gid}`

Get the complete definition of a custom field’s metadata.

Since custom fields can be defined for one of a number of types, and
these types have different data and behaviors, there are fields that are
relevant to a particular type. For instance, as noted above, enum_options
is only relevant for the enum type and defines the set of choices that
the enum could represent. The examples below show some of these
type-specific custom field definitions.

**Get the metadata for a custom field of type ‘text’**

```
# Request
curl -H "Authorization: Bearer <personal_access_token>" \
https://app.asana.com/api/1.0/custom_fields/124578
```

```
# Response
HTTP/1.1 200
{
  "data": [
    {
      "id": 134679,
      "name": "Owner",
      "description": "Person responsible for task",
      "type": "text"
    }
  ]
}
```

**Get the metadata for a custom field of type ‘number’**

```
# Request
curl -H "Authorization: Bearer <personal_access_token>" \
https://app.asana.com/api/1.0/custom_fields/124578
```

```
# Response
HTTP/1.1 200
{
  "data": [
    {
      "id": 938271,
      "name": "Price",
      "description": "In US Dollars",
      "type": "number",
      "precision": 2
    }
  ]
}
```

**Get the metadata for a custom field when that field is of type ‘enum’.**

```
# Request
curl -H "Authorization: Bearer <personal_access_token>" \
https://app.asana.com/api/1.0/custom_fields/124578
```

```
# Response
HTTP/1.1 200
{
  "data": [
    {
      "id": 124578,
      "name": "Priority",
      "description": "Development team priority",
      "type": "enum",
      "enum_options": [
        {
          "id": 789,
          "name": "Low",
          "enabled": true,
          "color": "blue"
        },
        {
          "id": 208,
          "name": "Medium",
          "enabled": false,
          "color": "yellow"
        },
        {
          "id": 439,
          "name": "High",
          "enabled": true,
          "color": "red"
        }
      ]
    }
  ]
}
```

<h3 id="get-a-custom-field-definition-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|custom_field_gid|path|integer|true|Globally unique identifier for the custom field.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "custom_field",
    "name": "Bug Task",
    "resource_subtype": "milestone",
    "type": "text",
    "enum_options": [
      {}
    ],
    "enum_value": null,
    "enabled": true,
    "text_value": "Some Value",
    "description": "Development team priority",
    "precision": 2
  }
}
```

<h3 id="get-a-custom-field-definition-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the complete definition of a custom field’s metadata.|[CustomField](#schemacustomfield)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Update a custom field

<a id="opIdupdateCustomField"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/custom_fields/{custom_field_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Bug Task",
    "type": "text",
    "enum_options": [
      {}
    ],
    "enum_value": null,
    "enabled": true,
    "text_value": "Some Value",
    "description": "Development team priority",
    "precision": 2
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}',
{
  method: 'PUT',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('PUT','https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.put('https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("PUT");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.put 'https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`PUT /custom_fields/{custom_field_gid}`

A specific, existing custom field can be updated by making a PUT request on the URL for that custom field. Only the fields provided in the `data` block will be updated; any unspecified fields will remain unchanged
When using this method, it is best to specify only those fields you wish to change, or else you may overwrite changes made by another user since you last retrieved the custom field.
A custom field’s `type` cannot be updated.
An enum custom field’s `enum_options` cannot be updated with this endpoint. Instead see “Work With Enum Options” for information on how to update `enum_options`.
Locked custom fields can only be updated by the user who locked the field.
Returns the complete updated custom field record.

> Body parameter

```json
{
  "data": {
    "name": "Bug Task",
    "type": "text",
    "enum_options": [
      {}
    ],
    "enum_value": null,
    "enabled": true,
    "text_value": "Some Value",
    "description": "Development team priority",
    "precision": 2
  }
}
```

<h3 id="update-a-custom-field-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CustomFieldObject](#schemacustomfieldobject)|true|The custom field object with all updated properties.|
|custom_field_gid|path|integer|true|Globally unique identifier for the custom field.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "custom_field",
    "name": "Bug Task",
    "resource_subtype": "milestone",
    "type": "text",
    "enum_options": [
      {}
    ],
    "enum_value": null,
    "enabled": true,
    "text_value": "Some Value",
    "description": "Development team priority",
    "precision": 2
  }
}
```

<h3 id="update-a-custom-field-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|The custom field was successfully updated.|[CustomField](#schemacustomfield)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Delete a custom field

<a id="opIddeleteCustomField"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/custom_fields/{custom_field_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}',
{
  method: 'DELETE',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('DELETE','https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.delete('https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.delete 'https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /custom_fields/{custom_field_gid}`

A specific, existing custom field can be deleted by making a DELETE request on the URL for that custom field.
Locked custom fields can only be deleted by the user who locked the field.
Returns an empty data record.

<h3 id="delete-a-custom-field-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|custom_field_gid|path|integer|true|Globally unique identifier for the custom field.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="delete-a-custom-field-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|The custom field was successfully deleted.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Create an enum option

<a id="opIdaddEnumOption"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Low",
    "enabled": true,
    "color": "blue",
    "insert_before": 12345
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /custom_fields/{custom_field_gid}/enum_options`

Creates an enum option and adds it to this custom field’s list of enum options. A custom field can have at most 50 enum options (including disabled options). By default new enum options are inserted at the end of a custom field’s list.
Locked custom fields can only have enum options added by the user who locked the field.
Returns the full record of the newly created enum option.

> Body parameter

```json
{
  "data": {
    "name": "Low",
    "enabled": true,
    "color": "blue",
    "insert_before": 12345
  }
}
```

<h3 id="create-an-enum-option-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The enum option object to create.|
|» data|body|any|false|none|
|»» *anonymous*|body|[EnumOption](#schemaenumoption)|false|Enum options are the possible values which an enum custom field can|
|»»» id|body|integer(int64)|false|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|body|string|false|Globally unique ID of the object, as a string.|
|»»» resource_type|body|string|false|The base type of this resource.|
|»»» name|body|string|false|The name of the enum option.|
|»»» enabled|body|boolean|false|The color of the enum option. Defaults to ‘none’.|
|»»» color|body|string|false|Whether or not the enum option is a selectable value for the custom field.|
|»» *anonymous*|body|any|false|none|
|»»» *anonymous*|body|object|false|none|
|»»»» insert_before|body|integer|false|An existing enum option within this custom field before which the new enum option should be inserted. Cannot be provided together with after_enum_option.|
|»»» *anonymous*|body|object|false|none|
|»»»» insert_after|body|integer|false|An existing enum option within this custom field after which the new enum option should be inserted. Cannot be provided together with before_enum_option.|
|custom_field_gid|path|integer|true|Globally unique identifier for the custom field.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Detailed descriptions

** *anonymous***: Enum options are the possible values which an enum custom field can
adopt. An enum custom field must contain at least 1 enum option but no
more than 50.

You can add enum options to a custom field by using the `POST
/custom_fields/custom_field_gid/enum_options` endpoint.

**It is not possible to remove or delete an enum option**. Instead, enum
options can be disabled by updating the `enabled` field to false with the
`PUT /enum_options/enum_option_gid` endpoint. Other attributes can be
updated similarly.

On creation of an enum option, `enabled` is always set to `true`, meaning
the enum option is a selectable value for the custom field. Setting
`enabled=false` is equivalent to “trashing” the enum option in the Asana
web app within the “Edit Fields” dialog. The enum option will no longer
be selectable but, if the enum option value was previously set within a
task, the task will retain the value.

Enum options are an ordered list and by default new enum options are
inserted at the end. Ordering in relation to existing enum options can be
specified on creation by using `insert_before` or `insert_after` to
reference an existing enum option. Only one of `insert_before` and
`insert_after` can be provided when creating a new enum option.

An enum options list can be reordered with the `POST
/custom_fields/custom_field_gid/enum_options/insert` endpoint.

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "enum_option",
    "name": "Low",
    "enabled": true,
    "color": "blue"
  }
}
```

<h3 id="create-an-enum-option-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Custom field enum option successfully created.|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h3 id="create-an-enum-option-responseschema">Response Schema</h3>

Status Code **201**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
| data|[EnumOption](#schemaenumoption)|false|none|Enum options are the possible values which an enum custom field can<br>adopt. An enum custom field must contain at least 1 enum option but no<br>more than 50.<br><br>You can add enum options to a custom field by using the `POST<br>/custom_fields/custom_field_gid/enum_options` endpoint.<br><br>**It is not possible to remove or delete an enum option**. Instead, enum<br>options can be disabled by updating the `enabled` field to false with the<br>`PUT /enum_options/enum_option_gid` endpoint. Other attributes can be<br>updated similarly.<br><br>On creation of an enum option, `enabled` is always set to `true`, meaning<br>the enum option is a selectable value for the custom field. Setting<br>`enabled=false` is equivalent to “trashing” the enum option in the Asana<br>web app within the “Edit Fields” dialog. The enum option will no longer<br>be selectable but, if the enum option value was previously set within a<br>task, the task will retain the value.<br><br>Enum options are an ordered list and by default new enum options are<br>inserted at the end. Ordering in relation to existing enum options can be<br>specified on creation by using `insert_before` or `insert_after` to<br>reference an existing enum option. Only one of `insert_before` and<br>`insert_after` can be provided when creating a new enum option.<br><br>An enum options list can be reordered with the `POST<br>/custom_fields/custom_field_gid/enum_options/insert` endpoint.|
| id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
| gid|string|false|read-only|Globally unique ID of the object, as a string.|
| resource_type|string|false|read-only|The base type of this resource.|
| name|string|false|none|The name of the enum option.|
| enabled|boolean|false|none|The color of the enum option. Defaults to ‘none’.|
| color|string|false|none|Whether or not the enum option is a selectable value for the custom field.|

## Reorder a custom field's enum

<a id="opIdreorderEnumOption"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options/insert \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Low",
    "enabled": true,
    "color": "blue",
    "enum_option": 97285,
    "before_enum_option": 12345
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options/insert',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options/insert', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options/insert', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options/insert");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/custom_fields/{custom_field_gid}/enum_options/insert',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /custom_fields/{custom_field_gid}/enum_options/insert`

Moves a particular enum option to be either before or after another specified enum option in the custom field.
Locked custom fields can only be reordered by the user who locked the field.

> Body parameter

```json
{
  "data": {
    "name": "Low",
    "enabled": true,
    "color": "blue",
    "enum_option": 97285,
    "before_enum_option": 12345
  }
}
```

<h3 id="reorder-a-custom-field's-enum-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The enum option object to create.|
|» data|body|any|false|none|
|»» *anonymous*|body|[EnumOption](#schemaenumoption)|false|Enum options are the possible values which an enum custom field can|
|»»» id|body|integer(int64)|false|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|body|string|false|Globally unique ID of the object, as a string.|
|»»» resource_type|body|string|false|The base type of this resource.|
|»»» name|body|string|false|The name of the enum option.|
|»»» enabled|body|boolean|false|The color of the enum option. Defaults to ‘none’.|
|»»» color|body|string|false|Whether or not the enum option is a selectable value for the custom field.|
|»» *anonymous*|body|object|false|none|
|»»» enum_option|body|integer|false|The ID of the enum option to relocate.|
|»» *anonymous*|body|any|false|none|
|»»» *anonymous*|body|object|false|none|
|»»»» before_enum_option|body|integer|false|An existing enum option within this custom field before which the new enum option should be inserted. Cannot be provided together with after_enum_option.|
|»»» *anonymous*|body|object|false|none|
|»»»» after_enum_option|body|integer|false|An existing enum option within this custom field after which the new enum option should be inserted. Cannot be provided together with before_enum_option.|
|custom_field_gid|path|integer|true|Globally unique identifier for the custom field.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Detailed descriptions

** *anonymous***: Enum options are the possible values which an enum custom field can
adopt. An enum custom field must contain at least 1 enum option but no
more than 50.

You can add enum options to a custom field by using the `POST
/custom_fields/custom_field_gid/enum_options` endpoint.

**It is not possible to remove or delete an enum option**. Instead, enum
options can be disabled by updating the `enabled` field to false with the
`PUT /enum_options/enum_option_gid` endpoint. Other attributes can be
updated similarly.

On creation of an enum option, `enabled` is always set to `true`, meaning
the enum option is a selectable value for the custom field. Setting
`enabled=false` is equivalent to “trashing” the enum option in the Asana
web app within the “Edit Fields” dialog. The enum option will no longer
be selectable but, if the enum option value was previously set within a
task, the task will retain the value.

Enum options are an ordered list and by default new enum options are
inserted at the end. Ordering in relation to existing enum options can be
specified on creation by using `insert_before` or `insert_after` to
reference an existing enum option. Only one of `insert_before` and
`insert_after` can be provided when creating a new enum option.

An enum options list can be reordered with the `POST
/custom_fields/custom_field_gid/enum_options/insert` endpoint.

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "enum_option",
    "name": "Low",
    "enabled": true,
    "color": "blue"
  }
}
```

<h3 id="reorder-a-custom-field's-enum-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Custom field enum option successfully reordered.|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h3 id="reorder-a-custom-field's-enum-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
| data|[EnumOption](#schemaenumoption)|false|none|Enum options are the possible values which an enum custom field can<br>adopt. An enum custom field must contain at least 1 enum option but no<br>more than 50.<br><br>You can add enum options to a custom field by using the `POST<br>/custom_fields/custom_field_gid/enum_options` endpoint.<br><br>**It is not possible to remove or delete an enum option**. Instead, enum<br>options can be disabled by updating the `enabled` field to false with the<br>`PUT /enum_options/enum_option_gid` endpoint. Other attributes can be<br>updated similarly.<br><br>On creation of an enum option, `enabled` is always set to `true`, meaning<br>the enum option is a selectable value for the custom field. Setting<br>`enabled=false` is equivalent to “trashing” the enum option in the Asana<br>web app within the “Edit Fields” dialog. The enum option will no longer<br>be selectable but, if the enum option value was previously set within a<br>task, the task will retain the value.<br><br>Enum options are an ordered list and by default new enum options are<br>inserted at the end. Ordering in relation to existing enum options can be<br>specified on creation by using `insert_before` or `insert_after` to<br>reference an existing enum option. Only one of `insert_before` and<br>`insert_after` can be provided when creating a new enum option.<br><br>An enum options list can be reordered with the `POST<br>/custom_fields/custom_field_gid/enum_options/insert` endpoint.|
| id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
| gid|string|false|read-only|Globally unique ID of the object, as a string.|
| resource_type|string|false|read-only|The base type of this resource.|
| name|string|false|none|The name of the enum option.|
| enabled|boolean|false|none|The color of the enum option. Defaults to ‘none’.|
| color|string|false|none|Whether or not the enum option is a selectable value for the custom field.|

## Update an enum option.

<a id="opIdupdateEnumOption"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/enum_options/{enum_option_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Low",
    "enabled": true,
    "color": "blue"
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/enum_options/{enum_option_gid}',
{
  method: 'PUT',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('PUT','https://app.asana.com/api/1.0/enum_options/{enum_option_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.put('https://app.asana.com/api/1.0/enum_options/{enum_option_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/enum_options/{enum_option_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("PUT");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.put 'https://app.asana.com/api/1.0/enum_options/{enum_option_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`PUT /enum_options/{enum_option_gid}`

Updates an existing enum option. Enum custom fields require at least one enabled enum option.
Locked custom fields can only be updated by the user who locked the field.
Returns the full record of the updated enum option.

> Body parameter

```json
{
  "data": {
    "name": "Low",
    "enabled": true,
    "color": "blue"
  }
}
```

<h3 id="update-an-enum-option.-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The enum option object to update|
|» data|body|[EnumOption](#schemaenumoption)|false|Enum options are the possible values which an enum custom field can|
|»» id|body|integer(int64)|false|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»» gid|body|string|false|Globally unique ID of the object, as a string.|
|»» resource_type|body|string|false|The base type of this resource.|
|»» name|body|string|false|The name of the enum option.|
|»» enabled|body|boolean|false|The color of the enum option. Defaults to ‘none’.|
|»» color|body|string|false|Whether or not the enum option is a selectable value for the custom field.|
|enum_option_gid|path|integer|true|Globally unique identifier for the enum option.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Detailed descriptions

** data**: Enum options are the possible values which an enum custom field can
adopt. An enum custom field must contain at least 1 enum option but no
more than 50.

You can add enum options to a custom field by using the `POST
/custom_fields/custom_field_gid/enum_options` endpoint.

**It is not possible to remove or delete an enum option**. Instead, enum
options can be disabled by updating the `enabled` field to false with the
`PUT /enum_options/enum_option_gid` endpoint. Other attributes can be
updated similarly.

On creation of an enum option, `enabled` is always set to `true`, meaning
the enum option is a selectable value for the custom field. Setting
`enabled=false` is equivalent to “trashing” the enum option in the Asana
web app within the “Edit Fields” dialog. The enum option will no longer
be selectable but, if the enum option value was previously set within a
task, the task will retain the value.

Enum options are an ordered list and by default new enum options are
inserted at the end. Ordering in relation to existing enum options can be
specified on creation by using `insert_before` or `insert_after` to
reference an existing enum option. Only one of `insert_before` and
`insert_after` can be provided when creating a new enum option.

An enum options list can be reordered with the `POST
/custom_fields/custom_field_gid/enum_options/insert` endpoint.

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "enum_option",
    "name": "Low",
    "enabled": true,
    "color": "blue"
  }
}
```

<h3 id="update-an-enum-option.-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully updated the specified custom field enum.|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h3 id="update-an-enum-option.-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
| data|[EnumOption](#schemaenumoption)|false|none|Enum options are the possible values which an enum custom field can<br>adopt. An enum custom field must contain at least 1 enum option but no<br>more than 50.<br><br>You can add enum options to a custom field by using the `POST<br>/custom_fields/custom_field_gid/enum_options` endpoint.<br><br>**It is not possible to remove or delete an enum option**. Instead, enum<br>options can be disabled by updating the `enabled` field to false with the<br>`PUT /enum_options/enum_option_gid` endpoint. Other attributes can be<br>updated similarly.<br><br>On creation of an enum option, `enabled` is always set to `true`, meaning<br>the enum option is a selectable value for the custom field. Setting<br>`enabled=false` is equivalent to “trashing” the enum option in the Asana<br>web app within the “Edit Fields” dialog. The enum option will no longer<br>be selectable but, if the enum option value was previously set within a<br>task, the task will retain the value.<br><br>Enum options are an ordered list and by default new enum options are<br>inserted at the end. Ordering in relation to existing enum options can be<br>specified on creation by using `insert_before` or `insert_after` to<br>reference an existing enum option. Only one of `insert_before` and<br>`insert_after` can be provided when creating a new enum option.<br><br>An enum options list can be reordered with the `POST<br>/custom_fields/custom_field_gid/enum_options/insert` endpoint.|
| id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
| gid|string|false|read-only|Globally unique ID of the object, as a string.|
| resource_type|string|false|read-only|The base type of this resource.|
| name|string|false|none|The name of the enum option.|
| enabled|boolean|false|none|The color of the enum option. Defaults to ‘none’.|
| color|string|false|none|Whether or not the enum option is a selectable value for the custom field.|

## Get a workspace's custom fields

<a id="opIdgetCustomFieldsInWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/custom_fields \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/custom_fields',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/workspaces/{workspace_gid}/custom_fields', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/custom_fields', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}/custom_fields");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}/custom_fields',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /workspaces/{workspace_gid}/custom_fields`

Returns a list of the compact representation of all of the custom fields in a workspace.

<h3 id="get-a-workspace's-custom-fields-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|workspace_gid|path|integer|true|The workspace or organization to find custom field definitions in.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "custom_field",
      "name": "Bug Task",
      "resource_subtype": "milestone",
      "type": "text",
      "enum_options": [],
      "enum_value": null,
      "enabled": true,
      "text_value": "Some Value"
    }
  ]
}
```

<h3 id="get-a-workspace's-custom-fields-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved all custom fields for the given workspace.|[CustomField](#schemacustomfield)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-custom-field-settings">Custom Field Settings</h1>

Custom Fields Settings objects represent the many-to-many join of the Custom Field and Project as well as stores information that is relevant to that particular pairing.

## Query for all of the custom fields settings on a project.

<a id="opIdgetCustomFieldSettingsForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project-id}/custom_field_settings \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project-id}/custom_field_settings',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/projects/{project-id}/custom_field_settings', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/projects/{project-id}/custom_field_settings', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project-id}/custom_field_settings");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/projects/{project-id}/custom_field_settings',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /projects/{project-id}/custom_field_settings`

Returns a list of all of the custom fields settings on a project, in compact form. Note that, as in all queries to collections which return compact representation, `opt_fields` and `opt_expand` can be used to include more data than is returned in the compact representation. See the [getting started guide on input/output options](https://asana.com/developers/documentation/getting-started/input-output-options) for more information.

<h3 id="query-for-all-of-the-custom-fields-settings-on-a-project.-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project-id|path|integer|true|The ID of the project for which to list custom field settings.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "custom_field_setting",
      "project": null,
      "is_important": false,
      "parent": null,
      "custom_field": null
    }
  ]
}
```

<h3 id="query-for-all-of-the-custom-fields-settings-on-a-project.-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved custom field settings objects for a project.|[CustomFieldSetting](#schemacustomfieldsetting)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a project's custom fields

<a id="opIdgetCustomFieldSettingsForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid}/custom_field_settings \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}/custom_field_settings',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/projects/{project_gid}/custom_field_settings', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/projects/{project_gid}/custom_field_settings', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}/custom_field_settings");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/projects/{project_gid}/custom_field_settings',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /projects/{project_gid}/custom_field_settings`

Returns a list of all of the custom fields settings on a project, in compact form. Note that, as in all queries to collections which return compact representation, `opt_fields` and `opt_expand` can be used to include more data than is returned in the compact representation. See the [getting started guide on input/output options](https://asana.com/developers/documentation/getting-started/input-output-options) for more information.

<h3 id="get-a-project's-custom-fields-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|string|true|The ID of the project for which to list custom field settings.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "custom_field_setting",
      "project": null,
      "is_important": false,
      "parent": null,
      "custom_field": null
    }
  ]
}
```

<h3 id="get-a-project's-custom-fields-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved custom field settings objects for a project.|[CustomFieldSetting](#schemacustomfieldsetting)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a portfolio's custom fields

<a id="opIdgetCustomFieldSettingsForPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/custom_field_settings \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/custom_field_settings',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/custom_field_settings', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/custom_field_settings', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/custom_field_settings");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/custom_field_settings',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /portfolios/{portfolio_gid}/custom_field_settings`

Returns a list of all of the custom fields settings on a portfolio, in compact form.

<h3 id="get-a-portfolio's-custom-fields-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|portfolio_gid|path|string|true|The ID of the portfolio for which to list custom field settings.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "custom_field_setting",
      "project": null,
      "is_important": false,
      "parent": null,
      "custom_field": null
    }
  ]
}
```

<h3 id="get-a-portfolio's-custom-fields-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved custom field settings objects for a portfolio.|[CustomFieldSetting](#schemacustomfieldsetting)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-events">Events</h1>

An event is an object representing a change to a resource that was observed by an event subscription.

## Get events on a resource

<a id="opIdgetEvents"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/events?resource=12345 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/events?resource=12345',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/events', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/events', params={
  'resource': '12345'
}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/events?resource=12345");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/events',
  params: {
  'resource' => 'integer'
}, headers: headers

p JSON.parse(result)

```

`GET /events`

Returns the full record for all events that have occurred since the sync
token was created.

A GET request to the endpoint /[path_to_resource]/events can be made in
lieu of including the resource ID in the data for the request.

<h3 id="get-events-on-a-resource-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|resource|query|integer|true|A resource ID to subscribe to. The resource can be a task or project.|
|sync|query|string|false|A sync token received from the last request, or none on first sync. Events will be returned from the point in time that the sync token was generated.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Detailed descriptions

**sync**: A sync token received from the last request, or none on first sync. Events will be returned from the point in time that the sync token was generated.
**Note**: On your first request, omit the sync token. The response will be the same as for an expired sync token, and will include a new valid sync token.If the sync token is too old (which may happen from time to time) the API will return a `412 Precondition Failed` error, and include a fresh sync token in the response.

> 200 Response

```json
{
  "data": [
    {
      "user": {},
      "resource": {},
      "type": "task",
      "action": "changed",
      "parent": {},
      "created_at": "2012-02-22T02:06:58.147Z"
    }
  ],
  "sync": "de4774f6915eae04714ca93bb2f5ee81"
}
```

<h3 id="get-events-on-a-resource-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved events.|[Event](#schemaevent)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-jobs">Jobs</h1>

Jobs represent processes that handle asynchronous work.
Jobs are created when an endpoint requests an action that will be handled asynchronously. Such as project or task duplication.
Only the creator of the duplication process can access the duplication status of the new object.

## Get a job by id

<a id="opIdgetJob"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/jobs/{job_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/jobs/{job_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/jobs/{job_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/jobs/{job_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/jobs/{job_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/jobs/{job_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /jobs/{job_gid}`

Returns the full record for a job.

<h3 id="get-a-job-by-id-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|job_gid|path|string|true|Globally unique identifier for the job.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "resource_subtype": "milestone",
    "status": "in_progress",
    "new_project": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "new_task": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  }
}
```

<h3 id="get-a-job-by-id-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved Job.|[Job](#schemajob)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-organization-exports">Organization Exports</h1>

An *organization_export* object represents a request to export the complete data of an Organization in JSON format.

## Create an organization export request

<a id="opIdcreateOrganizationExport"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/organization_exports \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "organization": 1331
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/organization_exports',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/organization_exports', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/organization_exports', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/organization_exports");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/organization_exports',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /organization_exports`

This method creates a request to export an Organization. Asana will complete the export at some point after you create the request.

> Body parameter

```json
{
  "organization": 1331
}
```

<h3 id="create-an-organization-export-request-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The organization to export.|
|» organization|body|integer|false|Globally unique identifier for the workspace or organization.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "created_at": "2012-02-22T02:06:58.147Z",
    "download_url": "https://asana-export.s3.amazonaws.com/export-4632784536274-20170127-43246.json.gz?AWSAccessKeyId=xxxxxxxx",
    "state": "started",
    "organization": {
      "id": 14916,
      "gid": "14916",
      "name": "My Workspace"
    }
  }
}
```

<h3 id="create-an-organization-export-request-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created organization export request.|[OrganizationExportResponse](#schemaorganizationexportresponse)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get details on an org export request

<a id="opIdgetOrganizationExport"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/organization_exports/{organization_export_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/organization_exports/{organization_export_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/organization_exports/{organization_export_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/organization_exports/{organization_export_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/organization_exports/{organization_export_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/organization_exports/{organization_export_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /organization_exports/{organization_export_gid}`

Returns details of a previously-requested Organization export.

<h3 id="get-details-on-an-org-export-request-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|organization_export_gid|path|integer|true|Globally unique identifier for the organization export.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "created_at": "2012-02-22T02:06:58.147Z",
    "download_url": "https://asana-export.s3.amazonaws.com/export-4632784536274-20170127-43246.json.gz?AWSAccessKeyId=xxxxxxxx",
    "state": "started",
    "organization": {
      "id": 14916,
      "gid": "14916",
      "name": "My Workspace"
    }
  }
}
```

<h3 id="get-details-on-an-org-export-request-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved organization export object.|[OrganizationExportResponse](#schemaorganizationexportresponse)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-portfolios">Portfolios</h1>

A 'portfolio' gives a high-level overview of the status of multiple initiatives in Asana. Portfolios provide a dashboard overview of the state of multiple projects, including a progress report and the most recent [project status](https://asana.com/developers/api-reference/project_statuses) update.
Portfolios have some restrictions on size. Each portfolio has a max of 250 items and, like projects, a max of 20 custom fields.

## Get a list of the portfolios

<a id="opIdgetPortfolios"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolios \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/portfolios', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/portfolios', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/portfolios',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /portfolios`

Returns a list of the portfolios in compact representation that are owned by the current API user.

<h3 id="get-a-list-of-the-portfolios-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|workspace|query|string|false|The workspace or organization to filter portfolios on.|
|owner|query|string|false|The user who owns the portfolio. Currently, API users can only get a list of portfolios that they themselves own.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "portfolio",
      "name": "Bug Task"
    }
  ]
}
```

<h3 id="get-a-list-of-the-portfolios-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved portfolios.|[Portfolio](#schemaportfolio)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Create a new portfolio

<a id="opIdcreatePortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Bug Task",
    "created_by": null,
    "color": "light-green",
    "owner": null,
    "workspace": null,
    "members": null
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/portfolios', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/portfolios', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/portfolios',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /portfolios`

Creates a new portfolio in the given workspace with the supplied name.

Note that portfolios created in the Asana UI may have some state
(like the “Priority” custom field) which is automatically added
to the portfolio when it is created. Portfolios created via our
API will **not** be created with the same initial state to allow
integrations to create their own starting state on a portfolio.

> Body parameter

```json
{
  "data": {
    "name": "Bug Task",
    "created_by": null,
    "color": "light-green",
    "owner": null,
    "workspace": null,
    "members": null
  }
}
```

<h3 id="create-a-new-portfolio-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[PortfolioObject](#schemaportfolioobject)|true|The portfolio to create.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 201 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "portfolio",
      "name": "Bug Task"
    }
  ]
}
```

<h3 id="create-a-new-portfolio-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully retrieved portfolios.|[Portfolio](#schemaportfolio)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a portfolio

<a id="opIdgetPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolios/{portfolio_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/portfolios/{portfolio_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios/{portfolio_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/portfolios/{portfolio_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /portfolios/{portfolio_gid}`

Returns the complete portfolio record for a single portfolio.

<h3 id="get-a-portfolio-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|portfolio_gid|path|string|true|Globally unique identifier for the portfolio.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "portfolio",
    "name": "Bug Task",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": null,
    "color": "light-green",
    "custom_field_settings": [
      {}
    ],
    "owner": null,
    "workspace": null,
    "members": null
  }
}
```

<h3 id="get-a-portfolio-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested portfolio.|[Portfolio](#schemaportfolio)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Update a portfolio

<a id="opIdupdateportfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/portfolios/{portfolio_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Bug Task",
    "created_by": null,
    "color": "light-green",
    "owner": null,
    "workspace": null,
    "members": null
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}',
{
  method: 'PUT',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('PUT','https://app.asana.com/api/1.0/portfolios/{portfolio_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.put('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios/{portfolio_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("PUT");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.put 'https://app.asana.com/api/1.0/portfolios/{portfolio_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`PUT /portfolios/{portfolio_gid}`

An existing portfolio can be updated by making a PUT request on the URL for
that portfolio. Only the fields provided in the `data` block will be updated;
any unspecified fields will remain unchanged.

Returns the complete updated portfolio record.

> Body parameter

```json
{
  "data": {
    "name": "Bug Task",
    "created_by": null,
    "color": "light-green",
    "owner": null,
    "workspace": null,
    "members": null
  }
}
```

<h3 id="update-a-portfolio-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[PortfolioObject](#schemaportfolioobject)|true|The updated fields for the portfolio.|
|portfolio_gid|path|string|true|Globally unique identifier for the portfolio.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "portfolio",
    "name": "Bug Task",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": null,
    "color": "light-green",
    "custom_field_settings": [
      {}
    ],
    "owner": null,
    "workspace": null,
    "members": null
  }
}
```

<h3 id="update-a-portfolio-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully updated the portfolio.|[Portfolio](#schemaportfolio)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Delete a portfolio

<a id="opIddeletePortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/portfolios/{portfolio_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}',
{
  method: 'DELETE',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('DELETE','https://app.asana.com/api/1.0/portfolios/{portfolio_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.delete('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios/{portfolio_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.delete 'https://app.asana.com/api/1.0/portfolios/{portfolio_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /portfolios/{portfolio_gid}`

An existing portfolio can be deleted by making a DELETE request on
the URL for that portfolio.

Returns an empty data record.

<h3 id="delete-a-portfolio-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|portfolio_gid|path|string|true|Globally unique identifier for the portfolio.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="delete-a-portfolio-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully deleted the specified portfolio.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get portfolio items

<a id="opIdgetPortfolioItems"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/items \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/items',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/items', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/items', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/items");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/items',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /portfolios/{portfolio_gid}/items`

Get a list of the items in compact form in a portfolio.

<h3 id="get-portfolio-items-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|portfolio_gid|path|string|true|Globally unique identifier for the portfolio.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy",
      "created_at": "2012-02-22T02:06:58.147Z",
      "archived": false,
      "color": "light-green",
      "current_status": {},
      "custom_fields": [],
      "custom_field_settings": [],
      "due_date": "2012-03-26",
      "due_on": "2012-03-26",
      "followers": [],
      "html_notes": "These are things we need to purchase.",
      "is_template": false,
      "layout": "list",
      "members": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "These are things we need to purchase.",
      "owner": null,
      "public": false,
      "section_migration_status": "not_migrated",
      "start_on": "2012-03-26",
      "team": null,
      "workspace": null
    }
  ]
}
```

<h3 id="get-portfolio-items-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested portfolio's items.|[Project](#schemaproject)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Add a portfolio item

<a id="opIdaddPortfolioItem"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addItem?item=1331&insert_before=1331&insert_after=1331 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addItem?item=1331&insert_before=1331&insert_after=1331',
{
  method: 'POST',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addItem', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addItem', params={
  'item': '1331',  'insert_before': '1331',  'insert_after': '1331'
}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addItem?item=1331&insert_before=1331&insert_after=1331");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addItem',
  params: {
  'item' => 'string',
'insert_before' => 'string',
'insert_after' => 'string'
}, headers: headers

p JSON.parse(result)

```

`POST /portfolios/{portfolio_gid}/addItem`

Add an item to a portfolio.
Returns an empty data block.

<h3 id="add-a-portfolio-item-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|portfolio_gid|path|string|true|Globally unique identifier for the portfolio.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|
|item|query|string|true|The item to add to the portfolio.|
|insert_before|query|string|true|An id of an item in this portfolio. The new item will be added before the one specified here. `insert_before` and `insert_after` parameters cannot both be specified.|
|insert_after|query|string|true|An id of an item in this portfolio. The new item will be added after the one specified here. `insert_before` and `insert_after` parameters cannot both be specified.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="add-a-portfolio-item-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully added the item to the portfolio.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Remove a portfolio item

<a id="opIdremovePortfolioItem"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeItem?item=1331 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeItem?item=1331',
{
  method: 'POST',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeItem', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeItem', params={
  'item': '1331'
}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeItem?item=1331");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeItem',
  params: {
  'item' => 'string'
}, headers: headers

p JSON.parse(result)

```

`POST /portfolios/{portfolio_gid}/removeItem`

Remove an item from a portfolio.
Returns an empty data block.

<h3 id="remove-a-portfolio-item-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|portfolio_gid|path|string|true|Globally unique identifier for the portfolio.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|
|item|query|string|true|The item to remove from the portfolio.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="remove-a-portfolio-item-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully added the item to the portfolio.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Add a custom field to a portfolio

<a id="opIdportfolio.addCustomFieldSetting"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addCustomFieldSetting?custom_field=14916 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addCustomFieldSetting?custom_field=14916',
{
  method: 'POST',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addCustomFieldSetting', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addCustomFieldSetting', params={
  'custom_field': '14916'
}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addCustomFieldSetting?custom_field=14916");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/addCustomFieldSetting',
  params: {
  'custom_field' => 'integer'
}, headers: headers

p JSON.parse(result)

```

`POST /portfolios/{portfolio_gid}/addCustomFieldSetting`

Custom fields are associated with portfolios by way of custom field settings.  This method creates a setting for the portfolio.

<h3 id="add-a-custom-field-to-a-portfolio-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|portfolio_gid|path|string|true|Globally unique identifier for the portfolio.|
|custom_field|query|integer|true|The custom field to associate with this portfolio.|
|is_important|query|boolean|false|Whether this field should be considered important to this portfolio (for instance, to display in the list view of items in the portfolio).|
|insert_before|query|integer|false|An id of a Custom Field Setting on this portfolio, before which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.|
|insert_after|query|integer|false|An id of a Custom Field Setting on this portfolio, after which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="add-a-custom-field-to-a-portfolio-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully added the custom field to the portfolio.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Remove a custom field from a portfolio

<a id="opIdportfolio.removeCustomFieldSetting"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeCustomFieldSetting?custom_field=14916 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeCustomFieldSetting?custom_field=14916',
{
  method: 'POST',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeCustomFieldSetting', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeCustomFieldSetting', params={
  'custom_field': '14916'
}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeCustomFieldSetting?custom_field=14916");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/removeCustomFieldSetting',
  params: {
  'custom_field' => 'integer'
}, headers: headers

p JSON.parse(result)

```

`POST /portfolios/{portfolio_gid}/removeCustomFieldSetting`

Removes a custom field setting from a portfolio.

<h3 id="remove-a-custom-field-from-a-portfolio-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|portfolio_gid|path|string|true|Globally unique identifier for the portfolio.|
|custom_field|query|integer|true|The custom field to remove from this portfolio.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="remove-a-custom-field-from-a-portfolio-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully removed the custom field from the portfolio.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-projects">Projects</h1>

A `project` represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.

## Get a project's statuses

<a id="opIdgetProductStatuses"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /projects/{project_gid}/project_statuses`

Returns the compact project status update records for all updates on the project.

<h3 id="get-a-project's-statuses-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|integer|true|The project to get statuses from.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project_status",
      "title": "Status Update - Jun 15",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": null,
      "text": "The project is moving forward according to plan...",
      "html-text": "'&lt;body&gt;The project &lt;strong&gt;is&lt;/strong&gt; moving forward according to plan...&lt;/body&gt;'",
      "color": "green"
    }
  ]
}
```

<h3 id="get-a-project's-statuses-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified project's status updates.|[ProjectStatus](#schemaprojectstatus)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Create a project status

<a id="opIdcreateProjectStatus"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "project": 123456,
  "text": "The project is on track to ship next month!",
  "color": "green"
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/projects/{project_gid}/project_statuses',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /projects/{project_gid}/project_statuses`

Creates a new status update on the project.
Returns the full record of the newly created project status update.

> Body parameter

```json
{
  "project": 123456,
  "text": "The project is on track to ship next month!",
  "color": "green"
}
```

<h3 id="create-a-project-status-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The project status to create.|
|» project|body|integer|true|Globally unique identifier for the project.|
|» text|body|string|true|The text of the project status update.|
|» color|body|any|true|The color to associate with the status update.|
|project_gid|path|integer|true|The project to get statuses from.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| color|green|
| color|yellow|
| color|red|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "project_status",
    "title": "Status Update - Jun 15",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": null,
    "text": "The project is moving forward according to plan...",
    "html-text": "'&lt;body&gt;The project &lt;strong&gt;is&lt;/strong&gt; moving forward according to plan...&lt;/body&gt;'",
    "color": "green"
  }
}
```

<h3 id="create-a-project-status-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created a new story.|[ProjectStatus](#schemaprojectstatus)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a set of projects

<a id="opIdgetProjects"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/projects', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/projects', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/projects',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /projects`

Returns the compact project records for some filtered set of projects. Use one or more of the parameters provided to filter the projects returned.

<h3 id="get-a-set-of-projects-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|workspace|query|integer|false|The workspace or organization to filter projects on.|
|team|query|integer|false|The team to filter projects on.|
|archived|query|boolean|false|Only return projects whose `archived` field takes on the value of this parameter.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy",
      "created_at": "2012-02-22T02:06:58.147Z",
      "archived": false,
      "color": "light-green",
      "current_status": {},
      "custom_fields": [],
      "custom_field_settings": [],
      "due_date": "2012-03-26",
      "due_on": "2012-03-26",
      "followers": [],
      "html_notes": "These are things we need to purchase.",
      "is_template": false,
      "layout": "list",
      "members": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "These are things we need to purchase.",
      "owner": null,
      "public": false,
      "section_migration_status": "not_migrated",
      "start_on": "2012-03-26",
      "team": null,
      "workspace": null
    }
  ]
}
```

<h3 id="get-a-set-of-projects-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved projects.|[Project](#schemaproject)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Create a new project

<a id="opIdcreateProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Bug Project",
    "notes": "For tracking pesky bugs.",
    "workspace": 1331,
    "team": 14916
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/projects', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/projects', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/projects',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /projects`

Create a new project in a workspace or team.

Every project is required to be created in a specific workspace or
organization, and this cannot be changed once set. Note that you can use
the `workspace` parameter regardless of whether or not it is an
organization.

If the workspace for your project is an organization, you must also
supply a `team` to share the project with.

Returns the full record of the newly created project.

> Body parameter

```json
{
  "data": {
    "name": "Bug Project",
    "notes": "For tracking pesky bugs.",
    "workspace": 1331,
    "team": 14916
  }
}
```

<h3 id="create-a-new-project-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The project to create.|
|» data|body|object|false|none|
|»» name|body|string|false|The name of the project.|
|»» notes|body|string|false|The description of the project.|
|»» workspace|body|integer|false|The workspace or organization to create the project in.|
|»» team|body|integer|false|If creating in an organization, the specific team to create the project in.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy",
    "created_at": "2012-02-22T02:06:58.147Z",
    "archived": false,
    "color": "light-green",
    "current_status": {
      "color": "green",
      "text": "Everything is great",
      "author": {}
    },
    "custom_fields": [
      {}
    ],
    "custom_field_settings": [
      {}
    ],
    "due_date": "2012-03-26",
    "due_on": "2012-03-26",
    "followers": [
      {}
    ],
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "layout": "list",
    "members": [
      {}
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "owner": null,
    "public": false,
    "section_migration_status": "not_migrated",
    "start_on": "2012-03-26",
    "team": null,
    "workspace": null
  }
}
```

<h3 id="create-a-new-project-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully retrieved projects.|[Project](#schemaproject)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a project

<a id="opIdgetProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/projects/{project_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/projects/{project_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/projects/{project_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /projects/{project_gid}`

Returns the complete project record for a single project.

<h3 id="get-a-project-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|string|true|Globally unique identifier for the project.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy",
    "created_at": "2012-02-22T02:06:58.147Z",
    "archived": false,
    "color": "light-green",
    "current_status": {
      "color": "green",
      "text": "Everything is great",
      "author": {}
    },
    "custom_fields": [
      {}
    ],
    "custom_field_settings": [
      {}
    ],
    "due_date": "2012-03-26",
    "due_on": "2012-03-26",
    "followers": [
      {}
    ],
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "layout": "list",
    "members": [
      {}
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "owner": null,
    "public": false,
    "section_migration_status": "not_migrated",
    "start_on": "2012-03-26",
    "team": null,
    "workspace": null
  }
}
```

<h3 id="get-a-project-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested project.|[Project](#schemaproject)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Update a project

<a id="opIdupdateProject"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/projects/{project_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Stuff to buy",
    "archived": false,
    "color": "light-green",
    "due_date": "2012-03-26",
    "due_on": "2012-03-26",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "owner": null,
    "public": false,
    "start_on": "2012-03-26",
    "team": null,
    "workspace": null
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}',
{
  method: 'PUT',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('PUT','https://app.asana.com/api/1.0/projects/{project_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.put('https://app.asana.com/api/1.0/projects/{project_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("PUT");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.put 'https://app.asana.com/api/1.0/projects/{project_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`PUT /projects/{project_gid}`

A specific, existing project can be updated by making a PUT request on
the URL for that project. Only the fields provided in the `data` block
will be updated; any unspecified fields will remain unchanged.

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the task.

Returns the complete updated project record.

> Body parameter

```json
{
  "data": {
    "name": "Stuff to buy",
    "archived": false,
    "color": "light-green",
    "due_date": "2012-03-26",
    "due_on": "2012-03-26",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "owner": null,
    "public": false,
    "start_on": "2012-03-26",
    "team": null,
    "workspace": null
  }
}
```

<h3 id="update-a-project-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[ProjectObject](#schemaprojectobject)|true|The updated fields for the project.|
|project_gid|path|string|true|Globally unique identifier for the project.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy",
    "created_at": "2012-02-22T02:06:58.147Z",
    "archived": false,
    "color": "light-green",
    "current_status": {
      "color": "green",
      "text": "Everything is great",
      "author": {}
    },
    "custom_fields": [
      {}
    ],
    "custom_field_settings": [
      {}
    ],
    "due_date": "2012-03-26",
    "due_on": "2012-03-26",
    "followers": [
      {}
    ],
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "layout": "list",
    "members": [
      {}
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "owner": null,
    "public": false,
    "section_migration_status": "not_migrated",
    "start_on": "2012-03-26",
    "team": null,
    "workspace": null
  }
}
```

<h3 id="update-a-project-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully updated the project.|[Project](#schemaproject)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Delete a project

<a id="opIddeleteProject"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/projects/{project_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}',
{
  method: 'DELETE',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('DELETE','https://app.asana.com/api/1.0/projects/{project_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.delete('https://app.asana.com/api/1.0/projects/{project_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.delete 'https://app.asana.com/api/1.0/projects/{project_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /projects/{project_gid}`

A specific, existing project can be deleted by making a DELETE request on
the URL for that project.

Returns an empty data record.

<h3 id="delete-a-project-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|string|true|Globally unique identifier for the project.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="delete-a-project-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully deleted the specified project.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Duplicate a project

<a id="opIdduplicateProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/duplicate \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "New Project Name",
    "team": "12345",
    "include": [
      "members",
      "task_notes"
    ],
    "schedule_dates": {
      "should_skip_weekends": true,
      "due_on": "2019-05-21",
      "start_on": "2019-05-21"
    }
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}/duplicate',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/projects/{project_gid}/duplicate', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/projects/{project_gid}/duplicate', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}/duplicate");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/projects/{project_gid}/duplicate',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /projects/{project_gid}/duplicate`

Creates and returns a job that will asynchronously handle the duplication.

> Body parameter

```json
{
  "data": {
    "name": "New Project Name",
    "team": "12345",
    "include": [
      "members",
      "task_notes"
    ],
    "schedule_dates": {
      "should_skip_weekends": true,
      "due_on": "2019-05-21",
      "start_on": "2019-05-21"
    }
  }
}
```

<h3 id="duplicate-a-project-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|Describes the duplicate's name and the elements that will be duplicated.|
|» data|body|object|false|none|
|»» name|body|string|false|The name of the new project.|
|»» team|body|string|false|Sets the team of the new project. If team is not defined, the new project will be in the same team as the the original project.|
|»» include|body|string|false|The elements that will be duplicated to the new project. Tasks and project notes are always included.|
|»» schedule_dates|body|object|false|A dictionary of options to auto-shift dates. `task_dates` must be included to use this option. Requires either `start_on` or `due_on`, but not both.|
|»»» should_skip_weekends|body|boolean|false|Determines if the auto-shifted dates should skip weekends.|
|»»» due_on|body|string|false|Sets the last due date in the duplicated project to the given date. The rest of the due dates will be offset by the same amount as the due dates in the original project.|
|»»» start_on|body|string|false|Sets the first start date in the duplicated project to the given date. The rest of the start dates will be offset by the same amount as the start dates in the original project.|
|project_gid|path|string|true|Globally unique identifier for the project.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| include|members|
| include|task_notes|
| include|task_assignee|
| include|task_subtasks|
| include|task_attachments|
| include|task_dates|
| include|task_dependencies|
| include|task_followers|
| include|task_tags|
| include|task_projects|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "resource_subtype": "milestone",
    "status": "in_progress",
    "new_project": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "new_task": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  }
}
```

<h3 id="duplicate-a-project-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created the job to handle duplication.|[Job](#schemajob)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Add a custom field to a project

<a id="opIdproject.addCustomFieldSetting"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/addCustomFieldSetting?custom_field=14916 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}/addCustomFieldSetting?custom_field=14916',
{
  method: 'POST',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/projects/{project_gid}/addCustomFieldSetting', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/projects/{project_gid}/addCustomFieldSetting', params={
  'custom_field': '14916'
}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}/addCustomFieldSetting?custom_field=14916");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/projects/{project_gid}/addCustomFieldSetting',
  params: {
  'custom_field' => 'integer'
}, headers: headers

p JSON.parse(result)

```

`POST /projects/{project_gid}/addCustomFieldSetting`

Custom fields are associated with projects by way of custom field settings.  This method creates a setting for the project.

<h3 id="add-a-custom-field-to-a-project-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|string|true|Globally unique identifier for the project.|
|custom_field|query|integer|true|The custom field to associate with this project.|
|is_important|query|boolean|false|Whether this field should be considered "important" to this project. This may cause it to be displayed more prominently, for example in the task grid.|
|insert_before|query|integer|false|An id of a Custom Field Setting on this project, before which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.|
|insert_after|query|integer|false|An id of a Custom Field Setting on this project, after which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="add-a-custom-field-to-a-project-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully added the custom field to the project.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Remove a custom field from a project

<a id="opIdproject.removeCustomFieldSetting"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/removeCustomFieldSetting?custom_field=14916 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}/removeCustomFieldSetting?custom_field=14916',
{
  method: 'POST',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/projects/{project_gid}/removeCustomFieldSetting', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/projects/{project_gid}/removeCustomFieldSetting', params={
  'custom_field': '14916'
}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}/removeCustomFieldSetting?custom_field=14916");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/projects/{project_gid}/removeCustomFieldSetting',
  params: {
  'custom_field' => 'integer'
}, headers: headers

p JSON.parse(result)

```

`POST /projects/{project_gid}/removeCustomFieldSetting`

Removes a custom field setting from a project.

<h3 id="remove-a-custom-field-from-a-project-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|string|true|Globally unique identifier for the project.|
|custom_field|query|integer|true|The custom field to remove from this project.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="remove-a-custom-field-from-a-project-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully removed the custom field from the project.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a team's projects

<a id="opIdgetProjectsInTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/teams/{team_gid}/projects \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/teams/{team_gid}/projects',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/teams/{team_gid}/projects', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/teams/{team_gid}/projects', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/teams/{team_gid}/projects");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/teams/{team_gid}/projects',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /teams/{team_gid}/projects`

Returns the compact project records for all projects in the team.

<h3 id="get-a-team's-projects-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|archived|query|boolean|false|Only return projects whose `archived` field takes on the value of this parameter.|
|team_gid|path|string|true|Globally unique identifier for the team.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy",
      "created_at": "2012-02-22T02:06:58.147Z",
      "archived": false,
      "color": "light-green",
      "current_status": {},
      "custom_fields": [],
      "custom_field_settings": [],
      "due_date": "2012-03-26",
      "due_on": "2012-03-26",
      "followers": [],
      "html_notes": "These are things we need to purchase.",
      "is_template": false,
      "layout": "list",
      "members": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "These are things we need to purchase.",
      "owner": null,
      "public": false,
      "section_migration_status": "not_migrated",
      "start_on": "2012-03-26",
      "team": null,
      "workspace": null
    }
  ]
}
```

<h3 id="get-a-team's-projects-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested team's projects.|[Project](#schemaproject)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Create a project in a team

<a id="opIdcreateProjectsWithTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/teams/{team_gid}/projects \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Stuff to buy",
    "archived": false,
    "color": "light-green",
    "due_date": "2012-03-26",
    "due_on": "2012-03-26",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "owner": null,
    "public": false,
    "start_on": "2012-03-26",
    "team": null,
    "workspace": null
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/teams/{team_gid}/projects',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/teams/{team_gid}/projects', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/teams/{team_gid}/projects', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/teams/{team_gid}/projects");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/teams/{team_gid}/projects',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /teams/{team_gid}/projects`

Creates a project shared with the given team.

Returns the full record of the newly created project.

> Body parameter

```json
{
  "data": {
    "name": "Stuff to buy",
    "archived": false,
    "color": "light-green",
    "due_date": "2012-03-26",
    "due_on": "2012-03-26",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "owner": null,
    "public": false,
    "start_on": "2012-03-26",
    "team": null,
    "workspace": null
  }
}
```

<h3 id="create-a-project-in-a-team-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[ProjectObject](#schemaprojectobject)|true|The new project to create.|
|team_gid|path|string|true|Globally unique identifier for the team.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy",
    "created_at": "2012-02-22T02:06:58.147Z",
    "archived": false,
    "color": "light-green",
    "current_status": {
      "color": "green",
      "text": "Everything is great",
      "author": {}
    },
    "custom_fields": [
      {}
    ],
    "custom_field_settings": [
      {}
    ],
    "due_date": "2012-03-26",
    "due_on": "2012-03-26",
    "followers": [
      {}
    ],
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "layout": "list",
    "members": [
      {}
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "owner": null,
    "public": false,
    "section_migration_status": "not_migrated",
    "start_on": "2012-03-26",
    "team": null,
    "workspace": null
  }
}
```

<h3 id="create-a-project-in-a-team-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created the specified project.|[Project](#schemaproject)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get all projects in a workspace

<a id="opIdgetProjectsInWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /workspaces/{workspace_gid}/projects`

Returns the compact project records for all projects in the workspace.

<h3 id="get-all-projects-in-a-workspace-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|archived|query|boolean|false|Only return projects whose `archived` field takes on the value of this parameter.|
|workspace_gid|path|string|true|Globally unique identifier for the workspace or organization.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy",
      "created_at": "2012-02-22T02:06:58.147Z",
      "archived": false,
      "color": "light-green",
      "current_status": {},
      "custom_fields": [],
      "custom_field_settings": [],
      "due_date": "2012-03-26",
      "due_on": "2012-03-26",
      "followers": [],
      "html_notes": "These are things we need to purchase.",
      "is_template": false,
      "layout": "list",
      "members": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "These are things we need to purchase.",
      "owner": null,
      "public": false,
      "section_migration_status": "not_migrated",
      "start_on": "2012-03-26",
      "team": null,
      "workspace": null
    }
  ]
}
```

<h3 id="get-all-projects-in-a-workspace-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested workspace's projects.|[Project](#schemaproject)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Create a project in a workspace

<a id="opIdcreateProjectsInWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Stuff to buy",
    "archived": false,
    "color": "light-green",
    "due_date": "2012-03-26",
    "due_on": "2012-03-26",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "owner": null,
    "public": false,
    "start_on": "2012-03-26",
    "team": null,
    "workspace": null
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /workspaces/{workspace_gid}/projects`

Returns the compact project records for all projects in the workspace.

If the workspace for your project is an organization, you must also
supply a team to share the project with.

Returns the full record of the newly created project.

> Body parameter

```json
{
  "data": {
    "name": "Stuff to buy",
    "archived": false,
    "color": "light-green",
    "due_date": "2012-03-26",
    "due_on": "2012-03-26",
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "owner": null,
    "public": false,
    "start_on": "2012-03-26",
    "team": null,
    "workspace": null
  }
}
```

<h3 id="create-a-project-in-a-workspace-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[ProjectObject](#schemaprojectobject)|true|The new project to create.|
|workspace_gid|path|string|true|Globally unique identifier for the workspace or organization.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy",
    "created_at": "2012-02-22T02:06:58.147Z",
    "archived": false,
    "color": "light-green",
    "current_status": {
      "color": "green",
      "text": "Everything is great",
      "author": {}
    },
    "custom_fields": [
      {}
    ],
    "custom_field_settings": [
      {}
    ],
    "due_date": "2012-03-26",
    "due_on": "2012-03-26",
    "followers": [
      {}
    ],
    "html_notes": "These are things we need to purchase.",
    "is_template": false,
    "layout": "list",
    "members": [
      {}
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "These are things we need to purchase.",
    "owner": null,
    "public": false,
    "section_migration_status": "not_migrated",
    "start_on": "2012-03-26",
    "team": null,
    "workspace": null
  }
}
```

<h3 id="create-a-project-in-a-workspace-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created a new project in the specified workspace.|[Project](#schemaproject)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-project-memberships">Project Memberships</h1>

With the introduction of “comment-only” projects in Asana, a user’s membership in a project comes with associated permissions. These permissions (whether a user has full access to the project or comment-only access) are accessible through the project memberships endpoints described here.

## Get the project memberships for a project

<a id="opIdgetProjectMembershipsForProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid}/project_memberships \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}/project_memberships',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/projects/{project_gid}/project_memberships', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/projects/{project_gid}/project_memberships', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}/project_memberships");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/projects/{project_gid}/project_memberships',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /projects/{project_gid}/project_memberships`

Returns the compact project membership records for the project.

<h3 id="get-the-project-memberships-for-a-project-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|string|true|Globally unique identifier for the project.|
|user|query|any|false|The user to filter results on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project_membership",
      "user": {},
      "project": {},
      "write_access": "full_write"
    }
  ]
}
```

<h3 id="get-the-project-memberships-for-a-project-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested project's memberships.|[ProjectMembership](#schemaprojectmembership)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a project membership

<a id="opIdgetProjectMembership"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/project_memberships/{project_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/project_memberships/{project_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/project_memberships/{project_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/project_memberships/{project_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/project_memberships/{project_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/project_memberships/{project_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /project_memberships/{project_gid}`

Returns the complete project record for a single project membership.

<h3 id="get-a-project-membership-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|string|true|Globally unique identifier for the project.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "project_membership",
    "user": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "project": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "write_access": "full_write"
  }
}
```

<h3 id="get-a-project-membership-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested project membership.|[ProjectMembership](#schemaprojectmembership)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-project-statuses">Project Statuses</h1>

A *project status* is an update on the progress of a particular project, and is sent out to all project followers when created. These updates include both text describing the update and a color code intended to represent the overall state of the project: “green” for projects that are on track, “yellow” for projects at risk, and “red” for projects that are behind.

## Get a project status

<a id="opIdgetProductStatus"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/project_statuses/{project_status_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/project_statuses/{project_status_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/project_statuses/{project_status_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/project_statuses/{project_status_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/project_statuses/{project_status_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/project_statuses/{project_status_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /project_statuses/{project_status_gid}`

Returns the complete record for a single status update.

<h3 id="get-a-project-status-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|integer|true|The project to get statuses from.|
|project_status_gid|path|integer|true|The project status update to get.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "project_status",
    "title": "Status Update - Jun 15",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": null,
    "text": "The project is moving forward according to plan...",
    "html-text": "'&lt;body&gt;The project &lt;strong&gt;is&lt;/strong&gt; moving forward according to plan...&lt;/body&gt;'",
    "color": "green"
  }
}
```

<h3 id="get-a-project-status-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified project's status updates.|[ProjectStatus](#schemaprojectstatus)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Delete a project status

<a id="opIddeleteProductStatus"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/project_statuses/{project_status_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/project_statuses/{project_status_gid}',
{
  method: 'DELETE',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('DELETE','https://app.asana.com/api/1.0/project_statuses/{project_status_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.delete('https://app.asana.com/api/1.0/project_statuses/{project_status_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/project_statuses/{project_status_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.delete 'https://app.asana.com/api/1.0/project_statuses/{project_status_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /project_statuses/{project_status_gid}`

Deletes a specific, existing project status update.

Returns an empty data record.

<h3 id="delete-a-project-status-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|integer|true|The project to get statuses from.|
|project_status_gid|path|integer|true|The project status update to get.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="delete-a-project-status-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully deleted the specified product status.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-sections">Sections</h1>

A *section* is a subdivision of a project that groups tasks together.

## Get all sections in a project

<a id="opIdgetSectionsInProject"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid}/sections \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}/sections',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/projects/{project_gid}/sections', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/projects/{project_gid}/sections', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}/sections");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/projects/{project_gid}/sections',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /projects/{project_gid}/sections`

Returns the compact records for all sections in the specified project.

<h3 id="get-all-sections-in-a-project-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|string|true|Globally unique identifier for the project.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions",
      "created_at": "2012-02-22T02:06:58.147Z",
      "projects": []
    }
  ]
}
```

<h3 id="get-all-sections-in-a-project-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved sections in project.|[Section](#schemasection)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Creates a section in a project

<a id="opIdcreateSectionInProject"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/sections \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "project": 13579,
  "name": "Next Actions"
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}/sections',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/projects/{project_gid}/sections', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/projects/{project_gid}/sections', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}/sections");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/projects/{project_gid}/sections',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /projects/{project_gid}/sections`

Creates a new section in a project.
Returns the full record of the newly created section.

> Body parameter

```json
{
  "project": 13579,
  "name": "Next Actions"
}
```

<h3 id="creates-a-section-in-a-project-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The section to create.|
|» project|body|integer|true|The project to create the section in|
|» name|body|string|true|The text to be displayed as the section name. This cannot be an empty string.|
|project_gid|path|string|true|Globally unique identifier for the project.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "section",
    "name": "Next Actions",
    "created_at": "2012-02-22T02:06:58.147Z",
    "projects": [
      {}
    ]
  }
}
```

<h3 id="creates-a-section-in-a-project-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created the specified section.|[Section](#schemasection)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a section

<a id="opIdgetSection"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/sections/{section_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/sections/{section_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/sections/{section_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/sections/{section_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/sections/{section_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/sections/{section_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /sections/{section_gid}`

Returns the complete record for a single section.

<h3 id="get-a-section-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|section_gid|path|string|true|The globally unique identified for the section.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "section",
    "name": "Next Actions",
    "created_at": "2012-02-22T02:06:58.147Z",
    "projects": [
      {}
    ]
  }
}
```

<h3 id="get-a-section-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved section.|[Section](#schemasection)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Update a section

<a id="opIdupdateSection"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/sections/{section_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Next Actions",
    "projects": [
      {}
    ]
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/sections/{section_gid}',
{
  method: 'PUT',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('PUT','https://app.asana.com/api/1.0/sections/{section_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.put('https://app.asana.com/api/1.0/sections/{section_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/sections/{section_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("PUT");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.put 'https://app.asana.com/api/1.0/sections/{section_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`PUT /sections/{section_gid}`

A specific, existing section can be updated by making a PUT request on
the URL for that project. Only the fields provided in the `data` block
will be updated; any unspecified fields will remain unchanged. (note that
at this time, the only field that can be updated is the `name` field.)

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the task.

Returns the complete updated section record.

> Body parameter

```json
{
  "data": {
    "name": "Next Actions",
    "projects": [
      {}
    ]
  }
}
```

<h3 id="update-a-section-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[SectionObject](#schemasectionobject)|true|The section to create.|
|section_gid|path|string|true|The globally unique identified for the section.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "section",
    "name": "Next Actions",
    "created_at": "2012-02-22T02:06:58.147Z",
    "projects": [
      {}
    ]
  }
}
```

<h3 id="update-a-section-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully updated the specified section.|[Section](#schemasection)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Delete a section

<a id="opIddeleteSection"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/sections/{section_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/sections/{section_gid}',
{
  method: 'DELETE',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('DELETE','https://app.asana.com/api/1.0/sections/{section_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.delete('https://app.asana.com/api/1.0/sections/{section_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/sections/{section_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.delete 'https://app.asana.com/api/1.0/sections/{section_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /sections/{section_gid}`

A specific, existing section can be deleted by making a DELETE request on
the URL for that section.

Note that sections must be empty to be deleted.

The last remaining section in a board view cannot be deleted.

Returns an empty data block.

<h3 id="delete-a-section-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|section_gid|path|string|true|The globally unique identified for the section.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="delete-a-section-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully deleted the specified section.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Add task to section

<a id="opIdaddTaskToSection"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/sections/{section_gid}/addTask \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "task": 123456,
  "insert_before": 86420,
  "insert_after": 987654
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/sections/{section_gid}/addTask',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/sections/{section_gid}/addTask', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/sections/{section_gid}/addTask', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/sections/{section_gid}/addTask");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/sections/{section_gid}/addTask',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /sections/{section_gid}/addTask`

Add a task to a specific, existing section. This is remove the task from other sections of the project.

The task will be inserted at the top of a section unless an insert_before or insert_after parameter is declared.

This does not work for separators (tasks with the resource_subtype of section).

> Body parameter

```json
{
  "task": 123456,
  "insert_before": 86420,
  "insert_after": 987654
}
```

<h3 id="add-task-to-section-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The task and optionally the insert location.|
|» task|body|string|true|The task to add to this section.|
|» insert_before|body|string|true|An existing task within this section before which the added task should be inserted. Cannot be provided together with insert_after.|
|» insert_after|body|string|true|An existing task within this section after which the added task should be inserted. Cannot be provided together with insert_before.|
|section_gid|path|string|true|The globally unique identified for the section.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="add-task-to-section-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully added the task.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Move sections

<a id="opIdmoveSection"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/projects/{project_gid}/sections/insert \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "project": 123456,
  "section": 321654,
  "before_section": 86420,
  "after_section": 987654
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}/sections/insert',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/projects/{project_gid}/sections/insert', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/projects/{project_gid}/sections/insert', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}/sections/insert");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/projects/{project_gid}/sections/insert',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /projects/{project_gid}/sections/insert`

Move sections relative to each other in a board view. One of
`before_section` or `after_section` is required.

Sections cannot be moved between projects.

At this point in time, moving sections is not supported in list views,
only board views.

Returns an empty data block.

> Body parameter

```json
{
  "project": 123456,
  "section": 321654,
  "before_section": 86420,
  "after_section": 987654
}
```

<h3 id="move-sections-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The section's move action.|
|» project|body|integer|true|The project in which to reorder the given section.|
|» section|body|integer|true|The section to reorder.|
|» before_section|body|integer|true|Insert the given section immediately before the section specified by this parameter.|
|» after_section|body|integer|true|Insert the given section immediately after the section specified by this parameter.|
|project_gid|path|string|true|Globally unique identifier for the project.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="move-sections-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully moved the specified section.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get tasks in a section

<a id="opIdgetSectionTasks"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/sections/{section_gid}/tasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/sections/{section_gid}/tasks',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/sections/{section_gid}/tasks', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/sections/{section_gid}/tasks', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/sections/{section_gid}/tasks");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/sections/{section_gid}/tasks',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /sections/{section_gid}/tasks`

**Board view only**: Returns the compact section records for all tasks within the given section.

<h3 id="get-tasks-in-a-section-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|section_gid|path|string|true|The globally unique identified for the section.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="get-tasks-in-a-section-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the section's tasks.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Query for tasks in a workspace

<a id="opIdgetWorkspaceTasksSearch"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tasks/search \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tasks/search',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tasks/search', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tasks/search', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tasks/search");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tasks/search',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /workspaces/{workspace_gid}/tasks/search`

To mirror the functionality of the Asana web app's advanced search feature, the Asana API has a task search endpoint that allows you to build complex filters to find and retrieve the exact data you need.
#### Custom fields
| Parameter name | Custom field type | Accepted type | |---|---|---| | `custom_fields.<id>.is_set` | All | Boolean | | `custom_fields.<id>.value` | Text | String | | `custom_fields.<id>.value` | Number | Number | | `custom_fields.<id>.value` | Enum | Enum option ID | | `custom_fields.<id>.starts_with` | Text only | String | | `custom_fields.<id>.ends_with` | Text only | String | | `custom_fields.<id>.contains` | Text only | String | | `custom_fields.<id>.less_than` | Number only | Number | | `custom_fields.<id>.greater_than` | Number only | Number |
For example, if the ID of the custom field is 12345, these query parameter to find tasks where it is set would be `custom_fields.12345.is_set=true`. To match an exact value for an enum custom field, use the ID of the desired enum option and not the name of the enum option: `custom_fields.12345.value=67890`.
Searching for multiple exact matches of a custom field is not supported.
#### Premium access
Like the Asana web product's advance search feature, this search endpoint will only be available to premium Asana users. A user is premium if any of the following is true:
- The workspace in which the search is being performed is a premium workspace - The user is a member of a premium team inside the workspace
Even if a user is only a member of a premium team inside a non-premium workspace, search will allow them to find data anywhere in the workspace, not just inside the premium team. Making a search request using credentials of a non-premium user will result in a `402 Payment Required` error.
#### Pagination
Search results are not stable; repeating the same query multiple times may return the data in a different order, even if the data do not change. Because of this, the traditional [pagination](/developers/documentation/getting-started/pagination) available elsewhere in the Asana API is not available here. However, you can paginate manually by sorting the search results by their creation time and then modifying each subsequent query to exclude data you have already seen. Page sizes are limited to a maximum of 100 items, and can be specified by the `limit` query parameter.
#### Eventual consistency
Changes in Asana (regardless of whether they’re made though the web product or the API) are forwarded to our search infrastructure to be indexed. This process can take between 10 and 60 seconds to complete under normal operation, and longer during some production incidents. Making a change to a task that would alter its presence in a particular search query will not be reflected immediately. This is also true of the advanced search feature in the web product.
#### Rate limits
You may receive a `429 Too Many Requests` response if you hit any of our [rate limits](/developers/documentation/getting-started/rate-limits).

<h3 id="query-for-tasks-in-a-workspace-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|workspace_gid|path|string|true|Globally unique identifier for the workspace or organization.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|
|text|undefined|string|false|Performs full-text search on both task name and description|
|resource_subtype|undefined|string|false|Filters results by the task's resource_subtype|
|assignee.any|query|string|false|none|
|assignee.not|query|string|false|none|
|assignee_status|query|string|false|none|
|projects.any|query|string|false|none|
|projects.not|query|string|false|none|
|projects.all|query|string|false|none|
|sections.any|query|string|false|none|
|sections.not|query|string|false|none|
|sections.all|query|string|false|none|
|tags.any|query|string|false|none|
|tags.not|query|string|false|none|
|tags.all|query|string|false|none|
|teams.any|query|string|false|none|
|followers.any|query|string|false|none|
|followers.not|query|string|false|none|
|created_by.any|query|string|false|none|
|created_by.not|query|string|false|none|
|assigned_by.any|query|string|false|none|
|assigned_by.not|query|string|false|none|
|liked_by.any|query|string|false|none|
|liked_by.not|query|string|false|none|
|commented_on_by.any|query|string|false|none|
|commented_on_by.not|query|string|false|none|
|due_on.before|query|string(date)|false|none|
|due_on.after|query|string(date)|false|none|
|due_on|query|string(date)|false|none|
|due_at.before|query|string(date-time)|false|none|
|due_at.after|query|string(date-time)|false|none|
|start_on.before|query|string(date)|false|none|
|start_on.after|query|string(date)|false|none|
|start_on|query|string(date)|false|none|
|created_on.before|query|string(date)|false|none|
|created_on.after|query|string(date)|false|none|
|created_on|query|string(date)|false|none|
|created_at.before|query|string(date-time)|false|none|
|created_at.after|query|string(date-time)|false|none|
|completed_on.before|query|string(date)|false|none|
|completed_on.after|query|string(date)|false|none|
|completed_on|query|string(date)|false|none|
|completed_at.before|query|string(date-time)|false|none|
|completed_at.after|query|string(date-time)|false|none|
|modified_on.before|query|string(date)|false|none|
|modified_on.after|query|string(date)|false|none|
|modified_on|query|string(date)|false|none|
|modified_at.before|query|string(date-time)|false|none|
|modified_at.after|query|string(date-time)|false|none|
|is_blocking|query|boolean|false|none|
|is_blocked|query|boolean|false|none|
|has_attachment|query|boolean|false|none|
|completed|query|boolean|false|none|
|is_subtask|query|boolean|false|none|
|sort_by|query|string|false|none|
|sort_ascending|query|boolean|false|none|

#### Enumerated Values

|Parameter|Value|
|---|---|
|resource_subtype|default_task|
|resource_subtype|milestone|
|assignee_status|inbox|
|assignee_status|today|
|assignee_status|upcoming|
|assignee_status|later|
|sort_by|due_date|
|sort_by|created_at|
|sort_by|completed_at|
|sort_by|likes|
|sort_by|modified_at|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="query-for-tasks-in-a-workspace-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the section's tasks.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-stories">Stories</h1>

A story represents an activity associated with an object in the Asana system.

## Get a task's stories

<a id="opIdgetTaskStories"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/stories \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/stories',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tasks/{task_gid}/stories', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tasks/{task_gid}/stories', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/stories");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tasks/{task_gid}/stories',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tasks/{task_gid}/stories`

Returns the compact records for all stories on the task.

<h3 id="get-a-task's-stories-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|task_gid|path|string|true|The task to get stories from.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "story",
      "resource_subtype": "milestone",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": null,
      "text": "marked today",
      "type": "comment",
      "html_text": "Get whatever Sashimi has.",
      "is_edited": false,
      "is_pinned": false,
      "hearted": false,
      "hearts": [],
      "num_hearts": 5,
      "liked": false,
      "likes": [],
      "num_likes": 5,
      "previews": [],
      "old_name": "This was the Old Name",
      "new_name": "This is the New Name",
      "old_dates": {},
      "new_dates": {},
      "old_resource_subtype": "default_task",
      "new_resource_subtype": "milestone",
      "story": {},
      "assignee": {},
      "follower": {},
      "old_section": {},
      "new_section": {},
      "task": {},
      "project": {},
      "tag": {},
      "custom_field": {},
      "old_text_value": "This was the Old Text",
      "new_text_value": "This is the New Text",
      "old_number_value": 1,
      "new_number_value": 2,
      "old_enum_value": {},
      "new_enum_value": {},
      "duplicate_of": {},
      "duplicated_from": {},
      "dependency": {},
      "source": "web",
      "target": {}
    }
  ]
}
```

<h3 id="get-a-task's-stories-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified task's stories.|[Story](#schemastory)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Create a comment on a task

<a id="opIdcreateCommentStory"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/stories \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "task": 123456,
  "text": "This is a comment."
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/stories',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/stories', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/stories', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/stories");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/stories',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/stories`

Adds a comment to a task. The comment will be authored by the currently
authenticated user, and timestamped when the server receives the
request.

Returns the full record for the new story added to the task.

> Body parameter

```json
{
  "task": 123456,
  "text": "This is a comment."
}
```

<h3 id="create-a-comment-on-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The comment story to create.|
|» task|body|integer|true|Globally unique identifier for the task.|
|» text|body|string|true|The plain text of the comment to add.|
|task_gid|path|string|true|The task to get stories from.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "story",
    "resource_subtype": "milestone",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": null,
    "text": "marked today",
    "type": "comment",
    "html_text": "Get whatever Sashimi has.",
    "is_edited": false,
    "is_pinned": false,
    "hearted": false,
    "hearts": [
      {}
    ],
    "num_hearts": 5,
    "liked": false,
    "likes": [
      {}
    ],
    "num_likes": 5,
    "previews": [
      {}
    ],
    "old_name": "This was the Old Name",
    "new_name": "This is the New Name",
    "old_dates": {
      "start_on": "2019-09-15",
      "due_at": "2012-02-22T02:06:58.158Z",
      "due_on": "2019-09-15"
    },
    "new_dates": {
      "start_on": "2019-09-15",
      "due_at": "2012-02-22T02:06:58.158Z",
      "due_on": "2019-09-15"
    },
    "old_resource_subtype": "default_task",
    "new_resource_subtype": "milestone",
    "story": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "story",
      "resource_subtype": "milestone",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": null,
      "text": "marked today",
      "type": "comment"
    },
    "assignee": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "follower": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "old_section": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "new_section": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "task": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "project": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "tag": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy"
    },
    "custom_field": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "custom_field",
      "name": "Bug Task",
      "resource_subtype": "milestone",
      "type": "text",
      "enum_options": [],
      "enum_value": null,
      "enabled": true,
      "text_value": "Some Value"
    },
    "old_text_value": "This was the Old Text",
    "new_text_value": "This is the New Text",
    "old_number_value": 1,
    "new_number_value": 2,
    "old_enum_value": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "enum_option",
      "name": "Low",
      "enabled": true,
      "color": "blue"
    },
    "new_enum_value": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "enum_option",
      "name": "Low",
      "enabled": true,
      "color": "blue"
    },
    "duplicate_of": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "duplicated_from": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "dependency": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "source": "web",
    "target": {
      "id": 1234,
      "name": "Bug Task"
    }
  }
}
```

<h3 id="create-a-comment-on-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created a new story.|[Story](#schemastory)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a story

<a id="opIdgetStory"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/stories/{story_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/stories/{story_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/stories/{story_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/stories/{story_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/stories/{story_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/stories/{story_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /stories/{story_gid}`

Returns the full record for a single story.

<h3 id="get-a-story-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|story_gid|path|string|true|The globally unique identifier for the story.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "story",
    "resource_subtype": "milestone",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": null,
    "text": "marked today",
    "type": "comment",
    "html_text": "Get whatever Sashimi has.",
    "is_edited": false,
    "is_pinned": false,
    "hearted": false,
    "hearts": [
      {}
    ],
    "num_hearts": 5,
    "liked": false,
    "likes": [
      {}
    ],
    "num_likes": 5,
    "previews": [
      {}
    ],
    "old_name": "This was the Old Name",
    "new_name": "This is the New Name",
    "old_dates": {
      "start_on": "2019-09-15",
      "due_at": "2012-02-22T02:06:58.158Z",
      "due_on": "2019-09-15"
    },
    "new_dates": {
      "start_on": "2019-09-15",
      "due_at": "2012-02-22T02:06:58.158Z",
      "due_on": "2019-09-15"
    },
    "old_resource_subtype": "default_task",
    "new_resource_subtype": "milestone",
    "story": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "story",
      "resource_subtype": "milestone",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": null,
      "text": "marked today",
      "type": "comment"
    },
    "assignee": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "follower": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "old_section": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "new_section": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "task": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "project": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "tag": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy"
    },
    "custom_field": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "custom_field",
      "name": "Bug Task",
      "resource_subtype": "milestone",
      "type": "text",
      "enum_options": [],
      "enum_value": null,
      "enabled": true,
      "text_value": "Some Value"
    },
    "old_text_value": "This was the Old Text",
    "new_text_value": "This is the New Text",
    "old_number_value": 1,
    "new_number_value": 2,
    "old_enum_value": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "enum_option",
      "name": "Low",
      "enabled": true,
      "color": "blue"
    },
    "new_enum_value": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "enum_option",
      "name": "Low",
      "enabled": true,
      "color": "blue"
    },
    "duplicate_of": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "duplicated_from": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "dependency": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "source": "web",
    "target": {
      "id": 1234,
      "name": "Bug Task"
    }
  }
}
```

<h3 id="get-a-story-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified story.|[Story](#schemastory)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Update a story

<a id="opIdupdateStory"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/stories/{story_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "created_by": null,
    "text": "marked today",
    "html_text": "Get whatever Sashimi has.",
    "is_pinned": false,
    "old_name": "This was the Old Name",
    "story": {
      "created_by": null,
      "text": "marked today"
    },
    "assignee": {
      "name": "Greg Sanchez"
    },
    "follower": {
      "name": "Greg Sanchez"
    },
    "old_section": {
      "name": "Next Actions"
    },
    "new_section": {
      "name": "Next Actions"
    },
    "task": {
      "name": "Bug Task"
    },
    "project": {
      "name": "Stuff to buy"
    },
    "tag": {
      "name": "Stuff to buy"
    },
    "custom_field": {
      "name": "Bug Task",
      "type": "text",
      "enum_options": [],
      "enum_value": null,
      "enabled": true,
      "text_value": "Some Value"
    },
    "old_enum_value": {
      "name": "Low",
      "enabled": true,
      "color": "blue"
    },
    "new_enum_value": {
      "name": "Low",
      "enabled": true,
      "color": "blue"
    },
    "duplicate_of": {
      "name": "Bug Task"
    },
    "duplicated_from": {
      "name": "Bug Task"
    },
    "dependency": {
      "name": "Bug Task"
    }
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/stories/{story_gid}',
{
  method: 'PUT',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('PUT','https://app.asana.com/api/1.0/stories/{story_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.put('https://app.asana.com/api/1.0/stories/{story_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/stories/{story_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("PUT");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.put 'https://app.asana.com/api/1.0/stories/{story_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`PUT /stories/{story_gid}`

Updates the story and returns the full record for the updated story. Only comment stories can have their text updated, and only comment stories and attachment stories can be pinned. Only one of `text` and `html_text` can be specified.

> Body parameter

```json
{
  "data": {
    "created_by": null,
    "text": "marked today",
    "html_text": "Get whatever Sashimi has.",
    "is_pinned": false,
    "old_name": "This was the Old Name",
    "story": {
      "created_by": null,
      "text": "marked today"
    },
    "assignee": {
      "name": "Greg Sanchez"
    },
    "follower": {
      "name": "Greg Sanchez"
    },
    "old_section": {
      "name": "Next Actions"
    },
    "new_section": {
      "name": "Next Actions"
    },
    "task": {
      "name": "Bug Task"
    },
    "project": {
      "name": "Stuff to buy"
    },
    "tag": {
      "name": "Stuff to buy"
    },
    "custom_field": {
      "name": "Bug Task",
      "type": "text",
      "enum_options": [],
      "enum_value": null,
      "enabled": true,
      "text_value": "Some Value"
    },
    "old_enum_value": {
      "name": "Low",
      "enabled": true,
      "color": "blue"
    },
    "new_enum_value": {
      "name": "Low",
      "enabled": true,
      "color": "blue"
    },
    "duplicate_of": {
      "name": "Bug Task"
    },
    "duplicated_from": {
      "name": "Bug Task"
    },
    "dependency": {
      "name": "Bug Task"
    }
  }
}
```

<h3 id="update-a-story-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[StoryObject](#schemastoryobject)|true|The comment story to update.|
|story_gid|path|string|true|The globally unique identifier for the story.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "story",
    "resource_subtype": "milestone",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": null,
    "text": "marked today",
    "type": "comment",
    "html_text": "Get whatever Sashimi has.",
    "is_edited": false,
    "is_pinned": false,
    "hearted": false,
    "hearts": [
      {}
    ],
    "num_hearts": 5,
    "liked": false,
    "likes": [
      {}
    ],
    "num_likes": 5,
    "previews": [
      {}
    ],
    "old_name": "This was the Old Name",
    "new_name": "This is the New Name",
    "old_dates": {
      "start_on": "2019-09-15",
      "due_at": "2012-02-22T02:06:58.158Z",
      "due_on": "2019-09-15"
    },
    "new_dates": {
      "start_on": "2019-09-15",
      "due_at": "2012-02-22T02:06:58.158Z",
      "due_on": "2019-09-15"
    },
    "old_resource_subtype": "default_task",
    "new_resource_subtype": "milestone",
    "story": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "story",
      "resource_subtype": "milestone",
      "created_at": "2012-02-22T02:06:58.147Z",
      "created_by": null,
      "text": "marked today",
      "type": "comment"
    },
    "assignee": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "follower": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "old_section": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "new_section": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "section",
      "name": "Next Actions"
    },
    "task": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "project": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "tag": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy"
    },
    "custom_field": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "custom_field",
      "name": "Bug Task",
      "resource_subtype": "milestone",
      "type": "text",
      "enum_options": [],
      "enum_value": null,
      "enabled": true,
      "text_value": "Some Value"
    },
    "old_text_value": "This was the Old Text",
    "new_text_value": "This is the New Text",
    "old_number_value": 1,
    "new_number_value": 2,
    "old_enum_value": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "enum_option",
      "name": "Low",
      "enabled": true,
      "color": "blue"
    },
    "new_enum_value": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "enum_option",
      "name": "Low",
      "enabled": true,
      "color": "blue"
    },
    "duplicate_of": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "duplicated_from": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "dependency": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    },
    "source": "web",
    "target": {
      "id": 1234,
      "name": "Bug Task"
    }
  }
}
```

<h3 id="update-a-story-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified story.|[Story](#schemastory)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Delete a story

<a id="opIddeleteStory"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/stories/{story_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/stories/{story_gid}',
{
  method: 'DELETE',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('DELETE','https://app.asana.com/api/1.0/stories/{story_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.delete('https://app.asana.com/api/1.0/stories/{story_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/stories/{story_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.delete 'https://app.asana.com/api/1.0/stories/{story_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /stories/{story_gid}`

Deletes a story. A user can only delete stories they have created. Returns an empty data record.

Returns an empty data record.

<h3 id="delete-a-story-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|story_gid|path|string|true|The globally unique identifier for the story.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="delete-a-story-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully deleted the specified story.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-tags">Tags</h1>

A tag is a label that can be attached to any task in Asana. It exists in a single workspace or organization.

## Get a set of tags

<a id="opIdqueryTags"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tags \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tags',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tags', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tags', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tags");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tags',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tags`

Returns the compact tag records for some filtered set of tags. Use one or more of the parameters provided to filter the tags returned.

<h3 id="get-a-set-of-tags-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|workspace|query|integer|false|The workspace to filter tags on.|
|archived|query|boolean|false|Only return tags whose `archived` field takes on the value of this parameter.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy",
      "followers": [],
      "color": "light-green",
      "workspace": {}
    }
  ]
}
```

<h3 id="get-a-set-of-tags-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified set of tags.|[Tag](#schematag)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Create a tag

<a id="opIdcreateTag"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tags \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Stuff to buy",
    "color": "light-green",
    "workspace": {
      "name": "Bug Task"
    }
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tags',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tags', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tags', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tags");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tags',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tags`

Creates a new tag in a workspace or organization.

Every tag is required to be created in a specific workspace or
organization, and this cannot be changed once set. Note that you can use
the workspace parameter regardless of whether or not it is an
organization.

Returns the full record of the newly created tag.

> Body parameter

```json
{
  "data": {
    "name": "Stuff to buy",
    "color": "light-green",
    "workspace": {
      "name": "Bug Task"
    }
  }
}
```

<h3 id="create-a-tag-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[TagObject](#schematagobject)|true|The tag to create.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "tag",
    "name": "Stuff to buy",
    "followers": [
      {}
    ],
    "color": "light-green",
    "workspace": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "workspace",
      "name": "Bug Task"
    }
  }
}
```

<h3 id="create-a-tag-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created the newly specified tag.|[Tag](#schematag)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a tag

<a id="opIdgetTag"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tags/{tag_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tags/{tag_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tags/{tag_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tags/{tag_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tags/{tag_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tags/{tag_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tags/{tag_gid}`

Returns the complete tag record for a single tag.

<h3 id="get-a-tag-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|tag_gid|path|string|true|Globally unique identifier for the tag.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "tag",
    "name": "Stuff to buy",
    "followers": [
      {}
    ],
    "color": "light-green",
    "workspace": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "workspace",
      "name": "Bug Task"
    }
  }
}
```

<h3 id="get-a-tag-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified tag.|[Tag](#schematag)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Update a tag

<a id="opIdupdateTag"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/tags/{tag_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tags/{tag_gid}',
{
  method: 'PUT',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('PUT','https://app.asana.com/api/1.0/tags/{tag_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.put('https://app.asana.com/api/1.0/tags/{tag_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tags/{tag_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("PUT");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.put 'https://app.asana.com/api/1.0/tags/{tag_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`PUT /tags/{tag_gid}`

Updates the properties of a tag. Only the fields provided in the `data`
block will be updated; any unspecified fields will remain unchanged.

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the task.

Returns the complete updated tag record.

<h3 id="update-a-tag-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|tag_gid|path|string|true|Globally unique identifier for the tag.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "tag",
    "name": "Stuff to buy",
    "followers": [
      {}
    ],
    "color": "light-green",
    "workspace": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "workspace",
      "name": "Bug Task"
    }
  }
}
```

<h3 id="update-a-tag-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully updated the specified tag.|[Tag](#schematag)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get tasks with tag

<a id="opIdgetTagTasks"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tags/{tag_gid}/tasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tags/{tag_gid}/tasks',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tags/{tag_gid}/tasks', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tags/{tag_gid}/tasks', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tags/{tag_gid}/tasks");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tags/{tag_gid}/tasks',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tags/{tag_gid}/tasks`

Returns the compact task records for all tasks with the given tag. Tasks can have more than one tag at a time.

<h3 id="get-tasks-with-tag-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|tag_gid|path|string|true|Globally unique identifier for the tag.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="get-tasks-with-tag-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the tasks associated with the specified tag.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get tags in a workspace

<a id="opIdqueryAllTagsInWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /workspaces/{workspace_gid}/tags`

Returns the compact tag records for some filtered set of tags. Use one or more of the parameters provided to filter the tags returned.

<h3 id="get-tags-in-a-workspace-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|workspace_gid|path|integer|true|The workspace to filter tags on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy",
      "followers": [],
      "color": "light-green",
      "workspace": {}
    }
  ]
}
```

<h3 id="get-tags-in-a-workspace-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified set of tags.|[Tag](#schematag)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Create a tag in a workspace

<a id="opIdcreateTagInWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Stuff to buy",
    "color": "light-green",
    "workspace": {
      "name": "Bug Task"
    }
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tags',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /workspaces/{workspace_gid}/tags`

Creates a new tag in a workspace or organization.

Every tag is required to be created in a specific workspace or
organization, and this cannot be changed once set. Note that you can use
the workspace parameter regardless of whether or not it is an
organization.

Returns the full record of the newly created tag.

> Body parameter

```json
{
  "data": {
    "name": "Stuff to buy",
    "color": "light-green",
    "workspace": {
      "name": "Bug Task"
    }
  }
}
```

<h3 id="create-a-tag-in-a-workspace-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[TagObject](#schematagobject)|true|The tag to create.|
|workspace_gid|path|integer|true|The workspace to filter tags on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy",
      "followers": [],
      "color": "light-green",
      "workspace": {}
    }
  ]
}
```

<h3 id="create-a-tag-in-a-workspace-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified set of tags.|[Tag](#schematag)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-tasks">Tasks</h1>

The task is the basic object around which many operations in Asana are centered.

## Get a project's tasks

<a id="opIdgetProjectTasks"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/projects/{project_gid}/tasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/projects/{project_gid}/tasks',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/projects/{project_gid}/tasks', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/projects/{project_gid}/tasks', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/projects/{project_gid}/tasks");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/projects/{project_gid}/tasks',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /projects/{project_gid}/tasks`

Returns the compact task records for all tasks within the given project, ordered by their priority within the project. Tasks can exist in more than one project at a time.

<h3 id="get-a-project's-tasks-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|project_gid|path|string|true|Globally unique identifier for the project.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="get-a-project's-tasks-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested project's tasks.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a set of tasks

<a id="opIdqueryTasks"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tasks', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tasks', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tasks',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tasks`

Returns the compact task records for some filtered set of tasks. Use one or more of the parameters provided to filter the tasks returned. You must specify a `project` or `tag` if you do not specify `assignee` and `workspace`.

<h3 id="get-a-set-of-tasks-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|assignee|query|any|false|The assignee to filter tasks on.|
|project|query|integer|false|The project to filter tasks on.|
|section|query|integer|false|The section to filter tasks on.|
|workspace|query|integer|false|The workspace to filter tasks on.|
|completed_since|query|any|false|Only return tasks that are either incomplete or that have been completed since this time.|
|modified_since|query|any|false|Only return tasks that have been modified since the given time.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Detailed descriptions

**assignee**: The assignee to filter tasks on.
**Note**: If you specify `assignee`, you must also specify the `workspace` to filter on.

**section**: The section to filter tasks on.
**Note**: Currently, this is only supported in board views.

**workspace**: The workspace to filter tasks on.
**Note**: If you specify `workspace`, you must also specify the `assignee` to filter on.

**modified_since**: Only return tasks that have been modified since the given time.

**Note**: A task is considered “modified” if any of its properties
change, or associations between it and other objects are modified
(e.g.  a task being added to a project). A task is not considered
modified just because another object it is associated with (e.g. a
subtask) is modified. Actions that count as modifying the task
include assigning, renaming, completing, and adding stories.

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="get-a-set-of-tasks-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved requested tasks.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Create a task

<a id="opIdcreateTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Buy catnip",
    "assignee": null,
    "assignee_status": "upcoming",
    "completed": false,
    "due_at": "2012-02-22T02:06:58.147Z",
    "due_on": "2012-03-26",
    "external": {
      "id": "my_id",
      "data": "A blob of information"
    },
    "followers": [
      {}
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "memberships": [
      {}
    ],
    "notes": "Mittens really likes the stuff from Humboldt.",
    "parent": null,
    "projects": [
      {}
    ],
    "start_on": "2012-03-26",
    "tags": [
      {}
    ],
    "workspace": null
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks`

Creating a new task is as easy as POSTing to the `/tasks` endpoint with a
data block containing the fields you’d like to set on the task. Any
unspecified fields will take on default values.

Every task is required to be created in a specific workspace, and this
workspace cannot be changed once set. The workspace need not be set
explicitly if you specify `projects` or a `parent` task instead.

> Body parameter

```json
{
  "data": {
    "name": "Buy catnip",
    "assignee": null,
    "assignee_status": "upcoming",
    "completed": false,
    "due_at": "2012-02-22T02:06:58.147Z",
    "due_on": "2012-03-26",
    "external": {
      "id": "my_id",
      "data": "A blob of information"
    },
    "followers": [
      {}
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "memberships": [
      {}
    ],
    "notes": "Mittens really likes the stuff from Humboldt.",
    "parent": null,
    "projects": [
      {}
    ],
    "start_on": "2012-03-26",
    "tags": [
      {}
    ],
    "workspace": null
  }
}
```

<h3 id="create-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|any|true|The task to create.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Buy catnip",
    "created_at": "2012-02-22T02:06:58.147Z",
    "resource_subtype": "default_task",
    "assignee": null,
    "assignee_status": "upcoming",
    "completed": false,
    "completed_at": "2012-02-22T02:06:58.147Z",
    "custom_fields": [
      {}
    ],
    "dependencies": [
      {},
      {}
    ],
    "dependents": [
      {},
      {}
    ],
    "due_at": "2012-02-22T02:06:58.147Z",
    "due_on": "2012-03-26",
    "external": {
      "id": "my_id",
      "data": "A blob of information"
    },
    "followers": [
      {}
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "hearted": true,
    "hearts": [
      {}
    ],
    "liked": true,
    "likes": [
      {}
    ],
    "memberships": [
      {}
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "num_hearts": 5,
    "num_likes": 5,
    "num_subtasks": 3,
    "parent": null,
    "projects": [
      {}
    ],
    "start_on": "2012-03-26",
    "tags": [
      {}
    ],
    "workspace": null
  }
}
```

<h3 id="create-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created a new task.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a task

<a id="opIdgetTask"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tasks/{task_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tasks/{task_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tasks/{task_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tasks/{task_gid}`

Returns the complete task record for a single task.

<h3 id="get-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Buy catnip",
    "created_at": "2012-02-22T02:06:58.147Z",
    "resource_subtype": "default_task",
    "assignee": null,
    "assignee_status": "upcoming",
    "completed": false,
    "completed_at": "2012-02-22T02:06:58.147Z",
    "custom_fields": [
      {}
    ],
    "dependencies": [
      {},
      {}
    ],
    "dependents": [
      {},
      {}
    ],
    "due_at": "2012-02-22T02:06:58.147Z",
    "due_on": "2012-03-26",
    "external": {
      "id": "my_id",
      "data": "A blob of information"
    },
    "followers": [
      {}
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "hearted": true,
    "hearts": [
      {}
    ],
    "liked": true,
    "likes": [
      {}
    ],
    "memberships": [
      {}
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "num_hearts": 5,
    "num_likes": 5,
    "num_subtasks": 3,
    "parent": null,
    "projects": [
      {}
    ],
    "start_on": "2012-03-26",
    "tags": [
      {}
    ],
    "workspace": null
  }
}
```

<h3 id="get-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified task.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Update a task

<a id="opIdupdateTask"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/tasks/{task_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Buy catnip",
    "assignee": null,
    "assignee_status": "upcoming",
    "completed": false,
    "due_at": "2012-02-22T02:06:58.147Z",
    "due_on": "2012-03-26",
    "external": {
      "id": "my_id",
      "data": "A blob of information"
    },
    "followers": [
      {}
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "memberships": [
      {}
    ],
    "notes": "Mittens really likes the stuff from Humboldt.",
    "parent": null,
    "projects": [
      {}
    ],
    "start_on": "2012-03-26",
    "tags": [
      {}
    ],
    "workspace": null
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}',
{
  method: 'PUT',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('PUT','https://app.asana.com/api/1.0/tasks/{task_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.put('https://app.asana.com/api/1.0/tasks/{task_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("PUT");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.put 'https://app.asana.com/api/1.0/tasks/{task_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`PUT /tasks/{task_gid}`

A specific, existing task can be updated by making a PUT request on the
URL for that task. Only the fields provided in the `data` block will be
updated; any unspecified fields will remain unchanged.

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the task.

Returns the complete updated task record.

> Body parameter

```json
{
  "data": {
    "name": "Buy catnip",
    "assignee": null,
    "assignee_status": "upcoming",
    "completed": false,
    "due_at": "2012-02-22T02:06:58.147Z",
    "due_on": "2012-03-26",
    "external": {
      "id": "my_id",
      "data": "A blob of information"
    },
    "followers": [
      {}
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "memberships": [
      {}
    ],
    "notes": "Mittens really likes the stuff from Humboldt.",
    "parent": null,
    "projects": [
      {}
    ],
    "start_on": "2012-03-26",
    "tags": [
      {}
    ],
    "workspace": null
  }
}
```

<h3 id="update-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[TaskObject](#schemataskobject)|true|The task to update.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Buy catnip",
    "created_at": "2012-02-22T02:06:58.147Z",
    "resource_subtype": "default_task",
    "assignee": null,
    "assignee_status": "upcoming",
    "completed": false,
    "completed_at": "2012-02-22T02:06:58.147Z",
    "custom_fields": [
      {}
    ],
    "dependencies": [
      {},
      {}
    ],
    "dependents": [
      {},
      {}
    ],
    "due_at": "2012-02-22T02:06:58.147Z",
    "due_on": "2012-03-26",
    "external": {
      "id": "my_id",
      "data": "A blob of information"
    },
    "followers": [
      {}
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "hearted": true,
    "hearts": [
      {}
    ],
    "liked": true,
    "likes": [
      {}
    ],
    "memberships": [
      {}
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "num_hearts": 5,
    "num_likes": 5,
    "num_subtasks": 3,
    "parent": null,
    "projects": [
      {}
    ],
    "start_on": "2012-03-26",
    "tags": [
      {}
    ],
    "workspace": null
  }
}
```

<h3 id="update-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully updated the specified task.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Delete a task

<a id="opIddeleteTask"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/tasks/{task_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}',
{
  method: 'DELETE',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('DELETE','https://app.asana.com/api/1.0/tasks/{task_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.delete('https://app.asana.com/api/1.0/tasks/{task_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.delete 'https://app.asana.com/api/1.0/tasks/{task_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /tasks/{task_gid}`

A specific, existing task can be deleted by making a DELETE request on
the URL for that task. Deleted tasks go into the “trash” of the user
making the delete request. Tasks can be recovered from the trash within a
period of 30 days; afterward they are completely removed from the system.

Returns an empty data record.

<h3 id="delete-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="delete-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully deleted the specified task.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Duplicate a task

<a id="opIdduplicateTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/duplicate \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "New Task Name",
    "include": [
      "notes",
      "assignee"
    ]
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/duplicate',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/duplicate', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/duplicate', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/duplicate");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/duplicate',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/duplicate`

Creates and returns a job that will asynchronously handle the duplication.

> Body parameter

```json
{
  "data": {
    "name": "New Task Name",
    "include": [
      "notes",
      "assignee"
    ]
  }
}
```

<h3 id="duplicate-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|Describes the duplicate's name and the fields that will be duplicated.|
|» data|body|object|false|none|
|»» name|body|string|false|The name of the new task.|
|»» include|body|string|false|The fields that will be duplicated to the new task.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| include|notes|
| include|assignee|
| include|subtasks|
| include|attachments|
| include|tags|
| include|followers|
| include|projects|
| include|dates|
| include|dependencies|
| include|parent|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "resource_subtype": "milestone",
    "status": "in_progress",
    "new_project": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    },
    "new_task": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  }
}
```

<h3 id="duplicate-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created the job to handle duplication.|[Job](#schemajob)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a subtask

<a id="opIdgetSubTasks"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tasks/{task_gid}/subtasks`

Returns a compact representation of all of the subtasks of a task.

<h3 id="get-a-subtask-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="get-a-subtask-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified task's subtasks.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Create a subtask

<a id="opIdcreateSubtask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Buy catnip",
    "assignee": null,
    "assignee_status": "upcoming",
    "completed": false,
    "due_at": "2012-02-22T02:06:58.147Z",
    "due_on": "2012-03-26",
    "external": {
      "id": "my_id",
      "data": "A blob of information"
    },
    "followers": [
      {}
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "memberships": [
      {}
    ],
    "notes": "Mittens really likes the stuff from Humboldt.",
    "parent": null,
    "projects": [
      {}
    ],
    "start_on": "2012-03-26",
    "tags": [
      {}
    ],
    "workspace": null
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/subtasks`

Creates a new subtask and adds it to the parent task. Returns the full record for the newly created subtask.

> Body parameter

```json
{
  "data": {
    "name": "Buy catnip",
    "assignee": null,
    "assignee_status": "upcoming",
    "completed": false,
    "due_at": "2012-02-22T02:06:58.147Z",
    "due_on": "2012-03-26",
    "external": {
      "id": "my_id",
      "data": "A blob of information"
    },
    "followers": [
      {}
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "memberships": [
      {}
    ],
    "notes": "Mittens really likes the stuff from Humboldt.",
    "parent": null,
    "projects": [
      {}
    ],
    "start_on": "2012-03-26",
    "tags": [
      {}
    ],
    "workspace": null
  }
}
```

<h3 id="create-a-subtask-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[TaskObject](#schemataskobject)|true|The new subtask to create.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Buy catnip",
    "created_at": "2012-02-22T02:06:58.147Z",
    "resource_subtype": "default_task",
    "assignee": null,
    "assignee_status": "upcoming",
    "completed": false,
    "completed_at": "2012-02-22T02:06:58.147Z",
    "custom_fields": [
      {}
    ],
    "dependencies": [
      {},
      {}
    ],
    "dependents": [
      {},
      {}
    ],
    "due_at": "2012-02-22T02:06:58.147Z",
    "due_on": "2012-03-26",
    "external": {
      "id": "my_id",
      "data": "A blob of information"
    },
    "followers": [
      {}
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "hearted": true,
    "hearts": [
      {}
    ],
    "liked": true,
    "likes": [
      {}
    ],
    "memberships": [
      {}
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "num_hearts": 5,
    "num_likes": 5,
    "num_subtasks": 3,
    "parent": null,
    "projects": [
      {}
    ],
    "start_on": "2012-03-26",
    "tags": [
      {}
    ],
    "workspace": null
  }
}
```

<h3 id="create-a-subtask-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created the specified subtask.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Change a task's parent

<a id="opIdchangeSubtaskParent"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/setParent \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "parent": 987654,
    "insert_after": "null",
    "insert_before": "124816"
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/setParent',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/setParent', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/setParent', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/setParent");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/setParent',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/setParent`

parent, or no parent task at all. Returns an empty data block. When using `insert_before` and `insert_after`, at most one of those two options can be specified, and they must already be subtasks of the parent.

> Body parameter

```json
{
  "data": {
    "parent": 987654,
    "insert_after": "null",
    "insert_before": "124816"
  }
}
```

<h3 id="change-a-task's-parent-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The new parent of the subtask.|
|» data|body|object|false|none|
|»» parent|body|integer|true|The new parent of the task, or `null` for no parent.|
|»» insert_after|body|integer|false|A subtask of the parent to insert the task after, or `null` to insert at the beginning of the list.|
|»» insert_before|body|integer|false|A subtask of the parent to insert the task before, or `null` to insert at the end of the list.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Buy catnip",
    "created_at": "2012-02-22T02:06:58.147Z",
    "resource_subtype": "default_task",
    "assignee": null,
    "assignee_status": "upcoming",
    "completed": false,
    "completed_at": "2012-02-22T02:06:58.147Z",
    "custom_fields": [
      {}
    ],
    "dependencies": [
      {},
      {}
    ],
    "dependents": [
      {},
      {}
    ],
    "due_at": "2012-02-22T02:06:58.147Z",
    "due_on": "2012-03-26",
    "external": {
      "id": "my_id",
      "data": "A blob of information"
    },
    "followers": [
      {}
    ],
    "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
    "hearted": true,
    "hearts": [
      {}
    ],
    "liked": true,
    "likes": [
      {}
    ],
    "memberships": [
      {}
    ],
    "modified_at": "2012-02-22T02:06:58.147Z",
    "notes": "Mittens really likes the stuff from Humboldt.",
    "num_hearts": 5,
    "num_likes": 5,
    "num_subtasks": 3,
    "parent": null,
    "projects": [
      {}
    ],
    "start_on": "2012-03-26",
    "tags": [
      {}
    ],
    "workspace": null
  }
}
```

<h3 id="change-a-task's-parent-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully changed the parent of the specified subtask.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a task's dependencies

<a id="opIdgetTaskDependencies"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/dependencies \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/dependencies',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tasks/{task_gid}/dependencies', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tasks/{task_gid}/dependencies', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/dependencies");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tasks/{task_gid}/dependencies',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tasks/{task_gid}/dependencies`

Returns the compact representations of all of the dependencies of a task.

<h3 id="get-a-task's-dependencies-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="get-a-task's-dependencies-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified task's dependencies.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Set a task's dependencies

<a id="opIdaddTaskDependencies"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/addDependencies \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "dependencies": [
      133713,
      184253
    ]
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/addDependencies',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/addDependencies', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/addDependencies', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/addDependencies");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/addDependencies',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/addDependencies`

Marks a set of tasks as dependencies of this task, if they are not already dependencies. *A task can have at most 15 dependencies*.

> Body parameter

```json
{
  "data": {
    "dependencies": [
      133713,
      184253
    ]
  }
}
```

<h3 id="set-a-task's-dependencies-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[DependencyArray](#schemadependencyarray)|true|The list of tasks to set as dependencies.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="set-a-task's-dependencies-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully set the specified dependencies on the task.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Unlinks dependencies from a task

<a id="opIdremoveTaskDependencies"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependencies \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "dependencies": [
      133713,
      184253
    ]
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependencies',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependencies', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependencies', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependencies");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependencies',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/removeDependencies`

Unlinks a set of dependencies from this task.

> Body parameter

```json
{
  "data": {
    "dependencies": [
      133713,
      184253
    ]
  }
}
```

<h3 id="unlinks-dependencies-from-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[DependencyArray](#schemadependencyarray)|true|The list of tasks to unlink as dependencies.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="unlinks-dependencies-from-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully unlinked the dependencies from the specified task.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a task's dependents

<a id="opIdgetTaskDependents"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/dependents \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/dependents',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tasks/{task_gid}/dependents', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tasks/{task_gid}/dependents', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/dependents");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tasks/{task_gid}/dependents',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tasks/{task_gid}/dependents`

Returns the compact representations of all of the dependents of a task.

<h3 id="get-a-task's-dependents-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="get-a-task's-dependents-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the specified dependents of the task.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Set a task's dependents

<a id="opIdaddTaskDependents"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/addDependents \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "dependents": [
      133713,
      184253
    ]
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/addDependents',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/addDependents', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/addDependents', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/addDependents");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/addDependents',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/addDependents`

Marks a set of tasks as dependents of this task, if they are not already dependents. *A task can have at most 30 dependents*.

> Body parameter

```json
{
  "data": {
    "dependents": [
      133713,
      184253
    ]
  }
}
```

<h3 id="set-a-task's-dependents-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[DependentArray](#schemadependentarray)|true|The list of tasks to add as dependents.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="set-a-task's-dependents-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully set the specified dependents on the given task.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Unlink dependents from a task

<a id="opIdremoveTaskDependents"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependents \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "dependents": [
      133713,
      184253
    ]
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependents',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependents', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependents', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependents");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependents',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/removeDependents`

Unlinks a set of dependents from this task.

> Body parameter

```json
{
  "data": {
    "dependents": [
      133713,
      184253
    ]
  }
}
```

<h3 id="unlink-dependents-from-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[DependentArray](#schemadependentarray)|true|The list of tasks to remove as dependents.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="unlink-dependents-from-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully unlinked the specified tasks as dependents.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get projects a task is in

<a id="opIdgetTaskProjects"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/projects \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/projects',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tasks/{task_gid}/projects', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tasks/{task_gid}/projects', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/projects");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tasks/{task_gid}/projects',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tasks/{task_gid}/projects`

Returns a compact representation of all of the projects the task is in.

<h3 id="get-projects-a-task-is-in-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy",
      "created_at": "2012-02-22T02:06:58.147Z",
      "archived": false,
      "color": "light-green",
      "current_status": {},
      "custom_fields": [],
      "custom_field_settings": [],
      "due_date": "2012-03-26",
      "due_on": "2012-03-26",
      "followers": [],
      "html_notes": "These are things we need to purchase.",
      "is_template": false,
      "layout": "list",
      "members": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "These are things we need to purchase.",
      "owner": null,
      "public": false,
      "section_migration_status": "not_migrated",
      "start_on": "2012-03-26",
      "team": null,
      "workspace": null
    }
  ]
}
```

<h3 id="get-projects-a-task-is-in-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the projects for the given task.|[Project](#schemaproject)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Add a project to a task

<a id="opIdaddProjectToTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/addProject \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "project": 13579,
    "insert_after": 124816,
    "insert_before": 432134,
    "section": 987654
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/addProject',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/addProject', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/addProject', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/addProject");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/addProject',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/addProject`

Adds the task to the specified project, in the optional location
specified. If no location arguments are given, the task will be added to
the end of the project.

`addProject` can also be used to reorder a task within a project or
section that already contains it.

At most one of `insert_before`, `insert_after`, or `section` should be
specified. Inserting into a section in an non-order-dependent way can be
done by specifying section, otherwise, to insert within a section in a
particular place, specify `insert_before` or `insert_after` and a task
within the section to anchor the position of this task.

Returns an empty data block.

> Body parameter

```json
{
  "data": {
    "project": 13579,
    "insert_after": 124816,
    "insert_before": 432134,
    "section": 987654
  }
}
```

<h3 id="add-a-project-to-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The project to add the task to.|
|» data|body|object|false|none|
|»» project|body|integer|true|The project to add the task to.|
|»» insert_after|body|integer¦null|false|A task in the project to insert the task after, or `null` to insert at the beginning of the list.|
|»» insert_before|body|integer¦null|false|A task in the project to insert the task before, or `null` to insert at the end of the list.|
|»» section|body|integer¦null|false|A section in the project to insert the task into. The task will be inserted at the bottom of the section.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="add-a-project-to-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully added the specified project to the task.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Remove a project a task

<a id="opIdremoveProjectFromTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/removeProject \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "project": 13579
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/removeProject',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/removeProject', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/removeProject', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/removeProject");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/removeProject',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/removeProject`

Removes the task from the specified project. The task will still exist in
the system, but it will not be in the project anymore.

Returns an empty data block.

> Body parameter

```json
{
  "data": {
    "project": 13579
  }
}
```

<h3 id="remove-a-project-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The project to remove the task from.|
|» data|body|object|false|none|
|»» project|body|integer|true|The project to remove the task from.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="remove-a-project-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully removed the specified project from the task.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a task's tags

<a id="opIdgetTaskTags"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/tasks/{task_gid}/tags \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/tags',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/tasks/{task_gid}/tags', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/tasks/{task_gid}/tags', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/tags");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/tasks/{task_gid}/tags',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tasks/{task_gid}/tags`

Get a compact representation of all of the tags the task has.

<h3 id="get-a-task's-tags-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "tag",
      "name": "Stuff to buy",
      "followers": [],
      "color": "light-green",
      "workspace": {}
    }
  ]
}
```

<h3 id="get-a-task's-tags-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the tags for the given task.|[Tag](#schematag)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Add a tag to a task

<a id="opIdaddTagToTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/addTag \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "tag": 13579
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/addTag',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/addTag', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/addTag', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/addTag");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/addTag',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/addTag`

Adds a tag to a task. Returns an empty data block.

> Body parameter

```json
{
  "data": {
    "tag": 13579
  }
}
```

<h3 id="add-a-tag-to-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The tag to add to the task.|
|» data|body|object|false|none|
|»» tag|body|integer|true|The tag to add to the task.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="add-a-tag-to-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully added the specified tag to the task.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Remove a tag from a task

<a id="opIdremoveTagFromTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/removeTag \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "tag": 13579
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/removeTag',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/removeTag', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/removeTag', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/removeTag");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/removeTag',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/removeTag`

Removes a tag from a task. Returns an empty data block.

> Body parameter

```json
{
  "data": {
    "tag": 13579
  }
}
```

<h3 id="remove-a-tag-from-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The tag to remove from the task.|
|» data|body|object|false|none|
|»» tag|body|integer|true|The tag to remove from the task.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="remove-a-tag-from-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully removed the specified tag from the task.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Add followers to a task

<a id="opIdaddFollowerToTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/addFollowers \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "followers": [
      13579,
      321654
    ]
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/addFollowers',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/addFollowers', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/addFollowers', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/addFollowers");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/addFollowers',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/addFollowers`

Adds a tag to a task. Returns an empty data block.
Each task can be associated with zero or more followers in the system.
Requests to add/remove followers, if successful, will return the complete updated task record, described above.

> Body parameter

```json
{
  "data": {
    "followers": [
      13579,
      321654
    ]
  }
}
```

<h3 id="add-followers-to-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The tag to add to the task.|
|» data|body|object|false|none|
|»» followers|body|[integer]|true|The tag to add to the task.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="add-followers-to-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully added the specified tag to the task.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Remove followers from a task

<a id="opIdremoveFollowerToTask"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/tasks/{task_gid}/removeFollowers \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "followers": [
      13579,
      321654
    ]
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/tasks/{task_gid}/removeFollowers',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/tasks/{task_gid}/removeFollowers', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/tasks/{task_gid}/removeFollowers', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/tasks/{task_gid}/removeFollowers");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/tasks/{task_gid}/removeFollowers',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /tasks/{task_gid}/removeFollowers`

Removes each of the specified followers from the task if they are following. Returns the complete, updated record for the affected task.

> Body parameter

```json
{
  "data": {
    "followers": [
      13579,
      321654
    ]
  }
}
```

<h3 id="remove-followers-from-a-task-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The tag to remove to the task.|
|» data|body|object|false|none|
|»» followers|body|[integer]|true|The tag to add to the task.|
|task_gid|path|string|true|The task to operate on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="remove-followers-from-a-task-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully removed the specified tag to the task.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-team">Team</h1>

A *team* is used to group related projects and people together within an organization. Each project in an organization is associated with a team.

## Get a team

<a id="opIdgetTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/teams/{team_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/teams/{team_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/teams/{team_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/teams/{team_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/teams/{team_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/teams/{team_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /teams/{team_gid}`

Returns the full record for a single team.

<h3 id="get-a-team-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|team_gid|path|integer|true|Globally unique identifier for the team.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "team",
    "name": "Bug Task",
    "description": "All developers should be members of this team.",
    "html_description": "<body><em>All</em> developers should be members of this team.</body>",
    "organization": null
  }
}
```

<h3 id="get-a-team-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successsfully retrieved the record for a single team.|[Team](#schemateam)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get teams in an organization

<a id="opIdgetAllTeams"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/organizations/{organization_gid}/teams \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/organizations/{organization_gid}/teams',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/organizations/{organization_gid}/teams', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/organizations/{organization_gid}/teams', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/organizations/{organization_gid}/teams");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/organizations/{organization_gid}/teams',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /organizations/{organization_gid}/teams`

Returns the compact records for all teams in the organization visible to the authorized user.

<h3 id="get-teams-in-an-organization-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|organization_gid|path|integer|true|Globally unique identifier for the workspace or organization.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "team",
      "name": "Bug Task",
      "description": "All developers should be members of this team.",
      "html_description": "<body><em>All</em> developers should be members of this team.</body>",
      "organization": null
    }
  ]
}
```

<h3 id="get-teams-in-an-organization-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns the team records for all teams in the organization or workspace accessible to the authenticated user.|[Team](#schemateam)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a user's teams

<a id="opIdgetTeamsForUser"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users/{user_gid}/teams?organization_gid=1331 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/users/{user_gid}/teams?organization_gid=1331',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/users/{user_gid}/teams', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/users/{user_gid}/teams', params={
  'organization_gid': '1331'
}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/users/{user_gid}/teams?organization_gid=1331");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/users/{user_gid}/teams',
  params: {
  'organization_gid' => 'integer'
}, headers: headers

p JSON.parse(result)

```

`GET /users/{user_gid}/teams`

Returns the compact records for all teams to which the given user is assigned.

<h3 id="get-a-user's-teams-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|user_gid|path|any|true|An identifier for the user. Can be one of an email address, the globally unique identifier for the user, or the keyword `me` to indicate the current user making the request.|
|organization_gid|query|integer|true|The workspace or organization to filter teams on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "team",
      "name": "Bug Task",
      "description": "All developers should be members of this team.",
      "html_description": "<body><em>All</em> developers should be members of this team.</body>",
      "organization": null
    }
  ]
}
```

<h3 id="get-a-user's-teams-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns the team records for all teams in the organization or workspace to which the given user is assigned.|[Team](#schemateam)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get users in a team

<a id="opIdgetUsersForTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/teams/{team_gid}/users \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/teams/{team_gid}/users',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/teams/{team_gid}/users', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/teams/{team_gid}/users', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/teams/{team_gid}/users");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/teams/{team_gid}/users',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /teams/{team_gid}/users`

Returns the compact records for all users that are members of the team.

<h3 id="get-users-in-a-team-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|team_gid|path|integer|true|A globally unique identifier for the team.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez",
      "email": "gsanchez@example.com",
      "photo": {},
      "workspaces": []
    }
  ]
}
```

<h3 id="get-users-in-a-team-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns the user records for all the members of the team, including guests and limited access users|[User](#schemauser)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Add a user to a team

<a id="opIdaddUserToTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/teams/{team_gid}/addUser \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "user": 14641
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/teams/{team_gid}/addUser',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/teams/{team_gid}/addUser', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/teams/{team_gid}/addUser', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/teams/{team_gid}/addUser");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/teams/{team_gid}/addUser',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /teams/{team_gid}/addUser`

The user making this call must be a member of the team in order to add others. The user being added must exist in the same organization as the team.

> Body parameter

```json
{
  "user": 14641
}
```

<h3 id="add-a-user-to-a-team-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[UserIdObject](#schemauseridobject)|true|The user to add to the team.|
|team_gid|path|integer|true|A globally unique identifier for the team.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez",
      "email": "gsanchez@example.com",
      "photo": {},
      "workspaces": []
    }
  ]
}
```

<h3 id="add-a-user-to-a-team-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns the full user record for the added user.|[User](#schemauser)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Remove a user from a team

<a id="opIdremoveUserFromTeam"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/teams/{team_gid}/removeUser \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "user": 14641
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/teams/{team_gid}/removeUser',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/teams/{team_gid}/removeUser', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/teams/{team_gid}/removeUser', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/teams/{team_gid}/removeUser");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/teams/{team_gid}/removeUser',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /teams/{team_gid}/removeUser`

The user making this call must be a member of the team in order to remove themselves or others.

> Body parameter

```json
{
  "user": 14641
}
```

<h3 id="remove-a-user-from-a-team-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[UserIdObject](#schemauseridobject)|true|The user to remove from the team.|
|team_gid|path|integer|true|A globally unique identifier for the team.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez",
      "email": "gsanchez@example.com",
      "photo": {},
      "workspaces": []
    }
  ]
}
```

<h3 id="remove-a-user-from-a-team-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns an empty data record|[User](#schemauser)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-users">Users</h1>

A user object represents an account in Asana that can be given access to various workspaces, projects, and tasks.

## Get a set of users

<a id="opIdgetAllUsers"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/users',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/users', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/users', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/users");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/users',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /users`

Returns the user records for all users in all workspaces and organizations accessible to the authenticated user. Accepts an optional workspace ID parameter.
Results are sorted by user ID.

<h3 id="get-a-set-of-users-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|workspace|query|integer|false|The workspace or organization ID to filter users on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez",
      "email": "gsanchez@example.com",
      "photo": {},
      "workspaces": []
    }
  ]
}
```

<h3 id="get-a-set-of-users-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested user records.|[User](#schemauser)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a user

<a id="opIdgetUser"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users/{user_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/users/{user_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/users/{user_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/users/{user_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/users/{user_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/users/{user_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /users/{user_gid}`

Returns the full user record for the single user with the provided ID.
Results are sorted by user ID.

<h3 id="get-a-user-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|user_gid|path|string|true|Globally unique identifier for the user.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez",
    "email": "gsanchez@example.com",
    "photo": {
      "image_21x21": "https://...",
      "image_27x27": "https://...",
      "image_36x36": "https://...",
      "image_60x60": "https://...",
      "image_128x128": "https://..."
    },
    "workspaces": [
      {}
    ]
  }
}
```

<h3 id="get-a-user-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns the user specified.|[User](#schemauser)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a user's favorites

<a id="opIdgetUserFavorites"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users/{user_gid}/favorites?resource_type=project&workspace=1234 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/users/{user_gid}/favorites?resource_type=project&workspace=1234',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/users/{user_gid}/favorites', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/users/{user_gid}/favorites', params={
  'resource_type': 'project',  'workspace': '1234'
}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/users/{user_gid}/favorites?resource_type=project&workspace=1234");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/users/{user_gid}/favorites',
  params: {
  'resource_type' => 'string',
'workspace' => 'string'
}, headers: headers

p JSON.parse(result)

```

`GET /users/{user_gid}/favorites`

Returns all of a user's favorites in the given workspace, of the given type.
Results are given in order (The same order as Asana's sidebar).

<h3 id="get-a-user's-favorites-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|user_gid|path|string|true|Globally unique identifier for the user.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|
|resource_type|query|string|true|The resource type of favorites to be returned.|
|workspace|query|string|true|The workspace in which to get favorites.|

#### Enumerated Values

|Parameter|Value|
|---|---|
|resource_type|portfolio|
|resource_type|project|
|resource_type|tag|
|resource_type|task|
|resource_type|user|

> 200 Response

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "task"
}
```

<h3 id="get-a-user's-favorites-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns the specified user's favorites.|[Asana](#schemaasana)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get users in a workspace or organization

<a id="opIdgetUsersInWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/users \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/users',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/workspaces/{workspace_gid}/users', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/users', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}/users");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}/users',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /workspaces/{workspace_gid}/users`

Returns the user records for all users in the specified workspace or organization.
Results are sorted alphabetically by user names.

<h3 id="get-users-in-a-workspace-or-organization-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|workspace_gid|path|string|true|Globally unique identifier for the workspace or organization.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez",
      "email": "gsanchez@example.com",
      "photo": {},
      "workspaces": []
    }
  ]
}
```

<h3 id="get-users-in-a-workspace-or-organization-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Return the users in the specified workspace or org.|[User](#schemauser)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-user-task-lists">User Task Lists</h1>

A user task list represents the tasks assigned to a particular user.

## Get a user task list

<a id="opIdgetUserTaskList"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/user_task_list/{user_task_list_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/user_task_list/{user_task_list_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/user_task_list/{user_task_list_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/user_task_list/{user_task_list_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/user_task_list/{user_task_list_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/user_task_list/{user_task_list_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /user_task_list/{user_task_list_gid}`

Returns the full record for a user task list.

<h3 id="get-a-user-task-list-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|user_task_list_gid|path|string|true|Globally unique identifier for the user task list.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task",
    "owner": null,
    "workspace": null
  }
}
```

<h3 id="get-a-user-task-list-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the user task list.|[UserTaskList](#schemausertasklist)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a user's task list

<a id="opIdgetUsersTaskList"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/users/{user_gid}/user_task_list \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/users/{user_gid}/user_task_list',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/users/{user_gid}/user_task_list', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/users/{user_gid}/user_task_list', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/users/{user_gid}/user_task_list");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/users/{user_gid}/user_task_list',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /users/{user_gid}/user_task_list`

Returns the full record for a user's task list.

<h3 id="get-a-user's-task-list-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|user_gid|path|string|true|Globally unique identifier for the user.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task",
    "owner": null,
    "workspace": null
  }
}
```

<h3 id="get-a-user's-task-list-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the user's task list.|[UserTaskList](#schemausertasklist)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get tasks in a user task list

<a id="opIdgetUserTaskListTasks"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/user_task_lists/{user_task_list_gid}/tasks \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/user_task_lists/{user_task_list_gid}/tasks',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/user_task_lists/{user_task_list_gid}/tasks', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/user_task_lists/{user_task_list_gid}/tasks', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/user_task_lists/{user_task_list_gid}/tasks");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/user_task_lists/{user_task_list_gid}/tasks',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /user_task_lists/{user_task_list_gid}/tasks`

Returns the compact list of tasks in a user’s My Tasks list. The returned tasks will be in order within each assignee status group of `Inbox`, `Today`, and `Upcoming`.
**Note:** tasks in `Later` have a different ordering in the Asana web app than the other assignee status groups; this endpoint will still return them in list order in `Later` (differently than they show up in Asana, but the same order as in Asana’s mobile apps).
**Note:** Access control is enforced for this endpoint as with all Asana API endpoints, meaning a user’s private tasks will be filtered out if the API-authenticated user does not have access to them.
**Note:** Both complete and incomplete tasks are returned by default unless they are filtered out (for example, setting `completed_since=now` will return only incomplete tasks, which is the default view for “My Tasks” in Asana.)

<h3 id="get-tasks-in-a-user-task-list-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|completed_since|query|string|false|Only return tasks that are either incomplete or that have been completed since this time. Accepts a date-time string or the keyword *now*.|
|user_task_list_gid|path|string|true|Globally unique identifier for the user task list.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Detailed descriptions

**completed_since**: Only return tasks that are either incomplete or that have been completed since this time. Accepts a date-time string or the keyword *now*.

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Buy catnip",
      "created_at": "2012-02-22T02:06:58.147Z",
      "resource_subtype": "default_task",
      "assignee": null,
      "assignee_status": "upcoming",
      "completed": false,
      "completed_at": "2012-02-22T02:06:58.147Z",
      "custom_fields": [],
      "dependencies": [],
      "dependents": [],
      "due_at": "2012-02-22T02:06:58.147Z",
      "due_on": "2012-03-26",
      "external": {},
      "followers": [],
      "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
      "hearted": true,
      "hearts": [],
      "liked": true,
      "likes": [],
      "memberships": [],
      "modified_at": "2012-02-22T02:06:58.147Z",
      "notes": "Mittens really likes the stuff from Humboldt.",
      "num_hearts": 5,
      "num_likes": 5,
      "num_subtasks": 3,
      "parent": null,
      "projects": [],
      "start_on": "2012-03-26",
      "tags": [],
      "workspace": null
    }
  ]
}
```

<h3 id="get-tasks-in-a-user-task-list-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the user task list's tasks.|[Task](#schematask)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-webhooks">Webhooks</h1>

Webhooks allow an application to be notified of changes in Asana.

## Get a set of webhooks

<a id="opIdgetWebhooks"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/webhooks?workspace=1331 \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/webhooks?workspace=1331',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/webhooks', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/webhooks', params={
  'workspace': '1331'
}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/webhooks?workspace=1331");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/webhooks',
  params: {
  'workspace' => 'integer'
}, headers: headers

p JSON.parse(result)

```

`GET /webhooks`

Get the compact representation of all webhooks your app has registered for the authenticated user in the given workspace.

<h3 id="get-a-set-of-webhooks-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|workspace|query|integer|true|The workspace to query for webhooks in.|
|resource|query|integer|false|Only return webhooks for the given resource.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "created_at": "2012-02-22T02:06:58.147Z",
      "active": false,
      "last_failure_at": "2012-02-22T02:06:58.147Z",
      "last_failure_content": "500 Server Error\\n\\nCould not complete the request",
      "last_success_at": "2012-02-22T02:06:58.147Z",
      "resource": null,
      "target": "https://example.com/receive-webhook/7654"
    }
  ]
}
```

<h3 id="get-a-set-of-webhooks-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested webhooks.|[Webhook](#schemawebhook)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Establish a webhook on a resource

<a id="opIdcreateWebhook"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/webhooks \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "resource": 12345,
  "target": "https://example.com/receive-webhook/7654"
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/webhooks',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/webhooks', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/webhooks', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/webhooks");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/webhooks',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /webhooks`

Establishing a webhook is a two-part process. First, a simple HTTP POST
similar to any other resource creation. Since you could have multiple
webhooks we recommend specifying a unique local id for each target.

Next comes the confirmation handshake. When a webhook is created, we will
send a test POST to the target with an `X-Hook-Secret` header as
described in the [Resthooks Security
documentation](http://resthooks.org/docs/security/). The target must
respond with a `200 OK` and a matching `X-Hook-Secret` header to confirm
that this webhook subscription is indeed expected.

If you do not acknowledge the webhook’s confirmation handshake it will
fail to setup, and you will receive an error in response to your attempt
to create it. This means you need to be able to receive and complete the
webhook *while* the POST request is in-flight.

```
# Request
curl -H "Authorization: Bearer <personal_access_token>" \
-X POST https://app.asana.com/api/1.0/webhooks \
-d "resource=8675309" \
-d "target=https://example.com/receive-webhook/7654"
```

```
# Handshake sent to https://example.com/
POST /receive-webhook/7654
X-Hook-Secret: b537207f20cbfa02357cf448134da559e8bd39d61597dcd5631b8012eae53e81
```

```
# Handshake response sent by example.com
HTTP/1.1 200
X-Hook-Secret: b537207f20cbfa02357cf448134da559e8bd39d61597dcd5631b8012eae53e81
```

```
# Response
HTTP/1.1 201
{
  "data": {
    "id": 43214,
    "resource": {
      "id": 8675309,
      "name": "Bugs"
    },
    "target": "https://example.com/receive-webhook/7654",
    "active": false,
    "last_success_at": null,
    "last_failure_at": null,
    "last_failure_content": null
  }
}
```

> Body parameter

```json
{
  "resource": 12345,
  "target": "https://example.com/receive-webhook/7654"
}
```

<h3 id="establish-a-webhook-on-a-resource-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|The webhook workspace and target.|
|» resource|body|integer|true|A resource ID to subscribe to. The resource can be a task or project.|
|» target|body|string(uri)|true|The URL to receive the HTTP POST.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 201 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "created_at": "2012-02-22T02:06:58.147Z",
    "active": false,
    "last_failure_at": "2012-02-22T02:06:58.147Z",
    "last_failure_content": "500 Server Error\\n\\nCould not complete the request",
    "last_success_at": "2012-02-22T02:06:58.147Z",
    "resource": null,
    "target": "https://example.com/receive-webhook/7654"
  }
}
```

<h3 id="establish-a-webhook-on-a-resource-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successfully created the requested webhook.|[Webhook](#schemawebhook)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a webhook

<a id="opIdgetWebhook"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/webhooks/{webhook_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/webhooks/{webhook_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/webhooks/{webhook_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/webhooks/{webhook_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/webhooks/{webhook_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/webhooks/{webhook_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /webhooks/{webhook_gid}`

Returns the full record for the given webhook.

<h3 id="get-a-webhook-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|webhook_gid|path|integer|true|The webhook to affect with the current operation.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "created_at": "2012-02-22T02:06:58.147Z",
    "active": false,
    "last_failure_at": "2012-02-22T02:06:58.147Z",
    "last_failure_content": "500 Server Error\\n\\nCould not complete the request",
    "last_success_at": "2012-02-22T02:06:58.147Z",
    "resource": null,
    "target": "https://example.com/receive-webhook/7654"
  }
}
```

<h3 id="get-a-webhook-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested webhook.|[Webhook](#schemawebhook)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Remove a webhook

<a id="opIddeleteWebhook"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://app.asana.com/api/1.0/webhooks/{webhook_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/webhooks/{webhook_gid}',
{
  method: 'DELETE',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('DELETE','https://app.asana.com/api/1.0/webhooks/{webhook_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.delete('https://app.asana.com/api/1.0/webhooks/{webhook_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/webhooks/{webhook_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.delete 'https://app.asana.com/api/1.0/webhooks/{webhook_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /webhooks/{webhook_gid}`

This method **permanently** removes a webhook. Note that it may be possible to receive a request that was already in flight after deleting the webhook, but no further requests will be issued.

<h3 id="remove-a-webhook-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|webhook_gid|path|integer|true|The webhook to affect with the current operation.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {}
}
```

<h3 id="remove-a-webhook-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested webhook.|[Empty](#schemaempty)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h1 id="asana-workspaces">Workspaces</h1>

A workspace is the highest-level organizational unit in Asana. An organization is a special kind of workspace that represents a company.

## Retrieve objects via typeahead

<a id="opIdgetTypeahead"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid}/typeahead?resource_type=user \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/typeahead?resource_type=user',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/workspaces/{workspace_gid}/typeahead', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/typeahead', params={
  'resource_type': 'user'
}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}/typeahead?resource_type=user");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}/typeahead',
  params: {
  'resource_type' => 'string'
}, headers: headers

p JSON.parse(result)

```

`GET /workspaces/{workspace_gid}/typeahead`

Retrieves objects in the workspace based via an auto-completion/typeahead
search algorithm. This feature is meant to provide results quickly, so do
not rely on this API to provide extremely accurate search results. The
result set is limited to a single page of results with a maximum size, so
you won’t be able to fetch large numbers of results.

The typeahead search API provides search for objects from a single
workspace. This endpoint should be used to query for objects when
creating an auto-completion/typeahead search feature. This API is meant
to provide results quickly and should not be relied upon for accurate or
exhaustive search results. The results sets are limited in size and
cannot be paginated.

Queries return a compact representation of each object which is typically
the id and name fields. Interested in a specific set of fields or all of
the fields?! Of course you are. Use field selectors to manipulate what
data is included in a response.

<h3 id="retrieve-objects-via-typeahead-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|workspace_gid|path|string|true|Globally unique identifier for the workspace or organization.|
|resource_type|query|string|true|The type of values the typeahead should return. You can choose from one of the following: `custom_field`, `project`, `tag`, `task`, and `user`. Note that unlike in the names of endpoints, the types listed here are in singular form (e.g. `task`). Using multiple types is not yet supported.|
|type|query|string|false|**Deprecated: new integrations should prefer the resource_type field.**|
|query|query|string|false|The string that will be used to search for relevant objects. If an empty string is passed in, the API will currently return an empty result set.|
|count|query|integer|false|The number of results to return. The default is 20 if this parameter is omitted, with a minimum of 1 and a maximum of 100. If there are fewer results found than requested, all will be returned.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

#### Enumerated Values

|Parameter|Value|
|---|---|
|resource_type|custom_field|
|resource_type|portfolio|
|resource_type|project|
|resource_type|tag|
|resource_type|task|
|resource_type|user|
|type|custom_field|
|type|portfolio|
|type|project|
|type|tag|
|type|task|
|type|user|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task"
    }
  ]
}
```

<h3 id="retrieve-objects-via-typeahead-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved objects via a typeahead search algorithm.|[Asana](#schemaasana)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a set of workspaces

<a id="opIdgetAllWorkspaces"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/workspaces', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/workspaces', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/workspaces',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /workspaces`

Returns the compact records for all workspaces visible to the authorized user.

<h3 id="get-a-set-of-workspaces-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task",
      "email_domains": [],
      "is_organization": false
    }
  ]
}
```

<h3 id="get-a-set-of-workspaces-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Return all workspaces visible to the authorized user.|[Workspace](#schemaworkspace)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a workspace

<a id="opIdgetWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/workspaces/{workspace_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/workspaces/{workspace_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/workspaces/{workspace_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /workspaces/{workspace_gid}`

Returns the full workspace record for a single workspace.

<h3 id="get-a-workspace-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|workspace_gid|path|string|true|Globally unique identifier for the workspace or organization.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task",
    "email_domains": [
      "asana.com"
    ],
    "is_organization": false
  }
}
```

<h3 id="get-a-workspace-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Return the full workspace record.|[Workspace](#schemaworkspace)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Update a workspace

<a id="opIdupdateWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT https://app.asana.com/api/1.0/workspaces/{workspace_gid} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "data": {
    "name": "Bug Task",
    "email_domains": [
      "asana.com"
    ],
    "is_organization": false
  }
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}',
{
  method: 'PUT',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('PUT','https://app.asana.com/api/1.0/workspaces/{workspace_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.put('https://app.asana.com/api/1.0/workspaces/{workspace_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("PUT");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.put 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`PUT /workspaces/{workspace_gid}`

A specific, existing workspace can be updated by making a PUT request on the URL for that workspace. Only the fields provided in the data block will be updated; any unspecified fields will remain unchanged.
Currently the only field that can be modified for a workspace is its name.
Returns the complete, updated workspace record.

> Body parameter

```json
{
  "data": {
    "name": "Bug Task",
    "email_domains": [
      "asana.com"
    ],
    "is_organization": false
  }
}
```

<h3 id="update-a-workspace-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[WorkspaceObject](#schemaworkspaceobject)|true|The workspace object with all updated properties.|
|workspace_gid|path|string|true|Globally unique identifier for the workspace or organization.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task",
    "email_domains": [
      "asana.com"
    ],
    "is_organization": false
  }
}
```

<h3 id="update-a-workspace-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Update for the workspace was successful.|[Workspace](#schemaworkspace)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Add a user to a workspace or organization

<a id="opIdaddUserToWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/workspaces/{workspace_gid}/addUser \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "user": 14641
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/addUser',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/workspaces/{workspace_gid}/addUser', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/addUser', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}/addUser");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}/addUser',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /workspaces/{workspace_gid}/addUser`

Add a user to a workspace or organization.
The user can be referenced by their globally unique user ID or their email address. Returns the full user record for the invited user.

> Body parameter

```json
{
  "user": 14641
}
```

<h3 id="add-a-user-to-a-workspace-or-organization-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[UserIdObject](#schemauseridobject)|true|The user to add to the workspace.|
|workspace_gid|path|string|true|Globally unique identifier for the workspace or organization.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez",
    "email": "gsanchez@example.com",
    "photo": {
      "image_21x21": "https://...",
      "image_27x27": "https://...",
      "image_36x36": "https://...",
      "image_60x60": "https://...",
      "image_128x128": "https://..."
    },
    "workspaces": [
      {}
    ]
  }
}
```

<h3 id="add-a-user-to-a-workspace-or-organization-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|The user was added successfully to the workspace or organization.|[User](#schemauser)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Remove a user from a workspace or organization

<a id="opIdremoveUserToWorkspace"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://app.asana.com/api/1.0/workspaces/{workspace_gid}/removeUser \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "user": 14641
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/removeUser',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','https://app.asana.com/api/1.0/workspaces/{workspace_gid}/removeUser', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('https://app.asana.com/api/1.0/workspaces/{workspace_gid}/removeUser', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/workspaces/{workspace_gid}/removeUser");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'https://app.asana.com/api/1.0/workspaces/{workspace_gid}/removeUser',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /workspaces/{workspace_gid}/removeUser`

Remove a user from a workspace or organization.
The user making this call must be an admin in the workspace. The user can be referenced by their globally unique user ID or their email address.
Returns an empty data record.

> Body parameter

```json
{
  "user": 14641
}
```

<h3 id="remove-a-user-from-a-workspace-or-organization-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[UserIdObject](#schemauseridobject)|true|The user to remove from the workspace.|
|workspace_gid|path|string|true|Globally unique identifier for the workspace or organization.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{}
```

<h3 id="remove-a-user-from-a-workspace-or-organization-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|The user was removed successfully to the workspace or organization.|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

<h3 id="remove-a-user-from-a-workspace-or-organization-responseschema">Response Schema</h3>

<h1 id="asana-portfolio-memberships">Portfolio Memberships</h1>

## Get a list of portfolio memberships

<a id="opIdgetPortfolioMemberships"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolio_memberships \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolio_memberships',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/portfolio_memberships', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/portfolio_memberships', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolio_memberships");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/portfolio_memberships',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /portfolio_memberships`

Returns a list of portfolio memberships in compact representation. You must specify `portolio`, `portfolio` and `user`, or `workspace` and `user`.

<h3 id="get-a-list-of-portfolio-memberships-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|portfolio|query|string|false|The portfolio to filter results on.|
|workspace|query|string|false|The workspace to filter results on.|
|user|query|any|false|The user to filter results on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "portfolio",
      "name": "Bug Task"
    }
  ]
}
```

<h3 id="get-a-list-of-portfolio-memberships-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved portfolio memberships.|[Portfolio](#schemaportfolio)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get the portfolio memberships for a portfolio

<a id="opIdgetPortfolioMembershipsForPortfolio"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/portfolio_memberships \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/portfolio_memberships',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/portfolio_memberships', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/portfolio_memberships', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/portfolio_memberships");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/portfolios/{portfolio_gid}/portfolio_memberships',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /portfolios/{portfolio_gid}/portfolio_memberships`

Returns the compact portfolio membership records for the portfolio.

<h3 id="get-the-portfolio-memberships-for-a-portfolio-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|portfolio_gid|path|string|true|Globally unique identifier for the portfolio.|
|user|query|any|false|The user to filter results on.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "portfolio_membership",
      "user": {}
    }
  ]
}
```

<h3 id="get-the-portfolio-memberships-for-a-portfolio-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested portfolio's memberships.|[PortfolioMembership](#schemaportfoliomembership)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

## Get a portfolio membership

<a id="opIdgetPortfolioMembership"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://app.asana.com/api/1.0/portfolio_memberships/{portfolio_gid} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'

};

fetch('https://app.asana.com/api/1.0/portfolio_memberships/{portfolio_gid}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
    
    );

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','https://app.asana.com/api/1.0/portfolio_memberships/{portfolio_gid}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('https://app.asana.com/api/1.0/portfolio_memberships/{portfolio_gid}', params={

}, headers = headers)

print r.json()

```

```java
URL obj = new URL("https://app.asana.com/api/1.0/portfolio_memberships/{portfolio_gid}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'https://app.asana.com/api/1.0/portfolio_memberships/{portfolio_gid}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /portfolio_memberships/{portfolio_gid}`

Returns the complete portfolio record for a single portfolio membership.

<h3 id="get-a-portfolio-membership-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|portfolio_gid|path|string|true|Globally unique identifier for the portfolio.|
|opt_pretty|query|boolean|false|Provides “pretty” output.|
|opt_fields|query|array[string]|false|Defines fields to return.|
|opt_expand|query|array[string]|false|Expand fields returned.|
|limit|query|integer|false|Results per page.|
|offset|query|string|false|Offset token.|

> 200 Response

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "portfolio_membership",
    "user": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    },
    "portfolio": {
      "id": 12345,
      "gid": "12345",
      "resource_type": "portfolio",
      "name": "Bug Task"
    }
  }
}
```

<h3 id="get-a-portfolio-membership-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successfully retrieved the requested portfolio membership.|[PortfolioMembership](#schemaportfoliomembership)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|This usually occurs because of a missing or malformed parameter. Check the documentation and the syntax of your request and try again.|[Error](#schemaerror)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|A valid authentication token was not provided with the request, so the API could not associate a user with the request.|[Error](#schemaerror)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The authentication and request syntax was valid but the server is refusing to complete the request. This can happen if you try to read or write to objects or properties that the user does not have access to.|[Error](#schemaerror)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Either the request method and path supplied do not specify a known action in the API, or the object specified by the request does not exist.|[Error](#schemaerror)|
|5XX|Unknown|There was a problem on Asana’s end.|[Error](#schemaerror)|
|default|Default|Sadly, sometimes requests to the API are not successful. Failures can occur for a wide range of reasons. In all cases, the API should return an HTTP Status Code that indicates the nature of the failure, with a response body in JSON format containing additional information. In the event of a server error the response body will contain an error phrase. These phrases are automatically generated using the [node-asana-phrase library](https://github.com/Asana/node-asana-phrase) and can be used by Asana support to quickly look up the incident that caused the server error.|[Error](#schemaerror)|

# Schemas

<h2 id="tocS_Attachment">Attachment</h2>
<!-- backwards compatibility -->
<a id="schemaattachment"></a>
<a id="schema_Attachment"></a>
<a id="tocSattachment"></a>
<a id="tocsattachment"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "attachment",
  "name": "Screenshot.png",
  "created_at": "2012-02-22T02:06:58.147Z",
  "download_url": "https://www.dropbox.com/s/123/Screenshot.png?dl=1",
  "host": "dropbox",
  "parent": null,
  "view_url": "https://www.dropbox.com/s/123/Screenshot.png"
}

```

An *attachment* object represents any file attached to a task in Asana, whether it’s an uploaded file or one associated via a third-party service such as Dropbox or Google Drive.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|read-only|The name of the file.|
|created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|download_url|string(uri)¦null|false|read-only|The URL containing the content of the attachment.<br>**Note:** May be null if the attachment is hosted by [Box](https://www.box.com/). If present, this URL may only be valid for 1 hour from the time of retrieval. You should avoid persisting this URL somewhere and just refresh it on demand to ensure you do not keep stale URLs.|
|host|string|false|read-only|The service hosting the attachment. Valid values are `asana`, `dropbox`, `gdrive` and `box`.|
|parent|any|false|none|none|
|view_url|string(uri)¦null|false|read-only|The URL where the attachment can be viewed, which may be friendlier to users in a browser than just directing them to a raw file. May be null if no view URL exists for the service.|

<h2 id="tocS_AttachmentCompact">AttachmentCompact</h2>
<!-- backwards compatibility -->
<a id="schemaattachmentcompact"></a>
<a id="schema_AttachmentCompact"></a>
<a id="tocSattachmentcompact"></a>
<a id="tocsattachmentcompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "attachment",
  "name": "Screenshot.png"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|read-only|The name of the file.|

<h2 id="tocS_BatchRequest">BatchRequest</h2>
<!-- backwards compatibility -->
<a id="schemabatchrequest"></a>
<a id="schema_BatchRequest"></a>
<a id="tocSbatchrequest"></a>
<a id="tocsbatchrequest"></a>

```json
{
  "relative_path": "/tasks/123",
  "method": "get",
  "data": {
    "assignee": "me",
    "workspace": 1337
  },
  "options": {
    "limit": 3,
    "fields": [
      "name",
      "notes",
      "completed"
    ]
  }
}

```

A request object for use in a batch request.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|relative_path|string|true|none|The path of the desired endpoint relative to the API’s base URL. Query parameters are not accepted here; put them in `data` instead.|
|method|string|true|none|The HTTP method you wish to emulate for the action.|
|data|object|false|none|For `GET` requests, this should be a map of query parameters you would have normally passed in the URL. Options and pagination are not accepted here; put them in `options` instead. For `POST`, `PATCH`, and `PUT` methods, this should be the content you would have normally put in the data field of the body.|
|options|object|false|none|Pagination (`limit` and `offset`) and output options (`fields` or `expand`) for the action. “Pretty” JSON output is not an available option on individual actions; if you want pretty output, specify that option on the parent request.|
|» limit|integer|false|none|Pagination limit for the request.|
|» offset|integer|false|none|Pagination offset for the request.|
|» fields|[string]|false|none|The fields to retrieve in the request.|
|» expand|string|false|none|The expansion path for the request.|

#### Enumerated Values

|Property|Value|
|---|---|
|method|get|
|method|post|
|method|put|
|method|delete|
|method|patch|
|method|head|

<h2 id="tocS_BatchResponse">BatchResponse</h2>
<!-- backwards compatibility -->
<a id="schemabatchresponse"></a>
<a id="schema_BatchResponse"></a>
<a id="tocSbatchresponse"></a>
<a id="tocsbatchresponse"></a>

```json
{
  "status_code": 200,
  "headers": {
    "location": "/tasks/1234"
  },
  "body": {
    "data": {
      "id": 1967,
      "completed": false,
      "name": "Hello, world!",
      "notes": "How are you today?"
    }
  }
}

```

A response object returned from a batch request.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|status_code|integer|false|none|The HTTP status code that the invoked endpoint returned.|
|headers|object|false|none|A map of HTTP headers specific to this result. This is primarily used for returning a `Location` header to accompany a `201 Created` result.  The parent HTTP response will contain all common headers.|
|body|object|false|none|The JSON body that the invoked endpoint returned.|

<h2 id="tocS_CustomField">CustomField</h2>
<!-- backwards compatibility -->
<a id="schemacustomfield"></a>
<a id="schema_CustomField"></a>
<a id="tocScustomfield"></a>
<a id="tocscustomfield"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "custom_field",
  "name": "Bug Task",
  "resource_subtype": "milestone",
  "type": "text",
  "enum_options": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "enum_option",
      "name": "Low",
      "enabled": true,
      "color": "blue"
    }
  ],
  "enum_value": null,
  "enabled": true,
  "text_value": "Some Value",
  "description": "Development team priority",
  "precision": 2
}

```

Custom Fields store the metadata that is used in order to
add user-specified information to tasks in Asana. Be sure
to reference the [Custom Fields]
(https://asana.com/developers/documentation/getting-started/custom-fields)
developer documentation for more information about how custom fields
relate to various resources in Asana.

Users in Asana can [lock custom fields]
(https://asana.com/guide/help/premium/custom-fields#gl-lock-fields),
which will make them read-only when accessed by other users.
Attempting to edit a locked custom field will return HTTP error code
`403 Forbidden`.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the object.|
|resource_subtype|string|false|read-only|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|type|string|false|none|**Deprecated: new integrations should prefer the resource_subtype field.** The type of the custom field. Must be one of the given values.|
|enum_options|[object]|false|none|**Conditional**. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](https://asana.com/developers/api-reference/custom_fields#enum-options).|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|The name of the enum option.|
|» enabled|boolean|false|none|The color of the enum option. Defaults to ‘none’.|
|» color|string|false|none|Whether or not the enum option is a selectable value for the custom field.|
|enum_value|any|false|none|none|
|enabled|boolean|false|none|**Conditional**. Determines if the custom field is enabled or not.|
|text_value|string|false|none|**Conditional**. This string is the value of a text custom field.|
|description|string|false|none|[Opt In](/developers/documentation/getting-started/input-output-options). The description of the custom field.|
|precision|integer|false|none|Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|text|
|type|enum|
|type|number|

<h2 id="tocS_CustomFieldCompact">CustomFieldCompact</h2>
<!-- backwards compatibility -->
<a id="schemacustomfieldcompact"></a>
<a id="schema_CustomFieldCompact"></a>
<a id="tocScustomfieldcompact"></a>
<a id="tocscustomfieldcompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "custom_field",
  "name": "Bug Task",
  "resource_subtype": "milestone",
  "type": "text",
  "enum_options": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "enum_option",
      "name": "Low",
      "enabled": true,
      "color": "blue"
    }
  ],
  "enum_value": null,
  "enabled": true,
  "text_value": "Some Value"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the object.|
|resource_subtype|string|false|read-only|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|type|string|false|none|**Deprecated: new integrations should prefer the resource_subtype field.** The type of the custom field. Must be one of the given values.|
|enum_options|[object]|false|none|**Conditional**. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](https://asana.com/developers/api-reference/custom_fields#enum-options).|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|The name of the enum option.|
|» enabled|boolean|false|none|The color of the enum option. Defaults to ‘none’.|
|» color|string|false|none|Whether or not the enum option is a selectable value for the custom field.|
|enum_value|any|false|none|none|
|enabled|boolean|false|none|**Conditional**. Determines if the custom field is enabled or not.|
|text_value|string|false|none|**Conditional**. This string is the value of a text custom field.|

#### Enumerated Values

|Property|Value|
|---|---|
|type|text|
|type|enum|
|type|number|

<h2 id="tocS_CustomFieldSetting">CustomFieldSetting</h2>
<!-- backwards compatibility -->
<a id="schemacustomfieldsetting"></a>
<a id="schema_CustomFieldSetting"></a>
<a id="tocScustomfieldsetting"></a>
<a id="tocscustomfieldsetting"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "custom_field_setting",
  "project": null,
  "is_important": false,
  "parent": null,
  "custom_field": null
}

```

Custom fields are attached to a particular project with the Custom Field Settings resource. This resource both represents the many-to-many join of the Custom Field and Project as well as stores information that is relevant to that particular pairing; for instance, the `is_important` property determines some possible application-specific handling of that custom field.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|project|any|false|none|none|
|is_important|boolean|false|read-only|`is_important` is used in the Asana web application to determine if this custom field is displayed in the task list (left pane) of a project. A project can have a maximum of 5 custom field settings marked as `is_important`.|
|parent|any|false|none|none|
|custom_field|any|false|none|none|

<h2 id="tocS_CustomFieldSettingCompact">CustomFieldSettingCompact</h2>
<!-- backwards compatibility -->
<a id="schemacustomfieldsettingcompact"></a>
<a id="schema_CustomFieldSettingCompact"></a>
<a id="tocScustomfieldsettingcompact"></a>
<a id="tocscustomfieldsettingcompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "custom_field_setting"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|

<h2 id="tocS_EnumOption">EnumOption</h2>
<!-- backwards compatibility -->
<a id="schemaenumoption"></a>
<a id="schema_EnumOption"></a>
<a id="tocSenumoption"></a>
<a id="tocsenumoption"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "enum_option",
  "name": "Low",
  "enabled": true,
  "color": "blue"
}

```

Enum options are the possible values which an enum custom field can
adopt. An enum custom field must contain at least 1 enum option but no
more than 50.

You can add enum options to a custom field by using the `POST
/custom_fields/custom_field_gid/enum_options` endpoint.

**It is not possible to remove or delete an enum option**. Instead, enum
options can be disabled by updating the `enabled` field to false with the
`PUT /enum_options/enum_option_gid` endpoint. Other attributes can be
updated similarly.

On creation of an enum option, `enabled` is always set to `true`, meaning
the enum option is a selectable value for the custom field. Setting
`enabled=false` is equivalent to “trashing” the enum option in the Asana
web app within the “Edit Fields” dialog. The enum option will no longer
be selectable but, if the enum option value was previously set within a
task, the task will retain the value.

Enum options are an ordered list and by default new enum options are
inserted at the end. Ordering in relation to existing enum options can be
specified on creation by using `insert_before` or `insert_after` to
reference an existing enum option. Only one of `insert_before` and
`insert_after` can be provided when creating a new enum option.

An enum options list can be reordered with the `POST
/custom_fields/custom_field_gid/enum_options/insert` endpoint.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the enum option.|
|enabled|boolean|false|none|The color of the enum option. Defaults to ‘none’.|
|color|string|false|none|Whether or not the enum option is a selectable value for the custom field.|

<h2 id="tocS_EnumOptionCompact">EnumOptionCompact</h2>
<!-- backwards compatibility -->
<a id="schemaenumoptioncompact"></a>
<a id="schema_EnumOptionCompact"></a>
<a id="tocSenumoptioncompact"></a>
<a id="tocsenumoptioncompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "enum_option",
  "name": "Low",
  "enabled": true,
  "color": "blue"
}

```

Enum options are the possible values which an enum custom field can
adopt. An enum custom field must contain at least 1 enum option but no
more than 50.

You can add enum options to a custom field by using the `POST
/custom_fields/custom_field_gid/enum_options` endpoint.

**It is not possible to remove or delete an enum option**. Instead, enum
options can be disabled by updating the `enabled` field to false with the
`PUT /enum_options/enum_option_gid` endpoint. Other attributes can be
updated similarly.

On creation of an enum option, `enabled` is always set to `true`, meaning
the enum option is a selectable value for the custom field. Setting
`enabled=false` is equivalent to “trashing” the enum option in the Asana
web app within the “Edit Fields” dialog. The enum option will no longer
be selectable but, if the enum option value was previously set within a
task, the task will retain the value.

Enum options are an ordered list and by default new enum options are
inserted at the end. Ordering in relation to existing enum options can be
specified on creation by using `insert_before` or `insert_after` to
reference an existing enum option. Only one of `insert_before` and
`insert_after` can be provided when creating a new enum option.

An enum options list can be reordered with the `POST
/custom_fields/custom_field_gid/enum_options/insert` endpoint.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the enum option.|
|enabled|boolean|false|none|The color of the enum option. Defaults to ‘none’.|
|color|string|false|none|Whether or not the enum option is a selectable value for the custom field.|

<h2 id="tocS_Error">Error</h2>
<!-- backwards compatibility -->
<a id="schemaerror"></a>
<a id="schema_Error"></a>
<a id="tocSerror"></a>
<a id="tocserror"></a>

```json
{
  "errors": [
    {
      "message": "project: Missing input",
      "help": "For more information on API status codes and how to handle them, read the docs on errors: https://asana.com/developers/documentation/getting-started/errors'",
      "phrase": "6 sad squid snuggle softly"
    }
  ]
}

```

Sadly, sometimes requests to the API are not successful. Failures can
occur for a wide range of reasons. In all cases, the API should return
an HTTP Status Code that indicates the nature of the failure,
with a response body in JSON format containing additional information.

In the event of a server error the response body will contain an error
phrase. These phrases are automatically generated using the
[node-asana-phrase
library](https://github.com/Asana/node-asana-phrase) and can be used by
Asana support to quickly look up the incident that caused the server
error.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|errors|[object]|false|none|none|
|» message|string|false|read-only|Message providing more detail about the error that occurred, if available.|
|» help|string|false|read-only|Additional information directing developers to resources on how to address and fix the problem, if available.|
|» phrase|string|false|read-only|**500 errors only**. A unique error phrase which can be used when contacting developer support to help identify the exact occurrence of the problem in Asana’s logs.|

<h2 id="tocS_Event">Event</h2>
<!-- backwards compatibility -->
<a id="schemaevent"></a>
<a id="schema_Event"></a>
<a id="tocSevent"></a>
<a id="tocsevent"></a>

```json
{
  "user": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "resource": {
    "id": 12345,
    "name": "Bug Task"
  },
  "type": "task",
  "action": "changed",
  "parent": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "created_at": "2012-02-22T02:06:58.147Z"
}

```

An *event* is an object representing a change to a resource that was
observed by an event subscription.

In general, requesting events on a resource is faster and subject to
higher rate limits than requesting the resource itself. Additionally,
change events bubble up - listening to events on a project would include
when stories are added to tasks in the project, even on subtasks.

Establish an initial sync token by making a request with no sync token.
The response will be a `412` error - the same as if the sync token had
expired.

Subsequent requests should always provide the sync token from the
immediately preceding call.

Sync tokens may not be valid if you attempt to go ‘backward’ in the
history by requesting previous tokens, though re-requesting the current
sync token is generally safe, and will always return the same results.

When you receive a `412 Precondition Failed` error, it means that the
sync token is either invalid or expired. If you are attempting to keep a
set of data in sync, this signals you may need to re-crawl the data.

Sync tokens always expire after 24 hours, but may expire sooner,
depending on load on the service.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|user|object¦null|false|read-only|The user who triggered the event.<br><br>**Note**: The event may be triggered by a different user than the<br>subscriber. For example, if user A subscribes to a task and user B<br>modified it, the event’s user will be user B. Note: Some events are<br>generated by the system, and will have `null` as the user. API<br>consumers should make sure to handle this case.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|resource|object|false|read-only|The resource the event occurred on.<br><br>**Note**: The resource that triggered the event may be different from<br>the one that the events were requested for. For example, a<br>subscription to a project will contain events for tasks contained<br>within the project.|
|» id|integer|false|none|none|
|» name|string|false|none|none|
|type|string|false|read-only|**Deprecated: Refer to the resource_type of the resource.**<br>The type of the resource that generated the event.<br><br>**Note**: Currently, only tasks, projects and stories generate<br>events.|
|action|string|false|read-only|The type of action taken that triggered the event.|
|parent|object¦null|false|read-only|For added/removed events, the parent that resource was added to or removed from. The parent will be `null` for other event types.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|The name of the object.|
|created_at|string(date-time)|false|read-only|The timestamp when the event occurred.|

<h2 id="tocS_Job">Job</h2>
<!-- backwards compatibility -->
<a id="schemajob"></a>
<a id="schema_Job"></a>
<a id="tocSjob"></a>
<a id="tocsjob"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "task",
  "resource_subtype": "milestone",
  "status": "in_progress",
  "new_project": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy"
  },
  "new_task": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  }
}

```

A *job* is an object representing a process that handles asynchronous work.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|resource_subtype|string|false|read-only|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|status|string|false|read-only|none|
|new_project|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|new_task|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|The name of the object.|

#### Enumerated Values

|Property|Value|
|---|---|
|status|in_progress|
|status|completed|

<h2 id="tocS_OrganizationExport">OrganizationExport</h2>
<!-- backwards compatibility -->
<a id="schemaorganizationexport"></a>
<a id="schema_OrganizationExport"></a>
<a id="tocSorganizationexport"></a>
<a id="tocsorganizationexport"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "task",
  "created_at": "2012-02-22T02:06:58.147Z",
  "download_url": "https://asana-export.s3.amazonaws.com/export-4632784536274-20170127-43246.json.gz?AWSAccessKeyId=xxxxxxxx",
  "state": "started",
  "organization": {
    "id": 14916,
    "gid": "14916",
    "name": "My Workspace"
  }
}

```

An *organization_export* object represents a request to export the
complete data of an Organization in JSON format.

To export an Organization using this API:

* Create an `organization_export`
  [request](https://asana.com/developers/api-reference/organization_exports#create)
  and store the id that is returned.
* Request the `organization_export` every few minutes, until the `state`
  field contains ‘finished’.
* Download the file located at the URL in the `download_url` field.
* Exports can take a long time, from several minutes to a few hours for
  large Organizations.

**Note**: These endpoints are only available to [Service
Accounts](https://asana.com/guide/help/premium/service-accounts) of an
[Enterprise](https://asana.com/enterprise) Organization.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|download_url|string(uri)¦null|false|read-only|Download this URL to retreive the full export of the organization<br>in JSON format. It will be compressed in a gzip (.gz) container.<br><br>**Note**: May be null if the export is still in progress or<br>failed.  If present, this URL may only be valid for 1 hour from<br>the time of retrieval. You should avoid persisting this URL<br>somewhere and rather refresh on demand to ensure you do not keep<br>stale URLs.|
|state|string|false|read-only|The current state of the export.|
|organization|object|false|none|**Create-only**: The Organization that is being exported. This can only be specified at create time.|
|» id|integer|false|none|none|
|» gid|string|false|none|none|
|» name|string|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|state|pending|
|state|started|
|state|finished|
|state|error|

<h2 id="tocS_OrganizationExportObjectResponse">OrganizationExportObjectResponse</h2>
<!-- backwards compatibility -->
<a id="schemaorganizationexportobjectresponse"></a>
<a id="schema_OrganizationExportObjectResponse"></a>
<a id="tocSorganizationexportobjectresponse"></a>
<a id="tocsorganizationexportobjectresponse"></a>

```json
{
  "data": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "created_at": "2012-02-22T02:06:58.147Z",
    "download_url": "https://asana-export.s3.amazonaws.com/export-4632784536274-20170127-43246.json.gz?AWSAccessKeyId=xxxxxxxx",
    "state": "started",
    "organization": {
      "id": 14916,
      "gid": "14916",
      "name": "My Workspace"
    }
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|data|object|false|none|An *organization_export* object represents a request to export the<br>complete data of an Organization in JSON format.<br><br>To export an Organization using this API:<br><br>* Create an `organization_export`<br>  [request](https://asana.com/developers/api-reference/organization_exports#create)<br>  and store the id that is returned.<br>* Request the `organization_export` every few minutes, until the `state`<br>  field contains ‘finished’.<br>* Download the file located at the URL in the `download_url` field.<br>* Exports can take a long time, from several minutes to a few hours for<br>  large Organizations.<br><br>**Note**: These endpoints are only available to [Service<br>Accounts](https://asana.com/guide/help/premium/service-accounts) of an<br>[Enterprise](https://asana.com/enterprise) Organization.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|» download_url|string(uri)¦null|false|read-only|Download this URL to retreive the full export of the organization<br>in JSON format. It will be compressed in a gzip (.gz) container.<br><br>**Note**: May be null if the export is still in progress or<br>failed.  If present, this URL may only be valid for 1 hour from<br>the time of retrieval. You should avoid persisting this URL<br>somewhere and rather refresh on demand to ensure you do not keep<br>stale URLs.|
|» state|string|false|read-only|The current state of the export.|
|» organization|object|false|none|**Create-only**: The Organization that is being exported. This can only be specified at create time.|
|»» id|integer|false|none|none|
|»» gid|string|false|none|none|
|»» name|string|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|state|pending|
|state|started|
|state|finished|
|state|error|

<h2 id="tocS_Portfolio">Portfolio</h2>
<!-- backwards compatibility -->
<a id="schemaportfolio"></a>
<a id="schema_Portfolio"></a>
<a id="tocSportfolio"></a>
<a id="tocsportfolio"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "portfolio",
  "name": "Bug Task",
  "created_at": "2012-02-22T02:06:58.147Z",
  "created_by": null,
  "color": "light-green",
  "custom_field_settings": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "custom_field_setting",
      "project": null,
      "is_important": false,
      "parent": null,
      "custom_field": null
    }
  ],
  "owner": null,
  "workspace": null,
  "members": null
}

```

A *portfolio* gives a high-level overview of the status of multiple
initiatives in Asana. Portfolios provide a dashboard overview of
the state of multiple projects, including a progress report and the
most recent [project status](https://asana.com/developers/api-reference/project_statuses)
update.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the object.|
|created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|created_by|any|false|none|none|
|color|string|false|none|Color of the portfolio.|
|custom_field_settings|[object]|false|read-only|Array of custom field settings applied to the portfolio.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» project|any|false|none|none|
|» is_important|boolean|false|read-only|`is_important` is used in the Asana web application to determine if this custom field is displayed in the task list (left pane) of a project. A project can have a maximum of 5 custom field settings marked as `is_important`.|
|» parent|any|false|none|none|
|» custom_field|any|false|none|none|
|owner|any|false|none|none|
|workspace|any|false|none|none|
|members|any|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|color|dark-pink|
|color|dark-green|
|color|dark-blue|
|color|dark-red|
|color|dark-teal|
|color|dark-brown|
|color|dark-orange|
|color|dark-purple|
|color|dark-warm-gray|
|color|light-pink|
|color|light-green|
|color|light-blue|
|color|light-red|
|color|light-teal|
|color|light-brown|
|color|light-orange|
|color|light-purple|
|color|light-warm-gray|

<h2 id="tocS_PortfolioCompact">PortfolioCompact</h2>
<!-- backwards compatibility -->
<a id="schemaportfoliocompact"></a>
<a id="schema_PortfolioCompact"></a>
<a id="tocSportfoliocompact"></a>
<a id="tocsportfoliocompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "portfolio",
  "name": "Bug Task"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the object.|

<h2 id="tocS_PortfolioMembership">PortfolioMembership</h2>
<!-- backwards compatibility -->
<a id="schemaportfoliomembership"></a>
<a id="schema_PortfolioMembership"></a>
<a id="tocSportfoliomembership"></a>
<a id="tocsportfoliomembership"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "portfolio_membership",
  "user": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "portfolio": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "portfolio",
    "name": "Bug Task"
  }
}

```

This object determines if a user is a member of a portfolio.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|user|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|portfolio|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|The name of the object.|

<h2 id="tocS_PortfolioMembershipCompact">PortfolioMembershipCompact</h2>
<!-- backwards compatibility -->
<a id="schemaportfoliomembershipcompact"></a>
<a id="schema_PortfolioMembershipCompact"></a>
<a id="tocSportfoliomembershipcompact"></a>
<a id="tocsportfoliomembershipcompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "portfolio_membership",
  "user": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  }
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|user|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|

<h2 id="tocS_Preview">Preview</h2>
<!-- backwards compatibility -->
<a id="schemapreview"></a>
<a id="schema_Preview"></a>
<a id="tocSpreview"></a>
<a id="tocspreview"></a>

```json
{
  "fallback": "Greg: Great! I like this idea.\\n\\nhttps//a_company.slack.com/archives/ABCDEFG/12345678",
  "footer": "Mar 17, 2019 1:25 PM",
  "header": "Asana for Slack",
  "header_link": "https://asana.comn/apps/slack",
  "html_text": "<body>Great! I like this idea.</body>",
  "text": "Great! I like this idea.",
  "title": "Greg",
  "title_link": "https://asana.slack.com/archives/ABCDEFG/12345678"
}

```

A collection of rich text that will be displayed as a preview to another app.

This is read-only except for a small group of whitelisted apps.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|fallback|string|false|none|Some fallback text to display if unable to display the full preview.|
|footer|string|false|none|Text to display in the footer.|
|header|string|false|none|Text to display in the header.|
|header_link|string|false|none|Where the header will link to.|
|html_text|string|false|none|HTML formatted text for the body of the preview.|
|text|string|false|none|Text for the body of the preview.|
|title|string|false|none|Text to display as the title.|
|title_link|string|false|none|Where to title will link to.|

<h2 id="tocS_Project">Project</h2>
<!-- backwards compatibility -->
<a id="schemaproject"></a>
<a id="schema_Project"></a>
<a id="tocSproject"></a>
<a id="tocsproject"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "project",
  "name": "Stuff to buy",
  "created_at": "2012-02-22T02:06:58.147Z",
  "archived": false,
  "color": "light-green",
  "current_status": {
    "color": "green",
    "text": "Everything is great",
    "author": {
      "id": 12345,
      "name": "Greg Bizarro"
    }
  },
  "custom_fields": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "custom_field_setting",
      "project": null,
      "is_important": false,
      "parent": null,
      "custom_field": null
    }
  ],
  "custom_field_settings": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "custom_field_setting",
      "project": null,
      "is_important": false,
      "parent": null,
      "custom_field": null
    }
  ],
  "due_date": "2012-03-26",
  "due_on": "2012-03-26",
  "followers": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez",
      "email": "gsanchez@example.com",
      "photo": {},
      "workspaces": []
    }
  ],
  "html_notes": "These are things we need to purchase.",
  "is_template": false,
  "layout": "list",
  "members": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez",
      "email": "gsanchez@example.com",
      "photo": {},
      "workspaces": []
    }
  ],
  "modified_at": "2012-02-22T02:06:58.147Z",
  "notes": "These are things we need to purchase.",
  "owner": null,
  "public": false,
  "section_migration_status": "not_migrated",
  "start_on": "2012-03-26",
  "team": null,
  "workspace": null
}

```

A *project* represents a prioritized list of tasks in Asana or a board
with columns of tasks represented as cards. It exists in a single
workspace or organization and is accessible to a subset of users in that
workspace or organization, depending on its permissions.

Projects in organizations are shared with a single team. You cannot
currently change the team of a project via the API. Non-organization
workspaces do not have teams and so you should not specify the team of
project in a regular workspace.

Followers of a project are a subset of the members of that project.
Followers of a project will receive all updates including tasks created,
added and removed from that project. Members of the project have access
to and will receive status updates of the project. Adding followers to a
project will add them as members if they are not already, removing
followers from a project will not affect membership.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|archived|boolean|false|none|True if the project is archived, false if not. Archived projects do not show in the UI by default and may be treated differently for queries.|
|color|string¦null|false|none|Color of the project.|
|current_status|object¦null|false|read-only|The most recently created status update for the project, or `null` if no update exists. See also the documentation for [project status updates](/developers/api-reference/project_statuses).|
|» color|string|false|none|none|
|» text|string|false|none|none|
|» author|object|false|none|A *user* object represents an account in Asana that can be given access<br>to various workspaces, projects, and tasks.<br><br>Like other objects in the system, users are referred to by numerical<br>IDs. However, the special string identifier `me` can be used anywhere a<br>user ID is accepted, to refer to the current authenticated user.|
|»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»» resource_type|string|false|read-only|The base type of this resource.|
|»» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|»» email|string(email)|false|read-only|The user’s email address.|
|»» photo|object¦null|false|read-only|A map of the user’s profile photo in various sizes, or null if no photo is set. Sizes provided are 21, 27, 36, 60, and 128. Images are in PNG format.|
|»»» image_21x21|string(uri)|false|none|none|
|»»» image_27x27|string(uri)|false|none|none|
|»»» image_36x36|string(uri)|false|none|none|
|»»» image_60x60|string(uri)|false|none|none|
|»»» image_128x128|string(uri)|false|none|none|
|»» workspaces|[object]|false|read-only|Workspaces and organizations this user may access.<br>Note\: The API will only return workspaces and organizations that also contain the authenticated user.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the object.|
|»»» email_domains|[string]|false|none|The email domains that are associated with this workspace.|
|»»» is_organization|boolean|false|none|Whether the workspace is an *organization*.|
|»» custom_fields|[object]|false|read-only|Array of Custom Fields.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» project|any|false|none|none|
|»»» is_important|boolean|false|read-only|`is_important` is used in the Asana web application to determine if this custom field is displayed in the task list (left pane) of a project. A project can have a maximum of 5 custom field settings marked as `is_important`.|
|»»» parent|any|false|none|none|
|»»» custom_field|any|false|none|none|
|»» custom_field_settings|[object]|false|read-only|Array of Custom Field Settings (in compact form).|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» project|any|false|none|none|
|»»» is_important|boolean|false|read-only|`is_important` is used in the Asana web application to determine if this custom field is displayed in the task list (left pane) of a project. A project can have a maximum of 5 custom field settings marked as `is_important`.|
|»»» parent|any|false|none|none|
|»»» custom_field|any|false|none|none|
|»» due_date|string(date-time)¦null|false|none|**Deprecated: new integrations should prefer the due_on field.**|
|»» due_on|string(date-time)¦null|false|none|The day on which this project is due. This takes a date with format YYYY-MM-DD.|
|»» followers|[object]|false|read-only|Array of users following this project. Followers are a subset of members who receive all notifications for a project, the default notification setting when adding members to a project in-product.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|»»» email|string(email)|false|read-only|The user’s email address.|
|»»» photo|object¦null|false|read-only|A map of the user’s profile photo in various sizes, or null if no photo is set. Sizes provided are 21, 27, 36, 60, and 128. Images are in PNG format.|
|»»»» image_21x21|string(uri)|false|none|none|
|»»»» image_27x27|string(uri)|false|none|none|
|»»»» image_36x36|string(uri)|false|none|none|
|»»»» image_60x60|string(uri)|false|none|none|
|»»»» image_128x128|string(uri)|false|none|none|
|»»» workspaces|[object]|false|read-only|Workspaces and organizations this user may access.<br>Note\: The API will only return workspaces and organizations that also contain the authenticated user.|
|»»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»»» resource_type|string|false|read-only|The base type of this resource.|
|»»»» name|string|false|none|The name of the object.|
|»»»» email_domains|[string]|false|none|The email domains that are associated with this workspace.|
|»»»» is_organization|boolean|false|none|Whether the workspace is an *organization*.|
|»»» html_notes|string|false|none|[Opt In](https://asana.com/developers/documentation/getting-started/input-output-options). The notes of the project with formatting as HTML.<br>**Note: This field is under active migration—please see our [blog post] (https://asana.com/developers/news/new-rich-text) for more information.**|
|»»» is_template|boolean|false|none|[Opt In](/developers/documentation/getting-started/input-output-options). Determines if the project is a template.|
|»»» layout|string|false|read-only|The layout (board or list view) of a project|
|»»» members|[object]|false|read-only|Array of users who are members of this project.|
|»»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»»» resource_type|string|false|read-only|The base type of this resource.|
|»»»» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|»»»» email|string(email)|false|read-only|The user’s email address.|
|»»»» photo|object¦null|false|read-only|A map of the user’s profile photo in various sizes, or null if no photo is set. Sizes provided are 21, 27, 36, 60, and 128. Images are in PNG format.|
|»»»»» image_21x21|string(uri)|false|none|none|
|»»»»» image_27x27|string(uri)|false|none|none|
|»»»»» image_36x36|string(uri)|false|none|none|
|»»»»» image_60x60|string(uri)|false|none|none|
|»»»»» image_128x128|string(uri)|false|none|none|
|»»»» workspaces|[object]|false|read-only|Workspaces and organizations this user may access.<br>Note\: The API will only return workspaces and organizations that also contain the authenticated user.|
|»»»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»»»» resource_type|string|false|read-only|The base type of this resource.|
|»»»»» name|string|false|none|The name of the object.|
|»»»»» email_domains|[string]|false|none|The email domains that are associated with this workspace.|
|»»»»» is_organization|boolean|false|none|Whether the workspace is an *organization*.|
|»»»» modified_at|string(date-time)|false|none|The time at which this project was last modified.<br>**Note**: This does not currently reflect any changes in associations such as tasks or comments that may have been added or removed from the project.|
|»»»» notes|string|false|none|More detailed, free-form textual information associated with the project.|
|»»»» owner|any|false|none|none|
|»»»» public|boolean|false|none|True if the project is public to the organization. If false, do not share this project with other users in this organization without explicitly checking to see if they have access.|
|»»»» section_migration_status|string|false|read-only|**Read-only** The section migration status of this project.|
|»»»» start_on|string(date)¦null|false|none|The day on which work for this project begins, or null if the project has no start date. This takes a date with `YYYY-MM-DD` format. **Note:** `due_on` or `due_at` must be present in the request when setting or unsetting the `start_on` parameter.|
|»»»» team|any|false|none|none|
|»»»» workspace|any|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|color|dark-pink|
|color|dark-green|
|color|dark-blue|
|color|dark-red|
|color|dark-teal|
|color|dark-brown|
|color|dark-orange|
|color|dark-purple|
|color|dark-warm-gray|
|color|light-pink|
|color|light-green|
|color|light-blue|
|color|light-red|
|color|light-teal|
|color|light-brown|
|color|light-orange|
|color|light-purple|
|color|light-warm-gray|
|color|green|
|color|yellow|
|color|red|
|layout|list|
|layout|board|
|section_migration_status|not_migrated|
|section_migration_status|in_progress|
|section_migration_status|completed|

<h2 id="tocS_ProjectCompact">ProjectCompact</h2>
<!-- backwards compatibility -->
<a id="schemaprojectcompact"></a>
<a id="schema_ProjectCompact"></a>
<a id="tocSprojectcompact"></a>
<a id="tocsprojectcompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "project",
  "name": "Stuff to buy"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|

<h2 id="tocS_ProjectMembership">ProjectMembership</h2>
<!-- backwards compatibility -->
<a id="schemaprojectmembership"></a>
<a id="schema_ProjectMembership"></a>
<a id="tocSprojectmembership"></a>
<a id="tocsprojectmembership"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "project_membership",
  "user": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "project": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy"
  },
  "write_access": "full_write"
}

```

With the introduction of “comment-only” projects in Asana, a user’s membership in a project comes with associated permissions. These permissions (whether a user has full access to the project or comment-only access) are accessible through the project memberships endpoints described here.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|user|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|project|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|write_access|string|false|read-only|Whether the user has full access to the project or has comment-only access.|

#### Enumerated Values

|Property|Value|
|---|---|
|write_access|full_write|
|write_access|comment_only|

<h2 id="tocS_ProjectMembershipCompact">ProjectMembershipCompact</h2>
<!-- backwards compatibility -->
<a id="schemaprojectmembershipcompact"></a>
<a id="schema_ProjectMembershipCompact"></a>
<a id="tocSprojectmembershipcompact"></a>
<a id="tocsprojectmembershipcompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "project_membership",
  "user": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  }
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|user|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|

<h2 id="tocS_ProjectStatus">ProjectStatus</h2>
<!-- backwards compatibility -->
<a id="schemaprojectstatus"></a>
<a id="schema_ProjectStatus"></a>
<a id="tocSprojectstatus"></a>
<a id="tocsprojectstatus"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "project_status",
  "title": "Status Update - Jun 15",
  "created_at": "2012-02-22T02:06:58.147Z",
  "created_by": null,
  "text": "The project is moving forward according to plan...",
  "html-text": "'&lt;body&gt;The project &lt;strong&gt;is&lt;/strong&gt; moving forward according to plan...&lt;/body&gt;'",
  "color": "green"
}

```

A *project status* is an update on the progress of a particular project, and is sent out to all project followers when created. These updates include both text describing the update and a color code intended to represent the overall state of the project: "green" for projects that are on track, "yellow" for projects at risk, and "red" for projects that are behind.
Project statuses can be created and deleted, but not modified.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|title|string|false|read-only|The title of the project status update.|
|created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|created_by|any|false|none|none|
|text|string|false|read-only|The text content of the status update.|
|html-text|string|false|read-only|[Opt In](https://asana.com/developers/documentation/getting-started/input-output-options). The text content of the status update with formatting as HTML.|
|color|string|false|read-only|The color associated with the status update.|

#### Enumerated Values

|Property|Value|
|---|---|
|color|green|
|color|yellow|
|color|red|

<h2 id="tocS_ProjectStatusCompact">ProjectStatusCompact</h2>
<!-- backwards compatibility -->
<a id="schemaprojectstatuscompact"></a>
<a id="schema_ProjectStatusCompact"></a>
<a id="tocSprojectstatuscompact"></a>
<a id="tocsprojectstatuscompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "project_status",
  "title": "Status Update - Jun 15"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|title|string|false|read-only|The title of the project status update.|

<h2 id="tocS_Section">Section</h2>
<!-- backwards compatibility -->
<a id="schemasection"></a>
<a id="schema_Section"></a>
<a id="tocSsection"></a>
<a id="tocssection"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "section",
  "name": "Next Actions",
  "created_at": "2012-02-22T02:06:58.147Z",
  "projects": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    }
  ]
}

```

A *section* is a subdivision of a project that groups tasks together. It
can either be a header above a list of tasks in a list view or a column
in a board view of a project.

Sections are largely a shared idiom in Asana’s API for both list and
board views of a project regardless of the project’s layout.

The ‘memberships’ property when [getting a
task](https://asana.com/developers/api-reference/tasks#get) will return
the information for the section or the column under ‘section’ in the
response.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the section (i.e. the text displayed as the section header).|
|created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|projects|[object]|false|none|none|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|

<h2 id="tocS_SectionCompact">SectionCompact</h2>
<!-- backwards compatibility -->
<a id="schemasectioncompact"></a>
<a id="schema_SectionCompact"></a>
<a id="tocSsectioncompact"></a>
<a id="tocssectioncompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "section",
  "name": "Next Actions"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the section (i.e. the text displayed as the section header).|

<h2 id="tocS_Story">Story</h2>
<!-- backwards compatibility -->
<a id="schemastory"></a>
<a id="schema_Story"></a>
<a id="tocSstory"></a>
<a id="tocsstory"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "story",
  "resource_subtype": "milestone",
  "created_at": "2012-02-22T02:06:58.147Z",
  "created_by": null,
  "text": "marked today",
  "type": "comment",
  "html_text": "Get whatever Sashimi has.",
  "is_edited": false,
  "is_pinned": false,
  "hearted": false,
  "hearts": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez",
      "email": "gsanchez@example.com",
      "photo": {},
      "workspaces": []
    }
  ],
  "num_hearts": 5,
  "liked": false,
  "likes": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez",
      "email": "gsanchez@example.com",
      "photo": {},
      "workspaces": []
    }
  ],
  "num_likes": 5,
  "previews": [
    {
      "fallback": "Greg: Great! I like this idea.\\n\\nhttps//a_company.slack.com/archives/ABCDEFG/12345678",
      "footer": "Mar 17, 2019 1:25 PM",
      "header": "Asana for Slack",
      "header_link": "https://asana.comn/apps/slack",
      "html_text": "<body>Great! I like this idea.</body>",
      "text": "Great! I like this idea.",
      "title": "Greg",
      "title_link": "https://asana.slack.com/archives/ABCDEFG/12345678"
    }
  ],
  "old_name": "This was the Old Name",
  "new_name": "This is the New Name",
  "old_dates": {
    "start_on": "2019-09-15",
    "due_at": "2012-02-22T02:06:58.158Z",
    "due_on": "2019-09-15"
  },
  "new_dates": {
    "start_on": "2019-09-15",
    "due_at": "2012-02-22T02:06:58.158Z",
    "due_on": "2019-09-15"
  },
  "old_resource_subtype": "default_task",
  "new_resource_subtype": "milestone",
  "story": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "story",
    "resource_subtype": "milestone",
    "created_at": "2012-02-22T02:06:58.147Z",
    "created_by": null,
    "text": "marked today",
    "type": "comment"
  },
  "assignee": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "follower": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "user",
    "name": "Greg Sanchez"
  },
  "old_section": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "section",
    "name": "Next Actions"
  },
  "new_section": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "section",
    "name": "Next Actions"
  },
  "task": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "project": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "project",
    "name": "Stuff to buy"
  },
  "tag": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "tag",
    "name": "Stuff to buy"
  },
  "custom_field": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "custom_field",
    "name": "Bug Task",
    "resource_subtype": "milestone",
    "type": "text",
    "enum_options": [
      {}
    ],
    "enum_value": null,
    "enabled": true,
    "text_value": "Some Value"
  },
  "old_text_value": "This was the Old Text",
  "new_text_value": "This is the New Text",
  "old_number_value": 1,
  "new_number_value": 2,
  "old_enum_value": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "enum_option",
    "name": "Low",
    "enabled": true,
    "color": "blue"
  },
  "new_enum_value": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "enum_option",
    "name": "Low",
    "enabled": true,
    "color": "blue"
  },
  "duplicate_of": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "duplicated_from": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "dependency": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "task",
    "name": "Bug Task"
  },
  "source": "web",
  "target": {
    "id": 1234,
    "name": "Bug Task"
  }
}

```

**See [our forum post](https://forum.asana.com/t/no-more-parsing-story-text-new-fields-on-stories/42924) for
more info on when conditional fields are returned.**
A *story* represents an activity associated with an object in the Asana
system. Stories are generated by the system whenever users take actions
such as creating or assigning tasks, or moving tasks between projects.
*Comments* are also a form of user-generated story.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|resource_subtype|string|false|read-only|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|created_by|any|false|none|none|
|text|any|false|none|**Create-only**. Human-readable text for the story or comment.<br>This will not include the name of the creator.<br><br>**Note:** This is not guaranteed to be stable for a given type of<br>story. For example, text for a reassignment may not always say<br>“assigned to …” as the text for a story can both be edited and<br>change based on the language settings of the user making the request.<br>Use the `resource_subtype` property to discover the action that<br>created the story.|
|type|string|false|read-only|**Deprecated: new integrations should prefer the `resource_subtype` field.** The type of this story. For more fine-grained inspection of story types, see the [`resource_subtype`] (https://asana.com/developers/api-reference/stories#field-resource_subtype) property.|
|html_text|string|false|none|[Opt In](https://asana.com/developers/documentation/getting-started/input-output-options).<br>HTML formatted text for a comment. This will not include the name<br>of the creator.<br><br>**Note: This field is under active migration—please see our blog<br>post for more information.**|
|is_edited|boolean|false|read-only|**Conditional**. Whether the text of the story has been edited after creation.|
|is_pinned|boolean|false|none|**Conditional**. Whether the story should be pinned on the resource.|
|hearted|boolean|false|read-only|**Deprecated - please use likes instead**<br><br>**Conditional**. True if the story is hearted by the authorized user, false if not.|
|hearts|[object]|false|read-only|**Deprecated - please use likes instead**<br><br>**Conditional**. Array of users who have hearted this story.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|» email|string(email)|false|read-only|The user’s email address.|
|» photo|object¦null|false|read-only|A map of the user’s profile photo in various sizes, or null if no photo is set. Sizes provided are 21, 27, 36, 60, and 128. Images are in PNG format.|
|»» image_21x21|string(uri)|false|none|none|
|»» image_27x27|string(uri)|false|none|none|
|»» image_36x36|string(uri)|false|none|none|
|»» image_60x60|string(uri)|false|none|none|
|»» image_128x128|string(uri)|false|none|none|
|» workspaces|[object]|false|read-only|Workspaces and organizations this user may access.<br>Note\: The API will only return workspaces and organizations that also contain the authenticated user.|
|»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»» resource_type|string|false|read-only|The base type of this resource.|
|»» name|string|false|none|The name of the object.|
|»» email_domains|[string]|false|none|The email domains that are associated with this workspace.|
|»» is_organization|boolean|false|none|Whether the workspace is an *organization*.|
|» num_hearts|integer|false|read-only|**Deprecated - please use likes instead**<br><br>**Conditional**. The number of users who have hearted this story.|
|» liked|boolean|false|read-only|**Conditional**. True if the story is liked by the authorized user, false if not.|
|» likes|[object]|false|read-only|**Conditional**. Array of users who have liked this story.|
|»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»» resource_type|string|false|read-only|The base type of this resource.|
|»» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|»» email|string(email)|false|read-only|The user’s email address.|
|»» photo|object¦null|false|read-only|A map of the user’s profile photo in various sizes, or null if no photo is set. Sizes provided are 21, 27, 36, 60, and 128. Images are in PNG format.|
|»»» image_21x21|string(uri)|false|none|none|
|»»» image_27x27|string(uri)|false|none|none|
|»»» image_36x36|string(uri)|false|none|none|
|»»» image_60x60|string(uri)|false|none|none|
|»»» image_128x128|string(uri)|false|none|none|
|»» workspaces|[object]|false|read-only|Workspaces and organizations this user may access.<br>Note\: The API will only return workspaces and organizations that also contain the authenticated user.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the object.|
|»»» email_domains|[string]|false|none|The email domains that are associated with this workspace.|
|»»» is_organization|boolean|false|none|Whether the workspace is an *organization*.|
|»» num_likes|integer|false|read-only|**Conditional**. The number of users who have liked this story.|
|»» previews|[object]|false|read-only|**Conditional**. A collection of previews to be displayed in the story.<br><br>**Note**: This property only exists for comment stories.|
|»»» fallback|string|false|none|Some fallback text to display if unable to display the full preview.|
|»»» footer|string|false|none|Text to display in the footer.|
|»»» header|string|false|none|Text to display in the header.|
|»»» header_link|string|false|none|Where the header will link to.|
|»»» html_text|string|false|none|HTML formatted text for the body of the preview.|
|»»» text|string|false|none|Text for the body of the preview.|
|»»» title|string|false|none|Text to display as the title.|
|»»» title_link|string|false|none|Where to title will link to.|
|»» old_name|string|false|none|**Conditional**'|
|»» new_name|string|false|read-only|**Conditional**|
|»» old_dates|object|false|read-only|**Conditional**|
|»»» start_on|string(date)|false|none|none|
|»»» due_at|string(date-time)|false|none|none|
|»»» due_on|string(date)|false|none|none|
|»» new_dates|object|false|read-only|**Conditional**|
|»»» start_on|string(date)|false|none|none|
|»»» due_at|string(date-time)|false|none|none|
|»»» due_on|string(date)|false|none|none|
|»» old_resource_subtype|string|false|read-only|**Conditional**|
|»» new_resource_subtype|string|false|read-only|**Conditional**|
|»» story|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» resource_subtype|string|false|read-only|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|»»» created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|»»» created_by|any|false|none|none|
|»»» text|any|false|none|**Create-only**. Human-readable text for the story or comment.<br>This will not include the name of the creator.<br><br>**Note:** This is not guaranteed to be stable for a given type of<br>story. For example, text for a reassignment may not always say<br>“assigned to …” as the text for a story can both be edited and<br>change based on the language settings of the user making the request.<br>Use the `resource_subtype` property to discover the action that<br>created the story.|
|»»» type|string|false|read-only|**Deprecated: new integrations should prefer the `resource_subtype` field.** The type of this story. For more fine-grained inspection of story types, see the [`resource_subtype`] (https://asana.com/developers/api-reference/stories#field-resource_subtype) property.|
|»» assignee|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|»» follower|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|»» old_section|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the section (i.e. the text displayed as the section header).|
|»» new_section|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the section (i.e. the text displayed as the section header).|
|»» task|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the object.|
|»» project|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» tag|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|Name of the tag. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» custom_field|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the object.|
|»»» resource_subtype|string|false|read-only|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|»»» type|string|false|none|**Deprecated: new integrations should prefer the resource_subtype field.** The type of the custom field. Must be one of the given values.|
|»»» enum_options|[object]|false|none|**Conditional**. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](https://asana.com/developers/api-reference/custom_fields#enum-options).|
|»»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»»» resource_type|string|false|read-only|The base type of this resource.|
|»»»» name|string|false|none|The name of the enum option.|
|»»»» enabled|boolean|false|none|The color of the enum option. Defaults to ‘none’.|
|»»»» color|string|false|none|Whether or not the enum option is a selectable value for the custom field.|
|»»» enum_value|any|false|none|none|
|»»» enabled|boolean|false|none|**Conditional**. Determines if the custom field is enabled or not.|
|»»» text_value|string|false|none|**Conditional**. This string is the value of a text custom field.|
|»» old_text_value|string|false|read-only|**Conditional**|
|»» new_text_value|string|false|read-only|**Conditional**|
|»» old_number_value|integer|false|read-only|**Conditional**|
|»» new_number_value|integer|false|read-only|**Conditional**|
|»» old_enum_value|object|false|none|Enum options are the possible values which an enum custom field can<br>adopt. An enum custom field must contain at least 1 enum option but no<br>more than 50.<br><br>You can add enum options to a custom field by using the `POST<br>/custom_fields/custom_field_gid/enum_options` endpoint.<br><br>**It is not possible to remove or delete an enum option**. Instead, enum<br>options can be disabled by updating the `enabled` field to false with the<br>`PUT /enum_options/enum_option_gid` endpoint. Other attributes can be<br>updated similarly.<br><br>On creation of an enum option, `enabled` is always set to `true`, meaning<br>the enum option is a selectable value for the custom field. Setting<br>`enabled=false` is equivalent to “trashing” the enum option in the Asana<br>web app within the “Edit Fields” dialog. The enum option will no longer<br>be selectable but, if the enum option value was previously set within a<br>task, the task will retain the value.<br><br>Enum options are an ordered list and by default new enum options are<br>inserted at the end. Ordering in relation to existing enum options can be<br>specified on creation by using `insert_before` or `insert_after` to<br>reference an existing enum option. Only one of `insert_before` and<br>`insert_after` can be provided when creating a new enum option.<br><br>An enum options list can be reordered with the `POST<br>/custom_fields/custom_field_gid/enum_options/insert` endpoint.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the enum option.|
|»»» enabled|boolean|false|none|The color of the enum option. Defaults to ‘none’.|
|»»» color|string|false|none|Whether or not the enum option is a selectable value for the custom field.|
|»» new_enum_value|object|false|none|Enum options are the possible values which an enum custom field can<br>adopt. An enum custom field must contain at least 1 enum option but no<br>more than 50.<br><br>You can add enum options to a custom field by using the `POST<br>/custom_fields/custom_field_gid/enum_options` endpoint.<br><br>**It is not possible to remove or delete an enum option**. Instead, enum<br>options can be disabled by updating the `enabled` field to false with the<br>`PUT /enum_options/enum_option_gid` endpoint. Other attributes can be<br>updated similarly.<br><br>On creation of an enum option, `enabled` is always set to `true`, meaning<br>the enum option is a selectable value for the custom field. Setting<br>`enabled=false` is equivalent to “trashing” the enum option in the Asana<br>web app within the “Edit Fields” dialog. The enum option will no longer<br>be selectable but, if the enum option value was previously set within a<br>task, the task will retain the value.<br><br>Enum options are an ordered list and by default new enum options are<br>inserted at the end. Ordering in relation to existing enum options can be<br>specified on creation by using `insert_before` or `insert_after` to<br>reference an existing enum option. Only one of `insert_before` and<br>`insert_after` can be provided when creating a new enum option.<br><br>An enum options list can be reordered with the `POST<br>/custom_fields/custom_field_gid/enum_options/insert` endpoint.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the enum option.|
|»»» enabled|boolean|false|none|The color of the enum option. Defaults to ‘none’.|
|»»» color|string|false|none|Whether or not the enum option is a selectable value for the custom field.|
|»» duplicate_of|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the object.|
|»» duplicated_from|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the object.|
|»» dependency|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the object.|
|»» source|string|false|read-only|The component of the Asana product the user used to trigger the story.|
|»» target|object|false|read-only|The object this story is associated with. Currently may only be a task.|
|»»» id|integer|false|none|none|
|»»» name|string|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|type|text|
|type|enum|
|type|number|

<h2 id="tocS_StoryCompact">StoryCompact</h2>
<!-- backwards compatibility -->
<a id="schemastorycompact"></a>
<a id="schema_StoryCompact"></a>
<a id="tocSstorycompact"></a>
<a id="tocsstorycompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "story",
  "resource_subtype": "milestone",
  "created_at": "2012-02-22T02:06:58.147Z",
  "created_by": null,
  "text": "marked today",
  "type": "comment"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|resource_subtype|string|false|read-only|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|created_by|any|false|none|none|
|text|any|false|none|**Create-only**. Human-readable text for the story or comment.<br>This will not include the name of the creator.<br><br>**Note:** This is not guaranteed to be stable for a given type of<br>story. For example, text for a reassignment may not always say<br>“assigned to …” as the text for a story can both be edited and<br>change based on the language settings of the user making the request.<br>Use the `resource_subtype` property to discover the action that<br>created the story.|
|type|string|false|read-only|**Deprecated: new integrations should prefer the `resource_subtype` field.** The type of this story. For more fine-grained inspection of story types, see the [`resource_subtype`] (https://asana.com/developers/api-reference/stories#field-resource_subtype) property.|

<h2 id="tocS_Tag">Tag</h2>
<!-- backwards compatibility -->
<a id="schematag"></a>
<a id="schema_Tag"></a>
<a id="tocStag"></a>
<a id="tocstag"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "tag",
  "name": "Stuff to buy",
  "followers": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ],
  "color": "light-green",
  "workspace": {
    "id": 12345,
    "gid": "12345",
    "resource_type": "workspace",
    "name": "Bug Task"
  }
}

```

A *tag* is a label that can be attached to any task in Asana. It exists
in a single workspace or organization.

Tags have some metadata associated with them, but it is possible that we
will simplify them in the future so it is not encouraged to rely too
heavily on it. Unlike projects, tags do not provide any ordering on the
tasks they are associated with.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|Name of the tag. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|followers|[object]|false|read-only|Array of users following this tag.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|color|string|false|none|Color of the tag.|
|workspace|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|The name of the object.|

#### Enumerated Values

|Property|Value|
|---|---|
|color|dark-pink|
|color|dark-green|
|color|dark-blue|
|color|dark-red|
|color|dark-teal|
|color|dark-brown|
|color|dark-orange|
|color|dark-purple|
|color|dark-warm-gray|
|color|light-pink|
|color|light-green|
|color|light-blue|
|color|light-red|
|color|light-teal|
|color|light-brown|
|color|light-orange|
|color|light-purple|
|color|light-warm-gray|

<h2 id="tocS_TagCompact">TagCompact</h2>
<!-- backwards compatibility -->
<a id="schematagcompact"></a>
<a id="schema_TagCompact"></a>
<a id="tocStagcompact"></a>
<a id="tocstagcompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "tag",
  "name": "Stuff to buy"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|Name of the tag. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|

<h2 id="tocS_Task">Task</h2>
<!-- backwards compatibility -->
<a id="schematask"></a>
<a id="schema_Task"></a>
<a id="tocStask"></a>
<a id="tocstask"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "task",
  "name": "Buy catnip",
  "created_at": "2012-02-22T02:06:58.147Z",
  "resource_subtype": "default_task",
  "assignee": null,
  "assignee_status": "upcoming",
  "completed": false,
  "completed_at": "2012-02-22T02:06:58.147Z",
  "custom_fields": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "custom_field",
      "name": "Bug Task",
      "resource_subtype": "milestone",
      "type": "text",
      "enum_options": [],
      "enum_value": null,
      "enabled": true,
      "text_value": "Some Value",
      "description": "Development team priority",
      "precision": 2
    }
  ],
  "dependencies": [
    {
      "id": 1234,
      "gid": "1234"
    },
    {
      "id": 4321,
      "gid": "4321"
    }
  ],
  "dependents": [
    {
      "id": 1234,
      "gid": "1234"
    },
    {
      "id": 4321,
      "gid": "4321"
    }
  ],
  "due_at": "2012-02-22T02:06:58.147Z",
  "due_on": "2012-03-26",
  "external": {
    "id": "my_id",
    "data": "A blob of information"
  },
  "followers": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ],
  "html_notes": "<body>Mittens <em>really</em> likes the stuff from Humboldt.</body>",
  "hearted": true,
  "hearts": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ],
  "liked": true,
  "likes": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "user",
      "name": "Greg Sanchez"
    }
  ],
  "memberships": [
    {
      "project": {},
      "section": {}
    }
  ],
  "modified_at": "2012-02-22T02:06:58.147Z",
  "notes": "Mittens really likes the stuff from Humboldt.",
  "num_hearts": 5,
  "num_likes": 5,
  "num_subtasks": 3,
  "parent": null,
  "projects": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "project",
      "name": "Stuff to buy"
    }
  ],
  "start_on": "2012-03-26",
  "tags": [
    {
      "id": 59746,
      "gid": "59746",
      "name": "Grade A"
    }
  ],
  "workspace": null
}

```

The *task* is the basic object around which many operations in Asana are
centered. In the Asana application, multiple tasks populate the middle
pane according to some view parameters, and the set of selected tasks
determines the more detailed information presented in the details pane.

A *section*, at its core, is a task whose name ends with the colon
character `:`. Sections are unique in that they will be included in the
*memberships* field of task objects returned in the API when the task is
within a section. They can also be used to manipulate the ordering of a
task within a project.

[Queries](https://asana.com/developers/api-reference/tasks#query) return
a compact representation of each object which is typically the id and
name fields. Interested in a specific set of fields or all of the fields?
Use [field
selectors](https://asana.com/developers/documentation/getting-started/input-output-options)
to manipulate what data is included in a response.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|Name of the task. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|resource_subtype|string|false|read-only|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|assignee|any|false|none|none|
|assignee_status|string|false|none|Scheduling status of this task for the user it is assigned to. This field can only be set if the assignee is non-null.|
|completed|boolean|false|none|True if the task is currently marked complete, false if not.|
|completed_at|string(date-time)¦null|false|read-only|The time at which this task was completed, or null if the task is incomplete.|
|custom_fields|[object]|false|read-only|Array of custom field values applied to the project. These represent<br>the custom field values recorded on this project for a particular<br>custom field. For example, these custom field values will contain<br>an `enum_value` property for custom fields of type `enum`, a<br>`string_value` property for custom fields of type `string`, and<br>so on. Please note that the `id` returned on each custom field<br>value *is identical* to the `id` of the custom field, which<br>allows referencing the custom field metadata through the<br>`/custom_fields/custom_field-id` endpoint.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|The name of the object.|
|» resource_subtype|string|false|read-only|The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.|
|» type|string|false|none|**Deprecated: new integrations should prefer the resource_subtype field.** The type of the custom field. Must be one of the given values.|
|» enum_options|[object]|false|none|**Conditional**. Only relevant for custom fields of type `enum`. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](https://asana.com/developers/api-reference/custom_fields#enum-options).|
|»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»» resource_type|string|false|read-only|The base type of this resource.|
|»» name|string|false|none|The name of the enum option.|
|»» enabled|boolean|false|none|The color of the enum option. Defaults to ‘none’.|
|»» color|string|false|none|Whether or not the enum option is a selectable value for the custom field.|
|» enum_value|any|false|none|none|
|» enabled|boolean|false|none|**Conditional**. Determines if the custom field is enabled or not.|
|» text_value|string|false|none|**Conditional**. This string is the value of a text custom field.|
|» description|string|false|none|[Opt In](/developers/documentation/getting-started/input-output-options). The description of the custom field.|
|» precision|integer|false|none|Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.|
|dependencies|[object]|false|read-only|[Opt In](/developers/documentation/getting-started/input-output-options). Array of resources referencing tasks that this task depends on. The objects contain only the ID of the dependency.|
|» id|integer|false|none|none|
|» gid|string|false|none|none|
|dependents|[object]|false|read-only|[Opt In](/developers/documentation/getting-started/input-output-options). Array of resources referencing tasks that depend on this task. The objects contain only the ID of the dependent.|
|» id|integer|false|none|none|
|» gid|string|false|none|none|
|due_at|string(date)¦null|false|none|Date and time on which this task is due, or null if the task has no due time. This takes a UTC timestamp and should not be used together with `due_on`.|
|due_on|string(date)¦null|false|none|Date on which this task is due, or null if the task has no due date.  This takes a date with `YYYY-MM-DD` format and should not be used together with due_at.|
|external|object|false|none|**OAuth Required**. **Conditional**. This field is returned only if external values are set or included by using [Opt In] (/developers/documentation/getting-started/input-output-options).<br>The external field allows you to store app-specific metadata on tasks, including an id that can be used to retrieve tasks and a data blob that can store app-specific character strings. Note that you will need to authenticate with Oauth to access or modify this data. Once an external id is set, you can use the notation `external:custom_id` to reference your object anywhere in the API where you may use the original object id. See the page on Custom External Data for more details.|
|» id|integer|false|none|none|
|» gid|string|false|none|none|
|» data|string|false|none|none|
|followers|[object]|false|none|Array of users following this task.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|html_notes|string|false|none|[Opt In](/developers/documentation/getting-started/input-output-options). The notes of the text with formatting as HTML.<br>**Note: This field is under active migration—please see our blog post for more information.**|
|hearted|boolean|false|read-only|**Deprecated - please use liked instead** True if the task is hearted by the authorized user, false if not.|
|hearts|[object]|false|read-only|**Deprecated - please use likes instead** Array of users who have hearted this task.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|liked|boolean|false|read-only|True if the task is liked by the authorized user, false if not.|
|likes|[object]|false|read-only|Array of users who have liked this task.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|memberships|[object]|false|none|**Create-only**. Array of projects this task is associated with and the section it is in. At task creation time, this array can be used to add the task to specific sections. After task creation, these associations can be modified using the `addProject` and `removeProject` endpoints. Note that over time, more types of memberships may be added to this property.|
|» project|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»» resource_type|string|false|read-only|The base type of this resource.|
|»» name|string|false|none|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|» section|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»» resource_type|string|false|read-only|The base type of this resource.|
|»» name|string|false|none|The name of the section (i.e. the text displayed as the section header).|
|» modified_at|string(date-time)|false|read-only|The time at which this task was last modified.<br><br>**Note:** This does not currently reflect any changes in<br>associations such as projects or comments that may have been<br>added or removed from the task.|
|» notes|string|false|none|More detailed, free-form textual information associated with the task.|
|» num_hearts|integer|false|read-only|**Deprecated - please use likes instead** The number of users who have hearted this task.|
|» num_likes|integer|false|read-only|The number of users who have liked this task.|
|» num_subtasks|integer|false|read-only|[Opt In](https://asana.com/developers/documentation/getting-started/input-output-options). The number of subtasks on this task.|
|» parent|any|false|none|none|
|» projects|[object]|false|none|**Create-only.** Array of projects this task is associated with. At task creation time, this array can be used to add the task to many projects at once. After task creation, these associations can be modified using the addProject and removeProject endpoints.|
|»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»» resource_type|string|false|read-only|The base type of this resource.|
|»» name|string|false|none|Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|» start_on|string(date)¦null|false|none|The day on which work begins for the task , or null if the task has<br>no start date. This takes a date with `YYYY-MM-DD` format.<br><br>**Note:** `due_on` or `due_at` must be present in the request when<br>setting or unsetting the `start_on` parameter.|
|» tags|[object]|false|none|**Create-only**. Array of tags associated with this task. This property may be specified on creation using just an array of tag IDs.  In order to change tags on an existing task use `addTag` and `removeTag`.|
|»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»» resource_type|string|false|read-only|The base type of this resource.|
|»» name|string|false|none|Name of the tag. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.|
|»» followers|[object]|false|read-only|Array of users following this tag.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|»» color|string|false|none|Color of the tag.|
|»» workspace|object|false|none|A generic Asana Object, containing a globally unique identifier.|
|»»» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|»»» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|»»» resource_type|string|false|read-only|The base type of this resource.|
|»»» name|string|false|none|The name of the object.|
|»» workspace|any|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|resource_subtype|default_task|
|resource_subtype|milestone|
|resource_subtype|section|
|assignee_status|today|
|assignee_status|upcoming|
|assignee_status|later|
|assignee_status|new|
|assignee_status|inbox|
|type|text|
|type|enum|
|type|number|
|color|dark-pink|
|color|dark-green|
|color|dark-blue|
|color|dark-red|
|color|dark-teal|
|color|dark-brown|
|color|dark-orange|
|color|dark-purple|
|color|dark-warm-gray|
|color|light-pink|
|color|light-green|
|color|light-blue|
|color|light-red|
|color|light-teal|
|color|light-brown|
|color|light-orange|
|color|light-purple|
|color|light-warm-gray|

<h2 id="tocS_TaskCompact">TaskCompact</h2>
<!-- backwards compatibility -->
<a id="schemataskcompact"></a>
<a id="schema_TaskCompact"></a>
<a id="tocStaskcompact"></a>
<a id="tocstaskcompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "task",
  "name": "Bug Task"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the object.|

<h2 id="tocS_Team">Team</h2>
<!-- backwards compatibility -->
<a id="schemateam"></a>
<a id="schema_Team"></a>
<a id="tocSteam"></a>
<a id="tocsteam"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "team",
  "name": "Bug Task",
  "description": "All developers should be members of this team.",
  "html_description": "<body><em>All</em> developers should be members of this team.</body>",
  "organization": null
}

```

A *team* is used to group related projects and people together within an
organization. Each project in an organization is associated with a team.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the object.|
|description|string|false|none|[Opt In](/developers/documentation/getting-started/input-output-options). The description of the team.|
|html_description|string|false|none|[Opt In](/developers/documentation/getting-started/input-output-options). The description of the team with formatting as HTML.<br>**Note: This field is under active migration—please see our [blog post](https://asana.com/developers/news/new-rich-text) for more information.**|
|organization|any|false|none|none|

<h2 id="tocS_TeamCompact">TeamCompact</h2>
<!-- backwards compatibility -->
<a id="schemateamcompact"></a>
<a id="schema_TeamCompact"></a>
<a id="tocSteamcompact"></a>
<a id="tocsteamcompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "team",
  "name": "Bug Task"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the object.|

<h2 id="tocS_User">User</h2>
<!-- backwards compatibility -->
<a id="schemauser"></a>
<a id="schema_User"></a>
<a id="tocSuser"></a>
<a id="tocsuser"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "user",
  "name": "Greg Sanchez",
  "email": "gsanchez@example.com",
  "photo": {
    "image_21x21": "https://...",
    "image_27x27": "https://...",
    "image_36x36": "https://...",
    "image_60x60": "https://...",
    "image_128x128": "https://..."
  },
  "workspaces": [
    {
      "id": 12345,
      "gid": "12345",
      "resource_type": "task",
      "name": "Bug Task",
      "email_domains": [],
      "is_organization": false
    }
  ]
}

```

A *user* object represents an account in Asana that can be given access
to various workspaces, projects, and tasks.

Like other objects in the system, users are referred to by numerical
IDs. However, the special string identifier `me` can be used anywhere a
user ID is accepted, to refer to the current authenticated user.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|**Read-only except when same user as requester**. The user’s name.|
|email|string(email)|false|read-only|The user’s email address.|
|photo|object¦null|false|read-only|A map of the user’s profile photo in various sizes, or null if no photo is set. Sizes provided are 21, 27, 36, 60, and 128. Images are in PNG format.|
|» image_21x21|string(uri)|false|none|none|
|» image_27x27|string(uri)|false|none|none|
|» image_36x36|string(uri)|false|none|none|
|» image_60x60|string(uri)|false|none|none|
|» image_128x128|string(uri)|false|none|none|
|workspaces|[object]|false|read-only|Workspaces and organizations this user may access.<br>Note\: The API will only return workspaces and organizations that also contain the authenticated user.|
|» id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|» gid|string|false|read-only|Globally unique ID of the object, as a string.|
|» resource_type|string|false|read-only|The base type of this resource.|
|» name|string|false|none|The name of the object.|
|» email_domains|[string]|false|none|The email domains that are associated with this workspace.|
|» is_organization|boolean|false|none|Whether the workspace is an *organization*.|

<h2 id="tocS_UserCompact">UserCompact</h2>
<!-- backwards compatibility -->
<a id="schemausercompact"></a>
<a id="schema_UserCompact"></a>
<a id="tocSusercompact"></a>
<a id="tocsusercompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "user",
  "name": "Greg Sanchez"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|**Read-only except when same user as requester**. The user’s name.|

<h2 id="tocS_UserTaskList">UserTaskList</h2>
<!-- backwards compatibility -->
<a id="schemausertasklist"></a>
<a id="schema_UserTaskList"></a>
<a id="tocSusertasklist"></a>
<a id="tocsusertasklist"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "task",
  "name": "Bug Task",
  "owner": null,
  "workspace": null
}

```

A user task list represents the tasks assigned to a particular user. It provides API access to a user’s “My Tasks” view in Asana.
A user’s “My Tasks” represent all of the tasks assigned to that user. It is visually divided into regions based on the task’s [`assignee_status`] (https://asana.com/developers/api-reference/tasks#field-assignee_status) for Asana users to triage their tasks based on when they can address them. When building an integration it’s worth noting that tasks with due dates will automatically move through `assignee_status` states as their due dates approach; read up on [task auto-promotion](https://asana.com/guide/help/fundamentals/my-tasks#gl-auto-promote) for more information.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the object.|
|owner|any|false|none|none|
|workspace|any|false|none|none|

<h2 id="tocS_Webhook">Webhook</h2>
<!-- backwards compatibility -->
<a id="schemawebhook"></a>
<a id="schema_Webhook"></a>
<a id="tocSwebhook"></a>
<a id="tocswebhook"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "task",
  "created_at": "2012-02-22T02:06:58.147Z",
  "active": false,
  "last_failure_at": "2012-02-22T02:06:58.147Z",
  "last_failure_content": "500 Server Error\\n\\nCould not complete the request",
  "last_success_at": "2012-02-22T02:06:58.147Z",
  "resource": null,
  "target": "https://example.com/receive-webhook/7654"
}

```

Webhooks allow an application to be notified of changes. This is in
addition to the ability to fetch those changes directly as Events - in
fact, Webhooks are just a way to receive
[Events](https://asana.com/developers/api-reference/events) via HTTP POST
at the time they occur instead of polling for them. For services
accessible via HTTP this is often vastly more convenient, and if events
are not too frequent can be significantly more efficient.

In both cases, however, changes are represented as Event objects - refer
to the [Events
documentation](https://asana.com/developers/api-reference/events) for
more information on what data these events contain.

**Note**: While Webhooks send arrays of Event objects to their target,
the Event objects themselves contain *only IDs*, rather than the actual
resource they are referencing. Webhooks themselves contain only the
information necessary to deliver the events to the desired target as they
are generated.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|created_at|string(date-time)|false|read-only|The time at which this resource was created.|
|active|boolean|false|none|If true, the webhook will send events - if false it is considered inactive and will not generate events.|
|last_failure_at|string(date-time)|false|read-only|The timestamp when the webhook last received an error when sending an event to the target.|
|last_failure_content|string|false|read-only|The contents of the last error response sent to the webhook when attempting to deliver events to the target.|
|last_success_at|string(date-time)|false|read-only|The timestamp when the webhook last successfully sent an event to the target.|
|resource|any|false|none|none|
|target|string(uri)|false|read-only|The URL to receive the HTTP POST.|

<h2 id="tocS_WebhookEvent">WebhookEvent</h2>
<!-- backwards compatibility -->
<a id="schemawebhookevent"></a>
<a id="schema_WebhookEvent"></a>
<a id="tocSwebhookevent"></a>
<a id="tocswebhookevent"></a>

```json
{
  "action": "changed",
  "created_at": "2012-02-22T02:06:58.147Z",
  "parent": 12345,
  "resource": 32154,
  "type": "task",
  "user": 321654987
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|action|string|false|read-only|The type of action taken that triggered the event.|
|created_at|string(date-time)|false|read-only|The timestamp when the event occurred.|
|parent|integer¦null|false|read-only|For added/removed events, the parent ID that resource was added to or removed from. The parent will be `null` for other event types.|
|resource|integer|false|read-only|The resource ID the event occurred on.<br><br>**Note**: The resource that triggered the event may be different from<br>the one that the events were requested for. For example, a<br>subscription to a project will contain events for tasks contained<br>within the project.|
|type|string|false|read-only|The type of the resource that generated the event.<br><br>**Note**: Currently, only tasks, projects and stories generate<br>events.|
|user|integer¦null|false|read-only|The ID of the user who triggered the event.<br><br>**Note**: The event may be triggered by a different user than the<br>subscriber. For example, if user A subscribes to a task and user B<br>modified it, the event’s user will be user B. Note: Some events are<br>generated by the system, and will have `null` as the user. API<br>consumers should make sure to handle this case.|

<h2 id="tocS_Workspace">Workspace</h2>
<!-- backwards compatibility -->
<a id="schemaworkspace"></a>
<a id="schema_Workspace"></a>
<a id="tocSworkspace"></a>
<a id="tocsworkspace"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "task",
  "name": "Bug Task",
  "email_domains": [
    "asana.com"
  ],
  "is_organization": false
}

```

A *workspace* is the highest-level organizational unit in Asana. All
projects and tasks have an associated workspace.

An *organization* is a special kind of workspace that represents a
company. In an organization, you can group your projects into teams.
You can read more about how organizations work on the Asana Guide. To
tell if your workspace is an organization or not, check its
`is_organization` property.

Over time, we intend to migrate most workspaces into organizations and
to release more organization-specific functionality. We may eventually
deprecate using workspace-based APIs for organizations. Currently, and
until after some reasonable grace period following any further
announcements, you can still reference organizations in any `workspace`
parameter.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the object.|
|email_domains|[string]|false|none|The email domains that are associated with this workspace.|
|is_organization|boolean|false|none|Whether the workspace is an *organization*.|

<h2 id="tocS_WorkspaceCompact">WorkspaceCompact</h2>
<!-- backwards compatibility -->
<a id="schemaworkspacecompact"></a>
<a id="schema_WorkspaceCompact"></a>
<a id="tocSworkspacecompact"></a>
<a id="tocsworkspacecompact"></a>

```json
{
  "id": 12345,
  "gid": "12345",
  "resource_type": "workspace",
  "name": "Bug Task"
}

```

A generic Asana Object, containing a globally unique identifier.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|read-only|Globally unique ID of the attachment, as an integer. **Note: This field is under active migration to the gid field—please see our blog post for more information.**|
|gid|string|false|read-only|Globally unique ID of the object, as a string.|
|resource_type|string|false|read-only|The base type of this resource.|
|name|string|false|none|The name of the object.|

