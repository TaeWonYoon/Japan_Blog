<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
<title>BLOG</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/class.css">
</head>
<style>
    
</style>
<body>
    <div id="body">
        <%@ include file="/header.jsp" %>
        <article id="section">
            <div id="aside">
                <div id="category">
                    <div id="profile">
                        <div id="profile_one">
                            <div style="width:150px;height:150px;background-color: aqua;">프로필</div>
                        </div>
                        <div id="profile_two">
                            <ul class="list_style">
                                <li><a href="#" class="black under_none">별명</a></li>
                                <li><a href="#" class="black under_none">등급</a></li>
                                <li><a href="#" class="black under_none">프로필</a></li>
                            </ul>
                        </div>
                    </div>
                    <div id="profile2">
                        <span>게시글</span>
                        <ul class="list_style">
                            <li class=""><a href="#" class="blue under_none">공지</a></li>
                            
                            <li class=""><a href="#" class="blue under_none" id="sports">스포츠</a></li>
                            <span class="nav_toggle">   
                                <ul class="list_style nav_list">
                                    <li>→농구</li>
                                    <li>→축구</li>
                                    <li>→야쿠</li>
                                </ul>
                            </span>
                            
                            <li class=""><a href="#" id="taste" class="blue under_none">맛집탐방</a></li>
                            <span class="nav_toggle">   
                                <ul class="list_style nav_list2">
                                    <li>→서울</li>
                                    <li>→부산</li>
                                    <li>→경기도</li>
                                    <li>→전라도</li>
                                    <li>→강원도</li>
                                    <li>→충청도</li>
                                </ul>
                            </span>
                        </ul>
                    </div>
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
                                    <col width="300px" height="100px;">
                                    <col width="100px">
                                    <col width="200px">
                                </colgroup>
                                <tr>
                                    <th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
                                </tr>
                                <tr>
                                    <td>애국가</td><td>기수연</td><td>2020-10-27</td><td>8</td>
                                </tr>
                                <tr>
                                    <td>애국가2</td><td>기수연2</td><td>2020-10-27</td><td>5</td>
                                </tr>
                                <tr>
                                    <td>애국가3</td><td>기수연3</td><td>2020-10-27</td><td>10</td>
                                </tr>
                                <tr>
                                    <td>애국가2</td><td>기수연2</td><td>2020-10-27</td><td>5</td>
                                </tr>
                                <tr>
                                    <td>애국가3</td><td>기수연3</td><td>2020-10-27</td><td>10</td>
                                </tr>
                                <tr>
                                    <td>애국가2</td><td>기수연2</td><td>2020-10-27</td><td>5</td>
                                </tr>
                                <tr>
                                    <td>애국가3</td><td>기수연3</td><td>2020-10-27</td><td>10</td>
                                </tr>
                                <tr>
                                    <td>애국가2</td><td>기수연2</td><td>2020-10-27</td><td>5</td>
                                </tr>
                                <tr>
                                    <td>애국가3</td><td>기수연3</td><td>2020-10-27</td><td>10</td>
                                </tr>
                            </table>
                            <span>+더보기</span>
                        </div>
                    </div>
                    <div id="board_n">
                        asdasd
                    </div>
                </div>
            </div>

            <div id="aside-right">
                asdasd
            </div>
        </article>

        <%@ include file="/footer.jsp" %>
    </div>
    <script>
    <%--
        $("#header").load("header.html");
        $("#footer").load("footer.html");
	--%>
        $('#sports').click(function() {
            $('.nav_list').toggle();
        })
        $('#taste').click(function() {
            $('.nav_list2').toggle();
        });
        
    </script>
</body>
</html>