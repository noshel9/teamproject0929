<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
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
<jsp:include page="menu.jsp"></jsp:include>
<%
	String num = request.getParameter("num");	
	String action = "ListModel.li?write=write";
%>	
	<form method="post" name = "WritePform" action="<%=action%>">
	<div style="padding: 1% 20%;">
	<div class ="form-group">
             <input type ="text" class="form-control" placeholder="제목" name ="title" maxlength='20'>
         </div>
		<div class ="form-group">
             <textarea class="form-control" rows="20" name ="content"></textarea></div>
		<input type="hidden" name="num" value="<%=num%>">	
		<%//System.out.println(num);
		if(num == null){ %>
		<input type="button" value="게시글 등록" onclick="titlechk(WritePform);">		
		<%}else{ %>
		<input type="button" value="게시글 수정" onclick="titlechk(WritePform);">
		<%} %>
		</div>		
	</form>	
</body>
</html>