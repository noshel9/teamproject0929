<%@page import="java.util.List"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="../css/login3.css">
	<%
		List<MemberDTO> fw = (List<MemberDTO>)request.getAttribute("dto") ;

		if(fw != null){			

		if(fw.size() != 0){
	%>	
	<script type="text/javascript">
	function dd() {
		alert('비밀번호는 : <%=fw.get(0).getPass()%>');
	}		
	</script>	
	<% }else{%>		
	<script type="text/javascript">	
		function cc() {
		alert("비밀번호를 찾을 수 없습니다.");	
		}		
	</script>
		<%} 
		}
		if(fw != null){			
		
	%>
	<script type="text/javascript">
	//console.log(dd());
		if(typeof dd !== "undefined") setTimeout(dd, 200);
		if(typeof cc !== "undefined") setTimeout(cc, 200);
	</script>
	<%
		}
			
	%>
	

		

	
<title>Login</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />

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
			<%
				String action="loginform.do?log=log";
			%>
			
		<table> <!-- style="width: 360px;"> -->
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
<!--     	<td> -->
<!--         	<button id="log" type="submit">로그인</button> -->
<!--         	</td> -->
<!--         </tr> -->
        
<!--         <tr> -->
<!--         	<td href="/Member/IdfindMember.jsp"> -->
<!--         	<button id="idfind" type="submit">아이디 찾기</button> -->
<!--         	</td> -->
        	
<!--         	<td href="/Member/PwfindMember.jsp"> -->
<!--         	<button id="pwfind" type="submit" style="width: 100px;">비밀번호 찾기</button> -->
<!--         	</td> -->
        	
<!--         	<td> -->
<!--         	<button class="login_btn" id="log" type="submit">로그인</button> -->
<!--         	</td> -->

        </tr>
       <tr>
        	<td id="loginbtn" colspan="2"><button class="login_btn" id="log" type="submit">로그인</button></td>
    	</tr>
        
        <tr colspan="2">
        	<td colspan="1" href="/Member/IdfindMember.jsp">
        	<button id="idfind" type="submit">아이디 찾기</button>
        	</td>
        	
        	<td colspan="1" href="/Member/PwfindMember.jsp">
        	<button id="pwfind" type="submit" style="width: 130px;">비밀번호 찾기</button>
        	</td>
    	</tr>
        
    	
    	</form>
    </table>
		</div>
	</div>
	
</body>
</html>
