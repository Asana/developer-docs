<hr class="full-line">

# Managing your app

### Duplicating an app

You can quickly create a brand new app with the same configurations of an existing one by selecting **Duplicate app**
in the [developer console](https://app.asana.com/0/my-apps).

<img src="../images/duplicate-app.png" alt="duplicate app" />

This feature can help streamline the creation and management of different versions (e.g., staging, beta, production, etc.)
of your application. As a result of this operation, the newly-generated app will retain the configurations of the original app,
including:

* Basic information (e.g., app name, descriptions, authentication URL, etc.)
* Configurations of app components

Because the newly-generated app is its own unique app, the following _will not_ be carried over from the original app:

* App credentials (i.e., a new client ID and client secret will be generated)
* Users who have completed OAuth
* Organizations in which the app is available
* Published listings in the [app directory](https://asana.com/apps) or [app gallery](/docs/installation-flow)

<hr>

### Editing a published app

Developers have the ability to submit edits to a published app.

To begin the process, first [duplicate your app](/docs/duplicating-an-app):

<img src="../images/duplicate-app-modal.png" alt="duplicate app modal" />

After duplicating the original app, provide any edits to any configurations as needed. 

When you are ready to [submit your app for review](/docs/submit-your-app), navigate to **Submit for review** in the
sidebar when managing your app. On the app submission page, select **I'm submitting changes to a published app** in
the **Submission type** dropdown:

<img src="../images/edit-published-app.png" alt="editing a published app" />

Upon submission, your app will follow the standard review process. If the edits are accepted,
_the original (i.e., previous) app will reflect the new updates_, while the duplicate app can be used again for testing.

### Transfering app ownership

Domain administrators can request for Asana to transfer an OAuth application to another user in the domain. To begin the process, please [complete and submit this form](https://form-beta.asana.com/?k=sVVLasdoqvV2oYfllIhI0Q&d=15793206719).

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>