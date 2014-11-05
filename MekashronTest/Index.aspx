<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MekashronTest.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<title>Smart-HD</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>   	
    <link rel="shortcut icon" href="images/favicon.png" type="image/png"/>
</head>
<body>
    
	<div class="centred">
		<div class="email_verification">
			<p>Регистрация успешно завершена! Добро пожаловать в Smart-HD. - <strong>Необходимо подтверждение E-mail адреса.</strong></p>
			<p>
                        Проверьте почтовый ящик для активации Вашего аккаунта. Если Вы не получили e-mail в течении нескольких минут - проверьте ящик для спама или
                        <a href="javascript:__doPostBack('ctl00$lkEmail','')" id="lkEmail">нажмите здесь</a>
                        и мы вышлем код еще раз на 
                        <strong>kdfk@ukr.net</strong>
                        (<a href="/MyAccount.aspx">редактировать</a>)
                    </p>
		</div>
	</div>
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
	
		<div class="login">
			<h1>Вход в личный кабинет</h1>
			<form id="form1" runat="server">
				<span>E-mail:</span>
				<input required class="fields" type="text" />
				<br/>
				<br/>
				<span>Пароль:</span>
				<input required class="fields" type="password" />
				<div class="checkbox">
						<input required type="checkbox" value="1" id="checkboxInput" name="" />
						<label for="checkboxInput"></label>
						<span>Запомнить меня</span>
						<a href="forgot_password.html">Забыли пароль?</a>
				</div>
			
				<input class="button" type="button" value="Войти" />
			</form>
			
		</div>
	
		<ul class="what">
			<h1>Новый пользователь?</h1>
			<li class="red">Бесплатный просмотр<br/><p>Зарегистрируйтесь сейчас и попробуйте наши услуги БЕСПЛАТНО</p></li>
			<li>40 лучших ТВ-каналов<br/><p>Смотрите лучшие Российские, Израильские, Украинские и другие ТВ-каналы</p></li>
			<li>Тысячи фильмов<br/><p>Cмотрите новейшие VOD фильмы в HD и 3D качестве</p></li>
			<a class="orange_button" href="register_step_1.html">Быстрая регистрация</a>
		</ul>
		
		
		<div class="clear"></div>
		<br />
		<h2>Смотрите Ваши любимые фильмы и телепрограммы<br/><strong>в любом месте</strong></h2>
		
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
