<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매장 상세보기</title>
</head>
<body>

<header><%@include file="../header&footer/header.jsp"%></header>
<script src="//apis.daum.net/maps/maps3.js?apikey=6613c81cc99fd49f2ca28e4e4848f691"></script>	 
 <script type="text/javascript">	 
 $(document).ready(function(){	 
     $("#clicked").hide();	 
     $("#saleItem").click(function(){	 
       		$("#clicked").toggle();	 
     });	 
 	 
            i=0;	 
            j=0;	 
            x=0;	 
            y=0;	 
            function localMap1(p){	 
            $.getJSON("https://apis.daum.net/local/geo/addr2coord?apikey=6613c81cc99fd49f2ca28e4e4848f691&q="+p+"&page_size=1&output=JSON&callback=?",	 
                 function(data) {	 
                   i = data.channel.item[0].lat;	 
                   j = data.channel.item[0].lng;	 
 	 
                 }	 
               );	 
            }	 
 	 
 	 
            localMap1("${address}");	 
 	 
            setTimeout(function() {	 
 	 
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div	 
            mapOption = {	 
               center : new daum.maps.LatLng(i, j), // 지도의 중심좌표	 
               level : 3, // 지도의 확대 레벨	 
               mapTypeId : daum.maps.MapTypeId.ROADMAP	 
            // 지도종류	 
            };	 
 	 
 	 
            var map = new daum.maps.Map(mapContainer, mapOption);	 
 	 
            // 지도에 선을 표시한다	 
            var polyline = new daum.maps.Polyline({	 
               map : map, // 선을 표시할 지도 객체	 
               path : [ // 선을 구성하는 좌표 배열	 
               new daum.maps.LatLng(i,j),	 
 	 
               ],	 
               endArrow : true, // 선의 끝을 화살표로 표시되도록 설정한다	 
               strokeWeight : 3, // 선의 두께	 
               strokeColor : '#FF0000', // 선 색	 
               strokeOpacity : 0.9, // 선 투명도	 
               strokeStyle : 'solid' // 선 스타일	 
            });	 
            }, 100);	 
 	 
            // 지도 중심 좌표 변화 이벤트를 등록한다	 
            daum.maps.event.addListener(map, 'center_changed', function () {	 
               console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');	 
            });	 
11	 	 
 });	 
         </script>
	
	<script type="text/javascript" src="<c:url value='js/chain.js'/>"></script>
	<div id="middleSpace">
	<div id="title">
		<h2>Chain Store</h2><hr>
		<p>나의 일상이 되는 또다른 공간</p></div><br> <br>
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel" style="width:50%; height:300px; float:left; margin-right:20px;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="<c:url value='img/chain/${chain.chain_id}.jpg'/>" style="width:100%; height:300px;">
				</div>
				<div class="item">
					<img src="<c:url value='img/chain/${chain.chain_id}1.jpg'/>"style="width:100%; height:300px;">
				</div>
				<div class="item">
					<img src="<c:url value='img/chain/${chain.chain_id}2.jpg'/>"style="height:300px; width:100%;">
				</div>
				<div class="item">
					<img src="<c:url value='img/chain/${chain.chain_id}3.jpg'/>"style="height:300px; width:100%;">
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span>←</span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span>→</span>
				<span class="sr-only">Next</span>
			</a>
		</div>
<table  style="width:48%;">
<tr>
<td height="40"><span id="spanId"> ${chain.chain_name} 매장정보 </span></td>
</tr>
<tr>
<td><img src="<c:url value='img/icon/focus.png'/>" height="10"> 매장주소 : ${basic.address}</td>
</tr>
<tr>
<td><img src="<c:url value='img/icon/focus.png'/>" height="10"> 영업시간 : AM 09:00 ~ PM 11:00</td>
</tr>
<tr>
<td><img src="<c:url value='img/icon/focus.png'/>" height="10"> 전화번호 : ${basic.chain_phone }</td>
</tr>
<tr>

<td height="215">
<div id="map" style="width: 300px; height: 180px;"></div>
</td>
</tr>
</table>
<div id="saleItem" > + ${chain.chain_name} 메뉴보기</div>
<div id="clicked">
<table width="30%" class="table table-condensed">
<tr>
<th>제품명</th>
<th>가격</th>
</tr>
<c:forEach items="${saleItem }" var="list">
<tr>
<td>${list.item_name }</td>
<td>${list.item_price }</td>
</tr>
</c:forEach>
</table>
</div>
	</div>
<footer><br>사업자등록번호 201-81-21515 (주)코스타벅스커피 코리아 대표이사 조항덕 TEL : 02) 3123-7894 / FAX : 02) 3123-7895 개인정보 책임자 : 박상현
<br><br>ⓒ 2015 Starbucks Coffee Company. All Rights Reserved.<br></footer>
</body>
</html>