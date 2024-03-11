<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{box-sizing: border-box;}
    .main-content {
        min-height: 400px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .community_logo{margin-top: 70px;}
    .community_logo>img {
        width: 300px;
    }

    .underbar {
        width: 200px;
        height: 10px;
        border-bottom: 1px solid lightgrey;
    }

    .category_wrap {
        display: flex;
        gap: 100px;
    }

    .category_button {
        width: 120px;
        height: 40px;
        background-color: lightgrey;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: large;
        border-radius: 5px;
    }
    .category_button:hover{
        cursor: pointer;
        background-color: grey;
    }
    .recipe_search{
        height: 100px;
        padding: 30px 0px;
    }
    .recipe_search>input{
        width: 600px;
        height: 100%;
        border: none;
        border-bottom: 1px solid grey;
        outline: none;
    }
    .recipe_search>img{
        height: 100%;
        cursor: pointer;
    }

    .etc_wrap{
        width: 100%;
        display: flex;
        justify-content: right;
        gap: 20px;
        margin: 50px;
    }
    .etc_wrap>select{
        align-self: self-end;
        height: 70%;
    }
    .recipe_wrap{
        width: 100%;
        background-color: rgb(248, 243, 236);
        display: flex;
        justify-content: left;
        flex-wrap: wrap;
        padding: 30px 15px;
    }
    .recipe{
        width: 330px;
        height: 450px;
        margin: 20px 30px;
        padding: 20px;
        flex-shrink: 0;
    }
    .recipe:hover{
        cursor: pointer;
        background-color: antiquewhite;
    }
    .recipe_thumbnail{
        width: 100%;
        height: 45%;
        background-color: white;
        border-radius: 50px;
    }
    .recipe_category{
        font-size: 12px;
        margin-top: 15px;
    }
    .recipe_detail{color: grey;}
    .recipe_etc{
        display: flex;
        padding: 10px 0px;
        border-bottom: 1px solid grey;
        justify-content: space-between;
    }
    .recipe_etc div{
        font-size: small;
        font-weight: bold;
    }
    .recipe_product{
        border-top: 1px solid grey;
        margin-top: 5px;
        padding: 10px 0px;
        display: flex;
    }
    .recipe_product>.product_img{
        width: 40%;
        height: 20%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>
</head>
<body>

<div class="wrap container p-3">
		
		<%@ include file="/views/common/header.jsp" %>
		
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
	
	        <div class="community_logo">
	            <p style="margin-bottom: 0;">community</p>
	            <img src="resources/KakaoTalk_20240310_194335082.png" alt="community_logo">
	        </div>
	        <div class="underbar"></div>
	        <br><br><br>
	
	        <!-- 카테고리 -->
	        <div class="category_wrap">
	            <div class="category_button">전체</div>
	            <div class="category_button">장류</div>
	            <div class="category_button">드레싱</div>
	            <div class="category_button">기타</div>
	        </div>
	
	        <!-- 검색바 -->
	        <div class="recipe_search">
	            <input type="text">
	            <img src="" alt="검색">
	        </div>
	
	        <div class="etc_wrap">
	            <select name="">
	                <option value="">인기순</option>
	                <option value="">낮은 인기순</option>
	            </select>
	            <a href="" class="btn btn-secondary btn-lg">글쓰기</a>
	        </div>
	
	        <!-- 레시피 컨텐츠 -->
	
	        <!-- 레시피가 없을 경우 -->
	        <!-- 레시피가 존재하지 않습니다. -->
	
	        <!-- 레시피가 있는 경우 -->
	        <div class="recipe_wrap">
	            <div class="recipe">
	                <div class="recipe_thumbnail">
	                    <img src="">
	                </div>
	                <div class="recipe_category">분류>전통장/장류</div>
	                <div class="recipe_name" style="font-weight: bolder;">고추장 불고기</div>
	                <div class="recipe_detail">
	                    칼로리 zero 고추장을 사용해 만든 고추장 불고기에요!
	                </div>
	                <div class="recipe_etc">
	                    <div class="recipe_userProfile">
	                        <img src="" alt="프로필">
	                        user01
	                    </div>
	                    <div class="recipe_like">
	                        <img src="" alt="하트">
	                        (2000)
	                    </div>
	                </div>
	                <div class="recipe_product">
	                    <div class="product_img">
	                        <img src="" alt="상품">
	                    </div>
	                    <div class="product_etc">
	                        칼로리 zero 고추장
	                        <div class="product_price">8,000원</div>
	                        <div class="product_star">별별별별별(2)</div>
	                    </div>
	                </div>
	            </div>
	
	            <div class="recipe">
	                <div class="recipe_thumbnail">
	                    <img src="">
	                </div>
	                <div class="recipe_category">분류>전통장/장류</div>
	                <div class="recipe_name" style="font-weight: bolder;">고추장 불고기</div>
	                <div class="recipe_detail">
	                    칼로리 zero 고추장을 사용해 만든 고추장 불고기에요!
	                </div>
	                <div class="recipe_etc">
	                    <div class="recipe_userProfile">
	                        <img src="" alt="프로필">
	                        user01
	                    </div>
	                    <div class="recipe_like">
	                        <img src="" alt="하트">
	                        (2000)
	                    </div>
	                </div>
	                <div class="recipe_product">
	                    <div class="product_img">
	                        <img src="" alt="상품">
	                    </div>
	                    <div class="product_etc">
	                        칼로리 zero 고추장
	                        <div class="product_price">8,000원</div>
	                        <div class="product_star">별별별별별(2)</div>
	                    </div>
	                </div>
	            </div>
	
	            <div class="recipe">
	                <div class="recipe_thumbnail">
	                    <img src="">
	                </div>
	                <div class="recipe_category">분류>전통장/장류</div>
	                <div class="recipe_name" style="font-weight: bolder;">고추장 불고기</div>
	                <div class="recipe_detail">
	                    칼로리 zero 고추장을 사용해 만든 고추장 불고기에요!
	                </div>
	                <div class="recipe_etc">
	                    <div class="recipe_userProfile">
	                        <img src="" alt="프로필">
	                        user01
	                    </div>
	                    <div class="recipe_like">
	                        <img src="" alt="하트">
	                        (2000)
	                    </div>
	                </div>
	                <div class="recipe_product">
	                    <div class="product_img">
	                        <img src="" alt="상품">
	                    </div>
	                    <div class="product_etc">
	                        칼로리 zero 고추장
	                        <div class="product_price">8,000원</div>
	                        <div class="product_star">별별별별별(2)</div>
	                    </div>
	                </div>
	            </div>
	
	            <div class="recipe">
	                <div class="recipe_thumbnail">
	                    <img src="">
	                </div>
	                <div class="recipe_category">분류>전통장/장류</div>
	                <div class="recipe_name" style="font-weight: bolder;">고추장 불고기</div>
	                <div class="recipe_detail">
	                    칼로리 zero 고추장을 사용해 만든 고추장 불고기에요!
	                </div>
	                <div class="recipe_etc">
	                    <div class="recipe_userProfile">
	                        <img src="" alt="프로필">
	                        user01
	                    </div>
	                    <div class="recipe_like">
	                        <img src="" alt="하트">
	                        (2000)
	                    </div>
	                </div>
	                <div class="recipe_product">
	                    <div class="product_img">
	                        <img src="" alt="상품">
	                    </div>
	                    <div class="product_etc">
	                        칼로리 zero 고추장
	                        <div class="product_price">8,000원</div>
	                        <div class="product_star">별별별별별(2)</div>
	                    </div>
	                </div>
	            </div>
	        </div>
	
	     </section>
	     <!-- Section end -->
	     
	     <%@ include file="/views/common/footer.jsp" %>
	     
	 </div>

</body>
</html>