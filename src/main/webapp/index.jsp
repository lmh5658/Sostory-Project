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
	                 <img src="<%= contextPath %>/resources/images/mainImage1.jpg" alt="ad1" class="d-block" style="width:100%; height: 600px;">
	             </div>
	             <div class="carousel-item">
	                 <img src="<%= contextPath %>/resources/images/mainImage2.jpg" alt="ad2" class="d-block" style="width:100%; height: 600px;">
	             </div>
	             <div class="carousel-item">
	                 <img src="<%= contextPath %>/resources/images/mainImage1.jpg" alt="ad3" class="d-block" style="width:100%; height: 600px;">
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
	                     <button id="category1" class="btn btn-outline-danger btn-sm py-1 px-3" onclick="filter('all');">전체</button>
	                     <button id="category2" class="btn btn-outline-danger btn-sm py-1 px-3" onclick="filter('best');">랭킹</button>
	                     <button id="category3" class="btn btn-outline-danger btn-sm py-1 px-3" onclick="filter('new');">신상품</button>
	                 </div>
	                 <!-- 상품 카테고리 영역 end -->
	
	                 <!-- 상품 리스트 start -->
	                 <div class="product-thumbnail-list d-flex flex-column w-100">
	                     <!-- 상품 썸네일 리스트영역 start -->
	                     <div class="product-list d-flex w-100 flex-wrap justify-content-around"> 
	                     
	                        <!-- 상품목록이 생성될 영역 -->
							
	                     </div> 
	                     <!-- 상품 썸네일 리스트영역 end -->
	                     
	                     <!-- 상품 리스트 더보기 버튼 영역 start -->
	                     <div class="more-product center mt-5">
	                         <button class="btn btn-outline-secondary bg-secondary text-white btn-sm px-3" id="product-btn">더보기</button>
	                     </div>
	                     <!-- 상품 리스트 더보기 버튼 영역 end -->
	                     
	                     <!-- 메인페이지 상품목록 관련 스크립트 -->
	                     <script>
	                     	let user = null;				// script 전영역에서 공통으로 사용할 로그인한 회원정보 변수
	                     	
	                     	$(function(){
	                     		
	                     		selectProductList('all');	// 페이지로드 즉시 메인페이지 상품목록 조회 함수호출
	                     		
	                     		let num = 0;
	                     		let id = "";
	                     		
	                     		// 상품목록조회 영역 3초마다 갱신
	                     		setInterval(function(){
	                     			if(num < 3){
	                     				num += 1;
	                     			}else{
	                     				num = 1;
	                     			}
	                     			id = 'category' + num;
	                     			$(document.getElementById(id)).click();
	                     		}, 3000);
	                     		
	                     		
	                     	})
	                     	
	                     	// 특정상품 클릭시, 해당상품 상세페이지 이동요청시 실행될 함수
	                     	$(".product-list").on("click", ".product-body", function(){
	                     		let pNo = $(this).next().children(":hidden").val();	// 상품번호
	                     		location.href = "<%= contextPath %>/detail.pr?no=" + pNo;
	                     	})
	                     	
	                     	// 상품목록 "더보기" 버튼클릭시 해당리스트 카테고리의 상품목록 페이지 이동요청시 실행될 함수
	                     	$("#product-btn").click(function(){
	                     		
	                     		if($("#category").val() == 'all'){// 전체상품페이지
	                     			location.href = "<%= contextPath %>/alist.pr?page=1";
	                     		}else if($("#category").val() == 'best'){ // 랭킹상품페이지
	                     			location.href = "<%= contextPath %>/rank.pr?page=1";
	                     		}else if($("#category").val() == 'new'){ // 신상품페이지
	                     			location.href = "<%= contextPath %>/listNew.pr?page=1";
	                     		}
	                     	})
	                     	
	                     	// 상품목록조회 Ajax통신
                     		function selectProductList(category){
	                     		// category : "all" == 전체상품 | "best" == 랭킹상품 | "new" == 신상품
                     			$.ajax({
	                     			url:"<%= contextPath %>/product.mp",
	                     			async:false,
	                     			data:{"category":category},
	                     			success:function(result){
	                     				
	                     				let productList = result[0];	// 메인페이지 상품목록
                     					let cartList = result[1];		// 로그인한 사용자가 장바구니에 담은 상품번호 리스트
                     					let likedList = result[2];		// 로그인한 사용자가 찜한상품 상품번호 리스트
                     					user = result[3];				// 로그인한 사용자일 경우 : 사용자 회원번호
	                     				
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
	                     						if(product.discountPrice == 0){
	                     							list += 		"<h7 class='product-price d-block my-3'><b>" + product.price + "원</b></h7>";
	                     						}else{
	                     							list += 		"<h7 class='product-price d-block my-3'><b>" + (product.price - product.discountPrice) + "원</b>" + "  " + "<s class='text-secondary fw-bold'>" + product.price + "원</s></h7>";
	                     						}
	                     						list += 		"</div>";
	                     						list += 		"<div class='icon d-flex justify-content-end' style='margin-top:-20px;'>";
	                     						list += 			"<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='like me-4' viewBox='0 0 16 16'>";
	                     						list += 				"<path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314'/>";
	                     						list += 			"</svg>";
	                     						list +=	 			"<input type='hidden' value='" + product.productNo + "'>"
	                     						list += 			"<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='cart me-2' viewBox='0 0 16 16'>";
	                     						list += 				"<path d='M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2'/>";
	                     						list += 			"</svg>";
	                     						list += 		"</div>";
	                     						list += "</div>";
	                     						
	                     					}
	                     					
	                     					// 상품목록 생성
	                     					$(".product-list").html(list);
	                     					
	                     					// ====================================================================== 로그인한 사용자일 경우 ======================================================================================
	                     					
	                     					
	                     					if(user.userNo != null) {// 로그인한 사용자일 경우
	                     						
	                     						// (1) 장바구니 담긴상품표시 (장바구니에 추가한 상품이 존재할경우)
	                     						if(cartList.length != 0){
	                     							$(".product").each(function(){
	                     								for(let i=0 ; i<cartList.length ; i++){
	                     									if(cartList[i].pNo == $(this).find("input:hidden").val()){
	                     										$(this).find(".cart").attr("fill", "blue");
	                     									}
	                     								} 
	                     							})
	                     						} // if end 
	                     						
	                     						// (2) 찜한 상품표시 (찜한 상품이 존재할경우)
	                     						if(likedList.length != 0){
	                     							$(".product").each(function(){
	                     								for(let i=0 ; i<likedList.length ; i++){
	                     									if(likedList[i].pNo == $(this).find("input:hidden").val()){
	                     										$(this).find(".like").attr("fill", "red");
	                     									} 
	                     								} 
	                     							}) 
	                     						} // 찜상품표시 if end
	                     						
	                     					} // 로그인여부 if end

	                     				 } // 상품목록리스트 생성용 if end
	                     				 
	                     			} // success end
	                     			
	                     		}) // ajax end
	                     		
                     		} // selectProductList() end
                     		
                     		
	                     	
                     		/* 조회할 상품리스트 카테고리 버튼클릭시 실행될 함수
                     		 *
                     		 * "all" == 전체상품
                     		 * "best" == 랭킹상품
                     		 * "new" == 신상품
                     		*/
                     		function filter(category){
                     			$("#category").val(category);
                     			
                     			if(category == 'all'){
                     				$(document.getElementById('category' + 1)).siblings(".active").removeClass("active");
                     				$(document.getElementById('category' + 1)).addClass("active");	
                     			}else if(category == 'best'){
                     				$(document.getElementById('category' + 2)).siblings(".active").removeClass("active");
                     				$(document.getElementById('category' + 2)).addClass("active");
                     			}else if(category == 'new'){
                     				$(document.getElementById('category' + 3)).siblings(".active").removeClass("active");
                     				$(document.getElementById('category' + 3)).addClass("active");
                     			}
                     			selectProductList(category);
                     		}
                     		
                     		/* 상품 장바구니추가버튼클릭시 실행될 함수
                     		 * 
                     		 * case 01) 로그인 상태가 아닐경우 ==> "로그인을 먼저 진행해주세요."
                     		 *         
                     		 * case 02) 로그인 상태일 경우
                     		 *          (1) 장바구니 담기 (아이콘색 == 검정색) ==> 찜하기 요청
                     		 *          (2) 장바구니 삭제 (이이콘색 == 파란색) ==> 찜해제 요청
                     		*/
                     		$(".product-list").on("click", "svg.cart", function(){
                     			let pNo = $(this).prev().val();
                     			if(user.userNo == null) { // 로그인 상태가 아닐경우
                     				if(confirm("로그인을 먼저 진행해주세요.")){
                     					location.href="<%= contextPath %>/loginForm.me";
                     				}
                     			} else { // 로그인 상태일경우
                     				
                     				if($(this).attr("fill") == 'blue'){ // 장바구니 삭제요청    
                     					$(this).attr("fill", "black");
                     					$.ajax({
                     						url:"<%= contextPath %>/del.ca",
                     						data:{
                     							"productNo":$(this).prev().val(),
                     							"userNo":user.userNo,
                     							},
                     						success:function(result){
                     							if(result > 0){
                     								
                     							}else{
                     								
                     							} 
                     							
                     						} // success end
                     						
                     					}) // ajax end
                     					
                     				}else{
                     					$(this).attr("fill", "blue");
                     					$.ajax({
                     						url:"<%= contextPath %>/add.ca",
                     						data:{
                     							"productNo":$(this).prev().val(),
                     							"userNo":user.userNo,
                     							"cart_amount":1
                     							},
                     						success:function(result){
                     							if(result > 0){
                     								
                     							}else{
                     								
                     							} 
                     						} // success end
                     						
                     					}) // ajax end 
                     					
                     				} // 장바구니추가&삭제 if-else end
                     			
                     			} // 로그인여부 if-else end 
                     			
                     		}) // 장바구니 클릭시 실행함수 end
                     		
                     		
                     		
                     		/* 상품 찜하기버튼클릭시 실행될 함수
                     		 * 
                     		 * case 01) 로그인 상태가 아닐경우 ==> "로그인을 먼저 진행해주세요."
                     		 *         
                     		 * case 02) 로그인 상태일 경우
                     		 *          (1) 찜하기 (아이콘색 == 검정색) ==> 찜하기 요청
                     		 *          (2) 찜해제 (이이콘색 == 빨간색) ==> 찜해제 요청
                     		*/
                     		$(".product-list").on("click", "svg.like", function(){
                     			if(user.userNo == null) { 
                     				if(confirm("로그인을 먼저 진행해주세요.")){
                     					location.href="<%= contextPath %>/loginForm.me";
                     				}
                     			} else { // 로그인 상태일경우
                     
                     				if($(this).attr("fill") == 'red'){	// 찜해제 요청
                     					$(this).attr("fill", "black");
                     					$.ajax({
                     						url:"<%= contextPath %>/dheart.pr",
                     						data:{"proNo":$(this).next().val()},
                     						success:function(result){
                     							if(result > 0){
                     								
                     							}else{
                     								
                     							} 
                     							
                     						} // success end 
                     						
                     					}) // ajax end
                     				}else{
                     					
                     					$(this).attr("fill", "red");
                     					
                     					$.ajax({
                     						url:"<%= contextPath %>/heart.pr",
                     						data:{"proNo":$(this).next().val()},
                     						success:function(result){
                     							if(result > 0){
                     								
                     							}else{
                     								
                     							}
                     							
                     						} // success end
                     						
                     					}) // ajax end
                     					
                     				} // 찜하기 & 찜해제 if-else end 
                     				
                     			} // 로그인 여부 if-else end 
                     			 
                     		}) // 상품찜하기 버튼클릭시 실행함수 end 
                 
	                     </script>
	
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
	                         <button id="recipe-btn" class="btn btn-outline-secondary bg-secondary text-white btn-sm px-3">더보기</button>
	                     </div>
	                     <!-- 레시피 더보기 버튼 영역 end -->
	                     
	                     <script>
	                     	let maxPage = 0;
	                     	
	                     	$(function(){
	                     		let page = 1;				// 메인페이지 레시피목록 조회시 전달될 페이지값 매개변수
	                     		
	                     		selectRecipeList(page);		// 페이지 로드와 동시에 메인페이지 레시피목록조회 함수호출
	                     		
	                     		// 3초마다 레시피목록 갱신
	                     		setInterval(function(){
	                     			if(page < maxPage){
	                     				page += 1;
	                     			}else {
	                     				page = 1;
	                     			}
	                     			selectRecipeList(page);
	                     		}, 3000);
	                     		
	                     	}) // $(function{}) end
	                     	
	                     	
                         	// 특정레시피 클릭시, 해당레시피 상세페이지 이동요청시 실행될 함수
                         	$(".recipe-list").on("click", ".recipe-body", function(){
                         		let rNo = $(this).next().children(".rNo").val();
                         		location.href = "<%= contextPath %>/detail.re?no=" + rNo;
                         	})
                         	
                         	// 특정레시피 관련상품 클릭시, 해당관련상품 상세페이지 이동요청시 실행될 함수
                         	$(".recipe-list").on("click", ".recipe-product", function(){
                         		let pNo = $(this).prev().children(".pNo").val();
                         		location.href = "<%= contextPath %>/detail.pr?no=" + pNo;
                         	})
                    
                         	// 레시피커뮤니티 "더보기" 버튼크릭시, 레시피게시판 목록페이지 이동요청시 실행될 함수
                         	$("#recipe-btn").click(function(){
                         		location.href = "<%= contextPath %>/list.re?page=1";
                         	})
                         	
                         	// 메인페이지 레시피목록 조회 Ajax 통신용 함수
                         	function selectRecipeList(requestPage){
                         		$.ajax({
                         			url:"<%= contextPath %>/recipe.mp",
                         			data:{"page":requestPage},
                         			async:false,
                         			success:function(result){
                         				
                         				let recipeList = result[0];	// 메인페이지 레시피목록
                         				maxPage = result[1];		// 레시피 리스트 최대페이지수
                         				
                         				let likedList = result[2];	// 사용자가 찜한레시피 번호
                         				
                         				let list = "";				// 레시피리스트 생서할 HTML구문 변수
                         				
                         				if(recipeList.length != 0){
                         					
                         					let recipe = null;		// 리스트내의 각 레시피가 담길 변수
                         					
                         					for(let i=0 ; i<recipeList.length ; i++){
                         						recipe = recipeList[i];
                         						
                         						list += "<div class='recipe-wrap'>";
                         						list += 	"<div class='recipe' style='width:300px'>";
                         						
                         						// 레시피 썸네일 영역
                         						list += 		"<div class='recipe-body'>";
                         						list += 			"<img class='recipe-img-top' src='" + <%= contextPath + '/' %> + recipe.recipeUrl  + "' alt='recipe thumbnail' style='width:300px; height:200px; border-radius: 40px;'>";
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
                         						list += 			"<input type='hidden' class='pNo' value='" + recipe.productNo + "'>";
                         						list += 			"<input type='hidden' class='rNo' value='" + recipe.recipeNo + "'>";
                         						list += 			"<div class='recipe-good' style='width: 40%; padding-left: 40px;'>";
                         						list += 				"<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='like me-4' viewBox='0 0 16 16'>";
	                     						list += 					"<path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15'/>";
	                     						list += 				"</svg>"; 
                                              	list += 				"<label class='total-good' style='margin-top: 35px;'>(" + recipe.totalLiked + ")</label>";
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
                                              		list += 			"<div class='recipe-product-price mt-5'><lebel class='fw-bold'>" + (recipe.price - recipe.discountPrice) + "원</label></div>";
                                              	}else{
                                              		list += 			"<div class='recipe-product-price mt-5'><label class='fw-bold'>" + (recipe.price - recipe.discountPrice) + "원</label>" + "  " + "<s class='text-secondary fw-bold'>" + recipe.price + "원</s></div>";	
                                              	}
                                              	list += 			"</div>";
                                              	list += 		"</div>";
                                              	
                                              	list += 	"</div>";
                                              	list += "</div>";

                         					} // for end
                         					
                         				} // 레시피리스트 생성 if end
                         				
                         				// 레시피목록 생성
                         				$(".recipe-list").html(list);
                         				
                         				// 로그인한 사용자일 경우 찜한레시피 찜표시 
                         				if(user.userNo != null){
                         					$(".recipe-good").prev().each(function(){
                         						let rNo = $(this).val();
                         						for(let i=0 ; i<likedList.length ; i++){
                         							if(rNo == likedList[i]){
                         								$(this).next().children(".like").attr("fill", "red");
                         							}
                         							
                         						} // likedList for end
                         						
                         					}) // each end
                         					
                         				} // 로그인여부 확인용 if end 
                         				
                         			} // success end
                         			
                         		}) // ajax end 
                         		
                         	} // selectRecipe() end
                         	
                         	
                         	
                         // 레시피 좋아요 클릭시, 실행될 함수
                       	$(".recipe-list").on("click", "svg.like", function(){
                       		let rNo = $(this).parent().prev().val()
                       		
                       		if(user.userNo == null){
                       			if(confirm("로그인을 먼저 진행해주세요.")){
                 					location.href="<%= contextPath %>/loginForm.me";
                 				}
                       		}else{
                       			if($(this).attr("fill") == 'red'){	// 레시피 찜해제
                       				$(this).attr("fill", "black");
                       				$.ajax({
                       					url:"<%= contextPath %>/dlike.re",
                       					data:{"rNo":rNo},
                       					success:function(result){
                       						
                       					},error:function(){
                       						
                       					}
                       				}) 
                       			}else{	// 레시피 찜하기
                       				$(this).attr("fill", "red");
                       				$.ajax({
                       					url:"<%= contextPath %>/like.re",
                       					data:{"rNo":rNo},
                       					success:function(result){
                       						
                       					},error:function(){
                       						
                       					}
                       					
                       				}) // ajax end
                       				
                       			} // 레시피찜&해제 if-else end
                       			
                       		} // 로그인여부 확인용 if-else end 
                       		
                       	}) // on() end
                       	
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