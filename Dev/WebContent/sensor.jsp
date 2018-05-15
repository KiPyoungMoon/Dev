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
	height: 680px;
	margin: auto;
	box-sizing: border-box;
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

h2 {
	display: inline-block;
	margin: 10px;
	margin-left: 5%;
	color: #424242;
	"
}

h3, h4 {
	display: inline-block;
	margin: 10px;
	margin-left: 5%;
	color: #424242;
}

#addSenForm div {
	display: block;
	width: 90%;
	height: 50px;
	margin: auto;
	margin-top: 1%;
	margin-bottom: 1%;
	float: left;
}

#addSenForm>div label {
	font-family: 'NanumSquareRound', sans-serif;
	font-weight: 800;
	width: 29%;
	color: #424242;
	display: inline-block;
	box-sizing: border-box;
}

#addSenForm input[type="text"] {
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
/* div {
	border: 1px dotted red;
} */
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@include file="Top.jsp"%>
	<div id="container">
		<h1 style="width: auto;">���� ���</h1>
		<br>
		<div class="card" style="clear: both; float: left;">
			<h2 style="margin-top: 6%;">������� ��� ���</h2>
			<h4>
				<ol>
					<li>������� ��ġ�� ������ ���̵� �Է�</li>
					<br>
					<li>��������� MAC�� �Է�</li>
					<br>
					<li>��������� ������ �Է�</li>
					<br>
					<li>��� ��ư Ŭ��</li>
					<br>
				</ol>
			</h4>
		</div>
		<div class="card" style="float: left;">
			<!-- <h2 style="margin-top: 4%;"></h2> -->
			<fieldset style="margin-top: 4%">
				<legend>������� ���</legend>
				<br>
				<form action="" id="addSenForm">
					<div>
						<label for="oldId">������� ID :</label><input type="text"
							class="input" name="oldId" id="oldId" placeholder="������� ID">
					</div>
					<div>
						<label for="mac">MAC : </label><input type="text" class="input"
							name="mac" id="mac" placeholder="MAC ADDRESS">
					</div>
					<div>
						<label for="kinds">������� ���� :</label><input type="text"
							class="input" name="kinds" id="kinds" placeholder="������� ����">
					</div>

				</form>
			</fieldset>
			<div id="divBtn"
				style="width: 68%; height: 12%; margin: auto; margin-top: 2%">
				<div class="button-1">
					<div class="eff-1"></div>
					<a href="#" id="cancel">���</a>
				</div>
				<div class="button-1">
					<div class="eff-1"></div>
					<a href="#" id="regist">���</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#cancel").click(function() {
				$(".input").val('');
			})

			$("#regist").click(function() {
				var json = new Object();
				//json.command = "regSen";
				json.data = $("#addSenForm").serializeObject();

				var data = {
					jsonData : JSON.stringify(json)
				}
				//alert(JSON.stringify(json));

				$.ajax({

					url : "regSen.do",
					type : "POST",
					dataType : "json",
					data : data,

					success : function(data) {
						if (data == 200) {
							alert("��Ͽ� �����߽��ϴ�.");
							// �� ����ȭ ������ ������ �ִ°Ű���
						}
					}
				})
			})
			
			jQuery.fn.serializeObject = function() {
			    //form�� ������ ����ȭ���ִ� �޼ҵ�.
				var obj = null;
			    try {
			        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
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
		})
	</script>
</body>
</html>