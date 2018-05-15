<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<style type="text/css">
body {
	align-content: center;
	background-color: #F5F5F5;
}

#main {
	width: 1600px;
	height: 100px;
}

font {
	font-family: 'NanumSquareRound', sans-serif;
	font-weight: bolder;
}

h1 {
	display: block;
	font-family: 'NanumSquareRound', sans-serif;
	font-size: 260%;
	color: #424242;
	width: 26%;
	margin: 0px;
	margin-bottom: 1%;
	margin-top: 1%;
	margin-left: 5%;
	float: left;
}

hr {
	width: 80%;
	margin-top: 0px;
	margin-bottom: 1%;
	margin-left: 5%;
	border: none;
	border: 2px solid #616161;
	float: left;
}

#isLogin {
	display: inline-block;
	width: 15%;
	text-align: center;
	float: left;
	margin-top: 1%;
	margin-bottom: 1%;
}

#loginState {
	font-family: 'NanumSquareRound', sans-serif;
	display: inline-block;
	width: 15%;
	text-align: center;
	float: left;
	margin-bottom: 1%;
}

.button-1 {
	width: 120px;
	height: 50px;
	border: 2px solid #006064;
	float: left;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 20px 0 30px 10px;
}

.button-1 a {
	font-family: 'NanumSquareRound', sans-serif;
	font-size: 16px;
	color: #006064;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
}

.eff-1 {
	width: 120px;
	height: 50px;
	top: -2px;
	right: -120px;
	background: #006064;
	position: absolute;
	transition: all .3s ease;
	z-index: 1;
}

.button-1:hover .eff-1 {
	right: 0;
}

.button-1:hover a {
	color: #fff;
}

#container {
	width: 65%;
	height: 680px;
	margin: auto;
	box-sizing: border-box;
} 
</style>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>���ų��� ���� �ý���</title>
</head>
<body>

	<div id="main">
		<h1 style="margin-top: 1.4%;">���ų��� ���� �ý���</h1>
		<div id="buttonSet">
			<div class="button-1">
				<div class="eff-1"></div>
				<a href="Main.jsp">Ȩ����</a>
			</div>
			<div class="button-1">
				<div class="eff-1"></div>
				<a href="regist.jsp">���ų��� ���</a>
			</div>
			<div class="button-1">
				<div class="eff-1"></div>
				<a href="Assignment.jsp">���ų��� ����</a>
			</div>
			<div class="button-1">
				<div class="eff-1"></div>
				<a href="Modify.jsp">���ų��� ����</a>
			</div>
			<div class="button-1">
				<div class="eff-1"></div>
				<a href="delete.jsp">���ų��� ����</a>
			</div>
			<div class="button-1">
				<div class="eff-1"></div>
				<a href="sensor.jsp">���� ���</a>
			</div>
		</div>
		<div id="isLogin">�޽���</div>
		<a href="#1" id="loginState">�α��λ���</a>
		
		<hr>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			var loginId = "<%=(String) session.getAttribute("loginId")%>";
			
			//alert(loginId);
			if (loginId == "null") { 
				//�α��� ���� �����ִ� �޼ҵ�
				location.replace("Login.html");
			} else {
				$("#isLogin").text(loginId + "��, ȯ���մϴ�.");
				$("#loginState").text("�α׾ƿ�");
			}
		
			$('#loginState').click(function() {
				//���ǿ��� �α������� ����
				window.location.replace('Logout.do');
			})
		})
	</script>
</body>
</html>