<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.sos.myPage.model.vo.Liked" %>
<%@ page import="com.sos.common.model.vo.*" %>
<%@ page import="com.sos.cart.model.vo.Cart" %>
    
<%
	// 찜한 상품목록 리스트
	List<Liked> likedList = (List<Liked>)request.getAttribute("likedList");
	// 장바구니 상품번호 리스트
	List<Integer> pNoList = (List<Integer>)request.getAttribute("pNoList");
	// 페이징바 객체
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
                        <h4 class="btn categoryBtn" id="likedProduct"><b class="category">상품</b></h4>
                        <h4 class="btn categoryBtn" id="likedRecipe">레시피</h4>
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

                    <div>
                        <!-- 상품리스트 영역 start -->
	                    <div class="product-thumbnail-list d-flex flex-wrap w-100">
	                    
	                    	<% if(likedList.isEmpty()) { %>
	                    		<h3 class="text-secondary mt-5" style="margin-left:300px;">찜한 상품내역이 존재하지 않습니다.</h3>
	                    	<% } else { %>
	                    		<% for(Liked li : likedList) { %>
		                    	<!-- 상품 썸네일 한개 start -->
	                            <div class="product img-thumbnail p-2" style="width:290px; heigth:500px;">
	                            	<div class="item">
			                    		<input type="hidden" class="pNo" value="<%= li.getProductNo() %>">
		                                <img class="product-img" src="<%= contextPath + "/" + li.getProductThumbnailUrl() %>" alt="Card image" style="width:100%; height:300px;">
		                                <div class="product-body">
		                                    <small class="product-category text-secondary d-block mb-3 mt-2"><%= li.getCategoryName() %></small>
		                                    <h7 class="product-title d-block"><b><%= li.getProductName() %></b></h7>
		                                    <!-- 할인상품이 맞을경우 -->
		                                    <% if(li.getDiscountPrice() != 0){ %>
		                                    	<label class="product-price mt-1"><b><%= li.getPrice() - li.getDiscountPrice() %>원</b></label>
		                                    	<label class="product-price mt-4"><s><b class="text-secondary"><%= li.getPrice() %>원</b></s></label>
		                                    <% } else { %>
		                                    <!-- 할인상품이 아닐경우 -->
		                                    	<label class="product-price mt-4"><b><%= li.getPrice() %>원</b></label>
		                                    <% } %>
		                                </div>
	                                </div>
	                                    <div class="icon d-flex justify-content-end">
	                                    	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red" class="like me-4" viewBox="0 0 16 16">
											  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
											</svg>
		                                <!-- 장바구니 아이콘 컬러구분
		                                	case 01) 찜한상품 & 장바구니에 이미담긴 상품
		                                	case 02) 찜한상품 & 장바구니에 담지않은 상품
		                                -->
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16">
	                                          <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
	                                       	</svg>
	                                        
	                                    </div>
	                            </div>
	                            <!-- 상품 썸네일 한개 end -->
	                            <% } %>
	                    	<% } %>
	                            
                        </div>
                        <!-- 상품리스트 영역 end -->
                    </div>    
                    
                    <!-- 찜한상품(동적으로 생성된 요소) 관련 스크립트 -->
                    <script>
                    	$(function(){

                    		// 찜한상품이 장바구니에 담긴상품인지 구분하여 아이콘컬러를 구분하는 함수(페이지로드 즉시실행)
                    		$(".product").each(function(){
                    			
                    			const pNoList = <%= pNoList %>;				// 사용자가 장바구니에 담은상품의 상품번호 배열
                    			const $pNo = $(this).find(".pNo").val();	// 찜한상품 상품번호
                    			const $cart = $(this).find(".cart");		// 장바구니 아이콘태그
                    			
                    			for(let i=0 ; i<pNoList.length ; i++){
                    				// 장바구니에 담긴상품일 경우 ==> 아이콘컬러 : 파란색
                    				if(pNoList[i] == $pNo){	
                    					$cart.attr("fill", "blue");
                    				}
                    			}
                    		})
                    		
                    		
                    		/* 찜한상품 장바구니 클릭시 실행될 함수
                    		 * 
                    		 * case 01) 아이콘색(검정색)일경우 클릭시 ==> 장바구니추가 요청
                    		 *          (1) 장바구니 추가요청
                    		 *          (2) 삭제성공시 : "해당상품이 장바구니에 추가되었습니다." ==> 아이콘색 변경(파랑)
                    		 *              삭제실패시 : "장바구니에 추가하지 못했습니다. 다시 시도해주세요."
                    		 * 
                    		 * case 02) 아이콘색(파랑색)일경우 클릭시 ==> 장바구니삭제 요청
                    		 *          (1) 장바구니 삭제요청
                    		 *          (2) 삭제성공시 : "해당상품이 장바구니에서 삭제되었습니다." ==> 아이콘색 변경(검정)
                    		*/
                    		$(".cart").on("click", function(e){
                    			
                    			const $cart = $(this);											// 장바구니 아이콘태그
                    			const $pNo = $(this).parent().prev().children(".pNo").val();	// 찜한 상품번호
                    			const userNo = <%= loginUser.getUserNo() %>;					// 찜한 회원번호
                    			
                    			// 아이콘색(검정색) == 장바구니 추가요청
                    			if($cart.attr("fill") != 'blue'){
                    				// case 01) 해당상품 장바구니 추가요청 ajax통신
                        			$.ajax({
                        				url:"<%= contextPath %>/add.ca",
                        				data:{
                        					"userNo" : userNo,
                        					"productNo" : $pNo,
                        					"cart_amount" : 1
                        				},success:function(result){
                        					if(result > 0){
                        						$cart.attr("fill", "blue");
                        					}
                        				}
                        			})
                    			}else{
                    				// case 02) 아이콘색(파란색) == 장바구니 삭제요청
                    				$.ajax({
                        				url:"<%= contextPath %>/del.ca",
                        				data:{
                        					"userNo" : userNo,
                        					"productNo" : $pNo
                        				},success:function(result){
                        					if(result > 0){
                        						$cart.attr("fill", "black");
                        						alert("상품이 장바구니에서 삭제되었습니다.")
                        					
                        					}
                        				}
                        			})
                    			}
                    			
                    			
                    		})
                    		
                    		// 찜한상품 찜취소 요청 (찜하기버튼 클릭)
                    		$(".like").on("click", function(){
                    			
                    			const $pNo = $(this).parent().prev().children(".pNo").val();	// 찜한 상품번호
                    			const userNo = <%= loginUser.getUserNo() %>;					// 찜한 회원번호
                    			
                    			$.ajax({
                    				url :"<%= contextPath %>/dheart.pr",
                    				data : {
                    					"proNo" : $pNo 
                    				},success:function(result){
                    					if(result>0){
                    						alert("상품이 찜목록에서 삭제되었습니다.");
                    						location.reload();
                    					}
                    				}
                    			})
                    			
                    			
                    			
                    		})
                    		
                    		
                    		
                    		// 찜한상품 클릭시 ==> 해당상품 상세페이지로 이동시키는 함수
                    		$(".item").on("click", function(e){
                    			
                    			// 찜한 상품번호
                    			const $pNo = $(this).children(".pNo").val();
                    			
                    			// 해당상품 상세페이지 이동요청
                    			location.href = "<%= contextPath %>/detail.pr?no=" + $pNo;
                    			
                    		})
                    		
                    	})
                    </script>



                    <!-- 페이징바 영역 start -->
                    <ul class="pagination justify-content center" style="margin-top:150px; margin-bottom:100px;">
                    <!-- 이전페이지 이동버튼 활성화여부 
                    	 (1) 비활성화 : 현재페이지 == 1페이지
                    	 (2)  활성화 : 현재페이지 != 1페이지 ==> (현재페이지 - 1)페이지로 이동요청 URL
                     -->
                     <% if(pi.getCurrentPage() == 1 || pi.getMaxPage() == 0) { %>
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