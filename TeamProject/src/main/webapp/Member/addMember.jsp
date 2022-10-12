<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html>
<head>
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript">
	function checkForm() {
		if(!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return;
		}
		if(!document.newMember.pass.value) {
			alert("비밀번호를 입력하세요.");
			return;
		}
		if(document.newMember.pass.value != document.newMember.pw_confirm.value) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		document.newMember.submit();
	}
</script>
<title>회원 가입</title>
</head>
<body>

	<div class = "jumbotron" >
		<div class = "container">
			<h1 class = "display-3">편케팅 회원 가입</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newMember" action="addMemberform.do" method="post"  
		class="form-horizontal">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="id" class="form-control" placeholder="id">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" name="pass" class="form-control" placeholder="password">
				</div>
			</div>		
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" name="pw_confirm" class="form-control" placeholder="password confirm">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control" placeholder="name">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input type="text" name="address" class="form-control" placeholder="address">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10"> 
					<input type="button" class="btn btn-primary" value="등록" onclick="checkForm();">
					<input type="reset" class="btn btn-primary" value="취소" onclick="reset()">
				</div>
			</div>		
		</form>
	</div>
</body>
</html>
