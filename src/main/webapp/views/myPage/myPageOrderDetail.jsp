<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap 
				,java.util.List
				,com.sos.cart.model.vo.Order 
				,com.sos.product.model.vo.Product" 
%>

<%
	HashMap<String, Object> result = (HashMap<String, Object>)request.getAttribute("result");
	Order orderInfo = (Order)result.get("orderInfo");
	List<Product> productList = (List<Product>)result.get("productList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세</title>

<!-- 마이페이지(주문상세페이지) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageOrderDetail.css" rel="stylesheet">

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
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>주문상세</b></h3>
                    </div>
                    <!-- 페이지 제목 영역 end -->

                    <!-- 컨텐츠 영역 start -->

                    <!-- 주문목록 -->
                    <h3 style="margin: 30px 0;"><b>주문목록</b></h3>

                    <div class="order_list order_content">

                        <div class="order-info" style="border-bottom: 1px solid gray;">
                            <label style="font-size: 20px; font-weight: bold; margin-left: 10px;">주문번호 : </label>
                            <label style="font-size: 20px; font-weight: bold;"><%= orderInfo.getOrderNo() %></label>
                            <label style="font-size: 18px; font-weight: bold; float: right; margin-right: 10px;"><%= orderInfo.getOrderDate() %></label>
                        </div>

                        <div class="product-list">
                            <!-- 주문상품목록 start -->
                            
                            <!-- 주문상품 한개 -->
                            <% for(Product p : productList) { %>
                            <div class="order_product">
                                <img style="width:200px; height:150px;" src="<%= contextPath + '/' + p.getPath() %> " alt="상품이미지">
                                <label class="product-name"><%= p.getProductName() %></label>
                                <label class="product-price">
                                    <!-- 할인중인 상품 -->
                                    <%if(p.getDiscountPrice() != 0) { %>
	                                    <s><%= p.getPrice() %>원</s><br>
	                                    <b><%= p.getPrice() - p.getDiscountPrice() %>원</b>
                                    <% } else { %>
                                    	<b><%= p.getPrice() %>원</b>
                                    <% } %>
                                </label>
                                <label class="amount">수량 : <%= p.getRowNum() %></label>
                            </div>
							<% } %>
                            
                        </div>
                        <!-- 주문상품목록 end -->

                    </div>

                    <div class="calc_payment mt-5">
                        <table>
                        	<% 
                        		int totalOriginPrice = 0;		// 주문상품의 총원가 합계
                        		int totalDiscountPrice = 0;		// 주문상품에 적용된 총할인가 합계
                        		
                        		for(Product p: productList){
                        			totalOriginPrice += p.getPrice() * p.getRowNum();				// 상품원가 * 구매수량
                        			
                        			if(p.getDiscountPrice() != 0){ // 할인가가 있는 상품일경우
                        				totalDiscountPrice += p.getDiscountPrice() * p.getRowNum();	// 상품할인가 * 구매수량
                        			}
                        		}
                        	%>
                            <tr>
                                <th>상품금액</th>
                                <th rowspan="2" style="font-size: 60px;">-</t>
                                <th>상품할인금액</th>
                                <th rowspan="2" style="font-size: 50px;">=</th>
                                <th>총 결제금액</th>
                            </tr>
                            <tr class="total_price">
                                <th><%= totalOriginPrice %></th>
                                <th><%= totalDiscountPrice %></th>
                                <th><%= totalOriginPrice - totalDiscountPrice %></th>
                            </tr>
                        </table>
                    </div>

                    <!-- 배송지 정보 -->
                    <h3 style="margin-top: 100px;"><b>배송지 정보</b></h3>
                    <div class="address order_content mt-2">
                        <table class="mt-3">
                            <tr>
                                <th class="th">배송지명</th>
                                <td class="td"><%= orderInfo.getAddressName() %></td>
                            </tr>
                            <tr>
                                <th class="th">이름</th>
                                <td class="td"><%= orderInfo.getName() %></td>
                            </tr>
                            <tr>
                                <th class="th">전화번호</th>
                                <td class="td"><%= orderInfo.getPhone() %></td>
                            </tr>
                            <tr>
                                <th class="th">주소</th>
                                <td class="td">
                                    <%= orderInfo.getAddress() %><br>
                                    <%= orderInfo.getAddressDetail() %>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <!-- 결제 정보 -->
                    <h3 style="margin-top: 100px;"><b>결제 정보</b></h3>
                    <div class="payment order_content mt-2">
                        <table class="mt-3">
                            <tr>
                                <th class="th">결제수단</th>
                                <td class="td"><%= orderInfo.getPayMethod().equals("A") ? "무통장입금" : "카드결제" %></td>
                            </tr>
                            <tr>
                                <th class="th">결제금액</th>
                                <td class="td"><%= totalOriginPrice - totalDiscountPrice %>원</td>
                            </tr>
                            <tr>
                                <th class="th">결제일시</th>
                                <td class="td"><%= orderInfo.getPayDate() != null ? orderInfo.getPayDate() : "" %></td>
                            </tr>
                        </table>
                    </div>

                    <div class="button-area">
                        <button type="button" class="btn btn-outline-primary" onclick="history.back();">목록가기</button>
                    </div>

                    <!-- 컨텐츠 영역 end -->
                </div>

	        </div>

            
        </section>
        <!-- Section end -->
        
<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>