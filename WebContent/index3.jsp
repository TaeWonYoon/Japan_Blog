<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>

</style>
<body>
<%@ include file="/layout/header.jsp" %>

    <div id="body">
        <article id="section" class="b_g">
            <div id="aside">
                   <div id="profile" class="b_g">
                   	  <span class="m-l" style="font-weight:bold;font-size:17px;margin-bottom:6px;">私の情報</span>
                      <ul class="list_style">
                      	  <li>
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
                      	  </li>
                      	  <%if(id.equals("") || id == null) {%>
                      	  	  <li><a href="#" class="black under_none m-l" style="font-size:18px;">別名</a> : <span></span></li>
	                          <li><a href="#" class="black under_none m-l" style="font-size:18px;">等級</a> : <span></span></li>
	                          <li><a href="#" class="black under_none m-l" style="font-size:18px;">アイディ</a> : <span></span></li>
                      	  <%} else {%>
	                      	   <li><a href="#" class="black under_none m-l" style="font-size:18px;">別名</a> : <span><%=nickName %></span></li>
	                          <li><a href="#" class="black under_none m-l" style="font-size:18px;">等級</a> : <span><%=grade %></span></li>
	                          <li><a href="#" class="black under_none m-l" style="font-size:18px;">アイディ</a> : <span><%=id %></span></li>
                      	  <%} %>
                      </ul>
                    </div>
                    <div id="profile2">
                        <ul class="list_style">
                            <li class="l_b"><a href="###" class="blue under_none" style="font-weight:bold;">BLOGの紹介</a></li>
                            <li class="l_b"><a href="###" id="n_b" class="blue under_none" target="_blank" style="font-weight:bold;font-size:17px;">お知らせ事項 <font color="red">よんでください。!!</font></a></li>
                            <li class="l_b"><a href="###" class="blue under_none" id="sports" style="font-weight:bold;">文の目録</a></li>
	                        	<li class="p2_menu"><a href="/board/list.jsp?boardHobby=exercise" class="d_pink">→ 運動</a></li>
	                            <li class="p2_menu"><a href="/board/list.jsp?boardHobby=taste" class="d_pink">→ グルメ店</a></li>
	                            <li class="p2_menu"><a href="/board/list.jsp?boardHobby=suda" class="d_pink">→ おしゃべり</a></li>
	                          
                        </ul>
                        <br><br>
                        <h3 class="l_b" style="position: relative;bottom:-20px;">マナーを守ってください。!!!!!!</h3>
                    </div>
            </div>

            <div id="article">
                <div style="margin-top: 30px;"></div>
                <div id="content">
                    <div id="board_p">
                        <h3 style="text-align: center; margin-bottom: 10px;font-size:21px;">人気の文</h3>
                        <div>
                            <table border="1" style="text-align: center;">
                                <colgroup>
                                    <col width="50px">
                                    <col width="100px">
                                    <col width="300px">
                                    <col width="110px">
                                    <col width="200px">
                                    <col width="100px">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>順位</th><th>趣味</th><th>題目</th><th>作成者</th><th>日付</th><th>照会数</th>
                                </tr>
                                </thead>
                                <tbody>
                            <%@ include file="/db/DB.jsp" %>
                            <%@ include file="/db/index_best.jsp" %>
                                </tbody>
                            </table>
                            <span><a href="http://localhost:8080/board/list_bn.jsp?boardbn=best" class="black under_none bn">+もっと見る</a></span>
                        </div>
                    </div>
                    <div id="board_p">
                        <h3 style="text-align: center; margin-bottom: 10px;font-size:21px;">最近の文</h3>
                        <div>
                            <table border="1" style="text-align: center;">
                                <colgroup>
                                    <col width="50px">
                                    <col width="100px">
                                    <col width="300px">
                                    <col width="110px">
                                    <col width="200px">
                                    <col width="100px">
                                </colgroup>
                                <thead>
	                                <tr>
	                                    <th>順位</th><th>趣味</th><th>題目</th><th>作成者</th><th>日付</th><th>照会数</th>
	                                </tr>
                                </thead>
                                <tbody>
                          			<%@ include file="/db/index_new.jsp" %>
                                </tbody>
                            </table>
                            <span><a href="http://localhost:8080/board/list_bn.jsp?boardbn=bnew" class="black under_none bn">+もっと見る</a></span>
                        </div>
                    </div>
                </div>
            </div>

            <div id="aside-right">
            <br><br><br>
                <img src="./img/a.jpg" alt="사진없음" width="260" height="300"/>
            <br><br><br><br><br><br>
                <img src="./img/b.png" alt="사진없음" width="260" height="300"/>
            </div>
        </article>

        <%@ include file="/layout/footer.jsp" %>
    </div>
    <script>
    $("#n_b").click(function() {
    	window.open("./notice/notice.jsp","", "resizable=yes,left=10,top=250,left=250,width=400,height=400");
    })
    <%--
        $("#header").load("header.html");
        $("#footer").load("footer.html");
	--%>
	<%--
        $('#sports').click(function() {
            $('.nav_list').toggle();
        })
        $('#taste').click(function() {
            $('.nav_list2').toggle();
        });
        --%> 
    </script>
</body>
</html>