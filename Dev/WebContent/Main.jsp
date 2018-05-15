<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#container {
	width: 60%;
	height: 680px;
	margin: auto;
	box-sizing: border-box;
}

h2 {
	/* display: inline-block; */
	margin: 10px;
	margin-left: 5%;
	color: #424242;
}
h3 {
	/* display: inline-block; */
	margin: 10px;
	margin-left: 5%;
	color: #424242;
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
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ų��� ���� �ý���</title>
</head>
<body>
	<%@include file="Top.jsp"%>
	<div id="container">
		<h1 style="width: auto;">���ų��� ���� �ý��� ��� �޴���</h1>
		<br>
		<div class="card" style="clear: both; float: left;">
			<h2>
				<br><br>�� ����Ʈ�� ���ų��� ���� �ý��ۿ� ��ϵ� ���������� �����ϱ� ���� ����Ʈ�Դϴ�.<br>
				����Ʈ �����ڴ�
				�޴����� �����ϱ� �ٶ��ϴ�.</h2> <br>
				
				<br>
			<h3>
				<ol>
					<li>������� ������ ���� ������ ��ȸ�����翡�� �����˴ϴ�.</li><br>
					<li>����ȸ���� ���� ���� ������ �� ���,<br>
					�ݵ�� ���� ������ Ȯ�� �� �� ����� ������ �Է��ϰ� ����ȸ������ �����Ͻñ� �ٶ��ϴ�.
					</li><br>
					<li>���Ƿ� � ������ ������ �ؼ� �ȵ˴ϴ�.</li><br>
					<li>���������� �ٷ�� �����Ƿ�, ���ȿ� �����Ͽ��� �մϴ�.</li><br>
					<li>��ȸ������ Ȥ�� ��� �Ҽ� ���� ������ ������ ���� ���, DBA���� ���� �ٶ��ϴ�. ���� 105</li>
				</ol>
			</h3><br><br>
			<h2>���õ� �ູ�� �Ϸ� �ǽñ� �ٶ��ϴ�.</h2>

		</div>
	</div>
</body>
</html>