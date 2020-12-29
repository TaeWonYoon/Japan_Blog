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
                   	  <span class="m-l" style="font-weight:bold;font-size:17px;margin-bottom:6px;">내정보</span>
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
                      	  <%if(id != null) {%>
	                          <li><a href="#" class="black under_none m-l" style="font-size:18px;">별명</a> : <span><%=nickName %></span></li>
	                          <li><a href="#" class="black under_none m-l" style="font-size:18px;">등급</a> : <span><%=grade %></span></li>
	                          <li><a href="#" class="black under_none m-l" style="font-size:18px;">아이디</a> : <span><%=id %></span></li>
                      	  <%} else {%>
	                      	  <li><a href="#" class="black under_none m-l" style="font-size:18px;">별명</a> : <span></span></li>
	                          <li><a href="#" class="black under_none m-l" style="font-size:18px;">등급</a> : <span></span></li>
	                          <li><a href="#" class="black under_none m-l" style="font-size:18px;">아이디</a> : <span></span></li>
                      	  <%} %>
                      </ul>
                    </div>
                    <div id="profile2">
                        <ul class="list_style">
                            <li class="l_b"><a href="###" class="blue under_none" style="font-weight:bold;">BLOG소개</a></li>
                            <li class="l_b"><a href="###" id="n_b" class="blue under_none" target="_blank" style="font-weight:bold;">공지사항 꼭 <font color="red">읽어보시오!!</font></a></li>
                            <li class="l_b"><a href="###" class="blue under_none" id="sports" style="font-weight:bold;">글 목록</a></li>
	                        	<li class="p2_menu"><a href="/board/list.jsp?boardHobby=exercise" class="d_pink">→ 운동</a></li>
	                            <li class="p2_menu"><a href="/board/list.jsp?boardHobby=taste" class="d_pink">→ 맛집</a></li>
	                            <li class="p2_menu"><a href="/board/list.jsp?boardHobby=suda" class="d_pink">→ 수다</a></li>
	                          
                        </ul>
                        <br><br>
                        <h3 class="l_b" style="position: relative;bottom:-20px;">매너를 추구합니다!!!!!!</h3>
                    </div>
            </div>

            <div id="article">
                <div style="margin-top: 30px;"></div>
                <div id="content">
                    <div id="board_p">
                        <h3 style="text-align: center; margin-bottom: 10px;">인기 게시글</h3>
                        <div>
                            <table border="1" style="text-align: center;">
                                <colgroup>
                                    <col width="50px">
                                    <col width="70px">
                                    <col width="300px">
                                    <col width="110px">
                                    <col width="200px">
                                    <col width="100px">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>순위</th><th>취미</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
                                </tr>
                                </thead>
                                <tbody>
                            <%@ include file="/db/DB.jsp" %>
                            <%@ include file="/db/index_best.jsp" %>
                                </tbody>
                            </table>
                            <span><a href="http://localhost:8080/board/list_bn.jsp?boardbn=best" class="black under_none bn">+더보기</a></span>
                        </div>
                    </div>
                    <div id="board_p">
                        <h3 style="text-align: center; margin-bottom: 10px;">최신게시물 게시글</h3>
                        <div>
                            <table border="1" style="text-align: center;">
                                <colgroup>
                                    <col width="50px">
                                    <col width="70px">
                                    <col width="300px">
                                    <col width="110px">
                                    <col width="200px">
                                    <col width="100px">
                                </colgroup>
                                <thead>
	                                <tr>
	                                    <th>순위</th><th>취미</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
	                                </tr>
                                </thead>
                                <tbody>
                          			<%@ include file="/db/index_new.jsp" %>
                                </tbody>
                            </table>
                            <span><a href="http://localhost:8080/board/list_bn.jsp?boardbn=bnew" class="black under_none bn">+더보기</a></span>
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