<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLOG</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<style>
	.u_l {
		text-decoration: none !important;
	}
	.u_l:hover {
		font-weight: 800;
		color: #262626;
	}
	#n_b {
		cursor: pointer;
	}
</style>
</head>
<body>
<%@ include file="/layout/header.jsp" %>
<div class="row" style="height:800px;">
    
    <div class="col-xs-6 col-md-2" style="border-right: 3px solid #e6e6e6;">
        <div class="container">
            <div class="col-xs-6"style="height:350px">
                <span>会員情報</span><br><br>
                <% if(level == 1) {%>
           	  			<img src="./img/1.png" alt="" width="150" height="150" style="margin-left:45px;margin-bottom:10px;"/>
           	  	<%} else if(level == 2) {%>
           	  			<img src="./img/2.jpg" alt="" width="150" height="150" style="margin-left:45px;margin-bottom:10px;"/>
           	  	<%} else if(level == 3) {%>
           	  			<img src="./img/3.jpg" alt="" width="150" height="150" style="margin-left:45px;margin-bottom:10px;"/>
           	  	<%} else if(level == 4) {%>
           	  			<img src="./img/4.jpg" alt="" width="150" height="150" style="margin-left:45px;margin-bottom:10px;"/>
           	  	<%} else if(level == 5) {%>
           	  			<img src="./img/5.png" alt="" width="150" height="150" style="margin-left:45px;margin-bottom:10px;"/>
           	  	<%} else {%>
           	  			<img src="./img/a.jpg" alt="" width="150" height="150" style="margin-left:45px;margin-bottom:10px;"/>
           	  	<%}%>
           	  	<br>
                <%if(id.equals("") || id == null) {%>
                <span>別名 : </span><br>
                <span>ID : </span><br>
                <span>ランキング : </span>
                <%} else {%>
                <span>別名 : <%=nickName %></span><br>
                <span>ID : <%=id %></span><br>
                <span>ランキング :  <%=grade %></span>
                <%} %>
                <br>
                <hr style="border: 2px solid #e6e6e6;">
                <span style="font-size:14px;"><img src="./img/write.jpg" width="22"/><a href="./board/add.jsp" style="font-size:18px;">作成</a></span>
            </div>
            <div>
            	<hr style="border: 2px solid #e6e6e6;">
                <span><a href="###" class="u_l" style="font-weight:bold; font-size:22px;">ブログ紹介</a></span><br>
                <hr style="border: 2px solid #e6e6e6;">
                <span class="d_pink u_l" id="n_b">お知らせ </span><br>
                <hr style="border: 2px solid #e6e6e6;">
                <span><a href="/board/list.jsp?boardHobby=exercise" class="d_pink u_l" style="font-size:19px;">→ スポーツ</a></span><br>
                <span><a href="/board/list.jsp?boardHobby=taste" class="d_pink u_l" style="font-size:19px;">→ グルメ</a></span><br>
                <span><a href="/board/list.jsp?boardHobby=suda" class="d_pink u_l" style="font-size:19px;">→ おしゃべり</a></span>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-7" style="margin-left:70px;">
        <div>
            <h4 style="font-weight : bold;">人気トピックス</h4>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>順位</th><th>カテゴリー</th><th>タイトル</th><th>作成者</th><th>日付</th><th>照会数</th>
                    </tr>
                </thead>
                <tbody>
                   <%@ include file="/db/DB.jsp" %>
                   <%@ include file="/db/index_best.jsp" %>
                </tbody>
            </table>
            <span><a href="http://localhost:8080/board/list_bn.jsp?boardbn=best" class="black under_none bn" style="margin-left:480px">+もっと見る</a></span>
        </div>
        <br><br>
        <div>
            <h4 style="font-weight : bold;">最新トピックス</h4>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>順位</th><th>カテゴリー</th><th>タイトル</th><th>作成者</th><th>日付</th><th>照会数</th>
                    </tr>
                </thead>
                <tbody>
                   <%@ include file="/db/index_new.jsp" %>
                </tbody>
            </table>
            <span><a href="http://localhost:8080/board/list_bn.jsp?boardbn=best" class="black under_none bn" style="margin-left:480px">+もっと見る</a></span>
        </div>
    </div>
    <div class="col-xs-6 col-md-2">
    </div>
</div><br><br><br>
<%@ include file="/layout/footer.jsp" %>
<%@ include file="/layout/script.jsp" %>
<script>
$("#n_b").click(function() {
	window.open("./notice/notice.jsp","", "resizable=yes,left=10,top=250,left=250,width=400,height=400");
});
</script>
</body>
</html>