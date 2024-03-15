<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임세일 페이지</title>

<style>

	/* 타임세일목록페이지 관련 스타일 */
        .main-content{display: flex; flex-direction: column;}
        .content-product-list{display: flex; flex-direction: column;}
        .product-thumbnail-list .product:hover, .recipe:hover, .recipe-product:hover{cursor: pointer; opacity: 0.8;}
        .recipe-product{display: flex;}

        
        .more-product{
            margin-top: 20px;
        }

        .pagination{
            margin-top: 30px;
        }
        .select-product{
            margin-bottom: 20px;
        }
       
        .carousel-inner img {
            width: 800px;
            height: 280px;
        }
        #demo{
            width: 800px;
            height: 300px;
            margin: auto;
        }
        .timesale{
            margin-bottom: 20px;
        }


</style>

</head>
<body>
	<div class="wrap container p-3">

        <%@ include file="/views/common/header.jsp" %>

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
        
        <!-- Section start -->
        <section class="main-content">
            

            <!-- 상품 상단 영역 start -->
            <div class="content-product-list my-5 center">

                <div class="timesale">

                    <img src="<%=contextPath %>/resources/images/타임세일 로고.png">

              </div>
                    <!-- 상품 배너 영역 start -->
                    <div id="demo" class="carousel slide" data-ride="carousel">

                        <!-- Indicators slideshow 개수만큼 li 추가 -->
                        <ul class="carousel-indicators">
                          <li data-target="#demo" data-slide-to="0" class="active"></li>
                          <li data-target="#demo" data-slide-to="1"></li>
                          <li data-target="#demo" data-slide-to="2"></li>
                          <li data-target="#demo" data-slide-to="3"></li>
                          <li data-target="#demo" data-slide-to="4"></li>
                          <li data-target="#demo" data-slide-to="5"></li>
                        </ul>
                      
                        <!-- The slideshow  -->
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <img src="<%=contextPath %>/resources/images/이미지1.jpg">
                          </div>
                          <div class="carousel-item">
                            <img src="../semi_sostory/resources/images/이미지1.jpg">
                          </div>
                          <div class="carousel-item">
                            <img src="../semi_sostory/resources/images/이미지1.jpg">
                          </div>
                          <div class="carousel-item">
                            <img src="../semi_sostory/resources/images/이미지2.jpg">
                          </div>
                          <div class="carousel-item">
                            <img src="../semi_sostory/resources/images/이미지2.jpg">
                          </div>
                          <div class="carousel-item">
                            <img src="../semi_sostory/resources/images/이미지2.jpg">
                          </div>
                        </div>

                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                          <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#demo" data-slide="next">
                          <span class="carousel-control-next-icon"></span>
                        </a>
                      
                      </div>
                    <!-- 상품 배너 영역 end -->

                    
            </div>

            

                <!-- 상품 상단 영역 end -->


                    <!-- 상품 리스트 start -->
                    <div class="product-thumbnail-list d-flex flex-column w-100">
                        <!-- 상품 상단 start -->
                        <div class="thumbnail-list-top d-flex w-100 justify-content-evenly"> 
                            <!-- 상품 썸네일 start -->
                            <div class="product img-thumbnail p-2" style="width:300px">
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지2.jpg" alt="Card image" style="width:100%">
                                <div class="product-body">
                                    <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                    <h7 class="product-title"><b><b class="text-secondary">[SALE] </b>칼로리 zero 머스타드</b></h7>
                                    <h7 class="product-price d-block my-4"><del>8,000원</del><p><b>5,000원</b></p></h7>
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
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지2.jpg" alt="Card image" style="width:100%">
                                <div class="product-body">
                                    <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                    <h7 class="product-title"><b><b class="text-secondary">[SALE] </b>칼로리 zero 머스타드</b></h7>
                                    <h7 class="product-price d-block my-4"><del>8,000원</del><p><b>5,000원</b></p></h7>
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
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지2.jpg" alt="Card image" style="width:100%">
                                <div class="product-body">
                                    <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                    <h7 class="product-title"><b><b class="text-secondary">[SALE] </b>칼로리 zero 머스타드</b></h7>
                                    <h7 class="product-price d-block my-4"><del>8,000원</del><p><b>5,000원</b></p></h7>
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
                        <!-- 상품 상단 end -->

                        <!-- 상품 중단 start -->
                        <div class="thumbnail-list-middle d-flex w-100 justify-content-evenly">
                             <!-- 상품 썸네일 start -->
                             <div class="product img-thumbnail p-2" style="width:300px">
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
                                <div class="product-body">
                                    <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                    <h7 class="product-title"><b><b class="text-secondary">[SALE] </b>칼로리 zero 머스타드</b></h7>
                                    <h7 class="product-price d-block my-4"><del>8,000원</del><p><b>5,000원</b></p></h7>
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
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
                                <div class="product-body">
                                    <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                    <h7 class="product-title"><b><b class="text-secondary">[SALE] </b>칼로리 zero 머스타드</b></h7>
                                    <h7 class="product-price d-block my-4"><del>8,000원</del><p><b>5,000원</b></p></h7>
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
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
                                <div class="product-body">
                                    <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                    <h7 class="product-title"><b><b class="text-secondary">[SALE] </b>칼로리 zero 머스타드</b></h7>
                                    <h7 class="product-price d-block my-4"><del>8,000원</del><p><b>5,000원</b></p></h7>
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
                        <!-- 상품 중단 end -->

                    </div> 
                    <!-- 상품 리스트 영역 end -->
                    <br><br>

                    

        </section>
        <!-- Section end -->
	</div>


		<%@ include file="/views/common/footer.jsp" %>




















</body>
</html>