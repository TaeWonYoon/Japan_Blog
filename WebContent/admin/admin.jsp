<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
</head>
<body>
	<div style="text-align:right;">김민수님환영합니다.</div>
	<%@ include file="/layout/header.jsp" %>
	
    <div class="container">
        <div class="list-box">
            <div class="card">
                <div class="card-header">
                    <select name="list" id="list" style="width:100px;">
                        <option value="">취미종류</option>
                        <option value="a">축구</option>
                        <option value="b">농구</option>
                        <option value="c">야구</option>
                    </select>
                    <select name="level" id="level" style="width:80px;">
                        <option value="">등급</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                    <button type="button" class="btn btn-warning">검색</button>
                </div>
                <div class="card-body">
                    <table class="table table-hover">
                        <colgroup>
                        </colgroup>
                        <thead class="table-primary">
                            <tr>
                                <th>등급</th>
                                <th style="width:30px">취미</th>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>이메일</th>
                                <th style="width:15px;">패스워드</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <!-- <td>
                                    <select name="level" id="" style="width:80px;">
                                        <option value="1" size="4">새싹</option>
                                        <option value="2">잎사귀</option>
                                        <option value="3">열매</option>
                                        <option value="4">운영자</option>
                                        <option value="5">관리자</option>
                                    </select>
                                </td>
                                <td><input type="text" name="" id="" value="농구" style="border:none;"  readonly></td>
                                <td><input type="text" name="" id="" value="dbsxodnjs456" style="border:none;"  readonly></td>
                                <td><input type="text" name="" id="" value="윤태원"style="border:none;" readonly></td>
                                <td><input type="text" name="" id="" value="dbsxodnjs456@naver.com" style="border:none;" readonly></td>
                                <td><input type="text" name="" id="" value="1234"style="border:none;" readonly></td> -->
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>			
        </div>
    </div>	
    <script>
    
    	$('header').css('display','none');
    	
        for(var i=0;i<10;i++) {
        var list = "";
            list += "<tr>";
            list += "<td>";
            list +="<select name='level'  style='width:80px;''>";
            list +="<option value='1' size='4'>새싹</option>";
            list +="<option value='2'>잎사귀</option>";
            list +="<option value'3'>열매</option>";
            list +="<option value='4'>운영자</option>";
            list +="</select>";
            list +="</td>";
            list +="<td><input type='text' value='축구' style='border:none;width:45px;'  readonly></td>";
            list +="<td><input type='text' value='dbsxodnjs456'style='border:none;' readonly></td>";
            list +="<td><input type='text' value='윤태원'style='border:none;' readonly></td>";
            list +="<td><input type='text' value='dbsxodnjs456@naver.com' style='border:none;width:190px;' readonly></td>";
            list +="<td><input type='text' value='1234'style='border:none;' readonly></td>";
            list += "</tr>";
            $('tbody').append(list);
        }
        $('#list').change(function() {
            if($('#list').val() == "a") {
                alert('a');
            } else if($('#list').val() == "b") {
                alert('b');
            } else {
                alert('c');
            }
        });
    </script>
</body>
</html>