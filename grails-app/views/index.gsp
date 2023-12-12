<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>TekDays - The Community is the Conference!</title>
    <style>
    .custom-link {
        text-align: right;
        display: block;
    }
    </style>
</head>

<body>
<div id="welcome">
    <br/>

    <h3>Welcome to TekDays.com</h3>

    <p>TekDays.com is a site dedicated to assisting individuals and
    communities to organize technology conferences. To bring great
    minds with common interests and passions together for the good
    of greater geekdom!</p>

    <br/>
</div>

<div id="homeSearch">
    <g:form controller="tekEvent" action="search">
        <label>Search:</label>
        <input id="query" type="text" name="query"/>
        <input type=submit value="Go"/>
    </g:form>
</div>
<g:organizerEvents/>
<g:volunteerEvents/>
<div class="homeCell">

    <h3>Find a Tek Event</h3>

    <p>See if there's a technical event in the works that strikes your
    fancy. If there is, you can volunteer to help or just let the
    organizers know that you'd be interested in attending.
    Everybody has a role to play.</p>

    <br/>

    <g:link class="custom-link" controller="tekEvent" action="index">Find a Tek Event</g:link>
</div>


<div class="homeCell">

    <h3>Sponsor a Tek Event</h3>

    <p>If you are part of a business or organization that is involved in
    technology then sponsoring a tek event would be a great way to
    let the community know that you're there and you're involved.</p>

    <br/>

    <g:link class="custom-link" controller="sponsor" action="create">Sponsor a Tek Event</g:link>
</div>
</body>
</html>
