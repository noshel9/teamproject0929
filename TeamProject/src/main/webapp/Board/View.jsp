<%@page import="model1.board.ReplyDTO"%>
<%@page import="model1.board.ReplyDAO"%>
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
	//System.out.println("페이지 넘 : " + pageNum);
	BoardDAO dao = new BoardDAO();
	dao.updateVisitCount(num); // 조회수 카운트
	
	BoardDTO dto = dao.selectView(num);	
	CommentDAO cdao = new CommentDAO();
	ReplyDAO rdao = new ReplyDAO();
	
	List<CommentDTO> list = cdao.selectComment(num);
	List<ReplyDTO> ReplyList = rdao.selectReply(num);
	dao.close();
	//System.out.println("리스트 크기 : "+list.size());
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
<jsp:include page="Boardmenu.jsp"></jsp:include>
<link rel = "stylesheet" href="../resource/css/NewFile.css">
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
				<button class="btn btn-secondary btn-sm" type="button" onclick="location.href='ListModel.li?List=List';">목록보기</button>
			</td>			
		</tr>		
	</table>
</form>
<div>
<div style="text-align: center;">
<form action="ListModel.li">
<textarea name="comment" style="width: 60%; height: 100px;" ></textarea>
<input type="hidden" name="num" value="<%=num%>">
</br>
<input class="btn btn-primary " type="submit" value="댓글 쓰기">	
</form>	
</br>
</div>
<div><div>
<table class="table table-bordered" style="width: 60%; margin: auto;">

<%for(int i=0; i<list.size(); i++){ %> 	
		<tr>
			<td style="width: 7%; vertical-align: middle; text-align: center;"><%=list.get(i).getId() %></td>
			<td class="selectReply" colspan="3" height="100"><%=list.get(i).getContent().replaceAll("\r\n", "<br/>")%>
				<%				
				for(int j=0; j<ReplyList.size(); j++){					
					if(list.get(i).getDeletePK()==ReplyList.get(j).getSelectPK()){					
				%>
					 <div style="color: blue;"><%=ReplyList.get(j).getId()%> : <%=ReplyList.get(j).getContent().replaceAll("\r\n", "<br/>")%>
					 <%if(session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(ReplyList.get(j).getId())){ %>
					 <a style="color: red" href="ListModel.li?replyDelete=<%=ReplyList.get(j).getDeletePK()%>&&num=<%=num%>" >삭제</a>
					 <%} %>
					 </div>					 
				<%}}%>
				<div class="reply close">
					<form name="frm" method="post" action="ListModel.li?insertReply=insertReply">
						<textarea class="table table-bordered" name="content" style="width: 100%; height: 100px;"></textarea>						
						<input type="hidden" name="selectPK" value="<%=list.get(i).getDeletePK()%>">
						<input type="hidden" name="num" value="<%=num%>">
						<input type="hidden" name="i" value="<%=i%>">						
						<input class="btn btn-secondary " type="button" value="답글 달기" onclick="scrollSelect(<%=i%>);">
						<!-- <input class="btn btn-danger " type="button" name="close" value="닫기" onclick="replyClose();"> -->
					</form>
				</div>
				<br>
				<a class="cursor" onclick="replyOpen(event);" style="color: blue;">[열기]</a>
				<a class="cursor" onclick="replyClose(event);" style="color: red;">[닫기]</a>
			</td>	
			<%if(session.getAttribute("UserId").toString().equals(list.get(i).getId())){ %>
			<td style="width: 5%; vertical-align: middle; text-align: center;"><a class="btn btn-danger btn-sm" href="ListModel.li?deletePK=<%=list.get(i).getDeletePK()%>&&num=<%=num%>">삭제</a></td>	
		<%} %>
		</tr>
<%} %></table></div></div>
<jsp:include page="BotList.jsp" />

<script type="text/javascript">
	scrollTo(0,sessionStorage.scroll);	
	var select = document.querySelectorAll(".selectReply");
	var reply = document.querySelectorAll(".reply");
	
	window.addEventListener('scroll',()=> {	
		//console.log(window.scrollY);
				sessionStorage.scroll = window.scrollY; 
	})
	
	function replyOpen() {		
		
		for(var i = 0; i<select.length; i++){		
			select[i].addEventListener("click" , function(e) {							
				console.log(this.children[this.children.length-4]);
				this.children[this.children.length-4].classList.remove('close');				
			});	
		}	
	}
	function replyClose() {
		
		for(var i=0; i<select.length; i++){
			//console.log(reply);			
			select[i].addEventListener("click" , function(e) {
				//console.log(this.children[this.children.length-4]);
				this.children[this.children.length-4].classList.add('close');				
			});
		}
	}
 	    
	function scrollSelect(num) {				
		document.frm[num].submit();
		return; 
	}

	</script>
</body>
</html>