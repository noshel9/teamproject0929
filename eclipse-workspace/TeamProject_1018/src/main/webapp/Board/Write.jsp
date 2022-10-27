<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" type="text/css" href="../css/Write.css" />
</head>
<body>
<script type="text/javascript">
	function titlechk(form) {
		if(!form.title.value){			
			alert("제목을 입력하세요.");	
			
			return;
		}
		form.submit();
	}
	</script>
<jsp:include page="/menu.jsp"></jsp:include>
<%
	String num = request.getParameter("num");	
	String action = "ListModel.li?write=write";
%>	
	<form method="post" name = "WritePform" action="<%=action%>">
	<div class= "InputBox">
	<div class ="form-group1">
             <input type ="text" id="Title" placeholder="제목" name ="title" maxlength='20'>
         </div>
		<div class ="form-group">
             <textarea id="Contents" rows="20" name ="content"></textarea></div>
		<input type="hidden" name="num" value="<%=num%>">	
		<div id="Btn">
		<%//System.out.println(num);
		if(num == null){ %>
		<input type="button" value="게시글 등록" onclick="titlechk(WritePform);">		
		<%}else{ %>
		<input type="button" value="게시글 수정" onclick="titlechk(WritePform);">
		<%} %>
		</div>
		</div>		
	</form>	
</body>
</html>