<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
<script type="text/javascript">

	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.newMember.pass.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newMember.pass.value != document.newMember.pass_confirm.value) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	}
</script>
<% String UserId = (String) session.getAttribute("UserId"); %>
<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/marketnavi"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />
<sql:query dataSource="${dataSource}" var="resultSet" >
	select * from member where id=?
	<sql:param value="<%=UserId %>" />
</sql:query>
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">	

<title>회원 수정</title>
</head>
<body onload="init()">
	<jsp:include page="menu.jsp" />
	<div class = "jumbotron" >
		<div class = "container">
			<h1 class = "display-3">회원 수정</h1>
		</div>
	</div>	


	
	<div class="container">
		<form name="newMember" action="updateMemberform.do" method="post"  
		class="form-horizontal" onsubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="id" class="form-control" placeholder="id"
						value="<c:out value='${row.id}'/>" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" name="pass" class="form-control" placeholder="password"
						value="<c:out value='${row.pass}'/>" >
				</div>
			</div>		
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" name="pw_confirm" class="form-control" placeholder="password_confirm">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control" placeholder="name"
						value="<c:out value='${row.name}'/>" >
				</div>
			</div>
	
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input type="text" name="address" class="form-control" placeholder="address"
					value="<c:out value='${row.address}'/>">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="회원수정" >
					<a href="deleteMemberform.do" class="btn btn-primary">회원탈퇴</a>
				</div>
			</div>		
		</form>
	</div>

</body>
</html>

