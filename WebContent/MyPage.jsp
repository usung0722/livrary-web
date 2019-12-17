<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.DAO.DAO"%>
<%@ page import="com.DTO.BookDTO"%>
<%@ page import="com.DTO.userDTO"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<script type="text/javascript">
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다. 
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.addrDetail.value = addrDetail;
		
		
}



</script>
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: 'Sunflower', sans-serif;
	padding: 0px;
	margin: 0px;
	animation-name: navbar-fade;
	 animation-duration: 2s;
   	 -webkit-animation-name: navbar-fade;
  	 -webkit-animation-duration: 2s;
}
@keyframes navbar-fade {
    from { opacity: .4}
    to { opacity: 1 }
}

@-webkit-keyframes navbar-fade {
    from { opacity: .4}
    to { opacity: 1 }
}

.fm1{
margin: 50px;
}
.sh{
margin: 50px;}

@media screen and (max-width:1000px) {
.fm1{
font-size: 200%;
}
.sh{
margin: 50px;}
font-size: 200%;
}

</style>
</head>
<body>
<%
String id = (String)session.getAttribute("sessionid");
DAO dao = new DAO();
userDTO userdto = dao.userInfo(id);
String id2 = userdto.getId();
String pw = userdto.getPw();
String ph = userdto.getPh();
String ad1 = userdto.getAd1();
String ad2 = userdto.getAd2();
%>
<div class="fm1">
<h3>회원 정보</h3>

<form action="Modified" method="post" name="form" id="form" >
	ID : <input type="text" name="idtb" readonly value="<%=id2%>"><br><br>
	PW : <input type="password" name="pwtb" required value="<%=pw%>"><br><br>
	Phone number <input type="text" name="pntb" required value="<%=ph%>"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/><br><br>
	
	<div id="list"></div>
	<div id="callBackDiv">
	<input type="button" onClick="goPopup();" value="주소입력"   class="bt"/><br><br>
	address 1<input type="text" value="<%=ad1%>"  readonly style="width:350px;" id="roadAddrPart1"  name="roadAddrPart1" readonly required/><br><br>
	address 2 <input type="text" value="<%=ad2%>" readonly  style="width:300px;" id="addrDetail"  name="addrDetail" required /><br><br>
	<input type="submit" value="수정" class="bt">
	</div>
	
	</form>

</div>


<div class="sh">

<h3>가지고있는 책</h3>
			<%
				request.setCharacterEncoding("UTF-8");
				ArrayList<BookDTO> list;
				System.out.print(id);
				
					list = dao.mybook(id);
					for(int i=0;i<list.size(); i++){
						BookDTO dto = list.get(i);
						String book_name = dto.getBook_name();
						String book_price = dto.getBook_price();
						String book_img = dto.getBook_imgad();
						
					%>

					<div class= "tb">
					<table>
						<tr>
							<th style=" width: 150px;"><%=book_name %></th>
							<tr>
								<td ><img style=" width: auto; height: 200px;" src="Upload/<%=book_img %>"></td>
							</tr>
					</table>
					</div>
					<%
					} 
				%>
			

</div>

</body>
</html>