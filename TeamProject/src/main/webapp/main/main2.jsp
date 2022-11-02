<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>오늘의 편케팅!</title>

	<link rel="stylesheet" type="text/css" href="../css/fullpage.css" />
	<link rel="stylesheet" type="text/css" href="../css/main2.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	<style>

	.section{
		text-align:center;
	}
	</style>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("utf-8");
	String UserId = (String)session.getAttribute("UserId");
%>
</head>
<%String id_chek = (String)session.getAttribute("UserId"); %>
<script type="text/javascript">
	function chek() {		
		var id =<%=id_chek%>;
		if(id == null){
			alert("로그인 해주세요");
			return false;
		}
		else{
			return true;
		}
	}
</script>
<body style="top-margin:0; bottom-margin:0; left-margin:0; right-margin:0;">
 <header>
        <div class="logo">
         <a onclick="location.href='main2.jsp'"><img src="../imgs/logo_small.png"/></a>
    
            <nav>
                <ul class="menu">
                <c:choose>
                <c:when test="${empty UserId }">
              <form>
                    <li><a href="../Member/loginMember.jsp">로그인</a></li>
                    <li><a href="../Member/addMember.jsp">회원가입</a></li>
                    <li><a href="../Map.map?outputmap=outputmap" onclick="return chek();">편케팅!</a></li>
                </form>
                </c:when>
                <c:otherwise>
                	<li style="padding-top:7px; color:#404040; font-size:25px; text-shadow: 1px 0 0 #fff, -1px 0 0 #fff, 0 1px 0 #fff, 0 -1px 0 #fff, 0.5px 0.5px #fff, -0.5px -0.5px 0 #fff, 0.5px -0.5px 0 #fff, -0.5px 0.5px 0 #fff;"><%=UserId %>님</li> 
                	<li><a href="../Member/logoutMember.jsp">로그아웃</a></li>
                	<li><a href="../Member/updateMember.jsp">회원수정</a>
                    <li><a href="../map.jsp">제보하기</a></li>
                    <li><a href="../Map.map?outputmap=outputmap" onclick="return chek();">편케팅!</a></li>
                    <li><a href="../Board/ListModel.li?List=List">건의 게시판</a></li>
                    
                 </c:otherwise>
                 </c:choose>
                </ul>
            </nav>
        </div>
    </header>
    <div id="fullpage">
    
        <div class="section" id="section0"><h1>오늘의<br/>편케팅!</h1></div>
        <div class="section" id="section1">
            <div class="slide" id="slide1"><h1>오늘의 편케팅 소개입니다.</h1></div>
            <div class="slide" id="slide2"><h1 id="title1">편케팅 소개 </h1>
            <div id="hi"><p>'오늘의 편케팅!'은 코로나 백신 예약 대란으로 인해 <br/>
							카카오맵과 네이버 지도에서 잔여 백신 예약이 가능하도록 <br/>
							서비스했던 것에서 착안하여 '오늘의 편케팅!'을 개발하게 되었습니다.
						<br/>편케팅이란 ‘편의점’과 ‘티켓팅’의 합성어로 편의점 인기제품을<br/> 
							게임같은 형식으로 구입하며 즐길 수 있게 초점을 맞춘 프로젝트 입니다</p></div>
            </div>
            
        </div>
        <div class="section" id="section2">
            <div class="intro">
                <h1 class="member_title">팀원 소개</h1>
             </div>
             <div id="m_intro">
             <img id="m1" alt="" src="../imgs/m_2.png">
             <img id="m2" alt="" src="../imgs/m_1.png">
             
        	</div>
        </div>
    <script type="text/javascript" src="fullpage.js"></script>
    
    <script type="text/javascript">
        var myFullpage = new fullpage('#fullpage');
    </script>

</body>
</html>