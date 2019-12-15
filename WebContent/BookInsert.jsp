<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="bookinsert" method="post" enctype="multipart/form-data">
책 제목 <input type="text" name="book_name"><br>
책 가격 <input type="text" name="book_price"><br>
글쓴이 <input type="text" name="book_author"><br>
메이커 <input type="text" name="book_maker"><br>
이미지<input type="file" value="파일 선택" name="file1"/><br>
책 출시일 <input type="text" name="book_bt"> ex:201912<br>
베스트셀러<input type="checkbox" name="book_best" value="1" ><br>
사용중<input type="checkbox" name="book_use"  value="1"><br>

<input type="submit" value="추가">
</form>



</body>
</html>