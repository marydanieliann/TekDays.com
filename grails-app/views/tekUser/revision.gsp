<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-result" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>
<table border="1">
    <thead>
    <tr>
        <th>Revision Type</th>
        <th>Current UserName</th>
        <th>Timestamp</th>
        <th>Bio</th>
        <th>Email</th>
        <th>Full Name</th>
        <th>Password</th>
        <th>User Name</th>
        <th>Website</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${result}" var="row">
        <tr>
            <g:if test="${row.revtype == 0}">
                <td>Created</td>
            </g:if>
            <g:if test="${row.revtype == 1}">
                <td>Edited</td>
            </g:if>
            <g:if test="${row.revtype == 2}">
                <td>Deleted</td>
            </g:if>
            <g:if test="${!(row.revtype in [0, 1, 2])}">
                <td>N/A</td>
            </g:if>
            <td>${row.id ?: 'N/A'}</td>
            <td>${row.timestamp ?: 'N/A'}</td>
            <td>${row.bio ?: 'N/A'}</td>
            <td>${row.email ?: 'N/A'}</td>
            <td>${row.full_name ?: 'N/A'}</td>
            <td>${row.password ?: 'N/A'}</td>
            <td>${row.user_name ?: 'N/A'}</td>
            <td>${row.website ?: 'N/A'}</td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>



%{--<label for="propertySelector">Check which property was changed:</label>
<select id="propertySelector" multiple>
<g:each in="${result ? result.properties : []}" var="property">
<option value="${property.key}">${property.key}</option>
</g:each>
</select>
     <button onclick="showSelectedProperties()">Choose properties</button>
     <table>
     <thead>
     <tr>
     <g:each in="${result ? result.properties : []}" var="property">
     <th class="userProperty ${property.key}">${property.key}</th>
     </g:each>
     </tr>
     </thead>
     <tbody>
     <g:each in="${result}" var="revision" status="i">
     <tr class="userRow">
     <g:each in="${result ? result.properties : []}" var="property">
     <td class="userProperty ${property.key}">
     <g:if test="${revision[property.key] != null}">
     ${revision[property.key]}
     </g:if>
     <g:else>
     No audited information available
     </g:else>
     </td>
     </g:each>
     </tr>
     </g:each>
     </tbody>
     </table>--}%
