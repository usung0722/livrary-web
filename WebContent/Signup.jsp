<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
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
</head>
<style>
body {
	font-family: 'Roboto', sans-serif;
	padding: 0px;
	margin: 0px;
	overflow: auto;
}
#form{
border-style: solid;
border-width: 1px;
width: 433px;
}
.bt {
	font-size: 10px;
	border: 1;
	outline: 1;
	background-color: white;
}
</style>

<body>

	<form action="SignUp" method="post" name="form" id="form" >
	ID : <input type="text" name="idtb" required><br><br>
	PW : <input type="password" name="pwtb" required><br><br>
	Phone number <input type="text" name="pntb" required  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/><br><br>
	
	<div id="list"></div>
	<div id="callBackDiv">
	<input type="button" onClick="goPopup();" value="주소입력"   class="bt"/><br><br>
	address 1<input type="text"  style="width:350px;" id="roadAddrPart1"  name="roadAddrPart1" readonly required/><br><br>
	address 2 <input type="text"  style="width:300px;" id="addrDetail"  name="addrDetail" required /><br><br>
	<input type="submit" value="회원가입" class="bt">
	</div>
	
	</form>

</body>
</html>