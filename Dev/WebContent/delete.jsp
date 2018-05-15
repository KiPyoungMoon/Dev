<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@include file="Top.jsp"%>
<style type="text/css">
/* #container {
	width: 60%;
	height: 600px;
	margin: auto;
	box-sizing: border-box;
} */

.searchForm {
	display: inline-block;
	width: 190px;
	height: 40px;
	width: 190px;
}

#search {
	margin-top: 3.3%;
	margin-left: 46px;
	height: 20px;
	width: 135px;
	border: none;
	margin-left: 46px;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	padding: 5px;
	width: 49%;
	height: 600px;
	font-family: 'NanumSquareRound', sans-serif;
	float: left;
	margin: auto;
	box-sizing: border-box;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

#DeleteForm div {
	display: block;
	width: 91%;
	height: 50px;
	margin: auto;
	margin-top: 1%;
	margin-bottom: 1%;
	float: left;
}

#DeleteForm>div label {
	font-family: 'NanumSquareRound', sans-serif;
	font-weight: 800;
	width: 29%;
	color: #424242;
	display: inline-block;
	box-sizing: border-box;
}

#DeleteForm input[type="text"] {
	width: 75%;
	height: 30px;
	border-bottom-width: 1;
	border-left-width: 0;
	border-right-width: 0;
	border-top-width: 0;
	border: none;
	border-bottom: 1px solid #424242;
}

legend {
	display: block;
	font-family: 'NanumSquareRound', sans-serif;
	font-size: 150%;
	color: #424242;
	margin: auto;
	width: 100%;
	text-align: center;
}

h2 {
	/* display: inline-block; */
	margin: 10px;
	margin-left: 5%;
	color: #424242;
}

h3, h4 {
	display: inline-block;
	margin: 10px;
	margin-left: 5%;
	color: #424242;
}

#divBtn div {
	margin-top: 3.5%;
}

span {
	font-family: 'NanumSquareRound', sans-serif;
	color: #424242;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ų��� ���� �ý���</title>
</head>
<body>
	<br>
	<div id="container">
		<h1 style="width: auto; display: block;">������� ����</h1>
		<br>
		<div class="card" style="clear: both; float: left;">
			<div style="width: 99%; height: 10%; margin: auto; margin-top: 6%">
				<h3 style="float: left;">������� �˻�</h3>
				<div class="searchForm"
					style="background: URL(imgSearchForm.png); float: left; margin-left: 3%;">
					<input type="text" placeholder="������ȣ �˻�" name="search" id="search">
				</div>
			</div>
			<h2 style="clear: both; float: left;">������� ���� �� ���ǻ���.</h2>
			<br>
			<h4>
				<ol style="clear: both;">
					<li>���� �̿� ��ҿ� �ʿ��� ���� Ȯ���� �ʿ��մϴ�. <br>�� ���, ������ �̿� ��� �䱸 ��
					</li>
					<br>
					<li>���� �� ��� ��Ȱ ��ϰ� ������ �����Ǵ� �����Ͻñ� �ٶ��ϴ�.</li>
					<br>
					<li>������ ������ ������ �� �����ϴ�.</li>
				</ol>
			</h4>

		</div>
		<div class="card"">
			<fieldset style="margin-top: 6%;">
				<legend>������� ����</legend>
				<br>
				<form action="" id="DeleteForm">
					<div>
						<label for="name">���� :</label><span id="name"></span>
					</div>
					<div>
						<label for="birth">������� : </label><span id="birth"></span>
					</div>
					<div>
						<label for="address">�ּ� :</label><span id="address"></span>
					</div>
					<div>
						<label for="tel">Tel :</label><span id="tel"></span>
					</div>
					<div>
						<label for="familyTel">������ ����ó : </label><span id="famTel"></span>
					</div>
					<div>
						<label for="special">Ư�̻��� :</label><span id="special"></span>
					</div>
					<div>
						<label for="familyId">���λ���� ID : </label><span id="fimId"></span>
					</div>
				</form>
			</fieldset>
			<div id="divBtn" style="width: 70%; height: 12%; margin: auto;">
			<div class="button-1" id="btnCancel">
				<div class="eff-1"></div>
				<a href="#">���</a>
			</div>
			<div class="button-1" id="btnDelete">
				<div class="eff-1"></div>
				<a href="">����</a>
			</div>
		</div>
		</div>
		
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			var oldId;
			$("#search").keydown(function(e) {
				//var id = $('#search').val();
				// alert(name + "�� �Էµƽ��ϴ�.");

				/* �� �ڸ��� db�� ����ϴ� ajax�ڵ尡 �ʿ�. */

				if (e.which == 13) { // �˻�â�� enterŰ�� ������...(������ Ű�ڵ�� 13)
					/* DB���� ������ȣ�� ����� ������ �޾� ȭ�鿡 �ѷ��ش�. */
					var id = parseInt($('#search').val());
					oldId = id;

					var json = new Object();
					json.command = "oldInfo";
					json.id = id;

					var data = {
						jsonData : JSON.stringify(json)
					}

					$.ajax({

						url : "Delete.do",
						type : "POST",
						dataType : "json",
						data : data,

						success : function(data) {
							var result = true;
							console.log(JSON.stringify(data));

							if ((!$.isEmptyObject(data))) {
								/* ���� â�� ��� ���� ����ϴ� �ڵ� �ʿ�. */
								// �̸� ���� �ּ� �� ����, Ư��, ����id
								$('#name').html(data.name);
								$('#birth').html(data.birth);
								$('#address').html(data.address);
								$('#tel').html(data.tel);
								$('#famTel').html(data.famTel);
								$('#special').html(data.special);
								$('#famId').html(data.famId);

								result = false;
							}

							if (result) {
								alert("��ϵ� ������ �����ϴ�.");
							}
						},
						error : function(e) {
							alert("failed");
						}
					})

				}
			});

			$('#btnCancel').on("click", function() {
				//�ϴ� ���.
				$('#DeleteForm span').html('');
			});

			$('#btnDelete').on("click", function() {
				if (confirm("���� �����Ͻðڽ��ϱ�?")) {

					var json = new Object();
					json.command = "deleteInfo";
					json.id = oldId;
					var data = {
						jsonData : JSON.stringify(json)
					}
					console.log("������ư json >> " + data);
					//alert("������ư json >> " + data);

					$.post("Delete.do", data, function(result) {
						if (result == "success") {
							alert("���� ����");
						} else {
							alert("���� ����");
						}
					})
				}
			});
		});
	</script>
</body>
</html>