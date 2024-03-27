<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.cart.model.vo.Cart, java.util.List, com.sos.common.model.vo.PageInfo"%>

 <%
 	List<Cart> list = (List<Cart>)request.getAttribute("list");
 	String totalPrice = (String)request.getAttribute("totalPrice");
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니목록페이지</title>
<style>

/* 장바구니목록 관련 스타일 */
        
        .cart-price{
            margin-top: 30px;
        }
        
        .icon{
            margin-top: 40px;
        }
        .pagination{
            margin-top: 30px;
        }
        .cart-count{
            margin-top: 40px;
        }
        .icon svg{
        	cursor: pointer;
        
        }
        
        #cartDiscountPrice{
        	display: none;
		 }
		 
	   .cart-hh{
	   
	   	display: flex;
    	flex-direction: row; /* 요소들을 가로로 나열 */
    	justify-content: space-between; /* 요소들 사이에 여백 추가 */
	   
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

                        <h1 class="d-inline"><b>장바구니</b></h1>

                    </div>
                    <!-- 상품 리스트 제목 영역 end -->
                    
            </div>
            <hr>

                <!-- 상품 상단 영역 end -->


               
                    <div class="d-flex" style="margin-bottom: 20px;">
                        
                        <input type="checkbox" style="width: 30px;" id="selectAll-cart" checked>
                    
                        
                        <b>전체선택(해제)</b>

                    </div>
                    
                   

				<!-- 장바구니 목록리스트 start -->
			<form action="<%=contextPath %>/payForm.pa" method="post">
				<div class="cart-list">
				
                    <!-- 상품 리스트 start -->
                   
                    <% for(Cart c : list) { %>
                    <div class="product-thumbnail-list d-flex flex-direction w-100">
                        <div class="thumbnail-list d-flex w-100 justify-content-evenly"> 
                            <!-- 상품 썸네일 start -->
                            <input type="hidden" class="pNo" name="hiddencartProductNo" value="<%= c.getProductNo() %>">
                            
                                <input type="checkbox" name="productNo" value="<%=c.getProductNo() %>" style="width: 30px;" class="cartCheckbox" checked onclick="updateTotalPrice()">
                            <div class="product img-thumbnail p-2" style="width:200px">
                                <img class="product-img" src="<%=contextPath + "/" + c.getPath() %>" alt="Card image" style="width:100%">
                                <input type="hidden"  name="cartImage" value="<%=contextPath + "/" + c.getPath() %>">
                                
                            </div>
                            <div class="product-name">
                                <small class="product-category text-secondary d-block mb-3 mt-2"><%=c.getCategoryName() %></small>
                                <h7 class="product-title"><b ><b style="color: rgb(150, 24, 136);"></b><%= c.getProductName()%></b></h7>
                                <input type="hidden"  name="cartName" value="<%= c.getProductName()%>">
                            </div>
                            <div class="cart-price cart-hh">
                            <%if(c.getDiscountPrice() ==0){ %>
                            	<h5 class="cart-price d-block mb-3 mt-2"><b id="cartPrice"><%=c.getPrice() %></b></h5>
                            	<%}else{ %>
                            	<h5 class="cart-price d-block mb-3 mt-2"><b id="cartPrice"><%=c.getPrice()-c.getDiscountPrice() %></b></h5>
                            	<span>&nbsp&nbsp</span>
                            	<h5 class="cart-price d-block mb-3 mt-2" style="color:gray;"><b><s><%=c.getPrice() %></s></b></h5>
                            	<s id="cartDiscountPrice"><%=c.getDiscountPrice() %></s> <%-- 스타일 display : none으로 가격 숨김 --%>
                            
                            	<%} %>
                            	<input type="hidden" name="priceMisnusDiscountPrice" value="<%=c.getPrice()-c.getDiscountPrice() %>">
                            	<input type="hidden" name="changePrice" value="<%=c.getPrice() %>">
                            	<input type="hidden" name="changeDiscountPrice" value="<%=c.getDiscountPrice() %>">
                             </div>
                             <div class="cart-count">
                             <!-- 수량 증감버튼 -->
                                <input type="button" value="-" style="width: 30px;" class="quantity-decrement">
                                <input type="text" id="cartCount"  value="<%=c.getCartAmount() %>" style="width: 40px; text-align: center;" min="1" class="quantity-input" name="changeCount">
                                <input type="button" value="+" style="width: 30px;" class="quantity-increment">
                            </div>
                            <div class="icon d-flex justify-content-end">
                            
                                <svg class="delete" style="pointer-events: visible"onclick="cartDelete(this);" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-excel" viewBox="0 0 16 16" class="cartCheck">
                                    <path d="M5.18 4.616a.5.5 0 0 1 .704.064L8 7.219l2.116-2.54a.5.5 0 1 1 .768.641L8.651 8l2.233 2.68a.5.5 0 0 1-.768.64L8 8.781l-2.116 2.54a.5.5 0 0 1-.768-.641L7.349 8 5.116 5.32a.5.5 0 0 1 .064-.704"/>
                                    <path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1"/>
                                 </svg>
                            </div>
                            <!-- 상품 썸네일 end -->
                        </div> 
                    </div>
                    <!-- 상품 리스트 end -->
                    <br>
                    
                    <%} %>
                  </div>
                  
                  <!-- 장바구니 목록리스트 end -->
                       
                    <hr>
                    <br>
                    
                    <!-- 상품 금액 표시 영역 start -->
                    <div class="cart-allprice d-flex flex-direction justify-content-evenly" style="background-color: rgba(240, 240, 240); height: 300px;">
                        
                            <div class="center">
                                <div class="d-flex flex-column productPrice" style="border-radius: 30px; border: 1px solid black; width: 200px; height: 150px;">
                                    
	                                <h4 class="center" style="padding-top: 30px;">상품금액</h4>
	                                <h2 class="center" id="totalPrice">0</h2>
                                </div>

                            </div>
                            
                            <div class="center">
                                <div class="center" style="border-radius: 30px; border: 0px solid black; width: 100px; height: 150px;">
                               		 <h1>-</h1>
                                </div>
                            </div>

                            <div class="center">
                                <div class="d-flex flex-column" style="border-radius: 30px; border: 1px solid black; width: 200px; height: 150px;">
	                                <h4 class="center" style="padding-top: 30px;">상품할인금액</h4>
	                                <h2 class="center" id="discountPrice">0</h2>
	                                <input type="hidden" name="discountPrice" id="hiddendiscountPrice">
                                </div>
                            </div>
                            <div class="center">
                                <div class="center" style="border-radius: 10px; border: 0px solid black; width: 100px; height: 150px;">
                                   <h1>=</h1>
                                </div>

                            </div>
                            <div class="center">
                                <div class="d-flex flex-column" style="border-radius: 30px; border: 1px solid black; width: 200px; height: 150px;">
	
	                                <h4 class="center totalPayment" style="padding-top: 30px;">총 결제금액</h4>
	                                <h2 class="center" id="allPrice">0</h2>
	                                <input type="hidden" name="allPrice" id="hiddenAllPrice">
                                 </div>
                            </div>

                    </div>
                    <br>
                    <div class="d-flex flex-direction justify-content-evenly">
                    
                        <button onclick="goBack()" class="btn btn-outline-dark" style="background-color: rgb(197, 191, 191); border-radius: 15px; color: black;">뒤로가기</button>
                        <button type="submit" class="btn btn-outline-dark" style="background-color: rgb(206, 73, 73); border-radius: 15px; color: white;">주문하기</button>

                     </div>
                  </form>
                  
                  
                     <br>
                    <!-- 상품 금액 표시 영역 end -->
                    
        	</section>
        <!-- Section end -->
         </div>
         				
         				
                  		
                  		
	                           
          				<script>
                           
                                <!-- 체크박스 선택시 선택된 상품의 가격들만 변동 -->
                                function updateTotalPrice() {
                                    var totalPrice = 0;
                                    var totalDiscount = 0;
                                    $('.cartCheckbox:checked').each(function() {
                                    	// 상품가격 업데이트
                                        var priceElement = $(this).closest('.thumbnail-list').find('#cartPrice');
                                        var priceText = priceElement.text();
                                        var price = parseInt(priceText.replace('원', '').trim()) || 0;
                                        
                                        // 할인가격 업데이트
                                        var discountElement = $(this).closest('.thumbnail-list').find('#cartDiscountPrice'); // 할인 가격 요소 선택
                                        var discountText = discountElement.text();
                                        var discountPrice = parseInt(discountText.replace('원', '').trim()) || 0; // 할인 가격 추출
                                        
                                        var quantity = parseInt($(this).closest('.thumbnail-list').find('.quantity-input').val());
                                        
                                        totalPrice += price * quantity;
                                        totalDiscount += discountPrice * quantity;
                                    });
                                    $('#totalPrice').text(totalPrice+totalDiscount); // 모든 상품들의 가격 합 업데이트
                                    $('#allPrice').text(totalPrice); // 할인된 총 가격 업데이트
                                    $('#discountPrice').text(totalDiscount); // 할인된 총 가격 업데이트
                                    
                                    $('#hiddenAllPrice').val(totalPrice); // 숨겨진 input에 AlllPrice 할당
                                    $('#hiddendiscountPrice').val(totalDiscount); // 숨겨진 input에 discountlPrice 할당
                                    
                                }
                                
                                
                                <!-- x버튼 클릭 시 상품 삭제 --> 
                                function cartDelete(product){
                                	
                                	// 클릭된 상품 썸네일 리스트
    								//var productThumbnail = $('[data-product-no="' + productNo + '"]').closest('.product-thumbnail-list');

                                    // var productThumbnail = document.querySelector('.product-thumbnail-list');
									
                                    const $delPro = $(product).parents(".product-thumbnail-list");
									const $pNo = $delPro.find(".pNo").val();
                                	
                                    // 해당 상품 썸네일 리스트 삭제
                                   	$delPro.remove();
                                    
                                     updateTotalPrice(); //  상품 삭제 시 상품가격 업데이트
                                    
                                    // 상품 삭제 시 해당 상품가격만큼 뺀 가격을 상품금액 표시영역에 넣어주기
                                    
                                	<%
                                	
                            		int userNo = loginUser.getUserNo();
                                		
                            		%>
                            		
                            		var userNo = <%= userNo %>;
                            		
                                  	$.ajax({
                                  		
                                  		url:"<%=contextPath%>/del.ca",
                						data:{
                							productNo:$pNo,
                							userNo:userNo,
                						},
                						type:"post",
                						success:function(result){
                							if(result>0){ // 장바구니 상품삭제 성공
                								console.log("삭제성공!");
                							}
                						},error:function(){
                							console.log("ajax 통신 실패");
                							
                						}
                                  		
                                  	})
                                    
                              }
                               
                                
                                function goBack(){
                                	window.history.back();
                                }
                                
                                
                               
                                $(document).ready(function() {
                                	
                                	 // 페이지 로드 시 총 가격 업데이트
                                    updateTotalPrice();
                                	
                                    <!-- 장바구니 상품 수량 증감버튼  -->
                                    // 수량 감소 버튼 클릭 시
                                    $('.quantity-decrement').click(function() {
                                        var $quantityInput = $(this).siblings('.quantity-input');
                                        var quantity = parseInt($quantityInput.val());
                                        if (quantity > 1) {
                                            $quantityInput.val(quantity - 1);
                                            updateTotalPrice();
                                        }
                                    });

                                    // 수량 증가 버튼 클릭 시
                                    $('.quantity-increment').click(function() {
                                        var $quantityInput = $(this).siblings('.quantity-input');
                                        var quantity = parseInt($quantityInput.val());
                                        $quantityInput.val(quantity + 1);
                                        updateTotalPrice();
                                    });

                                   
                                <!-- 전체선택(해제) checkbox  -->
                                    // 전체 선택 체크박스
                                    $("#selectAll-cart").change(function() {
                                        $(".cartCheckbox").prop('checked', $(this).prop("checked"));
                                        updateTotalPrice(); // 가격 업데이트
                                    });

                                    // 개별 항목 체크박스들 중 하나라도 체크 해제 시 전체 선택 체크박스도 체크 해제
                                    $(".cartCheckbox").change(function() {
                                        if (!$(this).prop("checked")) {
                                            $("#selectAll-cart").prop('checked', false);
                                        }
                                            updateTotalPrice(); // 가격 업데이트
                                    });
                                });
                                
                  		</script>
                            
                            
                          

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

       <%@ include file="/views/common/footer.jsp" %>

















</body>
</html>