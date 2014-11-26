<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="MekashronTest.MyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<title>Smart-HD</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>   	
    <link rel="shortcut icon" href="images/favicon.png" type="image/png"/>
</head>

<body>
    <div class="centred">
        
            <div id="errorDiv" visible="False" class="centred" runat="server">
                <div class="error_message">
                    <p id="errorMsg" runat="server"></p>
                </div>
            </div>

        <form id="form2" runat="server">

            <div class="top_line">
                <div class="centred">
                    <a class="logo" href="index.aspx"></a>
                    <a class="fb" target="_blank" href="http://facebook.com"></a>
                    <ul>
                        <li class="ru"><a href="#">Русский</a></li>
                        <li class="en" href="#"><a href="#">English</a></li>
                    </ul>
                </div>
            </div>


            <div class="register">
                <div class="form">

                    <span>Email:</span>
                    <input id="txtEmail" class="field" type="text" runat="server" />
                    <p>Данный E-mail будет использоваться для авторизации.</p>
                    <br/>

                </div>
            </div>
            <br />

            <br />
            <div class="register">
                <div class="form without">
                    <asp:Button ID="btnChange" runat="server" CssClass="orange_button" Text="Изменить" OnClick="btnChange_Click" />
                    
                    <div id="Div1" visible="True" class="centred"   runat="server">
                        <asp:ValidationSummary CssClass="validation_message" ID="ValidationSummaryIndex" runat="server" DisplayMode="BulletList" />
                    </div>

                </div>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" Display="None" ErrorMessage="Please, enter e-mail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="txtEmail" Display="None" ErrorMessage="Please, enter valid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

        </form>

        <div class="clear"></div>
        <br />
        <h2>Смотрите Ваши любимые фильмы и телепрограммы<br />
            <strong>в любом месте</strong></h2>

        <!--ul class="watch">
			<li style="margin: 0px 0 0 0;"><img src="images/box.png">На домашнем<br/>телевизоре</li>
			<li style="margin: 30px 0 0 0;"><img src="images/tablet.png">На планшете</li>
			<li style="margin: 50px 0 0 0;"><img src="images/phone.png">На своем<br/>смартфоне</li>
			<li style="margin: 30px 0 0 0;"><img src="images/smart.png">На телевизоре<br/>Смарт</li>
			<li style="margin: 0px 0 0 0;"><img src="images/pc.png">На домашнем ПК</li>
		</ul>
		<div class="clear"></div-->

        <img style="display: block; margin: 40px auto 30px auto;" src="images/facebook.png">
    </div>
    <div class="clear"></div>

    <div class="footer">
        <p class="copyright">Smart-HD © 2014 Все права защищены.</p>
    </div>

</body>
</html>
