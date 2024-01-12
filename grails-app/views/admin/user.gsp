<%--
  Created by IntelliJ IDEA.
  User: sofs4
  Date: 1/12/24
  Time: 4:51 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>TekDays - User page!</title>
</head>

<body>
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="page-body" role="main">
    <g:message code="my.message" args="${session?.user?.fullName}" default="Admin"/>
    <div>We are sorry, but you dont have permission to the admin page</div>
</div>
</body>
</html>