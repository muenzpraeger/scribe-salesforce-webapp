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
<body>
	Welcome to the Scribe Salesforce WebApp demo.
	<br />
	<br /> This demo application showcases how to use the Java based
	<a href="https://github.com/scribejava/scribejava" target="_blank">Scribe</a>
	library in conjunction with Salesforce (force.com) within a JSP based
	web application.
	<br>
	<br />The source code can be found on
	<a href="https://github.com/muenzpraeger/scribe-salesforce-webapp"
		target="_blank">GitHub</a>.
	<br />
	<br />
	<strong>Step 1 - Salesforce OAuth dance</strong>
	<br />Click the button to start the OAuth dance with Salesforce.
	You'll be redirected after the successful authentication to this page
	for step 2.
	<br />
	<form action="${pageContext.request.contextPath}/demo" method="post">
		<div class="slds-button-group" role="group">
			<button class="slds-button slds-button--neutral" type="submit"
				name="action" value="oauth">Start OAuth dance</button>
		</div>
	</form>

	<c:if test="${!empty accessToken}">
		<br />Hooooray - You have been successfully authenticated! Your OAuth
	accessToken is ${accessToken}. Now proceed to step 3.
	<br />
		<br />
		<strong>Step 2 - Read Salesforce data</strong>
		<form action="${pageContext.request.contextPath}/demo" method="post">
			<div class="slds-button-group" role="group">
				<button class="slds-button slds-button--neutral" type="submit"
					name="action" value="userdata">Fetch user data</button>
				<button class="slds-button slds-button--neutral" type="submit"
					name="action" value="accountdata">Fetch Accounts data</button>
			</div>
		</form>
	</c:if>
	<br />
	<br />${jsonResponse}
</body>
</html>