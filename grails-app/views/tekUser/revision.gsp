<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'tekUser.label', default: 'TekUser')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

</head>
<body>
<a href="#list-tekUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>
<table>
    <thead>
    <tr>
        <th>Full Name</th>
        <th>Website</th>
        <th>Email</th>
        <th>Bio</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${tekUser}" var="revision" status="i">
        <tr>
            <td>${revision.fullName}</td>
            <td>${revision.website}</td>
            <td>${revision.email}</td>
            <td>${revision.bio}</td>
        </tr>
    </g:each>
    </tbody>




</table>

</body>
</html>


