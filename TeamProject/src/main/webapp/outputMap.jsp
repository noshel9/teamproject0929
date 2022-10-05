<%@page import="java.util.List"%>
<%@page import="membership.UploadDTO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href="resource/css/NewFile.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="map.jsp">input 맵</a>
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:100%;height:100%;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=def47418c26c1b2e8383afc08b8370c5"></script>
<%
String list= request.getAttribute("UploadDTO").toString();
System.out.println(list);
%>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
var list = <%=request.getAttribute("UploadDTO")%>

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
     
 for (var i =0; i < list.length; i++) {    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({        
    	map: map, // 마커를 표시할 지도        
        position: new kakao.maps.LatLng(list[i].Latitude, list[i].longitude), // 마커를 표시할 위치        
        //title : list[i].memo, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage, // 마커 이미지      	 
        clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
    });	

    // 마커에 표시할 인포윈도우를 생성합니다 
    var text = [];
	for(var j =0; j<i; j++){
		if(list[i].Latitude == list[j].Latitude && list[i].longitude == list[j].longitude ) text.push("<br>"+list[j].memo+list[j].date+"<a class =\"btn btn-primary btn-sm\" href=\""+"\">삭제</a>") ; 
	}	
	
    var infowindow = new kakao.maps.CustomOverlay({
        content: "<span class=\"info-title\">"+list[i].memo+"&nbsp;" +list[i].date +"&nbsp;<a class =\"btn btn-primary btn-sm\" href=\"\">삭제</a>" + text.reverse().join("")+"</span>",
        map:map
        
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', function() {
		infowindow.setMap(map);
	});
    kakao.maps.event.addListener(marker, 'click', makeOutListener(infowindow));
  }  
//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
/*  function makeOverListener(map, marker, infowindow) {
     return function() {
         infowindow.open(map, marker);
     };
 } */

 // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
 function makeOutListener(infowindow) {
     return function() {
         infowindow.close();
     };
 }

</script>

</body>
</html>