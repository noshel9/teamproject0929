<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html5>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>오늘의 편케팅!</title>

	<link rel="stylesheet" type="text/css" href="../css/fullpage.css" />
	<link rel="stylesheet" type="text/css" href="/css/boardMenu.css" />
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	<style>

	.section{
		text-align:center;
	}
	ul, li {
	list-style-type: none;
	}
	</style>
 <body> 
 
 <!--{top-margin:0; bottom-margin:0; left-margin:0; right-margin:0}>  -->


<jsp:include page="/menu.jsp" />

    <div id="fullpage">
    
        <div class="section" id="section0"><h1>오늘의<br/>편케팅!</h1></div>
        <div class="section" id="section1">
            <div class="slide" id="slide1"><h1>오늘의 편케팅 소개입니다.</h1></div>
            <div class="slide" id="slide2"><h1>편케팅 소개 2</h1></div>
        </div>
        <div class="section" id="section2">
            <div class="intro">
                <h1 class="member_title">팀원 소개</h1>
                
                <ul class="member_intro">
               	 	<p>MEMBER</p>
                </ul>
                
            </div>
        </div>	
    <script type="text/javascript" src="fullpage.js"></script>
    
    <script type="text/javascript">
        var myFullpage = new fullpage('#fullpage');
    </script>
</div>
</body>
</html>