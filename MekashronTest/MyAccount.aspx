﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="MekashronTest.MyAccount" %>

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
        <form id="form2" runat="server">
            <div id="successReg" visible="False" class="centred" runat="server">
                <div class="email_verification">
                    <p>Регистрация успешно завершена! Добро пожаловать в Smart-HD. - <strong>Необходимо подтверждение E-mail адреса.</strong></p>
                    <p>
                        Проверьте почтовый ящик для активации Вашего аккаунта. Если Вы не получили e-mail в течении нескольких минут - проверьте ящик для спама или
                        <asp:LinkButton ID="lkEmail" myCustomID="" runat="server" OnClientClick="return false;">нажмите здесь</asp:LinkButton>
                        и мы вышлем код еще раз на <strong id="strongEmail" runat="server"></strong>
                        (<a href="/MyAccount.aspx">редактировать</a>)
                    </p>
                    <%--<a href="javascript:__doPostBack('ctl00$lkEmail','')" id="lkEmail">нажмите здесь</a>--%>
                </div>
            </div>

            <div id="errorDiv" visible="False" class="centred" runat="server">
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


            <div class="register">
                <div class="form">
                    <%--<form id="form1" runat="server">--%>
                    <span>Email:</span>
                    <input id="txtEmail" class="field" type="text" runat="server" />
                    <p>Данный E-mail будет использоваться для авторизации.</p>
                    <br />
                    <span>Новый пароль:</span>
                    <input id="txtPassword1" class="field" type="password" runat="server" />
                    <p>Введите пароль для защиты вашего аккаунта.</p>
                    <br />
                    <span>Подтвердите пароль:</span>
                    <input id="txtPassword2" class="field" type="password" runat="server" />
                    <p>Подтвердите ваш пароль.</p>
                    <span>Адрес:</span>
                    <input id="txtAddress" class="field" type="text" runat="server" />
                    <p>Укажите ваш действительный адрес.</p>
                    <br />
                    <span>Город:</span>
                    <input id="txtCity" class="field" type="text" runat="server" />
                    <p>Город в котором вы проживаете.</p>
                    <br />
                    <span>Почтовый индекс:</span>
                    <input id="txtZip" class="field" type="text" runat="server" />
                    <p>Ваш почтовый индекс.</p>
                    <br />
                    <span>Страна:</span>
                    <div class="select">
                        <select id="selCountry" runat="server">
                            <option>---</option>
                            <option>Israel</option>
                            <option>Ukraine</option>
                            <option>USA</option>
                        </select>
                    </div>
                    <p>Выберите страну в которой вы проживаете.</p>
                    <%--</form>--%>
                </div>
            </div>
            <br />

            <br />
            <div class="register">
                <div class="form without">
                    <asp:Button ID="btnReg2" runat="server" CssClass="orange_button" Text="Изменить аккаунт" />
                </div>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" Display="None" ErrorMessage="Please, enter e-mail"></asp:RequiredFieldValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword1" runat="server" ControlToValidate="txtPassword1" Display="None" ErrorMessage="Please, enter password"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword2" runat="server" ControlToValidate="txtPassword2" Display="None" ErrorMessage="Please, confirm password"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords don't match" ControlToCompare="txtPassword1" ControlToValidate="txtPassword2" Display="None"></asp:CompareValidator>
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please, enter address" Display="None"></asp:RequiredFieldValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" ControlToValidate="txtCity" ErrorMessage="Please, enter city" Display="None"></asp:RequiredFieldValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidatorZIP" runat="server" ControlToValidate="txtZip" ErrorMessage="Please, enter zip" Display="None"></asp:RequiredFieldValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCountry" runat="server" ControlToValidate="selCountry" ErrorMessage="Please, enter country" Display="None" InitialValue="---"></asp:RequiredFieldValidator>

	        <div Visible="True" class="centred" runat="server">
	            <asp:ValidationSummary ID="ValidationSummaryReg2" runat="server" BorderStyle="Solid" BackColor="#FFCCCC" BorderColor="#CC3300" BorderWidth="1px" DisplayMode="List" style="top: 0px; left: 0px; width: 414px" />
	        </div>


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

    <%--   <form id="form1" runat="server">
    <div>
    
    </div>
    </form>--%>
</body>
</html>
