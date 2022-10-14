<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="../resource/css/Member.css">

<title>Login</title>
</head>
<body>
	<jsp:include page="Membermenu.jsp" />
	<div class="jumbotron">
		<div class="container" align="center">
			<h1 class="display-3">편케팅 로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
				<%! int cnt=0; %>
			<%
				 
				String error = request.getParameter("error");
				if (error != null) {
					if(cnt == 3 ){
						out.println("<div class='alert alert-danger'>");
						out.println("3회 로그인 실패했습니다. 1분후에 확인해주세요");
						out.println("</div>");
					}else{
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
					}
					
				}if(request.getParameter("loginId") != null){
					out.println(" <h2 class='alert alert-danger'>" + "아이디 혹은 비밀번호가 틀렸습니다.</h2>");
				}
				cnt++;
			%>
			<form class="form-signin" action="loginform.do" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" id="idlog" placeholder="ID" 
					name='id' required autofocus>	
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" id="idlog" placeholder="Password" 
					name='pass' required>
				</div>
				<button class="btn btn btn-lg btn-dark btn-block" id="log" type="submit">로그인</button>
			</form>
		</div>
	</div>
</body>
</html>
