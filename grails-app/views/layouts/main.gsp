<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file:
            'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file:
            'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114"
          href="${resource(dir: 'images',
                  file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"
          type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}"
          type="text/css">
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>
<div id="logo" role="banner"><a href="${createLink(uri: '/')}">
    <img src="${resource(dir: 'images', file: 'images.png')}"
         alt="TekDays" style="width:1640px; height: 460px; "/></a>
    <g:loginToggle/>
</div>
<g:layoutBody/>
<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/></div>
<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>
%{--
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        overflow: hidden;
    }

    body {
        display: flex;
        flex-direction: column;
    }

    #logo {
        width: 100%;
        flex-shrink: 0;
        text-align: center; /* Center the logo */
        margin-top: 20px; /* Add space between logo and content */
    }

    #logo img {
        width: 1082px;
        height: 657px;
        background-size: cover;
        /*  max-width: 100%; /* Ensure the image doesn't exceed its container */
        height: auto;
    }

    .footer {
        /* Add your styles for the footer as needed */
    }

    #spinner {
        /* Add your styles for the spinner as needed */
    }

    .content {
        flex-grow: 1;
        width: 100%;
        box-sizing: border-box;
        padding: 20px; /* Adjust the padding as needed */
    }
    </style>
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>
<div id="logo" role="banner">
    <a href="${createLink(uri: '/')}">
        <img src="${resource(dir: 'images', file: 'images.png')}" alt="TekDays"/>
    </a>
    <g:loginToggle/>
</div>

<div class="content">
    <g:layoutBody/>
</div>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>
<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>--}%
