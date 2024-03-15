<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랭킹목록페이지</title>

<style>
	/* 랭킹목록페이지 관련 스타일 */
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

        .product-grade{
            margin-top: 40px;
        }
        .product-price{
            margin-top: 30px;
        }
        .product-count>h2{
            margin-top: 40px;
        }
        .icon{
            margin-top: 40px;
        }
        .pagination{
            margin-top: 30px;
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

                    <!-- 상품 리스트 제목 영역 start -->
                    <div class="product-list-title">
                        <h1 class="d-inline"><b style="color: red;">BEST </b></h1><h1 class="d-inline"><b>Product</b></h1>
                    </div>
                    <!-- 상품 리스트 제목 영역 end -->

                    <!-- 상품 카테고리 영역 start -->
                    <div class="product-category my-5 w-100 d-flex justify-content-evenly">
                        <a href="#" class="btn btn-outline-danger btn-sm py-1 px-3">전체</a>
                        <a href="#" class="btn btn-outline-danger btn-sm py-1 px-3">장류</a>
                        <a href="#" class="btn btn-outline-danger btn-sm py-1 px-3">드레싱</a>
                        <a href="#" class="btn btn-outline-danger btn-sm py-1 px-3">기타</a>
                        <!-- 검색 영역-->
                        <a href="#" style="color: black;"><svg xmlns="http://www.w3.org/2000/svg" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                          </svg></a>
                        
                        
                    </div>
                    <!-- 상품 카테고리 영역 end -->
            </div>

             <!-- 상품 정렬 Select start -->
             <div class="select-product d-flex justify-content-end">
                <select class="selectpicker" style="width: 120px;">
                    <option>조회순</option>
                    <option>판매순</option>
                    <option>낮은가격순</option>
                    <option>높은가격순</option>
                </select>
            </div>
            <!-- 상품 정렬 Select end -->

                <!-- 상품 상단 영역 end -->


                    <!-- 상품 리스트 start -->
                    <div class="product-thumbnail-list d-flex flex-direction w-100">
                      
                    
                        <div class="thumbnail-list d-flex w-100 justify-content-evenly"> 
                            <!-- 상품 썸네일 start -->
                            <div class="product-count">
                                <h2>1</h2>

                            </div>

                            <div class="product img-thumbnail p-2" style="width:200px">
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
                                
                            </div>
                            <div class="product-name">
                                <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                <h7 class="product-title"><b><b style="color: rgb(150, 24, 136);">[BEST] </b>칼로리 zero 머스타드</b></h7>
                                
                            </div>

                            <div class="product-grade">
                               
                                <span style="font-size: 20px;">5.0</span> <!-- 상품리뷰 평점 -->
                                <span>(2)</span> <!-- 리뷰 수 -->
                           
                            </div>

                            <div class="product-price">
                            <h7 class="product-price d-block mb-3 mt-2"><b>8,000원</b></h7>
                             </div>

                            <div class="icon d-flex justify-content-end">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                                </svg>
                            </div>
                            <!-- 상품 썸네일 end -->

                        </div> 
                       

                    </div> 
                    <!-- 상품 리스트 영역 end -->

                     <!-- 상품 리스트 start -->
                     <div class="product-thumbnail-list d-flex flex-direction w-100">
                      
                    
                        <div class="thumbnail-list d-flex w-100 justify-content-evenly"> 
                            <!-- 상품 썸네일 start -->
                            <div class="product-count">
                                <h2>2</h2>

                            </div>

                            <div class="product img-thumbnail p-2" style="width:200px">
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
                                
                            </div>
                            <div class="product-name">
                                <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                <h7 class="product-title"><b><b style="color: rgb(150, 24, 136);">[BEST] </b>칼로리 zero 머스타드</b></h7>
                                
                            </div>

                            <div class="product-grade">
                               
                                <span style="font-size: 20px;">5.0</span> <!-- 상품리뷰 평점 -->
                                <span>(2)</span> <!-- 리뷰 수 -->
                           
                        </div>

                            <div class="product-price">
                            <h7 class="product-price d-block mb-3 mt-2"><b>8,000원</b></h7>
                             </div>

                            <div class="icon d-flex justify-content-end">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                                </svg>
                            </div>
                            <!-- 상품 썸네일 end -->

                        </div> 
                       

                    </div> 
                    <!-- 상품 리스트 영역 end -->

                     <!-- 상품 리스트 start -->
                     <div class="product-thumbnail-list d-flex flex-direction w-100">
                      
                    
                        <div class="thumbnail-list d-flex w-100 justify-content-evenly"> 
                            <!-- 상품 썸네일 start -->
                            <div class="product-count">
                                <h2>3</h2>

                            </div>

                            <div class="product img-thumbnail p-2" style="width:200px">
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
                                
                            </div>
                            <div class="product-name">
                                <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                <h7 class="product-title"><b><b style="color: rgb(150, 24, 136);">[BEST] </b>칼로리 zero 머스타드</b></h7>
                                
                            </div>

                            <div class="product-grade">
                               
                                <span style="font-size: 20px;">5.0</span> <!-- 상품리뷰 평점 -->
                                <span>(2)</span> <!-- 리뷰 수 -->
                           
                            </div>

                            <div class="product-price">
                            <h7 class="product-price d-block mb-3 mt-2"><b>8,000원</b></h7>
                             </div>

                            <div class="icon d-flex justify-content-end">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                                </svg>
                            </div>
                            <!-- 상품 썸네일 end -->

                        </div> 
                       

                    </div> 
                    <!-- 상품 리스트 영역 end -->

                     <!-- 상품 리스트 start -->
                     <div class="product-thumbnail-list d-flex flex-direction w-100">
                      
                    
                        <div class="thumbnail-list d-flex w-100 justify-content-evenly"> 
                            <!-- 상품 썸네일 start -->
                            <div class="product-count">
                                <h2>4</h2>

                            </div>

                            <div class="product img-thumbnail p-2" style="width:200px">
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
                                
                            </div>
                            <div class="product-name">
                                <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                <h7 class="product-title"><b><b style="color: rgb(150, 24, 136);">[BEST] </b>칼로리 zero 머스타드</b></h7>
                                
                            </div>

                            <div class="product-grade">
                               
                                <span style="font-size: 20px;">5.0</span> <!-- 상품리뷰 평점 -->
                                <span>(2)</span> <!-- 리뷰 수 -->
                           
                            </div>

                            <div class="product-price">
                            <h7 class="product-price d-block mb-3 mt-2"><b>8,000원</b></h7>
                             </div>

                            <div class="icon d-flex justify-content-end">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                                </svg>
                            </div>
                            <!-- 상품 썸네일 end -->

                        </div> 
                       

                    </div> 
                    <!-- 상품 리스트 영역 end -->

                     <!-- 상품 리스트 start -->
                     <div class="product-thumbnail-list d-flex flex-direction w-100">
                      
                    
                        <div class="thumbnail-list d-flex w-100 justify-content-evenly"> 
                            <!-- 상품 썸네일 start -->
                            <div class="product-count">
                                <h2>5</h2>

                            </div>

                            <div class="product img-thumbnail p-2" style="width:200px">
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
                                
                            </div>
                            <div class="product-name">
                                <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                <h7 class="product-title"><b><b style="color: rgb(150, 24, 136);">[BEST] </b>칼로리 zero 머스타드</b></h7>
                                
                            </div>

                            <div class="product-grade">
                               
                                <span style="font-size: 20px;">5.0</span> <!-- 상품리뷰 평점 -->
                                <span>(2)</span> <!-- 리뷰 수 -->
                               
                            </div>

                            <div class="product-price">
                            <h7 class="product-price d-block mb-3 mt-2"><b>8,000원</b></h7>
                             </div>

                            <div class="icon d-flex justify-content-end">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                                </svg>
                            </div>
                            <!-- 상품 썸네일 end -->

                        </div> 
                       

                    </div> 
                    <!-- 상품 리스트 영역 end -->

                     <!-- 상품 리스트 start -->
                     <div class="product-thumbnail-list d-flex flex-direction w-100">
                      
                    
                        <div class="thumbnail-list d-flex w-100 justify-content-evenly"> 
                            <!-- 상품 썸네일 start -->
                            <div class="product-count">
                                <h2>6</h2>

                            </div>

                            <div class="product img-thumbnail p-2" style="width:200px">
                                <img class="product-img" src="<%=contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
                                
                            </div>
                            <div class="product-name">
                                <small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
                                <h7 class="product-title"><b><b style="color: rgb(150, 24, 136);">[BEST] </b>칼로리 zero 머스타드</b></h7>
                                
                            </div>

                            <div class="product-grade">
                               
                                <span style="font-size: 20px;">5.0</span> <!-- 상품리뷰 평점 -->
                                <span>(2)</span> <!-- 리뷰 수 -->
                           
                        </div>

                            <div class="product-price">
                            <h7 class="product-price d-block mb-3 mt-2"><b>8,000원</b></h7>
                             </div>

                            <div class="icon d-flex justify-content-end">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                                </svg>
                            </div>
                            <!-- 상품 썸네일 end -->

                        </div> 
                       

                    </div> 
                    <!-- 상품 리스트 영역 end -->

                    

                     <!-- 페이징바 영역 start -->
                     
                     
                      <ul class="pagination justify-content center">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                      </ul> 
                  
                    <!-- 페이징바 영역 end -->

                    

        </section>
       </div>
        <!-- Section end -->
        
        <%@ include file="/views/common/footer.jsp" %>








</body>
</html>