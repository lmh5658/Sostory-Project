<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.sos.myPage.model.vo.Liked" %>
<%@ page import="com.sos.common.model.vo.*" %>
    
<%
	// 찜한 상품목록 리스트
	List<Liked> list = (List<Liked>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜상품</title>

<!-- 마이페이지(찜상품목록페이지) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageLikedProductList.css" rel="stylesheet">


</head>
<body>
<div class="wrap">
      
        <%@ include file="/views/common/header.jsp" %>

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <!-- Section start -->
        <section class="main-content">

            <div class="main-wrap">

<!-- =========================================================================================================================== -->

              <!-- 사이드 nav바 start -->
		      <div class="menu_wrap" >
		
		          <div class="side_menu">
		              <button class="list">회원정보</button>
		              <div><a href="" id="updateMemInfo" style="color:white; text-decoration-line:none;">회원정보 변경</a></div>
		              <div><a href="<%= contextPath %>/updatePwdForm.me" style="color:white; text-decoration-line:none;">비밀변호 변경</a></div>
		              <div><a href="<%= contextPath %>/address.me" style="color:white; text-decoration-line:none;">배송지관리</a></div>
		              <div><a href="" id="deleteMember" style="color:white; text-decoration-line:none;">회원탈퇴</a></div>
		          </div>
		
		          <div class="side_menu">
		              <button class="list">My Tree</button>
		          </div>
		
		          <div class="side_menu">
		              <button class="list" id="likeList">찜목록</a>
		          </div>
		
		          <div class="side_menu">
		              <button class="list">고객문의</button>
		              <div>
		              <a href="<%= contextPath %>/qna.me?type=1&page=1" style="color:white; text-decoration-line:none;">상품문의</a><br>
		              <a href="<%= contextPath %>/qna.me?type=2&page=1" style="color:white; text-decoration-line:none;">1:1 문의</a>
		              </div>
		          </div>
		
		          <div class="side_menu">
		              <button class="list">주문조회</button>
		          </div>
		
		      </div>
		
			   <!-- 네비메뉴바 스크립트 -->
		       <script>
			   $(function(){
				   
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
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>찜목록</b></h3>
                    </div>
                    <div style="margin-left: 20px; width:970px; border-bottom:1px solid lightgray;">
                        <h4 class="btn categoryBtn" id="likedProduct"><b class="category">상품</b></h4>
                        <h4 class="btn categoryBtn" id="likedRecipe">레시피</h4>
                    </div>
                    <!-- 페이지 제목 영역 end -->
                    
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

                    <div>
                        <!-- 상품리스트 영역 start -->
	                    <div class="product-thumbnail-list d-flex flex-wrap w-100">
	                    
	                    	<% for(Liked li : list) { %>
	                    	<!-- 상품 썸네일 한개 start -->
	                    	
                            <div class="product img-thumbnail p-2 liked" style="width:300px; heigth:500px;">
                                <img class="product-img" src="<%= contextPath + "/" + li.getProductThumbnailUrl() %>" alt="Card image" style="width:100%; height:300px;">
                                <div class="product-body">
                                    <small class="product-category text-secondary d-block mb-3 mt-2"><%= li.getCategoryName() %></small>
                                    <h7 class="product-title"><b><%= li.getProductName() %></b></h7>
                                    <!-- 할인상품이 맞을경우 -->
                                    <% if(li.getDiscountPrice() != 0){ %>
                                    	<h7 class="product-price d-block mt-4"><s><b class="text-secondary"><%= li.getPrice() %></b></s></h7>
                                    	<h7 class="product-price d-block mt-1"><b><%= li.getPrice() - li.getDiscountPrice() %></b></h7>
                                    <% } else { %>
                                    <!-- 할인상품이 아닐경우 -->
                                    	<h7 class="product-price d-block mt-4"><b><%= li.getPrice() %></b></h7>
                                    <% } %>
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
                            <!-- 상품 썸네일 한개 end -->
                            <% } %>
	                            
                        </div>
                        <!-- 상품리스트 영역 end -->
                    </div>    
                    
                    <!-- 찜한상품(동적으로 생성된 요소) 관련 스크립트 -->
                    <script>
                    	$(function(){
                    		// 찜한상품 클릭시 ==> 해당상품 상세페이지로 이동시키는 함수
                    		$(".product-thumbnail-list").on("click", function(e){
                    			
                    			// 찜한상품
                    			const $product = $(e.target);
                    			console.log($product);
                    			
                    		})
                    		
                    	})
                    </script>



                    <!-- 페이징바 영역 start -->
                    <ul class="pagination justify-content center" style="margin-top:150px; margin-bottom:100px;">
                    <!-- 이전페이지 이동버튼 활성화여부 
                    	 (1) 비활성화 : 현재페이지 == 1페이지
                    	 (2)  활성화 : 현재페이지 != 1페이지 ==> (현재페이지 - 1)페이지로 이동요청 URL
                     -->
                     <% if(pi.getCurrentPage() == 1) { %>
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                     <% } else { %>
                     	<li class="page-item"><a class="page-link" href="<%= contextPath %>/like.me?type=p&page=<%= pi.getCurrentPage() - 1 %>">Previous</a></li>
                     <% } %>
                     <!-- 페이징바 페이지번호 활성화여부 
                          (1) 비활성화 : 현재페이지번호 == 페이징바페이지번호
                          (2)  활성화 : 현재페이지번호 != 페이징바페이지번호 ==> 해당번호의 페이지로 이동요청 URL
                      -->
                      <% for(int p=pi.getStartPage() ; p<=pi.getEndPage() ; p++) { %>
                      	<% if(p == pi.getCurrentPage()) { %>
                        	<li class="page-item active"><a class="page-link"><%= p %></a></li>
                      	<% } else { %>
                      		<li class="page-item"><a class="page-link" href="<%= contextPath %>/like.me?type=p&page=<%= p %>"><%= p %></a></li>
                      	<% } %>
                      <% } %>
                    <!-- 다음페이지 이동버튼 활성화여부 
                    	 (1) 비활성화 : 현재페이지 == 최대페이지
                    	 (2)  활성화 : 현재페이지 != 최대페이지 ==> (현재페이지 + 1)페이지로 이동요청 URL
                     -->
                    <% if(pi.getCurrentPage() == pi.getMaxPage() || pi.getMaxPage() == 0) { %>
                        <li class="page-item disabled"><a class="page-link">Next</a></li>
                    <% } else { %>
                    	<li class="page-item"><a class="page-link" href="<%= contextPath %>/like.me?type=p&page=<%= pi.getCurrentPage() + 1 %>">Next</a></li>
                    <% } %>
                    </ul>
                    <!-- 페이징바 영역 end -->
                </div>
                <!-- 상품 리스트 end-->
                 
                </div>
            </div>   
            <!-- 찜목록 영역 end -->
        </div>

    </section>
    <!-- Section end -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>