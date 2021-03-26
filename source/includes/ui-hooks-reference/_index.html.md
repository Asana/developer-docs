<!-- Generator: Widdershins v3.6.6 -->

<hr class="full-line">
<section class="full-section">
<h1 id="workflow-apps">Workflow App Reference</h1>

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

<span class="description">
This is the interface for handling requests for [Workflow Apps](https://developers.asana.com/docs/workflow-apps). This reference is generated from an [OpenAPI spec] (https://raw.githubusercontent.com/Asana/developer-docs/master/defs/ui_hooks_oas.yaml).
</span>

Base URLs:

* <a href="{siteUrl}">{siteUrl}</a>

<a href="https://asana.com/terms">Terms of service</a>
Web: <a href="https://asana.com/support">Asana Support</a> 
</section><hr class="full-line">
<section class="full-section">
<a id="asana-forms"></a>
<h1 id="forms">Forms</h1>

<pre class="highlight http tab-http">
<code><a href="/docs/get-form-metadata"><span class="get-verb">GET</span> <span class=""nn>/{form_metadata_url}</span></a><br><a href="/docs/on-change-callback"><span class="post-verb">POST</span> <span class=""nn>/{on_change_callback}</span></a><br><a href="/docs/on-submit-callback"><span class="post-verb">POST</span> <span class=""nn>/{on_submit_callback}</span></a></code>
</pre>

<span class="description">
The creation form is displayed when the user starts the flow to create a resource. Asana will make a signed request to the specified form_metadata_url in the capabilities, and expect a response with the metadata needed to create the form. This process is also used for forms within rules.
</span>

</section>
<hr class="half-line">
<section>
## Get form metadata

<a id="opIdgetFormMetadata"></a>

> Code samples

```shell
curl -X GET {siteUrl}/{form_metadata_url}?workspace=string&task=string&user=string&locale=string&expires_at=string \
  -H 'Accept: application/json'

```

```javascript--nodejs
getFormMetadata

```

```python
getFormMetadata

```

```ruby
getFormMetadata

```

```java
getFormMetadata

```

```php
getFormMetadata

```

> 200 Response

```json
{
  "error": "You must provide either a name or a title",
  "fields": [
    {
      "error": "Maximum description length is 256 characters",
      "id": "item-description",
      "options": [
        {
          "icon_url": "some-icon.png",
          "id": "opt-in",
          "label": "Opt in to emails."
        }
      ],
      "placeholder": "Type description here...",
      "required": true,
      "title": "Item Description",
      "type": "single_line_text",
      "value": "It's over 9000",
      "width": "full"
    }
  ],
  "on_change": {
    "on_change_callback": "https://app-server.com/form/onchange",
    "watched_fields": [
      "description"
    ]
  },
  "on_submit_callback": "www.example.com/on_submit",
  "submit_button_text": "Create New Issue",
  "title": "Create New Issue"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="get-verb">GET</span> /{form_metadata_url}</code>
</p>

<span class="description">
Get the metadata from the App Server to render a form.
</span>

<h3 id="get-form-metadata-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|The workspace gid this hook is coming from.|
|?task<span class="param-type"> string</span><div class="param-required">required</div>|The task gid this hook is coming from.|
|?user<span class="param-type"> string</span><div class="param-required">required</div>|The user gid this hook is coming from.|
|?locale<span class="param-type"> string</span><div class="param-required">required</div>|The locale of the user (i.e. en, fr)|
|?expires_at<span class="param-type"> string</span><div class="param-required">required</div>|The time (in ISO-8601 date format) when the request should expire|

<h3 id="get-form-metadata-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Successfully retrieved the metadata for a single form.|
|400<span class="param-type"> None</span>|Bad Request|
|401<span class="param-type"> None</span>|Unauthorized|
|403<span class="param-type"> None</span>|Forbidden|
|404<span class="param-type"> None</span>|Not Found|
|500<span class="param-type"> None</span>|Server Error|

</section><hr class="half-line">
<section>
## On change callback

<a id="opIdonFormChange"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{on_change_callback} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
onFormChange

```

```python
onFormChange

```

```ruby
onFormChange

```

```java
onFormChange

```

```php
onFormChange

```

> Body parameter

```json
{
  "changed_field": "string",
  "expires_at": "string",
  "locale": "string",
  "task": "string",
  "user": "string",
  "workspace": "string"
}
```

> 200 Response

```json
{
  "error": "You must provide either a name or a title",
  "fields": [
    {
      "error": "Maximum description length is 256 characters",
      "id": "item-description",
      "options": [
        {
          "icon_url": "some-icon.png",
          "id": "opt-in",
          "label": "Opt in to emails."
        }
      ],
      "placeholder": "Type description here...",
      "required": true,
      "title": "Item Description",
      "type": "single_line_text",
      "value": "It's over 9000",
      "width": "full"
    }
  ],
  "on_change": {
    "on_change_callback": "https://app-server.com/form/onchange",
    "watched_fields": [
      "description"
    ]
  },
  "on_submit_callback": "www.example.com/on_submit",
  "submit_button_text": "Create New Issue",
  "title": "Create New Issue"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{on_change_callback}</code>
</p>

<span class="description">
The callback request made to an App Server when a watched field's value changes within a form.
</span>

<h3 id="on-change-callback-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to notify of an on change event.|
|» changed_field<span class="param-type"> string</span>|The name of the changed FormField|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» locale<span class="param-type"> string</span>|The locale of the user (i.e. en, fr)|
|» task<span class="param-type"> string</span>|The task gid this hook is coming from.|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

<h3 id="on-change-callback-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Successfully returned the new state of the form.|
|400<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Something was wrong with the form data.|
|401<span class="param-type"> None</span>|Unauthorized|
|403<span class="param-type"> None</span>|Forbidden|
|404<span class="param-type"> None</span>|Not Found|
|500<span class="param-type"> None</span>|Server Error|

</section><hr class="half-line">
<section>
## On submit callback

<a id="opIdonFormSubmit"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{on_submit_callback} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
onFormSubmit

```

```python
onFormSubmit

```

```ruby
onFormSubmit

```

```java
onFormSubmit

```

```php
onFormSubmit

```

> Body parameter

```json
{
  "expires_at": "string",
  "locale": "string",
  "task": "string",
  "user": "string",
  "values": {
    "property1": {
      "field_name": "string",
      "field_object": {
        "error": "Maximum description length is 256 characters",
        "id": "item-description",
        "options": [
          {
            "icon_url": "some-icon.png",
            "id": "opt-in",
            "label": "Opt in to emails."
          }
        ],
        "placeholder": "Type description here...",
        "required": true,
        "title": "Item Description",
        "type": "single_line_text",
        "value": "It's over 9000",
        "width": "full"
      }
    },
    "property2": {
      "field_name": "string",
      "field_object": {
        "error": "Maximum description length is 256 characters",
        "id": "item-description",
        "options": [
          {
            "icon_url": "some-icon.png",
            "id": "opt-in",
            "label": "Opt in to emails."
          }
        ],
        "placeholder": "Type description here...",
        "required": true,
        "title": "Item Description",
        "type": "single_line_text",
        "value": "It's over 9000",
        "width": "full"
      }
    }
  },
  "workspace": "string"
}
```

> 200 Response

```json
{
  "error": "No resource matched that input",
  "resource_name": "Build the Thing",
  "resource_url": "https://example.atlassian.net/browse/CP-1"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{on_submit_callback}</code>
</p>

<span class="description">
The callback request made to an App Server when a form is submitted.
</span>

<h3 id="on-submit-callback-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to notify of a form submission.|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» locale<span class="param-type"> string</span>|The locale of the user (i.e. en, fr)|
|» task<span class="param-type"> string</span>|The task gid this hook is coming from.|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» values<span class="param-type"> object</span>|A FormValues object mapping each FormField’s name to its value|
|»» field_name<span class="param-type"> string</span>|none|
|»» field_object<span class="param-type"> object</span>|Every form field type has a set of properties to describe what should be rendered on the form. These are the common properties among every form field type, which should be included in addition to any unique properties of each form field type.|
|»»» error<span class="param-type"> string</span>|If present, the field will render as having an error and the error will be displayed under the form field|
|»»» id<span class="param-type"> string</span>|The id of the field, which is used to reference the field. These should be unique across the entire form|
|»»» options<span class="param-type"> array</span>|*Conditional*. Only relevant for custom fields of type `dropdown`. An array of FieldOption objects|
|»»»» icon_url<span class="param-type"> string</span>|*Conditional*. Only relevant for fields of type `dropdown`. The URL for the icon beside the label. If not present, no icon will be displayed.|
|»»»» id<span class="param-type"> string</span>|The id of the option|
|»»»» label<span class="param-type"> string</span>|The label of the option|
|»»» placeholder<span class="param-type"> string</span>|*Conditional*. Only relevant for custom fields of type `single_line_text`, `multi_line_text`, `date_input`, `date_time_input`, and `typeahead`. The placeholder for the input, which is shown if the field has no value. If not provided, there will be no placeholder.|
|»»» required<span class="param-type"> boolean</span>|Whether the field is required to submit the form|
|»»» title<span class="param-type"> string</span>|The title displayed on top of the field in the creation form. If not provided, no title will be shown.|
|»»» type<span class="param-type"> string</span>|The type of field the form field is|
|»»» value<span class="param-type"> any</span>|The value of the field, the type of which varies based on the particular field. If not provided, the field will be empty and the form cannot be submitted if it is required.|
|»»» width<span class="param-type"> string</span>|*Conditional*. Only relevant for custom fields of type `single_line_text`. The width of the form field. The default is "full".|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| type|single_line_text|
| type|multi_line_text|
| type|rich_text|
| type|static_text|
| type|dropdown|
| type|checkboxes|
| type|date_input|
| type|date_time_input|
| type|typeahead|
| width|full|
| width|half|

<h3 id="on-submit-callback-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [AttachedResource](#schemaattachedresource)</span>|Successfully attached the resource created by the form.|
|400<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Something was wrong with the form data.|
|401<span class="param-type"> None</span>|Unauthorized|
|403<span class="param-type"> None</span>|Forbidden|
|404<span class="param-type"> None</span>|Not Found|
|500<span class="param-type"> None</span>|Server Error|

</section><hr class="full-line">
<section class="full-section">
<a id="asana-rules"></a>
<h1 id="rules">Rules</h1>

<pre class="highlight http tab-http">
<code><a href="/docs/run-action"><span class="post-verb">POST</span> <span class=""nn>/{run_action_url}</span></a><br><a href="/docs/get-action-metadata"><span class="get-verb">GET</span> <span class=""nn>/{metadata_url}</span></a><br><a href="/docs/on-action-change-callback"><span class="post-verb">POST</span> <span class=""nn>/{action.on_change_callback}</span></a><br><a href="/docs/on-action-submit-callback"><span class="post-verb">POST</span> <span class=""nn>/{action.on_submit_callback}</span></a></code>
</pre>

<span class="description">
When a rule containing an app action is triggered, the Rules Engine will make a Workflow App request to the app to inform the app to run the configured app action. The resulting status code will indicate to the Rules Engine whether the action was successfully completed and, if not, specify a cause for the error.
</span>

</section>
<hr class="half-line">
<section>
## Run action

<a id="opIdrunAction"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{run_action_url} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
runAction

```

```python
runAction

```

```ruby
runAction

```

```java
runAction

```

```php
runAction

```

> Body parameter

```json
{
  "action_type": "string",
  "expires_at": "string",
  "locale": "string",
  "target_object": "string",
  "user": "string",
  "workspace": "string"
}
```

> 200 Response

```json
{
  "action_result": "ok",
  "error": "That resource no longer exists",
  "resources_created": [
    {
      "error": "No resource matched that input",
      "resource_name": "Build the Thing",
      "resource_url": "https://example.atlassian.net/browse/CP-1"
    }
  ]
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{run_action_url}</code>
</p>

<span class="description">
The request made when an action is triggered.
</span>

<h3 id="run-action-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to notify of an action running.|
|» action_type<span class="param-type"> string</span>|The id from the configuration used to create the app action. This is a developer-provided string.|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» locale<span class="param-type"> string</span>|The locale of the user (i.e. en, fr)|
|» target_object<span class="param-type"> string</span>|The id of the target object that the Rule is acting on (currently always a Task id)|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

<h3 id="run-action-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [RanAction](#schemaranaction)</span>|Successfully attached the resource created by the form.|
|400<span class="param-type"> None</span>|Bad Request|
|401<span class="param-type"> None</span>|Unauthorized|
|403<span class="param-type"> None</span>|Forbidden|
|404<span class="param-type"> None</span>|Not Found|
|410<span class="param-type"> None</span>|Gone|
|500<span class="param-type"> None</span>|Server Error|

</section><hr class="half-line">
<section>
## Get action metadata

<a id="opIdgetActionMetadata"></a>

> Code samples

```shell
curl -X GET {siteUrl}/{metadata_url}?action_type=string&project=string&workspace=string&user=string&locale=string&expires_at=string \
  -H 'Accept: application/json'

```

```javascript--nodejs
getActionMetadata

```

```python
getActionMetadata

```

```ruby
getActionMetadata

```

```java
getActionMetadata

```

```php
getActionMetadata

```

> 200 Response

```json
{
  "error": "You must provide either a name or a title",
  "fields": [
    {
      "error": "Maximum description length is 256 characters",
      "id": "item-description",
      "options": [
        {
          "icon_url": "some-icon.png",
          "id": "opt-in",
          "label": "Opt in to emails."
        }
      ],
      "placeholder": "Type description here...",
      "required": true,
      "title": "Item Description",
      "type": "single_line_text",
      "value": "It's over 9000",
      "width": "full"
    }
  ],
  "on_change": {
    "on_change_callback": "https://app-server.com/form/onchange",
    "watched_fields": [
      "description"
    ]
  },
  "on_submit_callback": "www.example.com/on_submit",
  "submit_button_text": "Create New Issue",
  "title": "Create New Issue"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="get-verb">GET</span> /{metadata_url}</code>
</p>

<span class="description">
When a user has navigated to the Custom Rule Builder UI and selected an App Action (either through the sidebar or via a Rule Preset), Asana will make a Workflow App request to the app to get the configuration form definition for the chosen app action. This will initiate the flow to configure a new app action or edit the configuration of an existing app action. This is the endpoint and schema for updating app actions; app triggers (V2) will be analogous.
</span>

<h3 id="get-action-metadata-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?action<span class="param-type"> string</span>|The id of an existing app action that is being edited. Should be omitted when configuring a new app action.|
|?action_type<span class="param-type"> string</span><div class="param-required">required</div>|The id of the configuration used to create the app action|
|?project<span class="param-type"> string</span><div class="param-required">required</div>|The project gid this hook is coming from.|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|The workspace gid this hook is coming from.|
|?user<span class="param-type"> string</span><div class="param-required">required</div>|The user gid this hook is coming from.|
|?locale<span class="param-type"> string</span><div class="param-required">required</div>|The locale of the user (i.e. en, fr)|
|?expires_at<span class="param-type"> string</span><div class="param-required">required</div>|The time (in ISO-8601 date format) when the request should expire|

<h3 id="get-action-metadata-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Successfully retrieved the metadata for a single action.|
|400<span class="param-type"> None</span>|Bad Request|
|401<span class="param-type"> None</span>|Unauthorized|
|403<span class="param-type"> None</span>|Forbidden|
|404<span class="param-type"> None</span>|Not Found|
|500<span class="param-type"> None</span>|Server Error|

</section><hr class="half-line">
<section>
## On action change callback

<a id="opIdonActionFormChange"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{action.on_change_callback} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
onActionFormChange

```

```python
onActionFormChange

```

```ruby
onActionFormChange

```

```java
onActionFormChange

```

```php
onActionFormChange

```

> Body parameter

```json
{
  "action": "string",
  "action_type": "string",
  "changed_field": "string",
  "expires_at": "string",
  "locale": "string",
  "user": "string",
  "workspace": "string"
}
```

> 200 Response

```json
{
  "error": "You must provide either a name or a title",
  "fields": [
    {
      "error": "Maximum description length is 256 characters",
      "id": "item-description",
      "options": [
        {
          "icon_url": "some-icon.png",
          "id": "opt-in",
          "label": "Opt in to emails."
        }
      ],
      "placeholder": "Type description here...",
      "required": true,
      "title": "Item Description",
      "type": "single_line_text",
      "value": "It's over 9000",
      "width": "full"
    }
  ],
  "on_change": {
    "on_change_callback": "https://app-server.com/form/onchange",
    "watched_fields": [
      "description"
    ]
  },
  "on_submit_callback": "www.example.com/on_submit",
  "submit_button_text": "Create New Issue",
  "title": "Create New Issue"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{action.on_change_callback}</code>
</p>

<span class="description">
The callback request made to an App Server when a watched field's value changes within an action form.
</span>

<h3 id="on-action-change-callback-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to notify of an on change event.|
|» action<span class="param-type"> string</span>|The id of an existing app action that is being edited|
|» action_type<span class="param-type"> string</span>|The id of the configuration used to create the app action|
|» changed_field<span class="param-type"> string</span>|The name of the changed FormField|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» locale<span class="param-type"> string</span>|The locale of the user (i.e. en, fr)|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

<h3 id="on-action-change-callback-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Successfully returned the new state of the form.|
|400<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Something was wrong with the form data.|
|401<span class="param-type"> None</span>|Unauthorized|
|403<span class="param-type"> None</span>|Forbidden|
|404<span class="param-type"> None</span>|Not Found|
|500<span class="param-type"> None</span>|Server Error|

</section><hr class="half-line">
<section>
## On action submit callback

<a id="opIdonActionFormSubmit"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{action.on_submit_callback} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
onActionFormSubmit

```

```python
onActionFormSubmit

```

```ruby
onActionFormSubmit

```

```java
onActionFormSubmit

```

```php
onActionFormSubmit

```

> Body parameter

```json
{
  "action": "string",
  "action_type": "string",
  "expires_at": "string",
  "locale": "string",
  "rule_name": "string",
  "task": "string",
  "user": "string",
  "values": {
    "property1": {
      "field_name": "string",
      "field_object": {
        "error": "Maximum description length is 256 characters",
        "id": "item-description",
        "options": [
          {
            "icon_url": "some-icon.png",
            "id": "opt-in",
            "label": "Opt in to emails."
          }
        ],
        "placeholder": "Type description here...",
        "required": true,
        "title": "Item Description",
        "type": "single_line_text",
        "value": "It's over 9000",
        "width": "full"
      }
    },
    "property2": {
      "field_name": "string",
      "field_object": {
        "error": "Maximum description length is 256 characters",
        "id": "item-description",
        "options": [
          {
            "icon_url": "some-icon.png",
            "id": "opt-in",
            "label": "Opt in to emails."
          }
        ],
        "placeholder": "Type description here...",
        "required": true,
        "title": "Item Description",
        "type": "single_line_text",
        "value": "It's over 9000",
        "width": "full"
      }
    }
  },
  "workspace": "string"
}
```

> 400 Response

```json
{
  "error": "You must provide either a name or a title",
  "fields": [
    {
      "error": "Maximum description length is 256 characters",
      "id": "item-description",
      "options": [
        {
          "icon_url": "some-icon.png",
          "id": "opt-in",
          "label": "Opt in to emails."
        }
      ],
      "placeholder": "Type description here...",
      "required": true,
      "title": "Item Description",
      "type": "single_line_text",
      "value": "It's over 9000",
      "width": "full"
    }
  ],
  "on_change": {
    "on_change_callback": "https://app-server.com/form/onchange",
    "watched_fields": [
      "description"
    ]
  },
  "on_submit_callback": "www.example.com/on_submit",
  "submit_button_text": "Create New Issue",
  "title": "Create New Issue"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{action.on_submit_callback}</code>
</p>

<span class="description">
The form is submitted when the user chooses to create their Rule. Asana will create the app action data model object and make a signed request to the on_submit_callback specified in the form metadata returned from the fetch/update app rule form endpoints. Information about the created app action should be included in the response if it was successfully created. This is the endpoint and schema for updating app actions; app triggers (V2) will be analogous.
</span>

<h3 id="on-action-submit-callback-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to submit an action form.|
|» action<span class="param-type"> string</span>|The id of an existing app action that is being edited|
|» action_type<span class="param-type"> string</span>|The id of the configuration used to create the app action|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» locale<span class="param-type"> string</span>|The locale of the user (i.e. en, fr)|
|» rule_name<span class="param-type"> string</span>|The name of the rule being created|
|» task<span class="param-type"> string</span>|The task gid this hook is coming from.|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» values<span class="param-type"> object</span>|A FormValues object mapping each FormField’s name to its value|
|»» field_name<span class="param-type"> string</span>|none|
|»» field_object<span class="param-type"> object</span>|Every form field type has a set of properties to describe what should be rendered on the form. These are the common properties among every form field type, which should be included in addition to any unique properties of each form field type.|
|»»» error<span class="param-type"> string</span>|If present, the field will render as having an error and the error will be displayed under the form field|
|»»» id<span class="param-type"> string</span>|The id of the field, which is used to reference the field. These should be unique across the entire form|
|»»» options<span class="param-type"> array</span>|*Conditional*. Only relevant for custom fields of type `dropdown`. An array of FieldOption objects|
|»»»» icon_url<span class="param-type"> string</span>|*Conditional*. Only relevant for fields of type `dropdown`. The URL for the icon beside the label. If not present, no icon will be displayed.|
|»»»» id<span class="param-type"> string</span>|The id of the option|
|»»»» label<span class="param-type"> string</span>|The label of the option|
|»»» placeholder<span class="param-type"> string</span>|*Conditional*. Only relevant for custom fields of type `single_line_text`, `multi_line_text`, `date_input`, `date_time_input`, and `typeahead`. The placeholder for the input, which is shown if the field has no value. If not provided, there will be no placeholder.|
|»»» required<span class="param-type"> boolean</span>|Whether the field is required to submit the form|
|»»» title<span class="param-type"> string</span>|The title displayed on top of the field in the creation form. If not provided, no title will be shown.|
|»»» type<span class="param-type"> string</span>|The type of field the form field is|
|»»» value<span class="param-type"> any</span>|The value of the field, the type of which varies based on the particular field. If not provided, the field will be empty and the form cannot be submitted if it is required.|
|»»» width<span class="param-type"> string</span>|*Conditional*. Only relevant for custom fields of type `single_line_text`. The width of the form field. The default is "full".|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

#### Enumerated Values

|Parameter|Value|
|---|---|
| type|single_line_text|
| type|multi_line_text|
| type|rich_text|
| type|static_text|
| type|dropdown|
| type|checkboxes|
| type|date_input|
| type|date_time_input|
| type|typeahead|
| width|full|
| width|half|

<h3 id="on-action-submit-callback-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> None</span>|Successfully handled form submission.|
|400<span class="param-type"> [FormMetadata](#schemaformmetadata)</span>|Something was wrong with the form data.|
|401<span class="param-type"> None</span>|Unauthorized|
|403<span class="param-type"> None</span>|Forbidden|
|404<span class="param-type"> None</span>|Not Found|
|500<span class="param-type"> None</span>|Server Error|

</section><hr class="full-line">
<section class="full-section">
<a id="asana-typeahead-workflow-apps"></a>
<h1 id="typeahead-workflow-apps">Typeahead - Workflow Apps</h1>

<pre class="highlight http tab-http">
<code><a href="/docs/typeahead-(ui)"><span class="get-verb">GET</span> <span class=""nn>/{typeahead_url}</span></a></code>
</pre>

<span class="description">
Each typeahead form field contains a typeahead_url to fetch typeahead options based on input text. While the user inputs text into the field, Asana will periodically (every 700ms) send signed requests to the typeahead_url and expect responses with lists of items matching the given input.
</span>

</section>
<hr class="half-line">
<section>
## Typeahead (UI)

<a id="opIdtypeaheadUI"></a>

> Code samples

```shell
curl -X GET {siteUrl}/{typeahead_url}?fragment=string&workspace=string&task=string&user=string&locale=string&expires_at=string \
  -H 'Accept: application/json'

```

```javascript--nodejs
typeaheadUI

```

```python
typeaheadUI

```

```ruby
typeaheadUI

```

```java
typeaheadUI

```

```php
typeaheadUI

```

> 200 Response

```json
{
  "items": [
    {
      "icon_url": "https://example-icon.png",
      "subtitle": "OTP",
      "title": "OTP Team PF",
      "value": "OTP"
    }
  ]
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="get-verb">GET</span> /{typeahead_url}</code>
</p>

<span class="description">
The typeahead request made to an App Server when a typeahead field changes.
</span>

<h3 id="typeahead-(ui)-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?fragment<span class="param-type"> string</span><div class="param-required">required</div>|The text entered into the typeahead input|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|The workspace gid this hook is coming from.|
|?task<span class="param-type"> string</span><div class="param-required">required</div>|The task gid this hook is coming from.|
|?user<span class="param-type"> string</span><div class="param-required">required</div>|The user gid this hook is coming from.|
|?locale<span class="param-type"> string</span><div class="param-required">required</div>|The locale of the user (i.e. en, fr)|
|?expires_at<span class="param-type"> string</span><div class="param-required">required</div>|The time (in ISO-8601 date format) when the request should expire|

<h3 id="typeahead-(ui)-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> Inline</span>|Successfully attached the resource created by the form.|
|400<span class="param-type"> None</span>|Bad Request|
|500<span class="param-type"> None</span>|Server Error|

<h3 id="typeahead-(ui)-responseschema">Response Schema</h3>

Status Code **200**

|Name|Description|
|---|---|
| items<span class="param-type"> [[TypeaheadItem](#schematypeaheaditem)]</span>|[An object describing a typeahead result]|
| icon_url<span class="param-type"> string</span>|The URL of the icon to display next to the title|
| subtitle<span class="param-type"> string</span>|The subtitle of the typeahead item|
| title<span class="param-type"> string</span>|The title of the typeahead item|
| value<span class="param-type"> string</span>|The value of the typeahead item|

</section><hr class="full-line">
<section class="full-section">
<a id="asana-widgets"></a>
<h1 id="widgets">Widgets</h1>

<pre class="highlight http tab-http">
<code><a href="/docs/get-widget-metadata"><span class="get-verb">GET</span> <span class=""nn>/{widget_metadata_url}</span></a><br><a href="/docs/attach-resource"><span class="post-verb">POST</span> <span class=""nn>/{resource_attach_url}</span></a></code>
</pre>

<span class="description">
The widget is displayed when the user views a task with an attachment with a resource URL matching your capability’s match_url_pattern. When this happens, Asana will make a signed request to your widget_metadata_url, and expect a response with information to build the widget.
</span>

</section>
<hr class="half-line">
<section>
## Get widget metadata

<a id="opIdgetWidgetMetadata"></a>

> Code samples

```shell
curl -X GET {siteUrl}/{widget_metadata_url}?resource_url=string&workspace=string&task=string&user=string&locale=string&attachment=string&asset=string&expires_at=string \
  -H 'Accept: application/json'

```

```javascript--nodejs
getWidgetMetadata

```

```python
getWidgetMetadata

```

```ruby
getWidgetMetadata

```

```java
getWidgetMetadata

```

```php
getWidgetMetadata

```

> 200 Response

```json
{
  "data": {
    "comment_count": 2,
    "error": "The resource cannot be accessed",
    "fields": [
      {
        "color": "gray",
        "icon_url": "https://example-icon.png",
        "name": "Status",
        "text": "To Do",
        "type": "pill"
      }
    ],
    "footer": "Last updated 19 hours ago",
    "subicon_url": "https://example-icon.png",
    "subtitle": "Custom App Story · Open in Custom App",
    "title": "Status"
  },
  "template": "summary_with_details_v0"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="get-verb">GET</span> /{widget_metadata_url}</code>
</p>

<span class="description">
Get the metadata from the App Server to render a widget.
</span>

<h3 id="get-widget-metadata-parameters">Parameters</h3>

|Name|Description|
|---|---|
|?resource_url<span class="param-type"> string</span><div class="param-required">required</div>|The URL of the URL attachment on the task (i.e. Jira issue, Github pull request)|
|?workspace<span class="param-type"> string</span><div class="param-required">required</div>|The workspace gid this hook is coming from.|
|?task<span class="param-type"> string</span><div class="param-required">required</div>|The task gid this hook is coming from.|
|?user<span class="param-type"> string</span><div class="param-required">required</div>|The user gid this hook is coming from.|
|?locale<span class="param-type"> string</span><div class="param-required">required</div>|The locale of the user (i.e. en, fr)|
|?attachment<span class="param-type"> string</span><div class="param-required">required</div>|The attachment id of the URL attachment|
|?asset<span class="param-type"> string</span><div class="param-required">required</div>|The asset id of the asset containing the URL attachment|
|?expires_at<span class="param-type"> string</span><div class="param-required">required</div>|The time (in ISO-8601 date format) when the request should expire|

<h3 id="get-widget-metadata-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [WidgetMetadata](#schemawidgetmetadata)</span>|Successfully retrieved the metadata for a single widget.|
|400<span class="param-type"> None</span>|Bad Request|
|401<span class="param-type"> None</span>|Unauthorized|
|403<span class="param-type"> None</span>|Forbidden|
|404<span class="param-type"> None</span>|Not Found|
|418<span class="param-type"> None</span>|Unauthorized|
|500<span class="param-type"> None</span>|Server Error|

</section><hr class="half-line">
<section>
## Attach resource

<a id="opIdattachResource"></a>

> Code samples

```shell
curl -X POST {siteUrl}/{resource_attach_url} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"data": {"field":"value","field":"value"} }'

```

```javascript--nodejs
attachResource

```

```python
attachResource

```

```ruby
attachResource

```

```java
attachResource

```

```php
attachResource

```

> Body parameter

```json
{
  "asset": "string",
  "attachment": "string",
  "expires_at": "string",
  "locale": "string",
  "task": "string",
  "user": "string",
  "value": "string",
  "workspace": "string"
}
```

> 200 Response

```json
{
  "error": "No resource matched that input",
  "resource_name": "Build the Thing",
  "resource_url": "https://example.atlassian.net/browse/CP-1"
}
```

> See [Input/Output Options](/docs/input-output-options) to include more fields in your response.

<p>
<code> <span class="post-verb">POST</span> /{resource_attach_url}</code>
</p>

<span class="description">
When the user attaches a resource URL to a task, Asana will make a signed request to the specified resource_attach_url in the capabilities. Information about the attached resource should be included in the response.
</span>

<h3 id="attach-resource-parameters">Parameters</h3>

|Name|Description|
|---|---|
|body<span class="param-type"> object</span><div class="param-required">required</div>|Request to attach a resource.|
|» asset<span class="param-type"> string</span>|The asset id of the asset containing the URL attachment|
|» attachment<span class="param-type"> string</span>|The attachment id of the URL attachment|
|» expires_at<span class="param-type"> string</span>|The time (in ISO-8601 date format) when the request should expire|
|» locale<span class="param-type"> string</span>|The locale of the user (i.e. en, fr)|
|» task<span class="param-type"> string</span>|The task gid this hook is coming from.|
|» user<span class="param-type"> string</span>|The user gid this hook is coming from.|
|» value<span class="param-type"> string</span>|The user’s input in the attach resource text input (this is often a resource url or resource key, such as CP-1 or https://abcde.atlassian.net/browse/CP-1)|
|» workspace<span class="param-type"> string</span>|The workspace gid this hook is coming from.|

<h3 id="attach-resource-responses">Responses</h3>

|Status|Description|
|---|---|
|200<span class="param-type"> [AttachedResource](#schemaattachedresource)</span>|Successfully attached the resource to the given object.|
|400<span class="param-type"> None</span>|Bad Request|
|401<span class="param-type"> None</span>|Unauthorized|
|403<span class="param-type"> None</span>|Forbidden|
|404<span class="param-type"> None</span>|Not Found|
|500<span class="param-type"> None</span>|Server Error|

</section><hr class="full-line">
<section class="full-section">
# Workflow App Schemas
<span class="description">
The schema definitions for each object requested or returned from Asana's API. Some fields are not returned by
default and you'll need to use [Input/Output Options](/docs/input-output-options) to include them.
</span>
</section>
<hr>
<section>
<a id="schemaattachedresource"></a>
<a id="schema_AttachedResource"></a>
<a id="tocSattachedresource"></a>
<a id="tocsattachedresource"></a>
<a id="tocS_AttachedResource"></a>
<h2 id="attached-resource">AttachedResource</h2>

```json
{
  "error": "No resource matched that input",
  "resource_name": "Build the Thing",
  "resource_url": "https://example.atlassian.net/browse/CP-1"
}

```

<span class="description">
The response to a successful attach request.

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|The error that should be displayed to the user|
|resource_name<span class="param-type"> string</span>|The name of the attached resource|
|resource_url<span class="param-type"> string</span>|The URL of the attached resource|

</section><hr>
<section>
<a id="schemaformmetadata"></a>
<a id="schema_FormMetadata"></a>
<a id="tocSformmetadata"></a>
<a id="tocsformmetadata"></a>
<a id="tocS_FormMetadata"></a>
<h2 id="form-metadata">FormMetadata</h2>

```json
{
  "error": "You must provide either a name or a title",
  "fields": [
    {
      "error": "Maximum description length is 256 characters",
      "id": "item-description",
      "options": [
        {
          "icon_url": "some-icon.png",
          "id": "opt-in",
          "label": "Opt in to emails."
        }
      ],
      "placeholder": "Type description here...",
      "required": true,
      "title": "Item Description",
      "type": "single_line_text",
      "value": "It's over 9000",
      "width": "full"
    }
  ],
  "on_change": {
    "on_change_callback": "https://app-server.com/form/onchange",
    "watched_fields": [
      "description"
    ]
  },
  "on_submit_callback": "www.example.com/on_submit",
  "submit_button_text": "Create New Issue",
  "title": "Create New Issue"
}

```

<span class="description">
Contains the metadata that describes how to display and manage a form

</span>

### Properties

|Name|Description|
|---|---|
|error<span class="param-type"> string</span>|The error that should be displayed at the footer of the creation form|
|fields<span class="param-type"> [object]</span>|An array of FormField objects that are rendered in the order they are in the array.|
|» error<span class="param-type"> string</span>|If present, the field will render as having an error and the error will be displayed under the form field|
|» id<span class="param-type"> string</span>|The id of the field, which is used to reference the field. These should be unique across the entire form|
|» options<span class="param-type"> array</span>|*Conditional*. Only relevant for custom fields of type `dropdown`. An array of FieldOption objects|
|»» icon_url<span class="param-type"> string</span>|*Conditional*. Only relevant for fields of type `dropdown`. The URL for the icon beside the label. If not present, no icon will be displayed.|
|»» id<span class="param-type"> string</span>|The id of the option|
|»» label<span class="param-type"> string</span>|The label of the option|
|» placeholder<span class="param-type"> string</span>|*Conditional*. Only relevant for custom fields of type `single_line_text`, `multi_line_text`, `date_input`, `date_time_input`, and `typeahead`. The placeholder for the input, which is shown if the field has no value. If not provided, there will be no placeholder.|
|» required<span class="param-type"> boolean</span>|Whether the field is required to submit the form|
|» title<span class="param-type"> string</span>|The title displayed on top of the field in the creation form. If not provided, no title will be shown.|
|» type<span class="param-type"> string</span>|The type of field the form field is|
|» value<span class="param-type"> any</span>|The value of the field, the type of which varies based on the particular field. If not provided, the field will be empty and the form cannot be submitted if it is required.|
|» width<span class="param-type"> string</span>|*Conditional*. Only relevant for custom fields of type `single_line_text`. The width of the form field. The default is "full".|
|on_change<span class="param-type"> object</span>|Contains the information to handle whenever watched form fields are changed|
|» on_change_callback<span class="param-type"> string</span>|The URL that Asana should send requests to whenever watched field values are changed|
|» watched_fields<span class="param-type"> [string]</span>|An array of FormField names to indicate which fields should send requests when their values are changed|
|on_submit_callback<span class="param-type"> string</span>|The URL to POST the form to when the user clicks the submit button.<br>If this is field is omitted then the submission button will be disabled. This is useful if the user must enter information in a watched field first, such as to show additional fields.|
|submit_button_text<span class="param-type"> string</span>|The text to display on the form’s submit button. If not provided, the default text “Submit” will be displayed on the button.|
|title<span class="param-type"> string</span>|The title of the form, which is displayed at the top of the creation form|

#### Enumerated Values

|Property|Value|
|---|---|
|type|single_line_text|
|type|multi_line_text|
|type|rich_text|
|type|static_text|
|type|dropdown|
|type|checkboxes|
|type|date_input|
|type|date_time_input|
|type|typeahead|
|width|full|
|width|half|

</section><hr>
<section>
<a id="schemaranaction"></a>
<a id="schema_RanAction"></a>
<a id="tocSranaction"></a>
<a id="tocsranaction"></a>
<a id="tocS_RanAction"></a>
<h2 id="ran-action">RanAction</h2>

```json
{
  "action_result": "ok",
  "error": "That resource no longer exists",
  "resources_created": [
    {
      "error": "No resource matched that input",
      "resource_name": "Build the Thing",
      "resource_url": "https://example.atlassian.net/browse/CP-1"
    }
  ]
}

```

<span class="description">
The response to an action request.

</span>

### Properties

|Name|Description|
|---|---|
|action_result<span class="param-type"> string</span>|Specifies any additional information that the app wants to send to Asana on completion of the action. Can only be `resources_created` or `ok`.|
|error<span class="param-type"> string</span>|The error that should be displayed to the user|
|resources_created<span class="param-type"> [object]</span>|A field with the data corresponding to the action_result value. Each action_result has its own data field shape that Asana expects. `resources_created` expects the name and url of the resources that the action created.|
|» error<span class="param-type"> string</span>|The error that should be displayed to the user|
|» resource_name<span class="param-type"> string</span>|The name of the attached resource|
|» resource_url<span class="param-type"> string</span>|The URL of the attached resource|

#### Enumerated Values

|Property|Value|
|---|---|
|action_result|resources_created|
|action_result|ok|

</section><hr>
<section>
<a id="schematypeaheaditem"></a>
<a id="schema_TypeaheadItem"></a>
<a id="tocStypeaheaditem"></a>
<a id="tocstypeaheaditem"></a>
<a id="tocS_TypeaheadItem"></a>
<h2 id="typeahead-item">TypeaheadItem</h2>

```json
{
  "icon_url": "https://example-icon.png",
  "subtitle": "OTP",
  "title": "OTP Team PF",
  "value": "OTP"
}

```

<span class="description">
An object describing a typeahead result

</span>

### Properties

|Name|Description|
|---|---|
|icon_url<span class="param-type"> string</span>|The URL of the icon to display next to the title|
|subtitle<span class="param-type"> string</span>|The subtitle of the typeahead item|
|title<span class="param-type"> string</span>|The title of the typeahead item|
|value<span class="param-type"> string</span>|The value of the typeahead item|

</section><hr>
<section>
<a id="schemawidgetmetadata"></a>
<a id="schema_WidgetMetadata"></a>
<a id="tocSwidgetmetadata"></a>
<a id="tocswidgetmetadata"></a>
<a id="tocS_WidgetMetadata"></a>
<h2 id="widget-metadata">WidgetMetadata</h2>

```json
{
  "data": {
    "comment_count": 2,
    "error": "The resource cannot be accessed",
    "fields": [
      {
        "color": "gray",
        "icon_url": "https://example-icon.png",
        "name": "Status",
        "text": "To Do",
        "type": "pill"
      }
    ],
    "footer": "Last updated 19 hours ago",
    "subicon_url": "https://example-icon.png",
    "subtitle": "Custom App Story · Open in Custom App",
    "title": "Status"
  },
  "template": "summary_with_details_v0"
}

```

<span class="description">
An object containing information about the widget

</span>

### Properties

|Name|Description|
|---|---|
|data<span class="param-type"> object</span>|none|
|» comment_count<span class="param-type"> integer</span>|The number of comments to display on the lower right corner of the widget. If not provided, no comment count will be shown|
|» error<span class="param-type"> string</span>|The error that should be displayed to the user|
|» fields<span class="param-type"> [object]</span>|An array of WidgetField objects. Currently, the most number of fields a widget can contain is 4.|
|»» color<span class="param-type"> string</span>|The color of the pill.|
|»» icon_url<span class="param-type"> string</span>|The URL of the icon to display next to the text|
|»» name<span class="param-type"> string</span>|The text to show in the title of the field.|
|»» text<span class="param-type"> string</span>|The text to show in the field.|
|»» type<span class="param-type"> string</span>|The type of widget field (this should be `pill`).|
|» footer<span class="param-type"> string</span>|The text to show in the title of the widget|
|» subicon_url<span class="param-type"> string</span>|The URL of the subicon next to the subtitle . If not provided, no icon will be shown|
|» subtitle<span class="param-type"> string</span>|The text to show under the title of the widget, next to "Open in {App Name}". If not provided, the resource_name from the app definition will be used as default|
|» title<span class="param-type"> string</span>|The text to show in the title of the widget|
|template<span class="param-type"> string</span>|none|

#### Enumerated Values

|Property|Value|
|---|---|
|color|none|
|color|red"|
|color|orange|
|color|yellow-orange|
|color|yellow|
|color|yellow-green|
|color|green|
|color|blue-green|
|color|aqua|
|color|blue|
|color|indigo|
|color|purple|
|color|magenta|
|color|hot-pink|
|color|pink|
|color|cool-gray|
|type|pill|
|type|icon|
|template|summary_with_details_v0|

</section>

