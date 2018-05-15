<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<style type="text/css">


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

.searchForm {
	display: inline-block;
	width: 190px;
	height: 7.4%;
	margin-left: 3%;
	background-repeat: no-repeat;
	float: left;
}

h2 {
	display: inline-block;
	margin: 10px; 
	margin-left: 5%;
	color: #424242;"
}

h5 {
	display: inline-block;
	float: left;
	margin: 0px;
	margin-top: 1.5%;
	margin-left: 3%;
	color: #424242;
	
}

legend {
	color: #424242;
}

input {
	border: none;
}

table.tbList {
	clear: left;
	border-collapse: collapse;
	text-align: left;
	line-height: 0.7;
	font-family: 'NanumSquareRound', sans-serif;
	text-align: left;
	width: 450px;
	margin: auto;
}

table.tbList thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.tbList tbody th {
	width: 300px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.tbList td {
	width: 600px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.info:hover {
	background-color: #ffffff;
}

fieldset {
	clear: both;
	font-size: 1em;
	line-height: 2em;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@include file="Top.jsp"%>

	<div id="container">
		<h1 style="width: auto;">관리대상 배정</h1><br>
		<div class="card" style="clear: both; float: left;">
		<br>
			<div class="searchForm"	style="background: URL(imgSearchForm.png);">
				<input type="text" placeholder="관리자ID 입력" name="search" id="searchManager" style="margin-left: 24%; height: 20px; width: 134px; margin-top: 3.4%;">
			</div>
			 <h5 style="display: inline-block; float: left; margin-top: 1.5%; margin-left: 3%;">※개인은 아이디,<br> &nbsp; &nbsp; 기관은 관리번호로 검색해주세요.</h5>
			 <br>
			 <fieldset id="managerInfo">
				<legend style="margin-left: 10%;">관리자 정보</legend>
				ID : <span id="manId"></span><br>
				성명 : <span id="manName"></span><br>
				생년월일 : <span id="manBirth"></span><br>
				Tel : <span id="manTel"></span><br>
			</fieldset>
			<h5>※ 독거노인 담당자 등록 시, 자격있는 대상인지 확인하시기 바랍니다.</h5><br>
			<br>
			<div class="searchForm"	style="background: URL(imgSearchForm.png);">
				<input type="text" placeholder="노인 등록번호 입력" name="search" id="searchOld" style="margin-left: 24%; height: 20px; width: 134px; margin-top: 4%;">
			</div>
			<br>
			<fieldset id="oldInfo">
				<legend style="margin-left: 10%;">대상노인 정보</legend>
				성명 : <span id="oldName"></span><br>
				생년월일 : <span id="oldBirth"></span><br>
				주소 : <span id="oldAddress"></span><br>
				Tel : <span id="oldTel"></span><br>
			</fieldset>
			<br>
			<div id="divBtn"style="width: 75%; height: 9%; margin: auto; float: right;">
				<div class="button-1" id="btnCancel" style=" margin: 0 0 0 10px;">
					<div class="eff-1"></div>
					<a href="#" id="cancel">취소</a>
				</div>
				<div class="button-1" id="btnAssignment" style=" margin: 0 0 0 10px;">
					<div class="eff-1"></div>
					<a href="" id="assign">등록</a>
				</div>
			</div>
		</div>
		<div class="card" style="float: left; box-sizing: border-box;">
			<h2 style="float: left;">담당노인 목록</h2><h5 style="float: left;">※목록을 클릭해<br> &nbsp; &nbsp; 담당설정을 취소할 수 있습니다.</h5><br>
			<table class="tbList">
				<thead>
					<tr>
						<th scope="cols"><h5>※ 담당자의 관리노인 목록입니다.</h5></th>
					</tr>
				</thead>
				<tbody id="tbBodyList">
					<tr>
						<td>먼저 관리자ID로 검색을 하시기 바랍니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			var oldInfo;
			var manInfo;
			var searchOldInfo;
			
			$('#searchManager').keydown(function(e){
				if(e.which == 13) {
					var id = $('#searchManager').val();					
					//alert(id);
					// 1. id로 DB에서 해당 관리자 아이디 정보 긁어와 화면에 출력하는 코드 작성 필요.
					/* 1. */
					var json = new Object();
					json.command = "managerInfo";
					json.id = id;
					var data = {
							jsonData : JSON.stringify(json)
					}
					
					$.ajax({
						
						url : "Assign.do",
						type : "POST",
						dataType : "json",
						data : data,
						
						success : function(data){
							//alert(typeof data.manInfo );
							if (!$.isEmptyObject(data) && !$.isEmptyObject(data.manInfo)) {
								//alert("data str >> " + JSON.stringify(data));
								manInfo = data.manInfo;
								oldInfo = data.oldInfo;
								
								$('#manId').html(manInfo.id);
								$('#manName').html(manInfo.name);
								$('#manBirth').html(manInfo.birth);
								$('#manTel').html(manInfo.tel);
								
								/* $('#manId').html(data.id);
								$('#manName').html(data.name);
								$('#manBirth').html(data.birth);
								$('#manTel').html(data.tel); */	
								
								if(oldInfo.length > 0){
									//alert("oldInfo.length >> " + oldInfo.length);
									//alert("oldInfo String >> " + JSON.stringify(oldInfo));
									$('#tbBodyList').empty();
									$.each(oldInfo, function(i){
										// 2. 해당 id에 등록된 관리대상 정보를 data에 담는 코드 필요.
										/* 2. */
										var contents = '';
										var infoString = "" + oldInfo[i].id + " / " + oldInfo[i].name + " / " + oldInfo[i].birth + " / " + oldInfo[i].address;
										
										contents += '<tr class="info" name="info">';
										contents += '<td>' + infoString + '</td>';
										contents += '</tr>';
										
										$('#tbBodyList').append(contents);
									})									
								}else {
									var contents = '';
									$('#tbBodyList').empty();
									//var infoString = "" + oldInfo[i].id + " / " + oldInfo[i].name + " / " + oldInfo[i].birth + " / " + oldInfo[i].address;
									
									contents += '<tr class="info" name="info">';
									contents += '<td>' + "배정된 노인 정보가 없습니다." + '</td>';
									contents += '</tr>';
									
									$('#tbBodyList').append(contents);
								}
							}else {
								alert("등록된 담당자 정보가 없습니다.");
							}					
						},
						error : function(e){
							alert("연결 실패.");
						}
					})			
				}
			})
			
			$('#searchOld').keydown(function(e){
				if(e.which == 13) {
					var id = $('#searchOld').val();
					//alert(id);
					var json = new Object();
					json.command = "searchOld";
					json.id = id;
					
					var data = {
							jsonData : JSON.stringify(json)
					}
					
					$.ajax({
						
						url : "Assign.do",
						type : "POST",
						dataType : "json",
						data : data,
						
						success : function(data){
							searchOldInfo = data;
							//alert($.isEmptyObject(data.famId));
							// 정보 가져와서 famid가 비어있으면 뿌려준다. 있으면 경고.
							if($.isEmptyObject(data.famId)){
								$('#oldName').html(data.name);
								$('#oldBirth').html(data.birth);
								$('#oldAddress').html(data.address);
								$('#oldTel').html(data.tel);	
							}else {
								alert("담당이 설정된 등록번호입니다.");
							}
							
						},
						error : function(e){
							
						}
					})
					
				}
			})
			
			$(".tbList").delegate("tr.info", "click", function(){
				var num = $('.info').index(this);
				//alert("num >> " + num);
				
				//var data = oldList;
				//alert("번호" + num + " /// oldList.id >> " + oldInfo[num].id);
				if(confirm("관리번호 " + oldInfo[num].id + "번 "+ oldInfo[num].name + "님의 등록을 해제하시겠습니까?")){
					//oldInfo.splice(num, 1);
					var json = new Object();
					json.command = "Unassigned";
					json.id = oldInfo[num].id;
					var data = {
							jsonData : JSON.stringify(json)
					}
					
					//alert(JSON.stringify(json));
					
					$.ajax({
						
						url : "Assign.do",
						type : "POST",
						dataType : "json",
						data : data,
						
						success : function(result){
							if (result == 200) {
								//oldInfo = oldInfo.splice(num, 1);
								// 설정해제 후 TABLE에서도 지워줘야하는데 안되고 있다.
								//alert("값 삭제된 oldInfo >> " + JSON.stringify(oldInfo));
								//alert(JSON.stringify("삭제 전 >> " + oldInfo));
								//alert(JSON.stringify("삭제 후 >> " + oldInfo));
								
								$('#tbBodyList').empty();
								var id = $('#searchManager').val();	
								var json = new Object();
								json.command = "managerInfo";
								json.id = id;
								var data = {
										jsonData : JSON.stringify(json)
								}
								
								$.ajax({
									
									url : "Assign.do",
									type : "POST",
									dataType : "json",
									data : data,
									
									success : function(data){
										//alert(typeof data.manInfo );
										if (!$.isEmptyObject(data) && !$.isEmptyObject(data.manInfo)) {
											//alert("data str >> " + JSON.stringify(data));
											manInfo = data.manInfo;
											oldInfo = data.oldInfo;
											
											$('#manId').html(manInfo.id);
											$('#manName').html(manInfo.name);
											$('#manBirth').html(manInfo.birth);
											$('#manTel').html(manInfo.tel);
											
											/* $('#manId').html(data.id);
											$('#manName').html(data.name);
											$('#manBirth').html(data.birth);
											$('#manTel').html(data.tel); */	
											
											if(oldInfo.length > 0){
												//alert("oldInfo.length >> " + oldInfo.length);
												//alert("oldInfo String >> " + JSON.stringify(oldInfo));
												$('#tbBodyList').empty();
												$.each(oldInfo, function(i){
													// 2. 해당 id에 등록된 관리대상 정보를 data에 담는 코드 필요.
													/* 2. */
													var contents = '';
													var infoString = "" + oldInfo[i].id + " / " + oldInfo[i].name + " / " + oldInfo[i].birth + " / " + oldInfo[i].address;
													
													contents += '<tr class="info" name="info">';
													contents += '<td>' + infoString + '</td>';
													contents += '</tr>';
													
													$('#tbBodyList').append(contents);
												})									
											}else {
												var contents = '';
												$('#tbBodyList').empty();
												//var infoString = "" + oldInfo[i].id + " / " + oldInfo[i].name + " / " + oldInfo[i].birth + " / " + oldInfo[i].address;
												
												contents += '<tr class="info" name="info">';
												contents += '<td>' + "배정된 노인 정보가 없습니다." + '</td>';
												contents += '</tr>';
												
												$('#tbBodyList').append(contents);
											}
										}else {
											alert("등록된 담당자 정보가 없습니다.");
										}					
									},
									error : function(e){
										alert("연결 실패.");
									}
								})
								alert("담당설정 해제.");
								
							}else {
								alert("담당설정 해제 실패.");
							}
						},
						error : function(e){
							alert("연결 실패.");
						}
					})	
				}
				// num의 정보를 읽어와 담당자에게서 해당 노인의 배정을 취소하는 코드 필요.
			})
			$("#cancel").click(function(){
				$("#oldInfo span").html("");
				$("#managerInfo span").html("");
				$("input[name=search]").val("");
				$("#tbBodyList").empty();
			})
			$("#assign").click(function(){
				
				if (confirm("관리번호 " + searchOldInfo.id + "번 " + searchOldInfo.name + "님을 위 담당자에게 배정하시겠습니까?")) {
					var json = new Object();
					json.command = "assign";
					json.manId = manInfo.id; 
					json.oldId = searchOldInfo.id;
					
					//alert(JSON.stringify(json));
					var data = {
							jsonData : JSON.stringify(json)
					}
					
					$.post("Assign.do", data, function(result){
						alert("Assign result?");
						// 서버로 post방식으로 담당id와 노인id전송하고 famid 등록하자.
						if (result == 200) {
							alert("배정 완료");
						}else {
							alert("배정 실패");
						}
					})
				}
			})
		})	
	</script>
</body>
</html>