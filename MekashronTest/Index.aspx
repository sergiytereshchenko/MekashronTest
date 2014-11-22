<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MekashronTest.Index" %>

<%@ Import Namespace="MekashronTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Smart-HD</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="images/favicon.png" type="image/png" />
    <!-- jQuery -->
    <script type="text/javascript" src="Scripts/jquery-2.1.1.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $("a[id='lkEmail']").click(function () {
                var customID = $(this).attr('myCustomID');

                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    url: 'activate.aspx/SendEmail',
                    data: "{'inEmail':'" + customID + "'}",
                    success:
                        function (response) {
                            alert("Your message was sent successfully!");
                        },

                    error: function () {
                        alert("Something wrong. Your message wasn't sent. Please, try again...");
                    }
                });

                return false;
            });

            return false;
        });
    </script>

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


            <div class="login">
                <h1>Вход в личный кабинет</h1>
                <%--<form id="form1" runat="server">--%>
                <span>E-mail:</span>
                <input id="txtEmail" class="fields" type="text" runat="server" />
                <br />
                <br />
                <span>Пароль:</span>
                <input id="txtPassword" class="fields" type="password" runat="server" />
                <div class="checkbox">
                    <%-- <asp:CheckBox ID="CheckBox1" runat="server" />--%>
                    <input type="checkbox" value="1" id="chkRememberMe" name="" runat="server" />
                    <label for="chkRememberMe"></label>
                    <span>Запомнить меня</span>
                    <a href="forgot_password.aspx">Забыли пароль?</a>
                </div>

                <input class="button" type="submit" value="Войти" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" Display="None" ErrorMessage="Please, enter e-mail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="txtEmail" Display="None" ErrorMessage="Please, enter e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please, enter password" Display="None"></asp:RequiredFieldValidator>

                <div visible="True" class="centred" runat="server">
                    <asp:ValidationSummary ID="ValidationSummaryIndex" runat="server" BorderStyle="Solid" BackColor="#FFCCCC" BorderColor="#CC3300" BorderWidth="1px" DisplayMode="List" Style="top: 0px; left: 0px; width: 414px" />
                </div>

            </div>
        </form>
        <ul class="what">
            <h1>Новый пользователь?</h1>
            <li class="red">Бесплатный просмотр<br />
                <p>Зарегистрируйтесь сейчас и попробуйте наши услуги БЕСПЛАТНО</p>
            </li>
            <li>40 лучших ТВ-каналов<br />
                <p>Смотрите лучшие Российские, Израильские, Украинские и другие ТВ-каналы</p>
            </li>
            <li>Тысячи фильмов<br />
                <p>Cмотрите новейшие VOD фильмы в HD и 3D качестве</p>
            </li>
            <a class="orange_button" href="register_step_1.aspx">Быстрая регистрация</a>
        </ul>


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
