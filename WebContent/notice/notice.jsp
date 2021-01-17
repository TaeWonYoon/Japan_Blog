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
	<h3 align=center>悪口と誹謗する文は使わないようにしましょう。</h3>
	<br>
	<div style="color:black; text-align:center;font-size:17px;font-weight:600;">
		他人に迷惑をかける行動は一切 <u>禁止</u>!!<br>
		お互いに役に立つ文を書きましょう。<br>
		継続的に悪行をした場合は警告1回<br>
		それでも持続する場合 <font color="red"><b>永久停止の対象となる</b></font> 可能性があります。
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