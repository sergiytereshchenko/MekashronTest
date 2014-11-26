<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register_step_2.aspx.cs" Inherits="MekashronTest.register_step_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Smart-HD</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="images/favicon.png" type="image/png" />
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
            <div class="step float_l" style="margin: 0 0 0 70px;">1</div>
            <div class="step float_l" style="margin: 0 0 0 20px;">2</div>
            <span class="float_l">Завершение регистрации на Smart-HD</span>
        </div>

        <form id="form1" runat="server">
            <div class="register">
                <div class="form">
                    <%--<form id="form1" runat="server">--%>
                    <span>
                        <asp:Label ID="LabelEmail" runat="server" Text=""></asp:Label></span>
                    &nbsp;<p>Данный E-mail будет использоваться для авторизации.</p>
                    <br />
                    <span>Пароль:</span>
                    <input id="txtPassword1" class="field" type="password" runat="server" />
                    <p>Введите пароль для защиты вашего аккаунта.</p>
                    <br />
                    <span>Подтвердите пароль:</span>
                    <input id="txtPassword2" class="field" type="password" runat="server" />
                    <p>Подтвердите ваш пароль.</p>
                    <%--</form>--%>
                </div>
            </div>

            <br />
            <div class="register">
                <div class="form">
                    <%--<form id="form2" runat="server">--%>
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

            <div class="register">
                <div class="form without">
                    <%--<form id="form3" runat="server">--%>
                    <span>Промо-код:</span>
                    <input id="txtPromo" class="field" type="text" runat="server" />
                    <p>Заполните данное поле, если у вас есть промо-код.</p>
                    <%--</form>--%>
                </div>
            </div>
            <br />
            <br />
            <div class="register">
                <div class="form without">
                    <%--<form id="form4" runat="server">--%>
                    <%--<input class="orange_button" type="submit" value="Создать аккаунт" />--%>
                    <asp:Button ID="btnReg2" runat="server" CssClass="orange_button" Text="Создать аккаунт" />
                    <div id="Div1" visible="True" class="centred" runat="server">
                        <asp:ValidationSummary CssClass="validation_message" ID="ValidationSummaryIndex" runat="server" DisplayMode="BulletList" />
                    </div>

                    <%--</form>--%>
                </div>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword1" runat="server" ControlToValidate="txtPassword1" Display="None" ErrorMessage="Please, enter password"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword2" runat="server" ControlToValidate="txtPassword2" Display="None" ErrorMessage="Please, confirm password"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords don't match" ControlToCompare="txtPassword1" ControlToValidate="txtPassword2" Display="None"></asp:CompareValidator>
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please, enter address" Display="None"></asp:RequiredFieldValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" ControlToValidate="txtCity" ErrorMessage="Please, enter city" Display="None"></asp:RequiredFieldValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidatorZIP" runat="server" ControlToValidate="txtZip" ErrorMessage="Please, enter zip" Display="None"></asp:RequiredFieldValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCountry" runat="server" ControlToValidate="selCountry" ErrorMessage="Please, enter country" Display="None" InitialValue="---"></asp:RequiredFieldValidator>

            

        </form>
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
