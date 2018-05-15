<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<style type="text/css">
#container {
	width: 60%;
	margin: auto;
	box-sizing: border-box;
} 

.button-1 {
	width: 140px;
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
	width: 140px;
	height: 50px;
	top: -2px;
	right: -140px;
	background: #006064;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
}

.button-1:hover .eff-1 {
	right: 0;
}

.button-1:hover a {
	color: #fff;
}

#inputForm div {
	display: inline-block;
	width: 49%;
	height: 50px;
	margin: auto;
	margin-top: 3%;
	margin-bottom: 3%;
	float: left;
	text-align: center;
}

#inputForm div label {
	font-family: 'NanumSquareRound', sans-serif;
	font-weight: 800;
	width: 30%;
	color: #424242;
	display: inline-block;
	box-sizing: border-box;
}

#inputForm input[type="text"] {
	width: 60%;
	height: 40px;
	border-bottom-width: 1;
	border-left-width: 0;
	border-right-width: 0;
	border-top-width: 0;
	border: none;
	border-bottom: 1px solid #424242;
}

legend {
	color: #424242;
	font-family: 'NanumSquareRound', sans-serif;
	text-align: center;
	font-size: 150%;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	padding: 5px;
	width: 100%;
	height: 600px;
	font-family: 'NanumSquareRound', sans-serif;
	float: left;
	margin: auto;
	box-sizing: border-box;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ų��� ���� �ý���</title>
</head>
<body>
	<%@include file="Top.jsp"%>
	<div id="container">
		<h1 style="width: auto; display: block;">������� ���</h1>
		<br>
		<div class="card">
			<fieldset style="display: block; margin-top: 3%;">
				<br>
				<legend>���� ��� ���� �Է�</legend>
				<form action="" id="inputForm">
					<div style="float:left;">
						<label for="name">���� :</label><input type="text" name="name"
							id="name" placeholder="�̸�" required>
					</div>
					<div style="float:left;">
						<label for="birth">������� : </label><input type="text" name="birth"
							id="birth" placeholder="�������" required>
					</div>
					<div style="clear: both; float:left;">
						<label for="address">�ּ� :</label><input type="text" name="address"
							id="address" placeholder="�ּ�" required>
					</div>
					<div>
						<label for="tel">Tel :</label><input type="text" name="tel"
							id="tel" placeholder="xxx-xxxx-xxxx">
					</div>
					<div style="clear: both; float:left;">
						<label for="familyTel">������ ����ó : </label><input type="text"
							name="famTel" id="famTel" placeholder="xxx-xxxx-xxxx">
					</div>
					<div>
						<label for="special">Ư�̻��� : </label><input type="text"
							name="special" id="special" placeholder="Ű����� �Է�">
					</div>
					<div style="clear: both; float:left;">
						<label for="familyId">���λ���� ID : </label><input type="text"
							name="famId" id="famId" placeholder="������ ID�Է�">
					</div>
				</form>
				

			</fieldset>
			<div class="button-1" style="float: clear; float: right;">
				<div class="eff-1"></div>
				<a href="#">���</a>
			</div>
			<div class="button-1" style="float: clear; float: right;">
				<div class="eff-1"></div>
				<a href="#" id="regist">���</a>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#regist").click(function() {
				var name = $("#name").val();
				var birth = $("#birth").val();
				var address = $("#address").val();
				var tel = $("#tel").val();
				var famTel = $("#famTel").val();
				var special = $("#special").val();
				var famId = $("#famId").val();

				var json = new Object();

				json.name = name;
				json.birth = birth;
				json.address = address;
				json.tel = tel;
				json.famTel = famTel;
				json.special = special;
				json.famId = famId;

				var data = {
					jsonData : JSON.stringify(json)
				}

				$.ajax({

					type : "POST",
					url : "Regist.do",
					dataType : "json",
					data : data,

					success : function(data) {
						if (data == 200) {
							alert("��� ����");
						} else {
							alert("��� ����");
						}
					},
					error : function(e) {
						alert('���� ���� ���� ������ �����ϴ�. �ٽ� �õ��� �ֽʽÿ�.');
					}
				});
			})
		})
	</script>
</body>
</html>