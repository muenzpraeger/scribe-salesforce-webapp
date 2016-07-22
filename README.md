# scribe-salesforce-webapp

This example application showcases how to use the popular [Scribe library](https://github.com/scribejava/scribejava) with Salesforce/force.com.

## Live application

You can find the application on https://scribe-salesforce-webapp.herokuapp.com. For using it you'll need an existing Salesforce account (i. e. a Developer Edition).

The application runs on Tomcat and consists out of standard Java web development components like JSP and Servlet.

# Run-On-Your-Own

## Prerequisites

For running the app on your own you'll need to fulfill the following requirements:
* Access to a Salesforce org, i. e. a Developer Edition (You can [signup here for free](https://developer.salesforce.com/signup) if you don't have one).
* A Connected App [set up](https://help.salesforce.com/apex/HTViewHelpDoc?id=connected_app_create.htm) in the Salesforce Org.

For local development I highly recommend to install the [Heroku Toolbelt](https://toolbelt.heroku.com/).

## Components

This example project is designed to leverage Heroku for deployment, but also offers options to run it independently.

* Gradle as build system
* Embedded Tomcat as webapp server
* Salesforce Lightning Design System ([SLDS](https://www.lightningdesignsystem.com/)) for CSS styling

## Automatic deployment to Heroku

The easiest way to test the application on your own is deploying it to [Heroku](https://www.heroku.com) via the Deploy button.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

After the deployment you've to enter in the Heroku UI your Connected App's clientId and clientSecret for the OAuth2 authentication process.

## Local deployment

Clone this repo.

```
git clone https://github.com/muenzpraeger/scribe-salesforce-webapp
```

Create in the root of the project a file _.env_ as described [here](https://devcenter.heroku.com/articles/heroku-local#set-up-your-local-environment-variables) for storing the Heroku environment variables.

Then add the following two key/value pairs to the _.env_ file and replace the placeholders with your Connected App OAuth values.

```
OAUTH_CONSUMER_KEY=your-key-from-salesforce
OAUTH_CONSUMER_SECRET=your-secret-from-salesforce
```

Create the needed WAR file then by executing Gradle. That'll download (if not already available) all needed dependencies and compile the project.

When you've installed Gradle already onto your system you can run the _stage_ command from the projects root folder.

```
gradle stage
```

If you don't have it installed you've to use the Gradle wrapper.

```
gradlew stage
```

After the compilation you'll find in the <project>/build/libs folder the WAR file.

Now start the app via the Heroku Toolbelt.

```
heroku local web
```

The WAR can be also used in any other Java Servlet container that supports the Servlet specification 3.+.

## Development

If you want to develop with this code you can do it i. e. with Eclipse.

Running `gradle eclipse` in the project root folder will create the needed files, so that you can import the project as Eclipse project.

## License

For licensing see the included [license file](https://github.com/muenzpraeger/scribe-salesforce-webapp/blob/master/LICENSE.md).
