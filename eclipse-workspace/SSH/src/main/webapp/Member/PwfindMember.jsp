<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="membership.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<%
		List<MemberDTO> idf = (List<MemberDTO>)request.getAttribute("dtto") ;
	System.out.println(idf);
		if(idf != null){			
		//System.out.println("fw: " + idf.get(idf.size()-1).getId());
		if(idf.size() != 0){
			System.out.println("fw: " + idf.get(idf.size()-1).getId());
	%>	
	<script type="text/javascript">

	function dd() {
<%-- 		alert("아이디는 : "+ <%=idf.get(0).getId()%>); --%>
		alert('아이디는 : <%=idf.get(0).getId()%>');
	}		
	</script>	
	<% }else{%>		
	<script type="text/javascript">	
		function cc() {
		alert("아이디 를 찾을 수 없습니다.");	
		}		
	</script>
		<%} 
		}
		if(idf != null){			
		
	%>
	<script type="text/javascript">
	//console.log(dd());
		if(typeof dd !== "undefined") setTimeout(dd, 200);
		if(typeof cc !== "undefined") setTimeout(cc, 200);
	</script>
	<%
		}
			
	%>
	


<script type="text/javascript">
	function back(){
		document.find_pw.action='loginMember.jsp';
		document.find_pw.submit();
		
		
	}
</script>
<<meta charset="UTF-8">
<<title></title>
</head>
<body>
<%
	String findpw = "loginform.do?fpw=fpw";
%>
		<jsp:include page="Membermenu.jsp" />
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