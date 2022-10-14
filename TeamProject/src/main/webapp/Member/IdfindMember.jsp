<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function back(){
		document.find_id.action='loginMember.jsp';
		document.find_id.submit();
		
	}
	</script>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<%
	String findid = "loginform.do?findid=findid";
%>
<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container" align="center">
			<h1 class="display-3"> 편케팅 아이디 찾기</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="idfind" style="width:450px;">
			<h4 class="form-signin-heading" style="padding:20px;"> 찾으실 계정의 정보를 입력해 주세요</h4>
		</div>
	</div>
	<form class="form-idfind" name="find_id" action="<%=findid %>" method="post">
		<div class="form-group" style="margin:0 auto; display:table;">
			<label for="inputfindPassword" class="sr-only">FindPassword</label>
			<input type="text" class="form-control" id="pwfind" placeholder="비밀번호 힌트" name="findpass" 
			style="width:300px;">
		</div>
		<div class="form-group" style="margin:0 auto; display:table; padding-top:15px;">
			<label for="inputphone" class="sr-only">phone</label>
			<input type="text" class="form-control" id="phone" placeholder="휴대전화 번호" name="phone" 
			style="width:300px; ">
		</div>
	
	<div class="container">
		<div class="bfind" style="padding-top: 15px; text-align: center;">
		<button class="b-find" id="id_find" type="submit" style="width: 15%; height: 40px; margin-right: 15px; border-radius: 5px;">아이디 보기</button>
		<button class="b-back" id="reset" onclick="back();" style="border-radius: 5px; width: 115px; height: 40px;">취소</button>
		</div>
	</div>
	</form>
	

</body>
</html>