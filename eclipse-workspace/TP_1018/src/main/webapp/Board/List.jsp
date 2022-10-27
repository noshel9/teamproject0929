<%@ page import="java.util.List"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
 function changeFunc(){ // 내가 쓴 글 검색할 때 인풋 텍스트 비활성화 스크릡트	
	if(document.optionform.searchField.value == "id2"){
	  document.optionform.searchWord.disabled = true;	
	}else{
		document.optionform.searchWord.disabled = false;
	}		
 }
</script>
</head>
<body>
<%
//String pageNum = request.getParameter("pageNum"); // 페이지 리스트의 넘버
String pageNum = (String)request.getAttribute("pageNum");
String pageLeft = request.getParameter("hdnbt");	// 이전 버튼 동작 여부 확인용
String pageList = request.getParameter("i");		// 지금 시점에서 가장 마지막 페이지의 숫자
String pageRight = request.getParameter("pageRight"); // 다음 버튼 동작 여부 확인용
String pageList_s = request.getAttribute("pageList_s").toString();
String pageList_e = request.getAttribute("pageList_e").toString();
String pageNum_chk_s = request.getAttribute("pageNum_chk_s").toString();
String pageNum_chk_e = request.getAttribute("pageNum_chk_e").toString();
int totalCount = Integer.parseInt(request.getAttribute("totalCount").toString());
List<BoardDTO> boardLists = (List<BoardDTO>)request.getAttribute("boardLists");
%>
<jsp:include page="/menu.jsp"></jsp:include>
    <!-- 검색폼 --> 
    <form method="get" name="optionform">  
    <div class="board-contents">
   		<div>
    		<div>
          	  <select name="searchField" onchange="changeFunc();"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
                <option value="id" >작성자</option>
                <option value="id2">내글보기</option>
           	 </select>
            <input class="form-control form-control-sm" type="text" name="searchWord"/>            
            <input type="submit" value="검색하기" /></div>
    	</div>
    </form>
    <!-- 게시물 목록 테이블(표) -->     
    <table class="table table-striped">
        <!-- 각 칼럼의 이름 --> 
        <tr align="center">
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        <!-- 목록의 내용 --> 
<%
if (boardLists == null || boardLists.size() == 0) {
    // 게시물이 하나도 없을 때 
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}else {
    // 게시물이 있을 때  
    
   	 for(int i =Integer.parseInt(pageNum_chk_s); i<Integer.parseInt(pageNum_chk_e);i++){          
	%>
      <tr align="center">
          <td><%= totalCount-i%></td>  <!--게시물 번호-->
          <td align="left">  <!--제목(+ 하이퍼링크)-->
              <a href="View.jsp?num=<%= boardLists.get(i).getNum() %>&&pageNum=<%=pageNum %>"><%= boardLists.get(i).getTitle() %></a> 
          </td>
          <td align="center"><%= boardLists.get(i).getId() %></td>          <!--작성자 아이디-->
          <td align="center"><%= boardLists.get(i).getVisitcount() %></td>  <!--조회수-->
          <td align="center"><%= boardLists.get(i).getPostdate() %></td>    <!--작성일--> 
      </tr>
	<%
		    }
		}
	%>
    </table>    
    <!--목록 하단의 [글쓰기] 버튼-->
    <table class="table">
        <tr align="right">            
            <%
				if(session.getAttribute("UserId") != null){
				%>
				<td>
			<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
				</td>	
			<%}%>           
        </tr>
    </table>
    </div>    
    <form action="ListModel.li" name="pageLeftForm" method="post">
    <div >  
    <b><%=pageNum %>page</b><br/> 
        <div aria-label="Page navigation example">
  <ul  class="pagination">
    <li class="page-item">    
    <!-- <a href="List.jsp?pageLeft=L"><<</a> -->
    <input type="hidden" name="hdnbt" />
    <input type="hidden" name="pageNum" value="<%=pageNum%>" />
      <input type="button" name="pageLeft" class="page-link" aria-label="Previous" value="<<" onclick="{document.pageLeftForm.hdnbt.value=this.value;document.pageLeftForm.submit();}">
    </li>   
	<%
	for(int i =Integer.parseInt(pageList_s); i<Integer.parseInt(pageList_e); i++){ // 페이지 리스트 버튼 출력		
		%>		
	<li class="page-item"><a class="page-link" href="ListModel.li?pageNum=<%=i%>"><%=i %></a></li>			
	<%
	}	
	%>	
	<input type="hidden" name="i" value="<%=pageList_e%>"/>	
	<li class="page-item">      
      <input class="page-link"  type="submit" name="pageRight" value=">>">      
    </li>
  </ul>
</div>
    </div>
    </form>    
</body>
</html>
