<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
<title>BLOG</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/class.css">
</head>
<style>
    
</style>
<body>
    <div id="body">
        <%@ include file="/layout/header.jsp" %>
        <article id="section">
            <div id="aside">
                <div id="category">
                    <div id="profile">
                        <div id="profile_one">
                            <div style="width:150px;height:150px;background-color: aqua;">프로필</div>
                        </div>
                        <div id="profile_two">
                            <ul class="list_style">
                                <li><span class="black under_none">별명</span>
                                <li><span class="black under_none">등급</span>
                                <li><span class="black under_none">프로필</span>
                                <li></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div id="profile2">
                        <span style="font-size:30px;" class="black">게시글</span>
                        <ul class="list_style" style="margin-top:8px;">
                            <li class=""style="margin-bottom:5px;"><a href="#" class="black under_none bold" >공지사항</a></li> 
                            
                            <span>
                            	<li class="" style="margin-bottom:5px;"><a href="#" class="black under_none bold" id="sports">스포츠</a></li>
	                             <span class="nav_toggle">  
	                                <ul class="list_style nav_list nav_toggle">
	                                    <li><a href="#">→ 농구</a></li>
	                                    <li><a href="#">→ 축구</a></li>
	                                    <li><a href="#">→ 야쿠</a></li>
	                                </ul>
	                             </span>
                            </span>
                            <span>
	                            <li class="" style="margin-bottom:5px;"><a href="#" id="taste" class="black under_none bold">맛집탐방</a></li>
	                            <span class="nav_toggle">   
	                                <ul class="list_style nav_list2">
	                                    <li><a href="#">→ 서울</a></li>
	                                    <li><a href="#">→ 부산</a></li>
	                                    <li><a href="#">→ 경기도</a></li>
	                                    <li><a href="#">→ 전라도</a></li>
	                                    <li><a href="#">→ 강원도</a></li>
	                                    <li><a href="#">→ 충청도</a></li>
	                                </ul>
	                            </span>
                            </span>
                        </ul>
                    </div>
                </div>
            </div>

            <div id="article">
                <div style="margin-top: 50px;"></div>
                <div id="content">
                    <div id="board_p">
                        <h3 style="text-align: center; margin-bottom: 10px;">인기 게시글</h3>
                        <div class="board_h" style="border: 1px solid black;">
                            <table border="1" style="text-align: center;">
                                <colgroup>
                                    <col width="300px" height="100px;">
                                    <col width="100px">
                                    <col width="200px">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
                                    </tr>
                                </thead>
                                <tbody class="for_table">
                                </tbody>
                            </table>
                            <span>+더보기</span>
                        </div>
                        <div class="board_h" style="border: 1px solid black;">
                            <h3 style="text-align: center; margin-bottom: 10px;">최신 게시글</h3>
                            <table border="1" style="text-align: center;">
                                <colgroup>
                                    <col width="300px" height="100px;">
                                    <col width="100px">
                                    <col width="200px">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
                                    </tr>
                                </thead>
                                <tbody class="for_table">
                                </tbody>
                            </table>
                            <span>+더보기</span>
                        </div>
                    </div>
                </div>
            </div>

            <div id="aside-right">
                asdasd
            </div>
        </article>

        <%@ include file="/layout/footer.jsp" %>
    </div>
    <script>

    var tbody = "";
    
    for(var i=0; i < 5; i++) {
        tbody = "<tr>";
        tbody += "<td>축구동아리${i}</td>";
        tbody += "<td>김기명${i}</td>";
        tbody += "<td>2020-10-30</td>";
        tbody += "<td>99</td>";
        tbody += "</tr>";
        
        $('.for_table').append(tbody);
    }

    $(document).ready(function() {

        $('#sports').click(function() {
            $('.nav_list').toggle();
        })
        $('#taste').click(function() {
            $('.nav_list2').toggle();
        })
    });
        
    </script>
</body>
</html>