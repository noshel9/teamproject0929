<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.CommentDTO" %>
<%@ page import="model1.board.CommentDAO" %>
<%
	String num = request.getParameter("num");
	//String pageNum = request.getParameter("pageNum");	

	BoardDAO dao = new BoardDAO();
	dao.updateVisitCount(num); // 조회수 카운트
	
	BoardDTO dto = dao.selectView(num);
	
	CommentDAO cdao = new CommentDAO();
	
	List<CommentDTO> list = cdao.selectComment(num);	
	dao.close();
	System.out.println("리스트 크기 : "+list.size());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 게시판</title>
<script type="text/javascript">
	function deletePost() {
		var confirmed = confirm("정말로 삭제하시겠습니까?");
		if(confirmed){
			var form = document.writeFrm;
			form.method = "post";
			form.action = "ListModel.li?deletePost=chk"
			form.submit();
		}
	}
</script>

</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<form name="writeFrm" style="padding: 1% 20%;">
	<input type="hidden" name="num" value="<%=num%>">		
			<table class="table table-bordered">
		<tr>
			<td style="width: 10%;">번호</td>
			<td style="width: 30%;"><%=dto.getNum() %></td>
			<td style="width: 30%;">작성자</td>
			<td style="width: 30%;"><%=dto.getName() %></td>			
		</tr>
		<tr>
			<td style="width: 10%;">작성일</td>
			<td style="width: 30%;"><%=dto.getPostdate()%></td>
			<td style="width: 30%;">조회수</td>
			<td style="width: 30%;"><%=dto.getVisitcount()%></td>		
		</tr>
		<tr>
			<td style="width: 10%;">제목</td>
			<td colspan="3"><%=dto.getTitle()%></td>
		</tr>
		<tr>
			<td style="width: 10%;">내용</td>
			<td colspan="3" height="100"><%=dto.getContent().replaceAll("\r\n", "<br/>")%></td>		
		</tr>
		<tr>
			<td colspan="4" align="center">
				<%
				if(session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())){
				%>
				<button class="btn btn-secondary btn-sm" type="button" onclick="location.href='Write.jsp?num=<%=dto.getNum()%>';">수정하기</button>
				<button class="btn btn-danger btn-sm" type="button" onclick="deletePost();">삭제하기</button>
				<%} %>
				<button class="btn btn-secondary btn-sm" type="button" onclick="location.href='ListModel.li';">목록보기</button>
			</td>			
		</tr>		
	</table>
</form>
<form action="ListModel.li">
<textarea name="comment" ></textarea>
<input type="submit" value="전송">	
</form>
<%for(int i=0; i<list.size(); i++){ %>
<%=list.get(i).getContent() %>
<%} %>
<jsp:include page="BotList.jsp" /> 

</body>
</html>