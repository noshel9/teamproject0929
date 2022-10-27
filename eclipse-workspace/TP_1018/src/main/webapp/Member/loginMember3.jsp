<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../css/login3.css" />

	<style>
	.section{
		text-align:center;
	}
	</style>
	
<title>편케팅 로그인</title>
 
</head>
<body>
<jsp:include page="/menu.jsp" />
		<div class="container" align="center">
			<h1 class="display-3" id="loghead">편케팅 로그인</h1>
		</div>
	
	<div class="container" align="center">
			<h3 class="form-signin-heading">로그인해주세요</h3>
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
					
				}
				cnt++;
			%>
				
			<table>
			<form class="form-signin" action="loginform.do" method="post">

        <tr>
            <td id="logtext">User Name</td>
            <td><input type="text" class="form-control" id="idlog" placeholder="ID" 
					name='id' required autofocus></td>
        </tr>
        
        <tr>
            <td id="logtext">PassWord</td>
            <td><input type="password" class="form-control" id="idlog" placeholder="Password" 
					name='pass' required></td>
        </tr>
        
        <tr>
        	<td id="loginbtn" colspan="2"><button class="login_btn" id="log" type="submit">로그인</button></td>
    	</tr>
    	
    	</form>
    </table>
    
		</div>
	</div>

</body>
</html>