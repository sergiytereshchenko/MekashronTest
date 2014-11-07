<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register_step_1.aspx.cs" Inherits="MekashronTest.register_step_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<title>Smart-HD</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>   	
    <link rel="shortcut icon" href="images/favicon.png" type="image/png"/>
</head>

<body>
    
	<div class="top_line">
		<div class="centred">
			<a class="logo" href="index.html"></a>
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
			<span class="float_l">Регистрация на Smart-HD</span>
			<div class="step float_r" style="margin: 0 70px 0 0;">2</div>
		</div>
		
		<div class="register">
			<div class="form">
				<form id="form1" runat="server">
					<span>E-mail:</span>
			 		<input required class="field" type="text" />
					<p>На вашу электронную почту будет  выслана ссылка для подтверждения регистрации.</p>
					<br/>
					<span>Имя и Фамилия:</span>
					<input required class="field" type="text" />
					<p>Введите пожалуйста ваше действительное Имя и Фамилию.</p>
					<br/>
					<span>Телефон:</span>
					<input required class="field" type="text" />
					<p>Укажите ваш действующий номер телефона.</p>
					<br/>
					<span>Страна:</span>
					<div class="select">
						<select required="">
							<option>---</option>
							<option>Israel</option>
							<option>Ukraine</option>
							<option>USA</option>
						</select>
					</div>
					<p>Выберите страну в которой вы проживаете.</p>
					<br/>
					<br/>
					<input class="orange_button" type="submit" value="Продолжить регистрацию" />
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
