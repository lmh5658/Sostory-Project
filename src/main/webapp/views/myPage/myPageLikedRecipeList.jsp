<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.sos.myPage.model.vo.Liked" %>
<%@ page import="com.sos.common.model.vo.*" %>
    
<%
	// 찜한 상품목록 리스트
	List<Liked> likedList = (List<Liked>)request.getAttribute("likedList");
	// 페이징바 객체
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜레시피</title>

<!-- 마이페이지(찜레시피목록페이지) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageLikedRecipeList.css" rel="stylesheet">
    
</head>
<body>
 <div class="wrap">
      
        <%@ include file="/views/common/header.jsp" %>
        
        <% if(loginUser == null){ // alert 시킬 알람문구가 존재할 경우 %>
	        <script>
	           alert('로그인을 먼저 진행해주세요'); // 문자열 취급시 따옴표로 감싸야됨
	           location.href="<%=contextPath%>/loginForm.me";
	        </script>
		<% } %>

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <!-- Section start -->
        <section class="main-content">

            <div class="main-wrap">

<!-- =========================================================================================================================== -->

              <!-- 사이드 nav바 start -->
		      <div class="menu_wrap" style="width:200px;">
		
		          <div class="side_menu">
		              <button class="list">회원정보</button>
		              <div><a href="" id="updateMemInfo" style="color:white; text-decoration-line:none;">회원정보 변경</a></div>
		              <div><a href="<%= contextPath %>/updatePwdForm.me" style="color:white; text-decoration-line:none;">비밀변호 변경</a></div>
		              <div><a href="<%= contextPath %>/address.me" style="color:white; text-decoration-line:none;">배송지관리</a></div>
		              <div><a href="" id="deleteMember" style="color:white; text-decoration-line:none;">회원탈퇴</a></div>
		          </div>
		
		          <div class="side_menu">
		              <button class="list" id="my-tree">My Tree</button>
		          </div>
		
		          <div class="side_menu">
				        <button type="button" id="likeList" class="list">찜목록</button>
				   </div>
		
		          <div class="side_menu">
		              <button class="list">고객문의</button>
		              <div>
		              <a href="<%= contextPath %>/qlist.me?type=1" style="color:white; text-decoration-line:none;">상품문의</a><br>
		              <a href="<%= contextPath %>/qlist.me?type=2" style="color:white; text-decoration-line:none;">1:1 문의</a>
		              </div>
		          </div>
		
		          <div class="side_menu">
				        <button class="list" id="orderList">주문조회</button>
				  </div>
		
		      </div>
		
			   <!-- 네비메뉴바 스크립트 -->
		       <script>
			   $(function(){
					
				   // 사이드메뉴-MyTree(내가 작성한 레피시목록페이지) 이동요청 버튼클릭시 실행될 함수
				   	$("#my-tree").click(function(){
				   		location.href = "<%= contextPath %>/recipe.me?page=1";
				   	})
				   
					// 사이드메뉴-주문조회 이동요청 버튼클릭시 실해될 함수
				   	$("#orderList").click(function(){
				   		location.href = "<%= contextPath %>/olist.me";
				   	})
				   	
					// 사이드메뉴-찜목록 이동요청 버튼클릭시 실행될 함수
				    $("#likeList").click(function(){
				    	location.href="<%= contextPath %>/like.me?type=p&page=1";
				    })	
				   
				   // 회원탈퇴페이지 요청시 실행될 함수
				   $("#deleteMember").click(function(e){
					   
					  /* 
					   * case 01) 회원탈퇴페이지 진입이후 동일페이지를 재요청할 경우 : 비밀번호확인 x
					   * case 02) 이외페이지에서 회원탈퇴페이지 요청할 경우 : 비밀번호확인
					  */
					   if(location.href.indexOf("<%= contextPath %>/deleteForm.me") == -1){
						   
						   let userPwd = prompt("본인확인을 위해 비밀번호를 입력해주세요.", "");
						   
						   if("<%= loginUser.getUserPwd() %>" == userPwd){
								   /* 
								    * 로그인한 회원(회원탈퇴 요청회원)의 비밀번호와 사용자가 입력한 비밀번호가 일치할경우
								   	* ==> 회원탈퇴페이지 이동
								   */
								   $(this).attr("href", "<%= contextPath %>/deleteForm.me");
							   }
						   
						   if("<%= loginUser.getUserPwd() %>" != userPwd){
								   /*
								    * 로그인한 회원(회원탈퇴 요청회원)의 비밀번호와 사용자가 입력한 비밀번호가 일치하지 않을경우
								    * ==> alert("실패메세지")
								   */
								   alert("비밀번호가 일치하지 않습니다.");
						   } 
					   }
					   
					   
				   })
				   
				   // 회원정보변경페이지 요청시 실행될 함수
				   $("#updateMemInfo").click(function(e){
					   
					   /* 
					    * case 01) 회원정보변경페이지 진입이후 동일페이지를 재요청할 경우 : 비밀번호확인 x
					    * case 02) 이외페이지에서 회원정보변경페이지 요청할 경우 : 비밀번호확인
					    */
					   if(location.href.indexOf("<%= contextPath %>/updateForm.me") == -1){
						   
						   let userPwd = prompt("본인확인을 위해 비밀번호를 입력해주세요.", "");
						   
						   if("<%= loginUser.getUserPwd() %>" == userPwd){
								   /* 
								    * 로그인한 회원(정보변경을 요청한 회원)의 비밀번호와 사용자가 입력한 비밀번호가 일치할경우
								   	* ==> 회원정보변경 페이지 이동
								   */
								   $(this).attr("href", "<%= contextPath %>/updateForm.me");
							   }
						   
						   if("<%= loginUser.getUserPwd() %>" != userPwd){
								   /*
								    * 로그인한 회원(정보변경 요청한 회원)의 비밀번호와 사용자가 입력한 비밀번호가 일치하지 않을경우
								    * ==> alert("실패메세지")
								   */
								   alert("비밀번호가 일치하지 않습니다.");
						   } 
					   }
					   
					   
				   })
				   
					// 마이페이지 nav메뉴바 목록 슬라이딩 처리용 함수
			        $(".side_menu>button").click(function(){       
			            const $b = $(this).nextAll();
			
			            if($b.css("display") == "none") {          
			                $(".list").siblings("div").slideUp();
			                $b.slideDown();         
			            }else{
			                $b.slideUp();
			            }
		
		        	})
		        	
			    })
				</script>	
		      	<!-- 사이드 nav바 end -->

<!-- =========================================================================================================================== -->

                <!-- 찜목록 영역 start -->
                <div class="main-page">

                    <!-- 페이지 제목 영역 start -->
                    <div class="page-title">
                        <svg id="main" style="pointer-events: visible; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>찜목록</b></h3>
                    </div>
                    
                     <div style="margin-left: 20px; width:970px; border-bottom:1px solid lightgray;">
                        <h4 class="btn categoryBtn" id="likedProduct">상품</h4>
                        <h4 class="btn categoryBtn" id="likedRecipe"><b class="category">레시피</b></h4>
                    </div>
                    <!-- 페이지 제목 영역 end -->
                    
                    <script>
                    	$(function(){
                    		// 회원아이콘 클릭시, 마이페이지-메인페이지 이동요청시 실행될 함수
                    		$("#main").click(function(){
                    			location.href="<%= contextPath %>/myPage.me";
                    		})
                    	})
                    </script>
                    
                    <!-- 찜유형(상품 | 레시피) 버튼클릭시 실행될 스크립트 -->
                    <script>
                    	$(function(){
                    		// 찜상품 목록조회 요청시(버튼클릭) 실행될 함수
                    		$("#likedProduct").click(function(){
                    			location.href = "<%= contextPath %>/like.me?type=p&page=1";
                    		})
                    		
                    		// 찜레시피 목록조회 요청시(버튼클릭) 실행될 함수
                    		$("#likedRecipe").click(function(){
                    			location.href = "<%= contextPath %>/like.me?type=r&page=1";
                    		})
                    	})
                    </script>

                    <!-- 찜목록 영역 start -->
                    <!-- 레시피가 없을 경우 -->
			        <!-- 레시피가 존재하지 않습니다. -->
			
			        <!-- 레시피가 있는 경우 -->
			        <div class="recipe_wrap">
			       	<% if(likedList.isEmpty()) { %>
			       		<h3 class="text-secondary mt-5" style="margin-left:300px;">찜한 상품내역이 존재하지 않습니다.</h3>
			       	<% } else { %>
			       		<% for(Liked li : likedList) { %>
				       		<!-- 레시피 한개 start -->
				            <div class="recipe">
				            
				            	<!-- 레시피 썸네일영역 start -->
					            <div class="recipe-item">
					            	<input type="hidden" class="rNo" value="<%= li.getRecipeNo() %>">
					                <div class="recipe_thumbnail">
					                    <img src="<%= contextPath + "/" + li.getRecipeThumbnailUrl() %>" alt="레시피썸네일이미지" style="width:280px; height:190px;">
					                </div>
					                <div class="recipe_category"><%= li.getCategoryName() %></div>
					                <div class="recipe_name" style="font-weight: bolder;"><%= li.getRecipeTitle() %></div>
					                <div class="recipe_detail">
					                    <%= li.getRecipeIntro() %>
					                </div>
					             </div>
				                <!-- 레시피 썸네일영역 end -->
				                
				             	<!-- 레시피 찜하기영역 start -->
				                <div class="recipe_etc">
				                	<input type="hidden" class="rNo" value="<%= li.getRecipeNo() %>">
				                    <div class="recipe_userProfile">
				                        <img src="<%= contextPath + "/" + li.getUserProfileUrl() %>" alt="프로필" height="15px">
				                        <%= li.getRecipeWriter() %>
				                    </div>
				                    <div class="recipe_like">
				                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red" class="like me-4" viewBox="0 0 16 16">
											<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
										</svg>
				                        (<%= li.getLikedTotal() %>)
				                    </div>
				                </div>
				             	<!-- 레시피 찜하기영역 end -->  
				             	
					             <!-- 레시피 관련상품 영역 start --> 
					             <div class="product-item">
					             	<input type="hidden" class="pNo" value="<%= li.getProductNo() %>">
					                <div class="recipe_product">
					                    <div class="product_img">
					                        <img src="<%= contextPath + "/" + li.getProductThumbnailUrl() %>" alt="상품" style="width:106px; height:70px;">
					                    </div>
					                    <div class="product_etc ms-2">
					                        <div style="color: grey; margin:0;"><%= li.getProductName() %></div>
					                        <!-- 할인하고 있지 않을 때 -->
					                        <% if(li.getDiscountPrice() == 0) { %>
					                         	<div class="d-block"><%= li.getPrice() %>원</div>
					                        <% } else { %>
					                        <!-- 할인하고 있을 때 -->
					                        	<div class="product_price"><s style="color:grey; font-size:14px"><%= li.getPrice() %>원</s>&nbsp;<%= li.getPrice() - li.getDiscountPrice() %>원</div>
					                        <% } %>
					                        <div class="product_star">별(<%= li.getRating() %>)</div>
					                    </div>
					                </div>
					              </div>
					              <!-- 레시피 관련상품 영역 end --> 
				              
				            </div>
				            <!-- 레시피 한개 end -->
				        <% } %>
			       	<% } %>
			        
			        <!-- 레시피 리스트관련 스크립트 start -->
			        <script>
			        	$(function(){
			        		// 레시피 찜해제요청시 실행될 함수
			        		$(".recipe_wrap").on("click", ".like", function(){
			        			console.log($(this));
			        		})
			        		
			        		// 레시피상세페이지 이동요청시 실행될 함수 (레시피썸네일영역 클릭시)
			        		$(".recipe-item").on("click", function(){
			        			const $rNo = $(this).children(".rNo").val();	// 레시피번호
			        			// 레시피 상세페이지 이동요청
			        			location.href = "<%= contextPath %>/detail.re?no=" + $rNo;
			        		})
			        		
			        		// 레시피 관련상품상세페이지 이동요청시 실행될 함수 (레시피관련상품영역 클릭시)
			        		$(".product-item").on("click", function(){
			        			const $pNo = $(this).children(".pNo").val();	// 관련상품번호
			        			// 관련상품상세페이지 이동요청
			        			location.href = "<%= contextPath %>/detail.pr?no=" + $pNo;
			        		})
			        		
			        		// 레시피찜 취소시 실행될 함수
			        		$(".recipe_like>svg").on("click", function(){
			        			const $rNo = $(this).parents(".recipe_etc").children(".rNo").val();		// 레시피번호
			        			// 레시피찜 취소요청
			        			
			        		})
			        		
			        		
			        	})
			        </script>
			        <!-- 레시피 리스트관련 스크립트 end -->
			            
			        </div>   
		            <!-- 찜목록 영역 end -->
		
		            <div style="display: flex; justify-content: center;">
		                <!-- 페이징바 영역 start -->
	                    <ul class="pagination justify-content center" style="margin-top:150px; margin-bottom:100px;">
	                    <!-- 이전페이지 이동버튼 활성화여부 
	                    	 (1) 비활성화 : 현재페이지 == 1페이지
	                    	 (2)  활성화 : 현재페이지 != 1페이지 ==> (현재페이지 - 1)페이지로 이동요청 URL
	                     -->
	                     <% if(pi.getCurrentPage() == 1) { %>
	                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                     <% } else { %>
	                     	<li class="page-item"><a class="page-link" href="<%= contextPath %>/like.me?type=r&page=<%= pi.getCurrentPage() - 1 %>">Previous</a></li>
	                     <% } %>
	                     <!-- 페이징바 페이지번호 활성화여부 
	                          (1) 비활성화 : 현재페이지번호 == 페이징바페이지번호
	                          (2)  활성화 : 현재페이지번호 != 페이징바페이지번호 ==> 해당번호의 페이지로 이동요청 URL
	                      -->
	                      <% for(int p=pi.getStartPage() ; p<=pi.getEndPage() ; p++) { %>
	                      	<% if(p == pi.getCurrentPage()) { %>
	                        	<li class="page-item active"><a class="page-link"><%= p %></a></li>
	                      	<% } else { %>
	                      		<li class="page-item"><a class="page-link" href="<%= contextPath %>/like.me?type=r&page=<%= p %>"><%= p %></a></li>
	                      	<% } %>
	                      <% } %>
	                    <!-- 다음페이지 이동버튼 활성화여부 
	                    	 (1) 비활성화 : 현재페이지 == 최대페이지
	                    	 (2)  활성화 : 현재페이지 != 최대페이지 ==> (현재페이지 + 1)페이지로 이동요청 URL
	                     -->
	                    <% if(pi.getCurrentPage() == pi.getMaxPage() || pi.getMaxPage() == 0) { %>
	                        <li class="page-item disabled"><a class="page-link">Next</a></li>
	                    <% } else { %>
	                    	<li class="page-item"><a class="page-link" href="<%= contextPath %>/like.me?type=r&page=<%= pi.getCurrentPage() + 1 %>">Next</a></li>
	                    <% } %>
	                    </ul>
	                    <!-- 페이징바 영역 end -->
		            </div>
		        </section>
		        <!-- Section end -->
		        
<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>