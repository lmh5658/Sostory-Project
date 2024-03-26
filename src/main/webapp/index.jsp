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
.product-body:hover{cursor:pointer; opacity:0.8;}
.product-body:hover, .recipe-body:hover, .recipe-product:hover{cursor: pointer; opacity: 0.8;}
.recipe-product{display: flex;}
.icon-good, .cart, .like{pointer-events:visible;}
.icon-good:hover, .cart:hover, .like:hover{cursor:pointer;}
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
	                 <input type="hidden" value="all" id="category">
	                 <div class="product-category my-5 w-100 d-flex justify-content-evenly">
	                     <button class="btn btn-outline-danger btn-sm py-1 px-3" onclick="filter('all');">전체</button>
	                     <button class="btn btn-outline-danger btn-sm py-1 px-3" onclick="filter('best');">랭킹</button>
	                     <button class="btn btn-outline-danger btn-sm py-1 px-3" onclick="filter('new');">신상품</button>
	                 </div>
	                 <!-- 상품 카테고리 영역 end -->
	
	                 <!-- 상품 리스트 start -->
	                 <div class="product-thumbnail-list d-flex flex-column w-100">
	                     <!-- 상품 썸네일 리스트영역 start -->
	                     <div class="product-list d-flex w-100 flex-wrap justify-content-around"> 
	                     
	                        <!-- 상품목록이 생성될 영역 -->
							
	                     </div> 
	                     <!-- 상품 썸네일 리스트영역 end -->
	                     
	                     <script>
	                     	$(function(){
	                     		// 상품목록조회 함수호출
	                     		selectProductList('all');
	                     		
	                     		
	                     	})
	                     	
	                     	// 상품목록조회 Ajax통신
                     		function selectProductList(category){
	                     		// category : "all" == 전체상품 | "best" == 랭킹상품 | "new" == 신상품
                     			$.ajax({
	                     			url:"<%= contextPath %>/product.mp",
	                     			data:{"category":category},
	                     			success:function(productList){
	                     				
	                     				console.log("성공");
	                     				console.log(productList);
	                     				
	                     				let list = "";			// 상품목록리스트 생성용 HTML 변수
	                     				
	                     				if(productList.length != 0){

	                     					let product = null;		// 반복문내 리스트의 각상품을 담을 변수
	                     					
	                     					for(let i=0 ; i<productList.length ; i++){
	                     						
	                     						product = productList[i];
	                     						
	                     						list += "<div class='product img-thumbnail p-2 my-3' style='width:300px; height:450px; margin-right:10px;'>";
	                     						list += 		"<div class='product-body' style='width:100%; height:100%;'>";
	                     						list += 			"<img class='product-img' src='" + <%= contextPath + '/' %>  + product.productUrl + "' alt='product image' style='width:100%; height:300px;'>";
	                     						list += 			"<small class='product-category text-secondary d-block mb-3 mt-2'>" + product.categoryName + "</small>";
	                     						list += 			"<h7 class='product-title'><b>" + product.productName + "</b></h7>";
	                     						list += 			"<h7 class='product-price d-block my-3'><b>" + product.price + "원</b></h7>";
	                     						list += 		"</div>";
	                     						list += 		"<div class='icon d-flex justify-content-end' style='margin-top:-20px;'>";
	                     						list += 			"<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='like me-4' viewBox='0 0 16 16'>";
	                     						list += 				"<path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314'/>";
	                     						list += 			"</svg>";
	                     						list +=	 			"<input type='hidden' value='" + product.productNo + "'>"
	                     						list += 			"<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='cart me-2' viewBox='0 0 16 16' onclick='cartProduct(" + product.productNo + ");'>";
	                     						list += 				"<path d='M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2'/>";
	                     						list += 			"</svg>";
	                     						list += 		"</div>";
	                     						list += "</div>";

	                     					}
	                     					
	                     					// 상품목록 생성
	                     					$(".product-list").html(list);
	                     					
	                     				}
	                     				
	                     				
	                     			},complete:function(){
	                     				console.log("완료");
	                     			}
	                     		})
                     		}
                     		
	                     	// 레시피목록조회 Ajax통신
                     		function selectRecipeList(){
                     			
                     		}
	                     	
                     		/* 조회할 상품리스트 카테고리 버튼클릭시 실행될 함수
                     		
                     		 * "all" == 전체상품
                     		 * "best" == 랭킹상품
                     		 * "new" == 신상품
                     		*/
                     		function filter(category){
                     			$("#category").val(category);
                     			selectProductList(category);
                     		}
                     		
                     		/* 상품 찜하기버튼클릭시 실행될 함수
                     		 * 
                     		 * case 01) 로그인 상태가 아닐경우 ==> "로그인을 먼저 진행해주세요."
                     		 *         
                     		 * case 02) 로그인 상태일 경우
                     		 *          (1) 찜하기 (아이콘색 == 검정색) ==> 찜하기 요청
                     		 *          (2) 찜해제 (이이콘색 == 빨간색) ==> 찜해제 요청
                     		*/
                     		$(".product-list").on("click", "svg.like", function(){
                     			console.log("하이");
                     			if(<%= loginUser %> == null){
                     				if(confirm("로그인을 먼저 진행해주세요.")){
                     					location.href="<%= contextPath %>/loginForm.me";
                     				}
                     			}else{ // 로그인 상태일 경우
                     				if($(this).attr("fill") == 'red'){	// 찜해제 요청
                     					$.ajax({
                     						url:"<%= contextPath %>/dheart.pr",
                     						data:{"proNo":$(this).next().val()},
                     						success:function(result){
                     							if(result > 0){
                     								$(this).attr("fill", "black");
                     							}else{
                     								alert("상품 찜해제가 정상적으로 처리되지 않았습니다. 다시 시도해주세요~");
                     							}
                     						}
                     					})
                     				}else{	// 찜하기 요청
                     					$.ajax({
                     						url:"<%= contextPath %>/heart.pr",
                     						data:{"proNo":$(this).next().val()},
                     						success:function(result){
                     							if(result > 0){
                     								$(this).attr("fill", "red");
                     							}else{
                     								alert("상품 찜하기가 정상적으로 처리되지 않았습니다. 다시 시도해주세요~");
                     							}
                     						}
                     					})
                     				}
                     			}
                     			 
                     		})
                     		
                     		
                     		// 상품 장바구니추가버튼클릭시 실행될 함수
                     		function cartProduct(productNo){
                     			
                     		}
	                     </script>
	
	                     <!-- 상품 리스트 더보기 버튼 영역 start -->
	                     <div class="more-product center mt-5">
	                         <a href="#" class="btn btn-outline-secondary bg-secondary text-white btn-sm px-3">더보기</a>
	                     </div>
	                     <!-- 상품 리스트 더보기 버튼 영역 end -->
	                 </div> 
	                 <!-- 상품 리스트 영역 end -->
	
<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	
	                 
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
	
	                         <!-- 레시피 목록이 생성될 영역 -->
	
	                     </div>
	                     <!-- 레시피 커뮤니티 리스트 end -->
	
	                     <!-- 레시피 더보기 버튼 영역 start -->
	                     <div class="more-recipe mt-5 center">
	                         <a href="#" class="btn btn-outline-secondary bg-secondary text-white btn-sm px-3">더보기</a>
	                     </div>
	                     <!-- 레시피 더보기 버튼 영역 end -->
	                     
	                     <script>
                         	$(function(){
                         		let page = 1;
                         		
                         		selectRecipeList(page);
                         		
                         		
                         	})
                         	
                         	function selectRecipeList(requestPage){
                         		$.ajax({
                         			url:"<%= contextPath %>/recipe.mp",
                         			data:{"page":requestPage},
                         			// async:false,
                         			success:function(recipeList){
                         				console.log("성공");
                         				console.log(recipeList);
                         				
                         				let list = "";				// 레시피리스트 생서할 HTML구문 변수
                         				
                         				if(recipeList.length != 0){
                         					
                         					let recipe = null;		// 리스트내의 각 레시피가 담길 변수
                         					
                         					for(let i=0 ; i<recipeList.length ; i++){
                         						recipe = recipeList[i];
                         						
                         						list += "<div class='recipe-wrap'>";
                         						list += 	"<div class='recipe' style='width:300px'>";
                         						
                         						// 레시피 썸네일 영역
                         						list += 		"<div class='recipe-body'>";
                         						list += 			"<img class='recipe-img-top' src='" + <%= contextPath + '/' %> + recipe.recipeUrl  + "' alt='recipe thumbnail' style='width:100%; border-radius: 30px;'>";
                         						list += 			"<small class='recipe-category d-block text-secondary my-3'>" + recipe.categoryName + "</small>";
                         						list += 			"<h7 class='recipe-title'><b>" + recipe.recipeTitle + "</b></h7>";
                         						list += 			"<small class='recipe-intro d-block text-secondary text-wrap my-2'>" + recipe.recipeIntro + "</small>";
                         						list += 		"</div>";
                         						
                         						list +=			"<div class='recipe-etc d-flex my-3 mt-4 border-bottom pb-2'>";
                         						list += 			"<div class='recipe-writer' style='text-align:middle; width: 60%;'>";
                         						
                         						// 레시피 작성자 영역
                         						list += 				"<div class='profile d-flex' style='padding-top:8px;'>";
                         						list += 					"<img style='width: 50px; height:50px; border:1px solid black; border-radius: 150px;' src='" + recipe.userUrl + "' alt='user profile image'>";
                         						list += 					"<label style='padding-top:20px; padding-left:10px;'>" + recipe.userId + "</label>";
                         						list += 				"</div>";
                         						list +=				"</div>";
                         						
                         						// 레시피 좋아요 영역
                         						list += 			"<div class='recipe-good' style='width: 40%; padding-left: 40px; padding-top:25px;'>";
                         						list += 				"<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='like me-4' viewBox='0 0 16 16' onclick='likeRecipe(" + recipe.recipeNo + ");'>";
	                     						list += 					"<path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15'/>";
	                     						list += 				"</svg>"; 
                                              	list += 				"<label class='total-good'>(" + recipe.totalLiked + ")</label>";
                                              	list += 			"</div>";
                                              	list += 		"</div>";
                                              	
                                              	// 레시피 관련상품 영역
                                              	list += 		"<div class='recipe-product border-top d-flex pt-4' style='display: flex;'>";
                                              	list += 			"<div class='recipe-product-img border me-4' style='width: 100px; height: 100px;'>";
                                              	list += 				"<img src='" + <%= contextPath + '/' %> + recipe.productUrl + "' alt='product image' style='width: 100%; height: 100%;'>";
                                              	list += 			"</div>";
                                              	list += 			"<div class='recipe-product-detail'>";
                                              	list += 				"<div class='recipe-product-title'><h6 class='fw-bold'>" + recipe.productName + "</h6></div>";
                                              	if(recipe.discountPrice == 0){
                                              		list += 				"<div class='recipe-product-price mt-5'><h6 class='fw-bold'>" + (recipe.price - recipe.discountPrice) + "원</h6></div>";
                                              	}else{
                                              		list += 				"<div class='recipe-product-price mt-5'><s class='text-secondary fw-bold'>" + recipe.price + "원</s>" + " " + "<h6 class='fw-bold'>" + (recipe.price - recipe.discountPrice) + "원</h6></div>";	
                                              	}
                                              	list += 			"</div>";
                                              	list += 		"</div>";
                                              	
                                              	list += 	"</div>";
                                              	list += "</div>";

                         					}
                         				}
                         				
                         				// 레시피목록 생성
                         				$(".recipe-list").html(list);
                         				
                         				
                         			},complete:function(){
                         				console.log("완료");
                         			}
                         		})
                         	}
                         	
                         // 레시피 좋아요 클릭시, 실행될 함수
                       	function likeRecipe(recipeNo){
                       		console.log("레시피 번호 : " + recipeNo);
                       	}
                         	
	                     </script>
	                     
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