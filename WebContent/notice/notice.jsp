<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.button {
	  background-color: #4CAF50;
	  border: none;
	  color: white;
	  padding: 15px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  cursor: pointer;
	  border-radius: 6px;
	}
	.button:hover {
		background-color:#95d097;
	}
</style>
</head>
<body bgcolor="#ccf2ff">
	<h3 align=center>욕설과 비방하는 글은 사용하지맙시다.</h3>
	<br>
	<div style="color:#666600; text-align:center;font-size:17px;font-weight:600;">
		타인에게 피해가 가는 행동은 일절 <u>금지</u>!!<br>
		서로 도움이 되는 글을 사용하시기 바랍니다.<br>
		지속적으로 악행을 할 때는  경고1회 <br>
		그래도 지속할 경우 <font color="red"><b>영구정지 대상이</b></font> 될 수 있습니다
	</div><br><br><br><br>
	<div style="text-align:center">
		<button class="button" onclick="btn_close()">닫기</button>
	</div>
	
	
<script>
		function btn_close() {
			window.close();
		}
</script>

</body>
</html>