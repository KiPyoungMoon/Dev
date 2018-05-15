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
		<h1 style="width: auto;">������� ����</h1><br>
		<div class="card" style="clear: both; float: left;">
		<br>
			<div class="searchForm"	style="background: URL(imgSearchForm.png);">
				<input type="text" placeholder="������ID �Է�" name="search" id="searchManager" style="margin-left: 24%; height: 20px; width: 134px; margin-top: 3.4%;">
			</div>
			 <h5 style="display: inline-block; float: left; margin-top: 1.5%; margin-left: 3%;">�ذ����� ���̵�,<br> &nbsp; &nbsp; ����� ������ȣ�� �˻����ּ���.</h5>
			 <br>
			 <fieldset id="managerInfo">
				<legend style="margin-left: 10%;">������ ����</legend>
				ID : <span id="manId"></span><br>
				���� : <span id="manName"></span><br>
				������� : <span id="manBirth"></span><br>
				Tel : <span id="manTel"></span><br>
			</fieldset>
			<h5>�� ���ų��� ����� ��� ��, �ڰ��ִ� ������� Ȯ���Ͻñ� �ٶ��ϴ�.</h5><br>
			<br>
			<div class="searchForm"	style="background: URL(imgSearchForm.png);">
				<input type="text" placeholder="���� ��Ϲ�ȣ �Է�" name="search" id="searchOld" style="margin-left: 24%; height: 20px; width: 134px; margin-top: 4%;">
			</div>
			<br>
			<fieldset id="oldInfo">
				<legend style="margin-left: 10%;">������ ����</legend>
				���� : <span id="oldName"></span><br>
				������� : <span id="oldBirth"></span><br>
				�ּ� : <span id="oldAddress"></span><br>
				Tel : <span id="oldTel"></span><br>
			</fieldset>
			<br>
			<div id="divBtn"style="width: 75%; height: 9%; margin: auto; float: right;">
				<div class="button-1" id="btnCancel" style=" margin: 0 0 0 10px;">
					<div class="eff-1"></div>
					<a href="#" id="cancel">���</a>
				</div>
				<div class="button-1" id="btnAssignment" style=" margin: 0 0 0 10px;">
					<div class="eff-1"></div>
					<a href="" id="assign">���</a>
				</div>
			</div>
		</div>
		<div class="card" style="float: left; box-sizing: border-box;">
			<h2 style="float: left;">������ ���</h2><h5 style="float: left;">�ظ���� Ŭ����<br> &nbsp; &nbsp; ��缳���� ����� �� �ֽ��ϴ�.</h5><br>
			<table class="tbList">
				<thead>
					<tr>
						<th scope="cols"><h5>�� ������� �������� ����Դϴ�.</h5></th>
					</tr>
				</thead>
				<tbody id="tbBodyList">
					<tr>
						<td>���� ������ID�� �˻��� �Ͻñ� �ٶ��ϴ�.</td>
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
					// 1. id�� DB���� �ش� ������ ���̵� ���� �ܾ�� ȭ�鿡 ����ϴ� �ڵ� �ۼ� �ʿ�.
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
										// 2. �ش� id�� ��ϵ� ������� ������ data�� ��� �ڵ� �ʿ�.
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
									contents += '<td>' + "������ ���� ������ �����ϴ�." + '</td>';
									contents += '</tr>';
									
									$('#tbBodyList').append(contents);
								}
							}else {
								alert("��ϵ� ����� ������ �����ϴ�.");
							}					
						},
						error : function(e){
							alert("���� ����.");
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
							// ���� �����ͼ� famid�� ��������� �ѷ��ش�. ������ ���.
							if($.isEmptyObject(data.famId)){
								$('#oldName').html(data.name);
								$('#oldBirth').html(data.birth);
								$('#oldAddress').html(data.address);
								$('#oldTel').html(data.tel);	
							}else {
								alert("����� ������ ��Ϲ�ȣ�Դϴ�.");
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
				//alert("��ȣ" + num + " /// oldList.id >> " + oldInfo[num].id);
				if(confirm("������ȣ " + oldInfo[num].id + "�� "+ oldInfo[num].name + "���� ����� �����Ͻðڽ��ϱ�?")){
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
								// �������� �� TABLE������ ��������ϴµ� �ȵǰ� �ִ�.
								//alert("�� ������ oldInfo >> " + JSON.stringify(oldInfo));
								//alert(JSON.stringify("���� �� >> " + oldInfo));
								//alert(JSON.stringify("���� �� >> " + oldInfo));
								
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
													// 2. �ش� id�� ��ϵ� ������� ������ data�� ��� �ڵ� �ʿ�.
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
												contents += '<td>' + "������ ���� ������ �����ϴ�." + '</td>';
												contents += '</tr>';
												
												$('#tbBodyList').append(contents);
											}
										}else {
											alert("��ϵ� ����� ������ �����ϴ�.");
										}					
									},
									error : function(e){
										alert("���� ����.");
									}
								})
								alert("��缳�� ����.");
								
							}else {
								alert("��缳�� ���� ����.");
							}
						},
						error : function(e){
							alert("���� ����.");
						}
					})	
				}
				// num�� ������ �о�� ����ڿ��Լ� �ش� ������ ������ ����ϴ� �ڵ� �ʿ�.
			})
			$("#cancel").click(function(){
				$("#oldInfo span").html("");
				$("#managerInfo span").html("");
				$("input[name=search]").val("");
				$("#tbBodyList").empty();
			})
			$("#assign").click(function(){
				
				if (confirm("������ȣ " + searchOldInfo.id + "�� " + searchOldInfo.name + "���� �� ����ڿ��� �����Ͻðڽ��ϱ�?")) {
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
						// ������ post������� ���id�� ����id�����ϰ� famid �������.
						if (result == 200) {
							alert("���� �Ϸ�");
						}else {
							alert("���� ����");
						}
					})
				}
			})
		})	
	</script>
</body>
</html>