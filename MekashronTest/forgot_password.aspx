﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot_password.aspx.cs" Inherits="MekashronTest.forgot_password" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<title>Smart-HD</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>   	
    <link rel="shortcut icon" href="images/favicon.png" type="image/png"/>
</head>

<body>
    
    <div id="errorDiv" Visible="False" class="centred" runat="server">
        <div class="error_message">
            <p id="errorMsg" runat="server"></p>
        </div>
    </div>

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
	<div class="centred">
		<div class="steps">
			
			<span class="float_l" style="margin: 0 0 0 320px;">Восстановление пароля</span>

		</div>
		
		<div class="register">
			<div class="form without">
				<form id="form1" runat="server">
					<p class="forgot">Для того, чтобы получить новый пароль, введите Ваш e-mail и мы отправим Вам письмо с инструкцией.</p>
					<br/>
					<span>E-mail:</span>
					<input id="txtEmail" class="field" type="text" runat="server" controltovalidate="txtEmail" />
					
					<br/>
					<asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Please, input e-mail" Display="None" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="Please, input valid e-mail" ControlToValidate="txtEmail" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
					<br/>
					<br/>
                    <asp:Button CssClass="orange_button" ID="btnSendEmail" runat="server" Text="Выслать новый пароль" OnClick="btnSendEmail_Click" />
                    <div id="Div1" visible="True" class="centred"   runat="server">
                        <asp:ValidationSummary CssClass="validation_message" ID="ValidationSummaryIndex" runat="server" DisplayMode="BulletList" />
                    </div>
				</form>
			</div>
		</div>
		
		
		
		
	</div>
	<div class="clear"></div>
	
	<div class="footer">
		<p class="copyright">Smart-HD © 2014 Все права защищены.</p>
	</div>
<%--    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>--%>
</body>
</html>
