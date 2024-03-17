<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.cart.model.vo.Cart, java.util.List, com.sos.common.model.vo.PageInfo"%>

 <%
 	List<Cart> list = (List<Cart>)request.getAttribute("list");
 	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
                        
                        <input type="checkbox" style="width: 30px;" id="selectAll-cart">
                    
                        
                        <b>전체선택(해제)</b>

                    </div>
                    
                   

				<!-- 장바구니 목록리스트 start -->
				<div class="cart-list">
				
                    <!-- 상품 리스트 start -->
                    <% for(Cart c : list) { %>
                    <div class="product-thumbnail-list d-flex flex-direction w-100">
                        <div class="thumbnail-list d-flex w-100 justify-content-evenly"> 
                            <!-- 상품 썸네일 start -->
                                <input type="checkbox" style="width: 30px;" class="cartCheckbox">
                            <div class="product img-thumbnail p-2" style="width:200px">
                                <img class="product-img" src="<%=contextPath + "/" + c.getPath() %>" alt="Card image" style="width:100%" id="cartImage">
                            </div>
                            <div class="product-name">
                                <small class="product-category text-secondary d-block mb-3 mt-2"><%=c.getCategoryName() %></small>
                                <h7 class="product-title"><b id="cartName"><b style="color: rgb(150, 24, 136);">[BEST] </b><%= c.getProductName()%></b></h7>
                            </div>
                            <div class="cart-price">
                            	<h7 class="cart-price d-block mb-3 mt-2"><b id="cartPrice"><%=c.getPrice() %>원</b></h7>
                             </div>
                             <div class="cart-count">
                                <input type="button" value="-" style="width: 30px;" id="decrementBtn-cart">
                                <input type="text" value="<%=c.getCartAmount() %>" style="width: 40px; text-align: center;" id="cartQuantity" value="1" min="1">
                                <input type="button" value="+" style="width: 30px;" id="incrementBtn-cart">
                            </div>
                            <div class="icon d-flex justify-content-end">
                                <a href="javascript:cartDelete(<%=c.getProductNo()%>);"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-excel" viewBox="0 0 16 16">
                                    <path d="M5.18 4.616a.5.5 0 0 1 .704.064L8 7.219l2.116-2.54a.5.5 0 1 1 .768.641L8.651 8l2.233 2.68a.5.5 0 0 1-.768.64L8 8.781l-2.116 2.54a.5.5 0 0 1-.768-.641L7.349 8 5.116 5.32a.5.5 0 0 1 .064-.704"/>
                                    <path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1"/>
                                 </svg></a>
                            </div>
                            <!-- 상품 썸네일 end -->
                        </div> 
                    </div>
                    <!-- 상품 리스트 end -->
                    <br>
                    
                    <!-- 상품 금액 표시 영역 start -->
                    <div class="cart-allprice d-flex flex-direction justify-content-evenly" style="background-color: rgba(240, 240, 240); height: 300px;">
                        
                            <div class="center">
                                <div class="d-flex flex-column productPrice" style="border-radius: 30px; border: 1px solid black; width: 200px; height: 150px;">
                                    
	                                <h4 class="center" style="padding-top: 30px;">상품금액</h4>
	                                <h2 class="center">33,000</h2>
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
	                                <h2 class="center">0</h2>
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
	                                <h2 class="center">33,000</h2>
                                 </div>
                            </div>

                    </div>
                    <br>
                    <div class="d-flex flex-direction justify-content-evenly">
                    
                        <button type="button" class="btn btn-outline-dark" style="background-color: rgb(197, 191, 191); border-radius: 15px; color: black;">뒤로가기</button>
                        <button type="button" class="btn btn-outline-dark" style="background-color: rgb(206, 73, 73); border-radius: 15px; color: white;">주문하기</button>

                     </div>
                     <br>
                    <!-- 상품 금액 표시 영역 end -->
                    <%} %>
                  </div>
                  <!-- 장바구니 목록리스트 end -->
                  
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
                    <hr>
                    <br>

                    
        	</section>
        <!-- Section end -->
         </div>
         
          				<script>
                            <!-- 장바구니 상품 수량 증감버튼  -->
                            $(document).ready(function(){
                                $('#incrementBtn-cart').click(function(){
                                  var quantityInput = $('#cartQuantity');
                                  var currentValue = parseInt(quantityInput.val());
                                  quantityInput.val(currentValue + 1);
                                  updatePrice(currentValue + 1);
                                });

                                $('#decrementBtn-cart').click(function(){
                                  var quantityInput = $('#cartQuantity');
                                  var currentValue = parseInt(quantityInput.val());
                                  if (currentValue > 1) {
                                    quantityInput.val(currentValue - 1);
                                    updatePrice(currentValue - 1);
                                  }
                                });

                                <!-- 수량 증감에 따른 상품 가격 변화  -->
                                function updatePrice(quantity) {	
                                	// 가격 업데이트
                                  var price = quantity * 8000; 	// 수량에 따른 가격 계산
                                  $('.cart-price b').text(price + '원');
                                  $('.productPrice h2').text(price);
                                  
                                }
                              });
                            
                            <!-- x버튼 클릭 시 상품 삭제 --> 
                                function cartDelete(productNo){
                                	
                                	// 클릭된 상품 썸네일 리스트
                                    var productThumbnail = document.querySelector('.product-thumbnail-list');
                                    
                                    // 해당 상품 썸네일 리스트 삭제
                                    productThumbnail.remove();
                                    
                                	<%
                            		int userNo = loginUser.getUserNo();
                                		
                            		%>
                            		
                            		var userNo = <%= userNo %>;
                               		
                            		
                                  	$.ajax({
                                  		
                                  		url:"<%=contextPath%>/del.ca",
                						data:{
                							productNo:productNo,
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
                            
                            <!-- 전체선택(해제) checkbox 스크립트 -->
                            $(document).ready(function() {
                                // 전체 선택 체크박스
                                $("#selectAll-cart").change(function() {
                                    $(".cartCheckbox").prop('checked', $(this).prop("checked"));
                                });

                                // 개별 항목 체크박스들 중 하나라도 체크 해제 시 전체 선택 체크박스도 체크 해제
                                $(".cartCheckbox").change(function() {
                                    if (!$(this).prop("checked")) {
                                        $("#selectAll-cart").prop('checked', false);
                                    }
                                });
                            });
                            
                  		</script>
                  		
                  		
	                           
                            
                            
                          

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

       <%@ include file="/views/common/footer.jsp" %>

















</body>
</html>