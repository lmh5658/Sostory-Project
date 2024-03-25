<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>

<style>
/* 메인페이지 Section 영역관련 스타일 */
.main-content{display: flex; flex-direction: column; z-index: 1;}
.content-product-list{display: flex; flex-direction: column;}
.product-thumbnail-list .product-img:hover, .product-body:hover .recipe:hover, .recipe-product:hover{cursor: pointer; opacity: 0.8;}
.recipe-product{display: flex;}
</style>

</head>
<body>


	<div class="wrap">
		
		<%@ include file="/views/common/header.jsp" %>
		
<!-- ----------------------------------------------------------------------------------------------------------------------------------------------- -->		
	     
	     <!-- Section start -->
	     <section class="main-content">
	         <!-- Carousel -->
	         <div id="ad" class="content-ad carousel slide my-5" data-bs-ride="carousel">
	
	             <!-- Indicators/dots -->
	             <div class="carousel-indicators">
	             <button type="button" data-bs-target="#ad" data-bs-slide-to="0" class="active"></button>
	             <button type="button" data-bs-target="#ad" data-bs-slide-to="1"></button>
	             <button type="button" data-bs-target="#ad" data-bs-slide-to="2"></button>
	             </div>
	             
	             <!-- The slideshow/carousel -->
	             <div class="carousel-inner">
	             <div class="carousel-item active">
	                 <img src="<%= contextPath %>/resources/images/이미지1.jpg" alt="ad1" class="d-block" style="width:100%; height: 600px;">
	             </div>
	             <div class="carousel-item">
	                 <img src="<%= contextPath %>/resources/images/이미지2.jpg" alt="ad2" class="d-block" style="width:100%; height: 600px;">
	             </div>
	             <div class="carousel-item">
	                 <img src="<%= contextPath %>/resources/images/이미지3.jpg" alt="ad3" class="d-block" style="width:100%; height: 600px;">
	             </div>
	             </div>
	             
	             <!-- Left and right controls/icons -->
	             <button class="carousel-control-prev" type="button" data-bs-target="#ad" data-bs-slide="prev">
	             <span class="carousel-control-prev-icon"></span>
	             </button>
	             <button class="carousel-control-next" type="button" data-bs-target="#ad" data-bs-slide="next">
	             <span class="carousel-control-next-icon"></span>
	             </button>
	         </div>
	
	         <!-- 상품 리스트 영역 start -->
	         <div class="content-product-list center my-5">
	
	                 <!-- 상품 리스트 제목 영역 start -->
	                 <div class="product-list-title">
	                     <h1 class="d-inline text-warning"><b>Our </b></h1><h1 class="d-inline"><b>Product</b></h1>
	                 </div>
	                 <!-- 상품 리스트 제목 영역 end -->
	
	                 <!-- 상품 카테고리 영역 start -->
	                 <div class="product-category my-5 w-100 d-flex justify-content-evenly">
	                     <a href="#" class="btn btn-outline-danger btn-sm py-1 px-3">전체</a>
	                     <a href="#" class="btn btn-outline-danger btn-sm py-1 px-3">랭킹</a>
	                     <a href="#" class="btn btn-outline-danger btn-sm py-1 px-3">신상품</a>
	                 </div>
	                 <!-- 상품 카테고리 영역 end -->
	
	                 <!-- 상품 리스트 start -->
	                 <div class="product-thumbnail-list d-flex flex-column w-100">
	                     <!-- 상품 썸네일 상단 start -->
	                     <div class="thumbnail-list-top d-flex w-100 justify-content-evenly"> 
	                     
	                         <!-- 상품 썸네일 start -->
	                         <div class="product img-thumbnail p-2" style="width:300px">
	                             <img class="product-img" src="<%= contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
	                             <div class="product-body">
	                                 <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
	                                 <h7 class="product-title"><b><b class="text-danger">[HOT] </b>칼로리 zero 머스타드</b></h7>
	                                 <h7 class="product-price d-block my-4"><b>8,000원</b></h7>
	                             </div>
	                             <div class="icon d-flex justify-content-end">
                                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                         <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
                                     </svg>
                                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                         <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                                     </svg>
                                 </div>
	                         </div>
	                         <!-- 상품 썸네일 end -->
	
	                         <!-- 상품 썸네일 start -->
	                         <div class="product img-thumbnail p-2" style="width:300px">
	                             <img class="product-img" src="<%= contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
	                             <div class="product-body">
	                                 <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
	                                 <h7 class="product-title"><b><b class="text-danger">[HOT] </b>칼로리 zero 머스타드</b></h7>
	                                 <h7 class="product-price d-block my-4"><b>8,000원</b></h7>
	                                 <div class="icon d-flex justify-content-end">
	                                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
	                                         <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
	                                     </svg>
	                                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
	                                         <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
	                                     </svg>
	                                 </div>
	                             </div>
	                         </div>
	                         <!-- 상품 썸네일 end -->
	
	                         <!-- 상품 썸네일 start -->
	                         <div class="product img-thumbnail p-2" style="width:300px">
	                             <img class="product-img" src="<%= contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
	                             <div class="product-body">
	                                 <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
	                                 <h7 class="product-title"><b><b class="text-danger">[HOT] </b>칼로리 zero 머스타드</b></h7>
	                                 <h7 class="product-price d-block my-4"><b>8,000원</b></h7>
	                                 <div class="icon d-flex justify-content-end">
	                                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
	                                         <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
	                                     </svg>
	                                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
	                                         <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
	                                     </svg>
	                                 </div>
	                             </div>
	                         </div>
	                         <!-- 상품 썸네일 end -->
	                     </div> 
	                     <!-- 상품 썸네일 상단 end -->
	
	                     <!-- 상품 썸네일 하단 start -->
	                     <div class="product-thumbnail-list-bottom d-flex w-100 justify-content-evenly my-5">
	                         <!-- 상품 썸네일 start -->
	                         <div class="product img-thumbnail p-2" style="width:300px">
	                             <img class="product-img" src="<%= contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
	                             <div class="product-body">
	                                 <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
	                                 <h7 class="product-title"><b><b class="text-danger">[HOT] </b>칼로리 zero 머스타드</b></h7>
	                                 <h7 class="product-price d-block my-4"><b>8,000원</b></h7>
	                                 <div class="icon d-flex justify-content-end">
	                                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
	                                         <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
	                                     </svg>
	                                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
	                                         <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
	                                     </svg>
	                                 </div>
	                             </div>
	                         </div>
	                         <!-- 상품 썸네일 end -->
	
	                         <!-- 상품 썸네일 start -->
	                         <div class="product img-thumbnail p-2" style="width:300px">
	                             <img class="product-img" src="<%= contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
	                             <div class="product-body">
	                                 <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
	                                 <h7 class="product-title"><b><b class="text-danger">[HOT] </b>칼로리 zero 머스타드</b></h7>
	                                 <h7 class="product-price d-block my-4"><b>8,000원</b></h7>
	                                 <div class="icon d-flex justify-content-end">
	                                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
	                                         <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
	                                     </svg>
	                                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
	                                         <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
	                                     </svg>
	                                 </div>
	                             </div>
	                         </div>
	                         <!-- 상품 썸네일 end -->
	                     </div>
	                     <!-- 상품 썸네일 하단 end -->
	
	                     <!-- 상품 리스트 더보기 버튼 영역 start -->
	                     <div class="more-product center">
	                         <a href="#" class="btn btn-outline-secondary bg-secondary text-white btn-sm px-3">더보기</a>
	                     </div>
	                     <!-- 상품 리스트 더보기 버튼 영역 end -->
	                 </div> 
	                 <!-- 상품 리스트 영역 end -->
	
	
	                 <!-- 레시피 커뮤니티 리스트 영역 start -->
	                 <div class="content-community-list w-100 my-5">
	
	                     <!-- 레시피 커뮤니티 이름 영역 start -->
	                     <div class="content-community-title mt-5" style="letter-spacing: 2px;">
	                         <div class="community text-secondary" style="padding-left: 520px;">community</div>
	                         <div class="community-title center mb-5">
	                             <div><h1 class="d-inline text-danger"><b>So's&nbsp;</b></h1><h1 class="d-inline text-warning"><b>tree</b></h1></div>
	                         </div>
	                     </div>
	                     <!-- 레시피 커뮤니티 이름 영역 end -->
	
	                     <!-- 레시피 커뮤니티 리스트 start -->
	                     <div class="recipe-list  d-flex w-100 justify-content-evenly p-5" style="background-color:cornsilk;">
	
	                         <!-- 레시피 썸네일 start -->
	                         <div class="recipe-wrap">
	                             <div class="recipe" style="width:300px">
	                                 <img class="recipe-img-top" src="<%= contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%; border-radius: 30px;">
	                                 <div class="recipe-body">
	                                     <small class="recipe-category d-block text-secondary my-3">카테고리명</small>
	                                     <h7 class="recipe-title"><b>레시피명</b></h7>
	                                     <small class="recipe-intro d-block text-secondary text-wrap my-2">레시피 간단소개</small>
	                                     <div class="recipe-etc d-flex my-3 mt-4 border-bottom pb-2">
	                                         <div class="recipe-writer" style="padding-right: 100px;">
	                                             <h6 class="profile">
	                                                 <!-- 레시피 작성자 프로필 사진 -->
	                                                 <img src="<%= contextPath %>/resources/images/user.svg" alt="user profile image" class="rounded-circle border" style="width: 20px; height: 20px;">
	                                                 <div class="d-inline center ms-1"><small>작성자아이디</small></div>
	                                             </h6>
	                                         </div>
	                                         <div class="recipe-good d-flex justify-content-end">
	                                             <!-- 레시피 좋아요 -->
	                                             <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="icon-good me-3" viewBox="0 0 16 16" onclick="클릭시실행함수()">
	                                                 <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
	                                             </svg>
	                                             <!-- 레시피 좋아요 총 갯수 -->
	                                             <div class="total-good">(2000)</div>
	                                         </div>
	                                     </div> <!-- 레시피 etc end -->
	                                 </div> <!-- 레시피 body end -->
	 
	                                 <!-- 레시피 관련상품 영역 start -->
	                                 <div class="recipe-product border-top d-flex pt-4" style="display: flex;">
	                                     <div class="recipe-product-img border me-4" style="width: 100px; height: 100px;">
	                                         <!-- 레시피 관련 상품 이미지 -->
	                                         <img src="<%= contextPath %>/resources/images/이미지3.jpg" alt="" style="width: 100%; height: 100%;">
	                                     </div>
	                                     <div class="recipe-product-detail">
	                                         <div class="recipe-product-title"><h6 class="fw-bold"><b class="text-danger">[HOT]&nbsp;</b>관련상품명</h6></div>
	                                         <div class="recipe-product-price text-secondary mt-5"><h6>관련상품가격</h6></div>
	                                     </div>
	                                 </div>
	                                 <!-- 레시피 관련상품 영역 end -->
	                             </div>
	                         </div>
	                         <!-- 레시피 썸네일 end -->
	
	                         <!-- 레시피 썸네일 start -->
	                         <div class="recipe-wrap">
	                             <div class="recipe" style="width:300px">
	                                 <img class="recipe-img-top" src="<%= contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%; border-radius: 30px;">
	                                 <div class="recipe-body">
	                                     <small class="recipe-category d-block text-secondary my-3">카테고리명</small>
	                                     <h7 class="recipe-title"><b>레시피명</b></h7>
	                                     <small class="recipe-intro d-block text-secondary text-wrap my-2">레시피 간단소개</small>
	                                     <div class="recipe-etc d-flex my-3 mt-4 border-bottom pb-2">
	                                         <div class="recipe-writer" style="padding-right: 100px;">
	                                             <h6 class="profile">
	                                                 <!-- 레시피 작성자 프로필 사진 -->
	                                                 <img src="<%= contextPath %>/resources/images/user.svg" alt="user profile image" class="rounded-circle border" style="width: 20px; height: 20px;">
	                                                 <div class="d-inline center ms-1"><small>작성자아이디</small></div>
	                                             </h6>
	                                         </div>
	                                         <div class="recipe-good d-flex justify-content-end">
	                                             <!-- 레시피 좋아요 -->
	                                             <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="icon-good me-3" viewBox="0 0 16 16" onclick="클릭시실행함수()">
	                                                 <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
	                                             </svg>
	                                             <!-- 레시피 좋아요 총 갯수 -->
	                                             <div class="total-good">(2000)</div>
	                                         </div>
	                                     </div> <!-- 레시피 etc end -->
	                                 </div> <!-- 레시피 body end -->
	 
	                                 <!-- 레시피 관련상품 영역 start -->
	                                 <div class="recipe-product border-top d-flex pt-4" style="display: flex;">
	                                     <div class="recipe-product-img border me-4" style="width: 100px; height: 100px;">
	                                         <!-- 레시피 관련 상품 이미지 -->
	                                         <img src="<%= contextPath %>/resources/images/이미지3.jpg" alt="" style="width: 100%; height: 100%;">
	                                     </div>
	                                     <div class="recipe-product-detail">
	                                         <div class="recipe-product-title"><h6 class="fw-bold"><b class="text-danger">[HOT]&nbsp;</b>관련상품명</h6></div>
	                                         <div class="recipe-product-price text-secondary mt-5"><h6>관련상품가격</h6></div>
	                                     </div>
	                                 </div>
	                                 <!-- 레시피 관련상품 영역 end -->
	                             </div>
	                         </div>
	                         <!-- 레시피 썸네일 end -->
	
	                         <!-- 레시피 썸네일 start -->
	                         <div class="recipe-wrap">
	                             <div class="recipe" style="width:300px">
	                                 <img class="recipe-img-top" src="<%= contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%; border-radius: 30px;">
	                                 <div class="recipe-body">
	                                     <small class="recipe-category d-block text-secondary my-3">카테고리명</small>
	                                     <h7 class="recipe-title"><b>레시피명</b></h7>
	                                     <small class="recipe-intro d-block text-secondary text-wrap my-2">레시피 간단소개</small>
	                                     <div class="recipe-etc d-flex my-3 mt-4 border-bottom pb-2">
	                                         <div class="recipe-writer" style="padding-right: 100px;">
	                                             <h6 class="profile">
	                                                 <!-- 레시피 작성자 프로필 사진 -->
	                                                 <img src="<%= contextPath %>/resources/images/user.svg" alt="user profile image" class="rounded-circle border" style="width: 20px; height: 20px;">
	                                                 <div class="d-inline center ms-1"><small>작성자아이디</small></div>
	                                             </h6>
	                                         </div>
	                                         <div class="recipe-good d-flex justify-content-end">
	                                             <!-- 레시피 좋아요 -->
	                                             <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="icon-good me-3" viewBox="0 0 16 16" onclick="클릭시실행함수()">
	                                                 <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
	                                             </svg>
	                                             <!-- 레시피 좋아요 총 갯수 -->
	                                             <div class="total-good">(2000)</div>
	                                         </div>
	                                     </div> <!-- 레시피 etc end -->
	                                 </div> <!-- 레시피 body end -->
	 
	                                 <!-- 레시피 관련상품 영역 start -->
	                                 <div class="recipe-product border-top d-flex pt-4" style="display: flex;">
	                                     <div class="recipe-product-img border me-4" style="width: 100px; height: 100px;">
	                                         <!-- 레시피 관련 상품 이미지 -->
	                                         <img src="<%= contextPath %>/resources/images/이미지3.jpg" alt="" style="width: 100%; height: 100%;">
	                                     </div>
	                                     <div class="recipe-product-detail">
	                                         <div class="recipe-product-title"><h6 class="fw-bold"><b class="text-danger">[HOT]&nbsp;</b>관련상품명</h6></div>
	                                         <div class="recipe-product-price text-secondary mt-5"><h6>관련상품가격</h6></div>
	                                     </div>
	                                 </div>
	                                 <!-- 레시피 관련상품 영역 end -->
	                             </div>
	                         </div>
	                         <!-- 레시피 썸네일 end -->
	
	                     </div>
	                     <!-- 레시피 커뮤니티 리스트 end -->
	
	                     <!-- 레시피 더보기 버튼 영역 start -->
	                     <div class="more-recipe mt-5 center">
	                         <a href="#" class="btn btn-outline-secondary bg-secondary text-white btn-sm px-3">더보기</a>
	                     </div>
	                     <!-- 레시피 더보기 버튼 영역 end -->
	                     
	                 </div>
	                 <!-- 레시피 커뮤니티 리스트 영역 end -->
	         </div>
	
	     </section>
	     <!-- Section end -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------------- -->
	     
	     <%@ include file="/views/common/footer.jsp" %>
	     
	 </div>

</body>
</html>