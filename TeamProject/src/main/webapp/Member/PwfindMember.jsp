<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function back(){
		document.find_pw.action='loginMember.jsp';
		document.find_pw.submit();
		
		
	}
</script>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	String findpw = "loginform.do?fpw=fpw";
%>
		<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container" align="center">
			<h1 class="display-3">편케팅 비밀번호 찾기</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h4 class="form-signin-heading" style="padding:20px;">찾으실 아이디와 비밀번호 힌트를 입력해주세요</h4>
			
			<form class="form-find" name="find_pw" action="<%=findpw %>" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" id="idlog" placeholder="아이디" name="id" > 
				</div>
				<div class="form-group">
					<label for="inputfindPassword" class="sr-only">FindPassword</label>
					<input type="text" class="form-control" id="pwfind" placeholder="비밀번호 힌트" name="findpass" >
				</div>
				<div>
				<button class="btn btn btn-lg btn-dark btn-block" id="find" type="submit" style="width:56%; float:left">비밀번호 보기</button>
				<button class="btn btn btn-lg btn-danger btn-block" id="reset" onclick="back();" style="width:40%;">취소</button>
				</div>
			</form>
			</div>
			</div>

</body>
</html>