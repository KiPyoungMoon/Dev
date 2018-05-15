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
<title>독거노인 관리 시스템</title>
</head>
<body>
	<%@include file="Top.jsp"%>
	<div id="container">
		<h1 style="width: auto;">독거노인 관리 시스템 사용 메뉴얼</h1>
		<br>
		<div class="card" style="clear: both; float: left;">
			<h2>
				<br><br>본 사이트는 독거노인 관리 시스템에 등록된 노인정보를 관리하기 위한 사이트입니다.<br>
				사이트 관리자는
				메뉴얼을 숙지하기 바랍니다.</h2> <br>
				
				<br>
			<h3>
				<ol>
					<li>기관에서 제공한 독거 노인은 사회복지사에게 배정됩니다.</li><br>
					<li>개인회원이 앱을 통해 가입을 한 경우,<br>
					반드시 관련 서류를 확인 한 후 대상의 정보를 입력하고 개인회원에게 배정하시기 바랍니다.
					</li><br>
					<li>임의로 어떤 정보도 변경을 해선 안됩니다.</li><br>
					<li>개인정보를 다루고 있으므로, 보안에 주의하여야 합니다.</li><br>
					<li>사회복지사 혹은 기관 소속 노인 정보에 문제가 있을 경우, DBA에게 문의 바랍니다. 내선 105</li>
				</ol>
			</h3><br><br>
			<h2>오늘도 행복한 하루 되시길 바랍니다.</h2>

		</div>
	</div>
</body>
</html>