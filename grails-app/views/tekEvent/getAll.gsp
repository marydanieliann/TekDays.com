<!DOCTYPE html>
<html>
<head>
    <title>TekEvents</title>
    <style>
    body {
        font-family: Monospace;
    }
    </style>
</head>
<body>
<h1>TekEvents</h1>
<ul>
    <g:each in="${tekEvents}" var="event">
        <li>
            <h3>${event.name}</h3>
            <h3>${event.city}</h3>
        </li>
    </g:each>
</ul>
</body>
</html>
