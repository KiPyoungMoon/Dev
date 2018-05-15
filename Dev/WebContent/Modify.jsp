<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
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

table.tbList {
	clear: left;
	border-collapse: collapse;
	text-align: left;
	line-height: 0.7;
	font-family: 'NanumSquareRound', sans-serif;
	width: 460px;
}

table.tbList thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.tbList tbody th {
	width: 99%;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.tbList td {
	width: 99%;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

h3 {
	display: block;
	margin: 0;
	margin-top: 3%;
	margin-left: 3%;
	margin-right: 3%;
	font-family: 'NanumSquareRound', sans-serif;
	float: left;
	color: #424242;
}

#modifyForm div {
	display: block;
	width: 90%;
	height: 50px;
	margin: auto;
	margin-top: 1%;
	margin-bottom: 1%;
	float: left;
}

#modifyForm>div label {
	font-family: 'NanumSquareRound', sans-serif;
	font-weight: 800;
	width: 29%;
	color: #424242;
	display: inline-block;
	box-sizing: border-box;
}

#modifyForm input[type="text"] {
	width: 70%;
	height: 30px;
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

#divBtn div {
	margin-top: 3.5%;
}

.info:hover {
	background-color: #ffffff;
	border: 1px dashed blue;
}
/* 
div {
	border: 1px dotted red;
} */
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>독거노인 관리 시스템</title>
</head>
<body>
	<%@include file="Top.jsp"%>
	<br>
	<div id="container">
		<h1 style="width: auto; display: block;">관리대상 수정</h1>
		<div class="card" style="clear: both; float: left;">
			<div style="width: 99%; height: 8%; margin-top: 3%">
				<h3>관리대상 리스트</h3>
				<div class="searchForm"
					style="background: URL(imgSearchForm.png); float: left;">
					<input type="text" placeholder="이름 검색" name="search" id="search">
				</div>
			</div>
			<div style="overflow: auto; clear: both; float: left;">
				<table class="tbList">
					<thead>
						<tr>
							<th scope="cols">※ 검색 결과가 출력됩니다.</th>
						</tr>
					</thead>
					<tbody id="tbBodyList">
						<tr>
							<td>먼저 이름 검색을 하시기 바랍니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card">
			<br>
			<fieldset>
				<legend>관리대상 정보 수정</legend>
				<br>
				<form action="" id="modifyForm">
					<div>
						<label for="name">성명 :</label><input type="text" class="input"
							name="name" id="name" placeholder="이름">
					</div>
					<div>
						<label for="birth">생년월일 : </label><input type="text" class="input"
							name="birth" id="birth" placeholder="생년월일">
					</div>
					<div>
						<label for="address">주소 :</label><input type="text"
							" class="input" name="address" id="address" placeholder="주소">
					</div>
					<div>
						<label for="tel">Tel :</label><input type="text" class="input"
							name="tel" id="tel" placeholder="xxx-xxxx-xxxx">
					</div>
					<div>
						<label for="familyTel">연고자 연락처 : </label><input type="text"
							class="input" name="familyTel" id="famTel"
							placeholder="xxx-xxxx-xxxx">
					</div>
					<div>
						<label for="special">특이사항 :</label><input type="text"
							class="input" name="special" id="special" placeholder="키워드로 입력">
					</div>
					<div>
						<label for="familyId">개인사용자 ID : </label><input type="text"
							class="input" name="familyId" id="famId" placeholder="개인의 ID입력">
					</div>
				</form>
			</fieldset>
			<div id="divBtn"
				style="width: 68%; height: 12%; margin: auto; margin-top: 2%">
				<div class="button-1">
					<div class="eff-1"></div>
					<a href="#" id="cancel">취소</a>
				</div>
				<div class="button-1">
					<div class="eff-1"></div>
					<a href="#" id="modify">수정</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var resultData;
							var oldId;

							$("#search")
									.keydown(
											function(e) {
												var name = $('#search').val();
												// alert(name + "이 입력됐습니다.");

												if (e.which == 13) { // 검색창에 enter키가 눌리면...(엔터의 키코드는 13)
													var json = new Object();
													json.command = "oldList";
													json.name = name;

													var data = {
														jsonData : JSON
																.stringify(json)
													}

													$
															.ajax({

																type : "POST",
																url : "Modify.do",
																dataType : "json",
																data : data,

																success : function(
																		data) {
																	resultData = data;
																	console
																			.log(JSON
																					.stringify(data));
																	//alert(data[0].id+" /// " + data.length);

																	$(
																			'#tbBodyList')
																			.empty(); // 기존 목록을 지워주고,

																	//db에서 넘겨받은 내용 출력부분
																	if (data.length > 0) {
																		//alert("data str >> " + JSON.stringify(data));
																		$
																				.each(
																						data,
																						function(
																								i) {
																							var contents = '';
																							var infoString = ""
																									+ data[i].id
																									+ " / "
																									+ data[i].name
																									+ " / "
																									+ data[i].birth
																									+ " / "
																									+ data[i].address;

																							contents += '<tr class="info" name="info">';
																							contents += '<td>'
																									+ infoString
																									+ '</td>';
																							contents += '</tr>';

																							$(
																									'#tbBodyList')
																									.append(
																											contents);
																						})

																	} else {
																		var contents = '';
																		var infoString = "검색 결과가 없습니다.";

																		contents += '<tr class="info" name="info">';
																		contents += '<td>'
																				+ infoString
																				+ '</td>';
																		contents += '</tr>';

																		$(
																				'#tbBodyList')
																				.append(
																						contents);
																	}
																},
																error : function(
																		e) {
																	alert('서버 연결 도중 에러 발생. 다시 시도해 주십시오.');
																}
															})

												}
											});

							$(".tbList").delegate(
									"tr.info",
									"click",
									function() {
										var num = $('.info').index(this);
										var data = resultData;
										oldId = data[num].id;
										//alert(data);
										// alert(num); // 동적 생성한테이블의 index를 넘겨받았다.
										/*
											DB에서 검색한 어레이리스트를 순서대로 뿌려줬을 것이다.
											때문에 인덱스로 어레이 리스트의 정보를 꺼내서 화면에 뿌려주면 된다.
											혹은 ajax로 인덱스의 고객번호를 통해 정보를 마저 검색해 뿌려주자.
										 */
										$('#name')
												.attr('value', data[num].name);
										$('#birth').attr('value',
												data[num].birth);
										$('#address').attr('value',
												data[num].address);
										$('#tel').attr('value', data[num].tel);
										$('#famTel').attr('value',
												data[num].famTel);
										$('#special').attr('value',
												data[num].special);
										$('#famId').attr('value',
												data[num].famId);
									});

							$('#cancel').click(function() {
								$('.input').attr('value', "");
							});

							$("#modify")
									.click(
											function() {
												//alert("modify start");
												var json = new Object();

												json.command = "modify";
												json.oldId = oldId;
												json.data = $("#modifyForm")
														.serializeObject();

												var data = {
													jsonData : JSON
															.stringify(json)
												}
												//alert(JSON.stringify(data));

												//form의 정보를 servlet으로 전송하는 코드.
												$
														.ajax({

															url : "Modify.do",
															type : "POST",
															dataType : "json",
															data : data,

															success : function(
																	data) {
																if (data == 200) {
																	$(".input")
																			.val(
																					"");
																	$(
																			'#tbBodyList')
																			.empty();
																	var contents = '';
																	var infoString = "먼저 이름을 검색하시기 바랍니다.";

																	contents += '<tr class="info" name="info">';
																	contents += '<td>'
																			+ infoString
																			+ '</td>';
																	contents += '</tr>';

																	$(
																			'#tbBodyList')
																			.append(
																					contents);
																	alert("수정 완료.");
																} else if (404) {
																	alert("수정에 실패했습니다..");
																}
															},
															error : function(e) {
																alert('서버 연결 도중 에러 발생. 다시 시도해 주십시오.');
															}
														})
											});

							jQuery.fn.serializeObject = function() {
								//form의 내용을 직렬화해주는 메소드.
								var obj = null;
								try {
									if (this[0].tagName
											&& this[0].tagName.toUpperCase() == "FORM") {
										var arr = this.serializeArray();
										if (arr) {
											obj = {};
											jQuery.each(arr, function() {
												obj[this.name] = this.value;
											});
										}//if ( arr ) {
									}
								} catch (e) {
									alert(e.message);
								} finally {
								}
								return obj;
							};
						});
	</script>
</body>
</html>