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
<title>독거노인 관리 시스템</title>
</head>
<body>
	<br>
	<div id="container">
		<h1 style="width: auto; display: block;">관리대상 삭제</h1>
		<br>
		<div class="card" style="clear: both; float: left;">
			<div style="width: 99%; height: 10%; margin: auto; margin-top: 6%">
				<h3 style="float: left;">삭제대상 검색</h3>
				<div class="searchForm"
					style="background: URL(imgSearchForm.png); float: left; margin-left: 3%;">
					<input type="text" placeholder="관리번호 검색" name="search" id="search">
				</div>
			</div>
			<h2 style="clear: both; float: left;">관리대상 삭제 시 주의사항.</h2>
			<br>
			<h4>
				<ol style="clear: both;">
					<li>서비스 이용 취소에 필요한 서류 확인이 필요합니다. <br>※ 사망, 가족의 이용 취소 요구 등
					</li>
					<br>
					<li>삭제 시 모든 생활 기록과 정보가 삭제되니 신중하시기 바랍니다.</li>
					<br>
					<li>삭제된 정보는 복구할 수 없습니다.</li>
				</ol>
			</h4>

		</div>
		<div class="card"">
			<fieldset style="margin-top: 6%;">
				<legend>삭제대상 정보</legend>
				<br>
				<form action="" id="DeleteForm">
					<div>
						<label for="name">성명 :</label><span id="name"></span>
					</div>
					<div>
						<label for="birth">생년월일 : </label><span id="birth"></span>
					</div>
					<div>
						<label for="address">주소 :</label><span id="address"></span>
					</div>
					<div>
						<label for="tel">Tel :</label><span id="tel"></span>
					</div>
					<div>
						<label for="familyTel">연고자 연락처 : </label><span id="famTel"></span>
					</div>
					<div>
						<label for="special">특이사항 :</label><span id="special"></span>
					</div>
					<div>
						<label for="familyId">개인사용자 ID : </label><span id="fimId"></span>
					</div>
				</form>
			</fieldset>
			<div id="divBtn" style="width: 70%; height: 12%; margin: auto;">
			<div class="button-1" id="btnCancel">
				<div class="eff-1"></div>
				<a href="#">취소</a>
			</div>
			<div class="button-1" id="btnDelete">
				<div class="eff-1"></div>
				<a href="">삭제</a>
			</div>
		</div>
		</div>
		
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			var oldId;
			$("#search").keydown(function(e) {
				//var id = $('#search').val();
				// alert(name + "이 입력됐습니다.");

				/* 이 자리에 db와 통신하는 ajax코드가 필요. */

				if (e.which == 13) { // 검색창에 enter키가 눌리면...(엔터의 키코드는 13)
					/* DB에서 관리번호로 대상의 정보를 받아 화면에 뿌려준다. */
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
								/* 옆의 창에 대상 정보 출력하는 코드 필요. */
								// 이름 생일 주소 텔 팸텔, 특이, 개인id
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
								alert("등록된 정보가 없습니다.");
							}
						},
						error : function(e) {
							alert("failed");
						}
					})

				}
			});

			$('#btnCancel').on("click", function() {
				//일단 대기.
				$('#DeleteForm span').html('');
			});

			$('#btnDelete').on("click", function() {
				if (confirm("정말 삭제하시겠습니까?")) {

					var json = new Object();
					json.command = "deleteInfo";
					json.id = oldId;
					var data = {
						jsonData : JSON.stringify(json)
					}
					console.log("삭제버튼 json >> " + data);
					//alert("삭제버튼 json >> " + data);

					$.post("Delete.do", data, function(result) {
						if (result == "success") {
							alert("삭제 성공");
						} else {
							alert("삭제 실패");
						}
					})
				}
			});
		});
	</script>
</body>
</html>