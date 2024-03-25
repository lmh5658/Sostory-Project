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
<style>
/* 주문조회 전용 style */
.order_content{
width: 100%;
border-top: 1px solid grey;
}

.order_product{
display: flex;
align-items: center;
border-bottom: 1px solid lightgrey;
padding: 10px 0;
}
.order_product>*{margin: 10px;}
.product-img{
	border: 2px solid tomato;	
}

.order_product b{font-size: 20px;}
.order_product>img+label{width: 60%;}
.order_product>img+label+label{width: 15%;}
.order_product>img+label+label+label{width: 15%;}
.order_product>div{width: 50px;}
.calc_payment{
width: 100%;
height: 170px;
margin-top: 15px;
background-color: rgb(235, 181, 145);
display: flex;
justify-content: center;
align-items: center;
}
.calc_payment>table{
width: 80%;
}
.calc_payment>table *{
text-align: center;
}
.total_price{font-size: 40px;}
.order_content>table tr{
height: 60px;
font-size: 17px;
}

.product-name{
    font-weight: bolder;
    font-size: 24px;
    text-align: center;
}

.order_product>img{
    width: 200px;
    height: 150px;
}

.product-price{
    text-align: center;
}

.amount{
    text-align: center;
    font-size: 18px;
    font-weight: bolder;
}

.th{
    width: 150px;
    font-size: 20px;
}

.td{
    font-size: 20px;
    color: gray;
}
.main-page{
    margin-bottom: 300px;
}

.button-area{
    display: flex;
    justify-content: center;
    margin-top: 100px;
}
</style>
</head>
<body>
<div class="wrap">

        <%@ include file="/views/common/header.jsp" %>
        
        <% if(loginUser == null){ // alert 시킬 알람문구가 존재할 경우 %>
		  <script>
		     alert('로그인을 먼저 진행해주세요'); // 문자열 취급시 따옴표로 감싸야됨
		     location.href="<%=contextPath%>"
		  </script>
		<% } %>

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
        
        <!-- Section start -->
        <section class="main-content">
            <div class="section_1">
                <%@ include file="/views/common/managerMenu.jsp" %>
        <!-- 사이드메뉴바 클릭시 바뀌는 화면-->
        <div class="section_right">
            <div class="section_title" style="border-bottom: 2px solid gray">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-house-gear-fill" viewBox="0 0 16 16">
                    <path d="M7.293 1.5a1 1 0 0 1 1.414 0L11 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l2.354 2.353a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708z"/>
                    <path d="M11.07 9.047a1.5 1.5 0 0 0-1.742.26l-.02.021a1.5 1.5 0 0 0-.261 1.742 1.5 1.5 0 0 0 0 2.86 1.5 1.5 0 0 0-.12 1.07H3.5A1.5 1.5 0 0 1 2 13.5V9.293l6-6 4.724 4.724a1.5 1.5 0 0 0-1.654 1.03"/>
                    <path d="m13.158 9.608-.043-.148c-.181-.613-1.049-.613-1.23 0l-.043.148a.64.64 0 0 1-.921.382l-.136-.074c-.561-.306-1.175.308-.87.869l.075.136a.64.64 0 0 1-.382.92l-.148.045c-.613.18-.613 1.048 0 1.229l.148.043a.64.64 0 0 1 .382.921l-.074.136c-.306.561.308 1.175.869.87l.136-.075a.64.64 0 0 1 .92.382l.045.149c.18.612 1.048.612 1.229 0l.043-.15a.64.64 0 0 1 .921-.38l.136.074c.561.305 1.175-.309.87-.87l-.075-.136a.64.64 0 0 1 .382-.92l.149-.044c.612-.181.612-1.049 0-1.23l-.15-.043a.64.64 0 0 1-.38-.921l.074-.136c.305-.561-.309-1.175-.87-.87l-.136.075a.64.64 0 0 1-.92-.382ZM12.5 14a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
                </svg>주문관리><b>주문상세</b>
            </div>
            
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

            
        </section>
        <!-- Section end -->

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

        <%@ include file="/views/common/footer.jsp" %>

    </div>
</body>
</html>