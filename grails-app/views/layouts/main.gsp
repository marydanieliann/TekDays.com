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
        <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
        <asset:stylesheet src="application.css"/>
        <asset:javascript src="application.js"/>
        <g:layoutHead/>
        <r:layoutResources/>
    </head>
<body>

<div id="logo" role="banner">
    <a href="${createLink(uri: '/', params: [lang: session?.lang != null ? session?.lang : ''])}">
        <img src="${resource(dir: 'images', file: 'tek-dayslogo.png')}"
             alt="TekDays" style="width:auto; height: auto; margin-left: -20px"/>
    </a>
</div>
    <g:select name="lang" class="lang form-select w-25 h-100 m-2 " keys="['en', 'ru', 'arm']"
          from="['🇺🇲  English', '🇷🇺  Русский', '🇦🇲  Հայերեն']" style="float:right"/>
    <div class="container">
        <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
            <a href='${createLink(uri: "/?lang=${session?.lang != null ? session?.lang : ''}")}'
               class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
            </a>
            <br>
         %{--   <ul class="nav nav-pills" style="float: right">
                <li class="nav-item">
                    <g:loginToggle class="nav-link" />
                </li>
            </ul>--}%
        </header>
    </div>
    <div class="userName" style="float: right">
        <g:loginToggle class="nav-link"/>
    </div>


<g:layoutBody/>
<div class="footer" role="contentinfo"></div>
<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>
<r:layoutResources/>

<g:javascript library="jquery"/>
<g:javascript library="application"/>
%{--
<script>
    $(document).ready(function () {
        $.ajax({
            type: 'POST',
            url: '/TekDays.com/language/checkLang',
            data: {},
            success: function (data) {
                $('.lang').val(data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Error fetching language");
            }
        });

        $('.lang').change(function () {
            let val = $(this).val();
            $.ajax({
                type: 'POST',
                url: '/TekDays.com/language/changeLang',
                data: {
                    "lang": val,
                },
                success: function (data) {
                    console.log('Language changed successfully');
                    window.location.href = window.location.pathname + "?lang=" + val;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log("Error changing language");
                }
            });
        });
    });
</script>--}%
<script>
    $(document).ready(function () {
        let currentLang = localStorage.getItem('selectedLang');
        $('.lang').val(currentLang);
        $('.lang').change(function () {
            let val = $(this).val();
            localStorage.setItem('selectedLang', val);
            $.ajax({
                type: 'POST',
                url: '/TekDays.com/language/changeLang',
                data: {
                    "lang": val,
                },
                success: function (data) {
                    console.log('Language changed successfully');
                    window.location.href = window.location.pathname + "?lang=" + val;
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log("Error changing language");
                }
            });
        });
    });
</script>

</body>
</html>

