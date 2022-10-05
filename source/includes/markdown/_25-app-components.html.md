<hr class="platform-ui-alpha">
<section class="platform-ui-alpha">

# Overview of app components

<span class="beta-indicator">BETA</span>

An important step in maintaining flow at work is having all the information you need in one place. Asana is for teams to track 
projects, to provide clarity on *who* is doing *what* by *when*, and to automate repetitive processes. With app components, it's
now easier than ever to see key work information from other tools on the surface of tasks, as well as automate cross-tool processes.

Apps can use app components to display customized widgets, forms, and rules within Asana's user interface. Under the hood, requests are
made from Asana directly to your [app server](/docs/app-server). Your App Server controls the information within these customized
widgets, as well what happens when a user takes actions within these components.

Using app components, you can build customizable in-product experiences for apps within Asana by leveraging capabilities such as:

* [Widget](/docs/widget)
* [Modal form](/docs/modal-form)
* [Lookup](/docs/lookup)
* [Rule action](/docs/rule-action)
* [Entry point](/docs/entry-point)

For a visual tour on getting started with app components, feel free to review the following video. Then, when you're ready, visit our [getting started](/docs/getting-started) guide to begin building right away.

<div style="padding:35% 0 0 0;position:relative;width:52%">
  <iframe src="https://player.vimeo.com/video/708387216?h=3f025d1b75&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" style="position:absolute;top:0;left:0;width:100%;height:100%;" title="App Components: Getting Started">
  </iframe>
</div>

<script src="https://player.vimeo.com/api/player.js"></script>
  
**You can find the [tutorial source code here](https://github.com/Asana/app-components-example-app)**.

To test and render the different capabilities of app components dynamically, you may access the [UI builder](/docs/ui-builder).

_Note: app components are currently in open beta. For the latest updates and announcements, [subscribe to our developer forum](https://forum.asana.com/c/api/app-components-beta/150)._
  
<hr>

## Widget

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

> Request to the app server

```http
https://app-server.com/widget?workspace=12345&task=23456&user=34567&locale=en&attachment=45678&asset=56789&expires_at=2011-10-05T14%3A48%3A00.000Z&resource_url=https%3A%2F%2Fcompany.atlassian.net%2Fissue%2F1254
```

> Response from the app server

```json
{
    "template": "summary_with_details_v0",
    "data": {
        "title": "MSB-3 As a user, I see a flexible widget",
        "subtitle": "Jira Cloud Story · Open in Jira Cloud",
        "subicon_url": "https://jira.com/icons/subicon.png",
        "footer": {
          "footer_type": "updated",
          "last_updated_at": "2012-02-22T02:06:58.147Z"
        },
        "comment_count": 12,
        "fields": [
            {
                "name": "Status",
                "type": "pill",
                "text": "In Progress",
                "color": "blue"
            },
            {
                "name": "Priority",
                "type": "value_with_icon",
                "icon_url": "https://jira.com/icons/priority_highest.png",
                "text": "Highest"
            },
            {
                "name": "Assignee",
                "type": "value_with_icon",
                "icon_url": "https://jira.com/avatars/rhian.png",
                "text": "Rhian Sheehan"
            }
        ]
    }
}
```

<img style="max-width:420px" src="../images/jira-widget.png" />

A widget is a card that is used to show data about an external resource. Currently, widget
appear inside of tasks. While the contents of a widget may change, the overall format stays
consistent across apps. Apps can control what layout they prefer by supplying their preferred 
`template`. You can see the available templates in the *Enumerated Values* 
section of [response schema](/docs/widget-metadata).

The app server controls the content of this Widget. When an 
Asana user's browser navigates to a widget, Asana sends a 
request to the registered app server. As long as the response from 
the server is valid (like the example on the right), the widget 
will display.

How does Asana determine when a widget should be shown? When a task is opened in
Asana, it checks each attachment on the task. If an attachment has a URL 
that fits with an app's registered **match URL pattern** (ex: `https:\/\/.*.atlassian.net\/.*`) 
then it shows a Widget. A `GET` request is sent to the app's **widget metadata URL**, including 
URL parameters like `task`, `user`, and `workspace`.

### UI builder: widget

Visit the [UI Builder](https://app.asana.com/0/my-apps/response-builder/widget) to configure a Widget in an interactive test environment.
For an overview of the UI Builder, see [this guide](/docs/ui-builder).

### Widget configurations

| Property            | Description                                                                                                                                 |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| Widget metadata URL | A URL that Asana uses to make requests for the data needed to load a Widget, which displays information about a third party resource.       |
| Match URL pattern   | A regex which allows Asana to compute whether a URL attachment is supported by an activated app on the project in order to render a widget. |


### Related references: 

* [Get widget metadata](/docs/get-widget-metadata)
* [Attach resource](/docs/attach-resource)

<hr>

## Modal form

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

> Request to the app server

```http
https://app-server.com/form?workspace=12345&task=23456&user=34567&locale=en&expires_at=2011-10-05T14%3A48%3A00.000Z
```

> Response from the app server

```json
{
  "title": "Create New Issue",
  "on_submit_callback": "https://app-server.com/actions/create",
  "submit_button_text": "Create Issue",
  "fields": [
    {
      "type": "single_line_text",
      "name": "summary",
      "title": "Summary",
      "value": "",
      "placeholder": "Enter some text",
      "width": "full",
      "is_required": true
    },
    {
      "type": "rich_text",
      "name": "description",
      "title": "Description",
      "value": "",
      "placeholder": "",
      "is_required": true
    },
    {
      "type": "typeahead",
      "name": "jira-project",
      "title": "Jira project",
      "value": "",
      "placeholder": "Search Jira for a project...",
      "is_required": true,
      "typeahead_url": "https://app-server.com/jira/project/typeahead",
    },
    {
      "type": "checkboxes",
      "name": "attachments",
      "is_required": false,
      "options": [
        {
          "id": "shouldIncludeAttachments",
          "label": "Attach files from this Asana task"
        }
      ]
    }
  ]
}
```

<img style="max-width:580px; box-shadow: 0 0 0 1px rgba(111,119,130,.15), 0 5px 20px 0 rgba(21,27,38,.08); border-radius: 4px;" src="../images/jira-modal.png" />

A modal form allows users to fill out a dynamic app-controlled list of fields. The number of fields can range from 0-20.
Once a form is submitted, the information is sent to the app server and Asana will perform different functions
depending on what the server responded with. If the app wants to cause additional changes within Asana, the app server
will need to make the changes via the API. 

An advanced feature of modal forms is live `on_change` events. While a user is filling out a form,
the app server can receive `on_change` requests. These requests include what the user has changed, and
allow the app server to respond with an updated form. Apps can build complex branching logic depending
on changes that a user makes.

To take advantage of `on_change` events, you may set a form field's `is_watched` value to `true` and an `on_change_callback` 
endpoint to hit with updates. 
See the `on_change` field in the response to the 
[form metadata request](/docs/get-form-metadata). The request sent to that
endpoint is the [on change callback request](/docs/on-change-callback).

### UI builder: modal form

Visit the [UI builder](https://app.asana.com/0/my-apps/response-builder/modal-form) to configure a modal form in an interactive test environment.
For an overview of the UI Builder, see [this guide](/docs/ui-builder).

### Modal form configurations

| Property              | Description                                                                                          |
|-----------------------|------------------------------------------------------------------------------------------------------|
| Form metadata URL     | A URL that Asana uses to request data from the app about fields it should display in the modal form. |

### Related references: 

* [Get form metadata](/docs/get-form-metadata)
* [Get modal form typeahead results](/docs/get-modal-form-typeahead-results)
* [On change callback](/docs/on-change-callback)
* [On submit callback](/docs/on-submit-callback)

<hr>

## Lookup

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

> Request to the app server

```http
https://app-server.com/lookup?value=Cool&workspace=12345&task=23456&user=34567&locale=en&expires_at=2011-10-05T14%3A48%3A00.000Z
```

> Response from the app server

```json
{
    "resource_name": "Cool Attachment",
    "resource_url": "https://localhost:5000/attachments/123456789"
}
```

<img style="max-width:658px" src="../images/jira-lookup.png" />

Users can send a search term to the app server. The term is often a URL or 
the title of an external resource. The app server then responds with a 
resource or an error.

### UI builder: lookup

Visit the [UI builder](https://app.asana.com/0/my-apps/response-builder/lookup) to configure a lookup in an interactive test environment.
For an overview of the UI builder, see [this guide](/docs/ui-builder).

### Lookup configurations

| Property               | Description                                                                                                                 |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Resource attach URL    | A URL that Asana will make a request to when a user submits a value to attach (i.e., when clicking **Add**).                  |
| Placeholder text       | _Optional_. Placeholder action text that appears in the lookup input field after the user clicks on the lookup action text. |
| Resource typeahead URL | A URL that Asana will make a request to when a user types into a lookup field.                                              |

### Related references: 

* [Widget](/docs/widget)
* [Attach resource](/docs/attach-resource)
* [Get lookup typeahead results](/docs/get-lookup-typeahead-results)

<hr>

## Rule Action

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

> Request to the app server

```http
https://app-server.com/rule?workspace=12345&project=23456&action_type=45678&action=56789&user=34567&locale=en&expires_at=2011-10-05T14%3A48%3A00.000Z
```

> Response from the app server

```json
{
  "on_submit_callback": "https://app-server.com/slack/action/onsubmit",
  "on_change": {
    "on_change_callback": "https://app-server.com/slack/action/onchange",
  },
  "fields": [
    {
      "title": "Choose a channel",
      "type": "typeahead",
      "id": "typeahead_full_width",
      "is_watched": true,
      "is_required": true,
      "typeahead_url": "https://app-server.com/slack/typeahead"
    },
    {
      "title": "Write a message",
      "type": "rich_text",
      "name": "description",
      "is_required": true
    }
  ]
}
```

<img style="max-width:380px; box-shadow: 0 0 0 1px rgba(111,119,130,.15), 0 5px 20px 0 rgba(21,27,38,.08); border-radius: 4px;" src="../images/slack-rule.png" />

A Rule Action allows users to customize actions triggered by Asana's rule engine. They use the same functionality as
the [Modal Form](/docs/modal-form), as Asana requests a form definition from the app server. The app controls the form 
fields, handles `on_change` events, and stores the inputs of the form. When a rule is created, Asana sends a request to 
the app server with the user-specified inputs. When the rule is triggered, Asana sends an event to the app server.

Rule Actions are a part of [Asana Rules](https://asana.com/guide/help/premium/rules).

_Note: An app server must be hosted in order for Rule Actions to function. For a brief list of popular hosting options, see [Hosting](/docs/hosting)._

To see an example app server written for Rule Actions, see our [app-components-rule-action-example-app](https://github.com/Asana/app-components-rule-action-example-app) on GitHub.

### UI Builder: Rule Action

Visit the [UI Builder](https://app.asana.com/0/my-apps/response-builder/rule-actions) to configure a Rule Action in an interactive test environment.
For an overview of the UI Builder, see [this guide](/docs/ui-builder).

### Rule Action Configurations

| Property          | Description                                                                                  |
|-------------------|----------------------------------------------------------------------------------------------|
| Display name      | The Rule Action name visible to end users in the rule builder (e.g., "Create a Jira issue"). |
| Run action URL    | A URL that Asana will make a request to when the rule is triggered.                          |
| Form metadata URL | A URL that Asana will make a request to to display the configuration form.                   |

### Related References: 

* [Get Rule Action typeahead results](/docs/get-rule-action-typeahead-results)
* [Run action](/docs/run-action)
* [Get action metadata](/docs/get-action-metadata)
* [On action change callback](/docs/on-action-change-callback)
* [On action submit callback](/docs/on-action-submit-callback)

<hr>

## Entry Point

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

<img src="../images/entry-point.png" alt="Entry point"/>

The Entry Point allows users to initiate the [Lookup](/docs/lookup) and [Modal Form](/docs/modal-form) components from tasks.

To configure the Entry Point, one or both of the above capabilities must be configured first. If only one of these capabilities is configured, the Entry Point takes the form of a button. If both of these capabilities above are configured, the Entry Point is rendered as a dropdown menu. 

### Entry Point Configurations

| Property               | Description                                                       |
|------------------------|-------------------------------------------------------------------|
| Lookup action text     | Clickable action text that allows users to initiate a Lookup.     |
| Modal Form action text | Clickable action text that allows users to initiate a Modal Form. |

<hr class="full-line">

# Getting Started

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

This guide will show you how to begin building with App Components. To make best use of the following tutorials, be sure you've already reviewed the [Overview of App Components](/docs/overview-of-app-components).

<hr>

## Overview of Build Steps

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

The overall development process for App Components involves the following:

1. Create the app in the [developer console](https://app.asana.com/0/developer-console).
2. Configure the app in the [developer console](https://app.asana.com/0/developer-console).
3. [Build the App Server](/docs/building-the-app-server).
4. [Get the app ready for publishing](/docs/publishing-an-app).
5. [Submit the app for review](/docs/submit-your-app).

The tutorials in this guide will cover the first two steps of the overall build process: creating and configuring the app. By the end of this guide, you will have an app ready to interact with your [App Server](/docs/app-server).

<hr>

## Before You Begin

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

### Get a Sandbox

To get started with App Components, you'll need an Asana account. This will give you a workspace to access the [developer console](https://app.asana.com/0/developer-console), through which you can create and configure apps directly in Asana's user interface. 

While you can [sign up](https://asana.com/guide/help/fundamentals/about-asana) for an account if you don't already have one, we actually recommend using a [Developer Sandbox](/docs/developer-sandbox) to help you build in a separate, dedicated environment. You'll still be able to access the developer console this way, but the developer sandbox will also grant you access to the [Example App](/docs/example-apps), where you can explore the capabilities and features of App Components in-depth.

### Consider the App's User Experience

Each app built with App Components is unique, and will leverage different capabilities of App Components. For example, the [Zoom app](https://asana.com/apps/zoom) lets users create a new meeting or attach an existing meeting to an Asana task. Under the hood, these actions are made possible by using a [Modal Form](/docs/modal-form) to create new meetings, [Lookup](/docs/lookup) to search and connect existing meetings, and a [Widget](/docs/widget) to display the external meeting data in a task. Meanwhile, a different app may forego such functionalities, and instead exclusively use [Rule Actions](/docs/rule-actions) to automate workflows between Asana and another tool. Overall, we encourage you to experiment with different capabilities and decide how you want your end user's experience to be.

To see visual documentation for how you can design your app, check out the [App Components Toolkit](/docs/toolkit). For further inspiration, feel free to navigate to the [app directory](https://asana.com/apps).

### Start Building the App Server

Because App Components allow your end users to interact with resources outside of Asana's user interface, an [App Server](/docs/app-server) is required for building with App Components. While it isn't necessary to have a complete App Server before moving forward, it's a good idea to at least know the URLs to any server endpoints you want to configure ahead of time (e.g., your URL to [get the metadata](/docs/get-widget-metadata) for a [Widget](/docs/widget)), though these can be configured or changed at any time.

Feel free to review the [app-components-example-app](https://github.com/Asana/app-components-example-app) on GitHub to see an example server written in Express.js. This server is also used in the [Example App](/docs/example-apps).

<hr>

## Create the App

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

The first step is to create the app in your [developer console](https://app.asana.com/0/developer-console). Navigate to **Create new app** and provide a name for your app. If your app is published, this name will appear in the Asana app for users to see, including in both the app gallery and [app directory](https://asana.com/apps).

<img src="../images/my-apps.png" alt="My apps"/>

<hr>

## Configure the App

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

Once your app has been created, you'll automatically be brought to the new app's settings. From here, you can make the configurations necessary to define your app. 

_Note: To see these settings again, navigate to your app in the [developer console](https://app.asana.com/0/developer-console)._

### Configure Basic Info

On the **Basic information** tab, provide some information about your app.

<img src="../images/basic-info.png" alt="Basic information"/>

These details will be accessible to the end user, and are meant to help them identify and learn more about your application.

| Property             | Description                                                                        |
|----------------------|------------------------------------------------------------------------------------|
| App icon             | Your app's icon, shown to users to identify your application.                      |
| App name             | Your app's name, shown to users to identify your application.                      |
| Short description    | A short description of the app shown in the app gallery.                           |
| Long description     | An extended description of the functionality of the app shown in the app settings. |
| Company name         | Your company name.                                                                 |
| Company URL          | URL of the page where users can learn more about your company.                     |
| App landing page URL | URL of the page where users can learn more about this app and install it.          |
| Support URL          | URL of the page where users can read documentation or get support.                 |
| Privacy policy URL   | URL of the page where users can read your app's privacy policy.                    |

### Configure Capabilities

The next set of configurations you make will differ depending on what functionality and user experience you're looking to build. Each of the capabilities below are configured separately in the **App Components** tab in the [developer console](https://app.asana.com/0/developer-console):

<img src="../images/app-components-configs.png" alt="App Components configuration"/>

Follow the links in the table below to view the configurations required to build each capability (e.g., [Widget](/docs/widget)).

| Capability                        | Description                                                                                                                                             |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Widget](/docs/widget)            | Display a dynamic, custom widget card in tasks that shows data from an attached resource.                                                               |
| [Modal Form](/docs/modal-form)    | Build a custom form to allow users to create new resources. This form gets shown in a modal when a user clicks the entry point on a task.               |
| [Lookup](/docs/lookup)            | Show a text input to allow users to find and attach resources to tasks. Users can paste a URL, ID, or pick from an optional typeahead.                  |
| [Rule Actions](/docs/rule-action) | Build one or more custom action for Asana’s Rules engine to help users automate their work. Users can create rules that run your action when triggered. |
| [Entry Point](/docs/entry-point)  | Configure the button in tasks that initiates the Lookup and Modal Form. To configure this, one or both of these capabilities must be configured first.  |

### Configure the Installation Flow

When a user connects an app with App Components to Asana for the first time, they will go through an [installation flow](/docs/installation-flow). There are a number of configurations that can be made here, including:

| Property           | Description                                                                                                                                                                                                         |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Headline           | Text that appears as a title on the overview of features (i.e., "value props").                                                                                                                                     |
| Subhead            | Text that appears as a subtitle on the overview of features.                                                                                                                                                        |
| Feature image      | The image representing a feature. For the best user experience, we recommend providing three `Feature image`s.                                                                                                      |
| Caption text       | Text below the image of a feature.                                                                                                                                                                                  |
| Image alt text     | Alt text for image of feature.                                                                                                                                                                                      |
| Authentication URL | A URL which informs Asana where to make requests for authenticating and authorizing users. This is called during installation or when the app returns a response indicating the user must authenticate to continue. |

To make these configurations, navigate to the **Install your app** tab and provide your configurations:

<img src="../images/install-your-app.png" alt="Install your app configs"/>

For an in-depth overview of the installation flow (including its customizations), see the [Installing Flow](/docs/installation-flow).

<hr>

## Next Steps

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

At this point, your app has been created and fully configured. For further configurations (e.g., updating a URL, replacing button text, etc.), you can head back into the [developer console](https://app.asana.com/0/developer-console) to make any necessary changes. 

Next, you can explore how to build the UI of your application via the [UI Builder](/docs/ui-builder), which will help you finish building your [App Server](/docs/building-the-app-server). By leveraging the URLs configured earlier in the sections above, your App Server is what enables your end users to interact with resources external to Asana (i.e., via requests to endpoints exposed on the App Server). 

When both your app and your App Server are complete, you can move forward with getting your app [ready for publishing](/docs/publishing-an-app).

<hr class="full-line">

# UI Builder

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

By building with App Components, applications can display customized widgets, forms, and rules within Asana's user interface. The [UI Builder](https://app.asana.com/0/my-apps/response-builder) is a place for developers to build the user interface of these capabilities in a dynamic, interactive test environment.

Use the UI Builder to see how your:

* [Modal Form](/docs/modal-forms) renders as a result of [getting form metadata](/docs/get-form-metadata)
* [Lookup](/docs/lookup) renders with different items and configurations
* [Widget](/docs/widget) renders as a result of [getting widget metadata](/docs/get-widget-metadata)
* [Rule Action](/docs/rule-action) renders as a result of [getting action metadata](/docs/get-action-metadata)

_Note: The UI Builder is a front end tool that allows you to test building your App Component application's user interface. The UI Builder itself is not capable of making HTTP requests, and as such, certain features cannot be displayed dynamically (e.g., watched fields, Typeahead, etc.)._

<img src="../images/ui-builder.png" alt="UI Builder"/>

<hr>

## Preset Configurations

The [UI Builder](https://app.asana.com/0/my-apps/response-builder) allows you to view preset UI configurations for the capabilities of App Components:

<img src="../images/ui-builder-capability-selection.gif" alt="UI Builder capability selection"/>

Likewise, _within_ each selected capability, you are able to select and view **Minimalist**,  **Normal**, and **Everything** levels of preset configuration (i.e., with **Everything** being the highest level of configuration):

<img src="../images/ui-builder-preset-configurations.gif" alt="UI Builder preset configurations"/>

<hr>

## Custom Configurations

Beyond the preset "template" configurations, you are also able to interact with the [UI Builder](https://app.asana.com/0/my-apps/response-builder)'s code editor directly. The result of the properties and values that you input in the editor will be dynamically rendered in the left panel:

<img src="../images/ui-builder-custom-configurations.gif" alt="UI Builder custom configurations"/>

<hr>

## Copying Configurations

As you use the [UI Builder](https://app.asana.com/0/my-apps/response-builder) to test and build your server responses (e.g., [getting form metadata](/docs/get-form-metadata)), use the **Copy to clipboard** button to quickly copy the resulting metadata. You may choose to paste this metadata directly into your App Server code.

<img src="../images/ui-builder-copy-button.gif" alt="UI Builder copy button"/>

To get started with the UI Builder, visit **App Components** in the sidebar of your app in the [developer console](https://app.asana.com/0/developer-console), then select **View UI builder**. Alternatively, you may access the [UI Builder](https://app.asana.com/0/my-apps/response-builder) directly.

<hr class="full-line">

# Building the App Server

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

Because apps built with App Components allow end users to interact with resources external to Asana, an [App Server](/docs/app-server) is required in order for your app to function. Asana will make requests directly to endpoints exposed on the App Server, which controls, for example, what the user sees in a [Widget](/docs/widget) or [what happens](/docs/rule-action) when the user takes certain actions.

To see an example server written in Express.js, check out the [app-components-example-app](https://github.com/Asana/app-components-example-app) on GitHub. This server is also used in the [Example App](/docs/example-apps).

As a final note, we recommend [creating and configuring your app](/docs/getting-started) before moving forward with building the App Server. You may also leverage the [UI Builder](/docs/ui-builder) to test and render the user interface of your application.

After you have completed building both the app and App Server, you will be ready to begin the [publishing process](/docs/publishing-an-app).

<hr>

## Authorization

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

```html
<!-- Example: An app might return this HTML in response to the 
Authentication URL request after the Oauth flow is completed:
 -->

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>You have successfully connected Asana to the app</title>
  </head>
  <body>
    Success!
    <script>
      window.opener.postMessage("success", "https://app.asana.com");
      window.close();
    </script>
  </body>
</html>
```

### Overview

The Asana platform needs confirmation from the App Components app that authentication has completed successfully.
When an app is added to a project, the user adding that app is sent to its `Authentication URL`
(see the [Installation Flow](/docs/installation-flow)). The app may perform OAuth with Asana, OAuth with a
different app, perform both, or perform none. For apps intended for multi-user usage, OAuth with Asana is
_required_ to securely determine the identity of the user performing the authorization. Otherwise, as long as
the app confirms the flow was complete, Asana will successfully add the app to the project. This will allow
requests to be sent to the app's predefined endpoints.

### How it works

Under the hood, we carry this out by listening for a message from the authentication popup window containing the string "success".
When we make a request to the app's `Authentication URL`, the browser opens a popup or "child" window and waits for it to respond
with "success"  using [window.postMessage](https://developer.mozilla.org/en-US/docs/Web/API/Window/postMessage). The target window
for this `postMessage` call should be the opener, accessible via
[window.opener](https://developer.mozilla.org/en-US/docs/Web/API/Window/opener).

Note that for security purposes, the _origin_ of the event (which is added to the event by the browser) needs to match the root of the 
`Authentication URL` registered to the app. That is, the authentication success message must be initiated from the same origin that receives the 
authentication request. This is different from the `targetOrigin` of the `window.opener.postMessage` call, which must be exactly 
`"https://app.asana.com"`.

### Additional notes

If the app wants additional data from Asana or wants to make changes within Asana, they should have the user complete 
an [OAuth flow](/docs/oauth) against Asana. 

Keep in mind that this authorization provides the App Server with a single user's auth token. Multiple users of Asana will view
external resources attached by a user who has authenticated and send requests to the App Server, but the server will likely only
have the token for one user. You may want to suggest users to authenticate with a bot account.

<hr>

## Security

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

When handling requests from Asana, an App Components app should:
 
 - Add [cross-origin resource sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) headers to responses. In order to update the Asana user interface (e.g., populating a Widget with external data), requests are made from the client to your app server. As such, enabling and configuring CORS is required. Feel free to use your browser's developer tools to debug during development.
 - Reject requests with missing or incorrect signatures. See [Message Integrity](/docs/message-integrity) for more details.
 - Reject requests with an `expires_at` time in the past.
    - **Note**: Make sure to use the correct units for this. `expires_at` is in milliseconds. If you compare the expiration time to a timestamp in seconds, it will always look like the request expires thousands of years in the future.

If an app uses [OAuth for authentication](/docs/oauth), the app should:
 
 - **Prevent OAuth CSRF attacks**. A one-time CSRF token in the `state` parameter is _required_ in order to implement a secure OAuth flow. Omitting the `state` parameter is a security risk. If the `state` parameter is _not_ used, or _not_ tied to the user's session, then attackers can initiate an OAuth flow themselves before tricking a user's browser into completing it. For more information about the `state` parameter, see [OAuth](/docs/oauth).

If an app doesn't use OAuth for authentication, the Asana Security Team should manually review the authentication scheme the app uses. In particular, we will try to verify that:

 - An attacker can't authenticate themselves as someone else
 - An attacker can't force a victim to authenticate as another user (e.g., with a CSRF attack)

<hr>

## Message Integrity

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

The burden of verifying the request is on the app. Without this check, attackers can send requests to the App Server pretending to be Asana.

Message integrity is provided by a SHA-256 HMAC signature on the contents of the request. For `GET` requests, the "message" used
to generate the signature is the query string of the request with escaped characters, omitting the leading "?" of the query string.
For `POST` requests, the "message" is the JSON blob in the `data` field of the request body. For both types of requests, the secret
used to compute the signature is your app's Client Secret which can be found in the **OAuth** tab for the app in the
[developer console](https://app.asana.com/0/developer-console). 

Note that the signature is transmitted via a header in the request body, particularly the value of `x-asana-request-signature`. The
app server calculates the same signature and compares that to the value in the header. **The app server should reject the request if the two do not match**.
The signature must be on the exact parameter string that will be passed to the app, since the signature will change if something as
trivial as spacing changes.

To see an example of how the signature is computed, you can view an open source example app server in the
[app-components-example-app](https://github.com/Asana/app-components-example-app) repository.

<hr>

## Timeliness

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

Timeliness is provided by the addition of an expiration parameter: `expires_at`. If this parameter were not added, then a recorded request (e.g., a log), could be reused to continue requesting information from the app at a later time.

The burden of verifying the request has not expired is on the app. Without this check, the App Server is vulnerable to 
replay attacks.

<hr>

## Hosting

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

Apps built with App Components allow end users to interact with resources external to Asana. As such an [App Server](/docs/app-server) is required in order for your app to function.

The following list includes providers and services commonly used for hosting an app server:

* [Amazon Web Services (AWS)](https://aws.amazon.com/)
* [Google Cloud](https://cloud.google.com/)
* [Heroku](https://www.heroku.com/platform)
* [Microsoft Azure](https://azure.microsoft.com/)
* [IBM Cloud](https://www.ibm.com/cloud/)

During development, you may choose to use [ngrok](https://ngrok.com/), which creates a public URL that "tunnels" into localhost. We do not advise the use of ngrok beyond testing and debugging purposes.

<hr>

## Final Steps

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

As you finish building the App Server, you may find it necessary to [update certain configurations](/docs/configure-the-app) such as URLs, image links, etc. These configurations can be updated at any time in the [developer console](https://app.asana.com/0/developer-console).

After you have finished building both your app and App Server, you are now ready to begin the [publishing process](/docs/publishing-an-app)! 

<hr class="full-line">

# Publishing an App

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

After [creating and configuring your app](/docs/getting-started) to function alongside your [App Server](/docs/building-the-app-server), you may begin the app review process.

Apps built on App Components are manually reviewed before they are accessible within Asana. To ensure a smooth review process and user experience, here are some guidelines you can follow before [submitting the app for review](/docs/submit-your-app).

<hr>

## Publishing Checklist

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

When [configuring your app](/docs/configure-the-app), you should:

* Add necessary images (e.g., feature images, icon, logo, etc.)
* Add links to supporting information and/or documentation (e.g., app landing page URL, support URL, etc.)
* Proofread marketing-related text (e.g., description, extended description, features)
* Make sure button text has 3-4 words or fewer and start with a verb
* Use consistent language for similar concepts where applicable
* Use sentence case by default and capitalize proper nouns

When testing your application, you should:

* Try to "break" your forms (e.g., test watched fields, limit invalid submissions, test typeahead fetches, etc.)
* Test and proof-read any custom error messages
* Test the auth flow from both the web browser and [desktop app](https://asana.com/download)
  * You can enter the installation flow manually by navigating to `https://app.asana.com/-/install_platform_ui_app?app_id=<app_client_id>`
* Test [Rule Actions](/docs/rule-actions) with a variety of trigger combinations

For additional details, an interactive checklist can be found on the **Submit for review** page when managing your app
through the [developer console](https://app.asana.com/0/my-apps).

<hr>

## Installation Flow

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

When the end user connects an app with App Components to Asana for the first time, they will go through an installation flow. This involves authorizing the app, and adding it to projects in Asana.

The installation flow can be configured in the [developer console](https://app.asana.com/0/developer-console). Note that a list of all possible configurations can also be found in [Configure the App](/docs/configure-the-app) in the [Getting Started](/docs/getting-started) guide.

For the end user, the installation flow can be triggered through either one of two ways:

1. The in-product app gallery. Users can access the app gallery by going into a project (in which they want to install an app), then navigating to **Customize** > **+ Add App**.
<br>
<br>
<img src="../images/app-gallery.png" alt="app gallery"/>
<br>
<br>
2. The [Asana app directory](https://asana.com/apps):
<br>
<br>
<img src="../images/app-directory.png" alt="app directory"/>

Note that subsequent interactions with the same application by the same user will _not_ trigger the following installation flow. To force the installation flow in its entirety again (e.g., for QA purposes), you can visit `https://app.asana.com/-/install_platform_ui_app?app_id=<app_client_id>`, replacing the value of the `app_id` query parameter with the application's Client ID (accessible via the [developer console](https://app.asana.com/0/developer-console)).

<hr>

### Features

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

After entering the installation flow, the first screen that users see are the app's features, or value props. 

<img src="../images/features.png" alt="features"/>

As part of the customizations, a `Headline` and `Subhead` can be shown at the top of the screen. Additionally, up to three `Feature image`s can be displayed on the screen, each containing the image itself, accompanying `Caption text` to display under each image, as well as `Image alt text` text. We recommend configuring all three `Feature images` for the best user experience.

<hr>

### Authenticating

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

On the next screen, the user will be directed to the auth screen, which will ask them to connect to the external app.

<img src="../images/authentication.png" alt="authentication"/>

When the user clicks the button to continue, Asana will make a request to the application's specified `Authentication URL` in a pop-up window. From here, it is developer's discretion as to how the user proceeds with authentication. In most cases, this authentication step usually involves completing the [Asana OAuth](/docs/oauth) flow, as well as the third-party (i.e., external) OAuth flow.

<img src="../images/authenticate-asana.png" alt="authentication with Asana"/>

<img src="../images/authenticate-external.png" alt="authentication with external app"/>

Additionally, you may choose to present custom screens, forms, or otherwise logic to prompt the user for additional information needed to set up the application.

The authentication flow is concluded when the app confirms that authentication is complete with a "success" message using [window.postMessage](https://developer.mozilla.org/en-US/docs/Web/API/Window/postMessage). For more information, feel free to review [Authorization](/docs/authorization) requirements when publishing an app.

<hr>

### Adding to a Project

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

Once the user has successully granted permissions, they'll be taken to different screens depending on how they entered the installation flow:

1. If the user began the installation flow from outside of a project (e.g., through the [Asana app directory](https://asana.com/apps)), the user will be shown an additional screen that prompts them to add the app to any necessary projects. This screen will not be shown otherwise.
<br>
<br>
<img src="../images/add-app-to-projects.png" alt="add app to projects"/>
<br>
<br>
From here, the user may choose to add the app to one or more projects, or even skip adding the app for the time being. Once the user has made their choice, the final screen will confirm the user's choices, and the installation flow will be completed.
<br>
<br>
2. If the user began the installation flow from within a project, the user will see a confirmation of the app they've added, and the installation flow will be completed.
<br>
<br>
<img src="../images/installation-flow-finish.png" alt="installation flow finish"/>
<br>

<hr>

## App Submission

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

After you have completed development of your app (and you have addressed the guidelines above), you can [begin the process](/docs/submit-your-app) to have your app published on Asana.

<hr class="full-line">

# Troubleshooting

## Common Issues
### App Component shows "Something went wrong. Try again later."

This typically happens when we receive a response from the app server that we do not understand. To ensure that Asana is able to read the response from the app server, check that the app server is returning the required properties listed in the corresponding schema of the endpoint being called (see [App Component Schemas](/docs/app-component-schemas)). Additionally, for certain properties like `color` and `width`, check that the value the app server is returning is a valid option under the *Enumerated Values* dropdown of an App Component schema.

Another reason that you may be seeing this message is when your app server is not using CORS. In order to update the Asana user interface (e.g., populating a Widget with external data), requests are made from the client to your app server. As such, enabling and configuring CORS is required. See [Security](https://developers.asana.com/docs/authorization) for more information.

### App server endpoints are not being triggered

Check that the endpoint paths saved for your app in the [developer console](https://app.asana.com/0/developer-console) match the endpoint paths that you created for your app server. For example, your app server's endpoint to [GET Form Metadata](/docs/get-form-metadata) might be `https://app.example.com/form/metadata`, while in your app's settings it is saved as `https://app.example.com/metadata`. Since these paths are non-matching, when Asana makes a request to [GET Form Metadata](/docs/get-form-metadata), it will be making requests to `https://app.example.com/metadata` instead of `https://app.example.com/form/metadata`.

Additionally, some app server responses may contain an `on_change_callback` and an `on_submit_callback` property. Check that the endpoints provided for these values are what you expected.

### Unable to trigger installation process again

In the event that you would like to test your app's installation flow again, you can visit `https://app.asana.com/-/install_platform_ui_app?app_id=<app_client_id>`. You can find your `app_client_id` in the URL of your app in the [developer console](https://app.asana.com/0/developer-console).

### App Component - Rule Action: App server is not receiving a response back from Asana

The app server for Rule Action must be hosted in order for Rule Actions to function. For a brief list of popular hosting options, see [Hosting](/docs/hosting).

### App does not appear in the app gallery of my organization

Ensure that your app is added to your organization. This can be done in your app's setting in the [developer console](https://app.asana.com/0/developer-console) under **Install your app** > **Add an organization**.

<br>
<br>
For any questions on App Components, as well as an opportunity to engage with other developers in the community, feel free to visit our [App Components forum](https://forum.asana.com/c/api/app-components-beta/150)

<hr class="full-line">

# Additional Resources

## Configurations

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

The following tables represent a master list of all the configurations you can make to define your App Components app. Further context for these configurations can be found in the [Configure the App](/docs/configure-the-app) section of the [Getting Started](/docs/getting-started) guide. Feel free to also review the [Toolkit](/docs/toolkit) for a visual documentation of these configurations. To make these configurations, visit the [developer console](https://app.asana.com/0/developer-console).

_Note: You must first create an app in order to be able to configure it. To begin, see the [Getting Started](/docs/getting-started) guide._

### Configurations for Basic Information

| Property             | Description                                                                        |
|----------------------|------------------------------------------------------------------------------------|
| App icon             | Your app's icon, shown to users to identify your application.                      |
| App name             | Your app's name, shown to users to identify your application.                      |
| Short description    | A short description of the app shown in the app gallery.                           |
| Long description     | An extended description of the functionality of the app shown in the app settings. |
| Company name         | Your company name.                                                                 |
| Company URL          | URL of the page where users can learn more about your company.                     |
| App landing page URL | URL of the page where users can learn more about this app and install it.          |
| Support URL          | URL of the page where users can read documentation or get support.                 |
| Privacy policy URL   | URL of the page where users can read your app's privacy policy.                    |

### Configurations for [Widget](/docs/widget)

| Property            | Description                                                                                                                                 |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| Widget metadata URL | A URL that Asana uses to make requests for the data needed to load a Widget, which displays information about a third party resource.       |
| Match URL pattern   | A regex which allows Asana to compute whether a URL attachment is supported by an activated app on the project in order to render a Widget. |

### Configurations for [Modal Form](/docs/modal-form)

| Property              | Description                                                                                          |
|-----------------------|------------------------------------------------------------------------------------------------------|
| Form metadata URL     | A URL that Asana uses to request data from the app about fields it should display in the Modal Form. |

### Configurations for [Lookup](/docs/lookup)

| Property               | Description                                                                                                                 |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Resource attach URL    | A URL that Asana will make a request to when a user submits a value to attach (i.e., when clicking "Add").                  |
| Placeholder text       | _Optional_. Placeholder action text that appears in the Lookup input field after the user clicks on the Lookup action text. |
| Resource typeahead URL | A URL that Asana will make a request to when a user types into a Lookup field.                                              |

### Configurations for [Rule Action](/docs/rule-action)

| Property          | Description                                                                                  |
|-------------------|----------------------------------------------------------------------------------------------|
| Display name      | The Rule Action name visible to end users in the rule builder (e.g., "Create a Jira issue"). |
| Run action URL    | A URL that Asana will make a request to when the rule is triggered.                          |
| Form metadata URL | A URL that Asana will make a request to to display the configuration form.                   |

### Configurations for [Entry Point](/docs/entry-point)

| Property               | Description                                                       |
|------------------------|-------------------------------------------------------------------|
| Lookup action text     | Clickable action text that allows users to initiate a Lookup.     |
| Modal Form action text | Clickable action text that allows users to initiate a Modal Form. |

### Configurations for the [Installation Flow](/docs/installation-flow)

| Property           | Description                                                                                                                                                                                                         |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Headline           | Text that appears as a title on the overview of features (i.e., "value props").                                                                                                                                     |
| Subhead            | Text that appears as a subtitle on the overview of features.                                                                                                                                                        |
| Feature image      | The image representing a feature. For the best user experience, we recommend providing three `Feature image`s.                                                                                                      |
| Caption text       | Text below the image of a feature.                                                                                                                                                                                  |
| Image alt text     | Alt text for image of feature.                                                                                                                                                                                      |
| Authentication URL | A URL which informs Asana where to make requests for authenticating and authorizing users. This is called during installation or when the app returns a response indicating the user must authenticate to continue. |

<hr>

## Example Apps

### Modal Form & Widget

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

The example app offers a quick way for developers to explore the capabilities and features of App Components. By following the steps below, you'll gain an understanding of how to install App Component apps to your developer sandbox, as well as how an example app communicates with endpoints exposed on a pre-built local server. 

Note that for the App Components apps [that you create](/docs/configurations), you'll be able to configure your own images, descriptions, URLs, and other content. Many of the values for these fields are marked by **{curly braces}** in the example app.

Before you begin, be sure you already have a [developer sandbox]((/docs/developer-sandbox)), as this will give you access the "External Example App" in the app gallery. To start using the example app:

1. Clone [this repository](https://github.com/Asana/app-components-example-app) containing an example Express server.
2. Follow the instructions in the [README](https://github.com/Asana/app-components-example-app/blob/main/README.md) to run the server. This server needs to remain on as you use the example app.
3. Open the developer sandbox in your browser.
4. In an existing project, go to **Customize** > **Add App** > **External Example App** to install the App Components example app. 
    - **Important**: The installation flow this takes you through is only shown once per user. To see it a second time, navigate to 
      `https://app.asana.com/-/install_platform_ui_app?app_id=<app_client_id>`, replacing the value of the `app_id` query parameter with the application's Client ID (accessible via the [developer console](https://app.asana.com/0/developer-console)).
<br>
<br>
<img src="../images/example-app-gallery-tile.png" />
<br>
<br>
5. Once the example app is installed, create a task in your project. In the task's **{Example}** custom field, go to **{Add Example Resource}** > **{Open form}** to see examples of customizable inputs. Click **Submit**.
<br>
<br>
<img src="../images/example-modal-form.gif" />
<br>
<br>
6. View the newly-generated Widget on your task. You can begin editing [index.js](https://github.com/Asana/app-components-example-app/blob/main/index.js) to modify the contents of the widget. Note that you'll need to restart the local server and reload the page to see your changes.
<br>
<br>
<img src="../images/example-widget.png" />
<br>
<br>
That's it! At this point, feel free to keep exploring how changes in the server affects data in the task's Widget. Once you're ready to define an app, [click here to create your own app](/docs/configurations) with App Components.

<hr>

### Example Rule Actions

<span class="beta-indicator">BETA</span> - For access, please see the [overview of app components](/docs/overview-of-app-components)

To explore the capabilities of Rule Actions, see our [app-components-rule-action-example-app](https://github.com/Asana/app-components-rule-action-example-app) on GitHub. Follow the instructions outlined in the repository's `README.md` to get started.

<hr>

## Toolkit

<span class="beta-indicator">BETA</span>

Our [App Components Toolkit](https://www.figma.com/file/my7DKSUnuVjEiNSnJuMFcI/branch/HiCYzuMtAkhdXQy1srf2Ug/App-Components-Toolkit?node-id=94%3A15940) provides
a visual documentation of App Components. You'll see at-a-glance how the different features and capabilities surface within
Asana, including how they fit together and what you can do with them. Feel free to use the toolkit to supplement the process
of designing and building your apps with App Components.

<img src="../images/ac-toolkit-screenshot.png" />

<hr>

## Forum

<span class="beta-indicator">BETA</span>

For the latest news on App Components, as well as opportunity to engage with other developers in the community,
feel free to visit our [App Components forum](https://forum.asana.com/c/api/app-components-beta/150).

</section>
