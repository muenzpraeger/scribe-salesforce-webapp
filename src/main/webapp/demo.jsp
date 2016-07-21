<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/slds/assets/styles/salesforce-lightning-design-system.css">
<title>Scribe Salesforce WebApp</title>
</head>
<body style="padding: 8px">
	<div class="slds-page-header" role="banner">
		<div class="slds-media slds-media--center">
			<div class="slds-media__figure">
				<img src="/resources/logo_salesforce.png" />
			</div>
			<div class="slds-media__body">
				<p class="slds-page-header__title slds-truncate slds-align-middle"
					title="Rohde Corp - 80,000 Widgets">Welcome to the Scribe
					Salesforce WebApp demo!</p>
			</div>
		</div>
	</div>
	<div style="padding-left: 20px">
		<br /> <br /> This demo application showcases how to use the Java
		based <a href="https://github.com/scribejava/scribejava"
			target="_blank">Scribe</a> library in conjunction with Salesforce
		(force.com) within a JSP based web application. <br> <br />The
		source code is available on <a
			href="https://github.com/muenzpraeger/scribe-salesforce-webapp"
			target="_blank">GitHub</a>. <br /> <br /> <strong>Step 1 -
			Salesforce OAuth dance</strong> <br />Click the button to start the OAuth
		dance with Salesforce. You'll be redirected after the successful
		authentication to this page for step 2. <br />
		<form action="${pageContext.request.contextPath}/demo" method="post">
			<div class="slds-button-group" role="group">
				<button class="slds-button slds-button--neutral" type="submit"
					name="action" value="oauth">Start OAuth dance</button>
			</div>
		</form>
		<br />You'll see in the next line your accessToken after the successful authentication<br />${accessToken}.<br /> <br />
		<strong>Step 2 - Read Salesforce data</strong>
		<br >In this step - after the authentication - you can either fetch your current userInfo or the first 10 Account objects of your Salesforce edition.
		<form action="${pageContext.request.contextPath}/demo" method="post">
			<div class="slds-button-group" role="group">
				<button class="slds-button slds-button--neutral" type="submit"
					name="action" value="userdata">Fetch user data</button>
				<button class="slds-button slds-button--neutral" type="submit"
					name="action" value="accountdata">Fetch Accounts data</button>
			</div>
		</form>
		<br /> <br />${jsonResponse}
	</div>
</body>
</html>