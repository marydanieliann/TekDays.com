<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>TekDays - The Community is the Conference!</title>
    %{--<style>
    .custom-link {
        text-align: right;
        display: block;
    }
    </style>--}%
</head>

<body>
<div id="welcome" style='margin-left:25px; margin-top:25px; width:85%'>
    <br/>

    <h3>${message(code: "welcome", default: "Welcome to")} TekDays.com</h3>

    <p>TekDays.com is a site dedicated to assisting individuals and
    communities to organize technology conferences. To bring great
    minds with common interests and passions together for the good
    of greater geekdom!</p>
</div>
<g:organizerEvents/>
<br>

<g:volunteerEvents/>
<br>
<div class="homeCell" style='margin-left:25px; margin-top:25px; width:85%'>
    <h3>${message(code: "findAnEvent", default: "Find an Event")}</h3>
    <p>See if there's a technical event in the works that strikes your
    fancy. If there is, you can volunteer to help or just let the
    organizers know that you'd be interested in attending.
    Everybody has a role to play.</p>
    <br>

    <span class="buttons" style="margin-left: auto; margin-right: auto;">
        <g:link controller="tekEvent" action="index">Find a Tek Event</g:link>
    </span>
</div>
<br>
<div class="homeCell" style='margin-left:25px; margin-top:25px; width:85%'>
    <h3>${message(code: "organizeEvent", default: "Organize an Event")}</h3>

    <p>If you don't see anything that suits your interest and location,
    then why not get the ball rolling. It's easy to get started and
    there may be others out there ready to get behind you to make it
    happen.</p>
    <br>

    <span class="buttons" style="margin-left: auto; margin-right: auto;">
        <g:link controller="tekEvent" action="create">Organize a Tek Event</g:link>
    </span>
</div>
<br>
<div class="homeCell" style='margin-left:25px; margin-top:25px; width:85%'>
    <h3>${message(code: "sponsorEvent", default: "Sponsor a Tek Event")}</h3>

    <p>If you are part of a business or organization that is involved in
    technology then sponsoring a tek event would be a great way to
    let the community know that you're there and you're involved.</p>
    <br>

    <span class="buttons" style="margin-left: auto; margin-right: auto;">
        <g:link controller="sponsor" action="create">Sponsor a Tek Event</g:link>
    </span>
</div>
</body>