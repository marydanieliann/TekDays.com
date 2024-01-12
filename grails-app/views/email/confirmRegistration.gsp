%{--
<%--
  Created by IntelliJ IDEA.
  User: sofs4
  Date: 1/10/24
  Time: 2:14 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Email For Registration</title>
</head>

<body>
<%@ page contentType="text/plain" %>
Dear ${user.fullName}
Congratulations! You have registered with TekDays, giving you access to be part of great event.
Your login id is: ${user.userName}
Please confirm your registration
<a href="http://localhost:8090/TekDays.com/tekUser/verifyUser?plainToken=${token.plainToken}">LINK</a>
Kind Regards,
The TekDays Team
</body>
</html>
--}%
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta name="x-apple-disable-message-reformatting">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="telephone=no" name="format-detection">
    <title></title>
    <!--[if (mso 16)]>
    <style type="text/css">
    a {text-decoration: none;}
    </style>
    <![endif]-->
    <!--[if gte mso 9]><style>sup { font-size: 100% !important; }</style><![endif]-->
    <link href="https://fonts.googleapis.com/css2?family=Imprima&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${createLink(uri: '/assets/confirmationMail.css')}" />
</head>
<body>
<div dir="ltr" class="es-wrapper-color">
    <table class="es-wrapper" width="100%" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
            <td class="esd-email-paddings" valign="top">

                <table cellpadding="0" cellspacing="0" class="es-content" align="center">
                    <tbody>
                    <tr>
                        <td class="esd-stripe" align="center">
                            <table bgcolor="#efefef" class="es-content-body" align="center" cellpadding="0" cellspacing="0" width="600" style="border-radius: 20px 20px 0 0 ">
                                <tbody>
                                <tr>
                                    <td class="esd-structure es-p40t es-p40r es-p40l" align="left">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                            <tr>
                                                <td width="520" class="esd-container-frame" align="center" valign="top">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tbody>
                                                        <tr>
                                                            <td align="left" class="esd-block-image es-m-txt-c" style="font-size: 0px;"><a target="_blank" href="https://viewstripo.email"><img src="https://tlr.stripocdn.email/content/guids/CABINET_ee77850a5a9f3068d9355050e69c76d26d58c3ea2927fa145f0d7a894e624758/images/group_4076323.png" alt="Confirm email" style="display: block; border-radius: 100px;" width="100" title="Confirm email"></a></td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="es-p20t es-p40r es-p40l esd-structure" align="left">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                            <tr>
                                                <td width="520" class="esd-container-frame" align="center" valign="top">
                                                    <table cellpadding="0" cellspacing="0" width="100%" bgcolor="#fafafa" style="background-color: #fafafa; border-radius: 10px; border-collapse: separate;">
                                                        <tbody>
                                                        <tr>
                                                            <td align="left" class="esd-block-text es-p20">
                                                                <h3>Welcome,&nbsp;${user.fullName}</h3>
                                                                <p><br></p>
                                                                <p>You're receiving this message because you recently signed up for a account.<br><br>Confirm your email address by clicking the button below. This step adds extra security to your business by verifying you own this email.</p>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table cellpadding="0" cellspacing="0" class="es-content" align="center">
                    <tbody>
                    <tr>
                        <td class="esd-stripe" align="center">
                            <table bgcolor="#efefef" class="es-content-body" align="center" cellpadding="0" cellspacing="0" width="600">
                                <tbody>
                                <tr>
                                    <td class="esd-structure es-p30t es-p40b es-p40r es-p40l" align="left">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                            <tr>
                                                <td width="520" class="esd-container-frame" align="center" valign="top">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tbody>
                                                        <tr>
                                                            <td align="center" class="esd-block-button">
                                                                <!--[if mso]><a href="http://localhost:8090/TekDays.com/tekUser/verifyUser?plainToken=${token.plainToken}https://" target="_blank" hidden>
	<v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="urn:schemas-microsoft-com:office:word" esdevVmlButton href="http://localhost:8090/TekDays.com/tekUser/verifyUser?plainToken=${token.plainToken}https://"
                 style="height:56px; v-text-anchor:middle; width:520px" arcsize="50%" stroke="f"  fillcolor="#7630f3">
                                                                    <w:anchorlock></w:anchorlock>
                                                                    <center style='color:#ffffff; font-family:Imprima, Arial, sans-serif; font-size:22px; font-weight:700; line-height:22px;  mso-text-raise:1px'>Confirm email</center>
                                                                </v:roundrect></a>
<![endif]-->
                                                                <!--[if !mso]><!-- --><span class="msohide es-button-border" style="display: block; background: #7630f3;"><a href="http://localhost:8090/TekDays.com/tekUser/verifyUser?plainToken=${token.plainToken}https://" class="es-button msohide" target="_blank" style="padding-left: 5px; padding-right: 5px; display: block; background: #f1efef; mso-border-alt: 10px solid #f1efef">Confirm email</a></span>
                                                                <!--<![endif]-->
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="esd-structure es-p40r es-p40l" align="left">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                            <tr>
                                                <td width="520" class="esd-container-frame" align="center" valign="top">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tbody>
                                                        <tr>
                                                            <td align="left" class="esd-block-text">
                                                                <p>Thanks,<br><br>TekDays</p>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" class="esd-block-spacer es-p40t es-p20b" style="font-size:0">
                                                                <table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td style="border-bottom: 1px solid #666666; background: unset; height: 1px; width: 100%; margin: 0px;"></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</body>

</html>