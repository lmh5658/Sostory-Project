<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.pay.model.vo.Pay, java.util.List, com.sos.cart.model.vo.Order"%>

 <%
 	List<Pay> list = (List<Pay>)request.getAttribute("list");
 	Order o = (Order)request.getAttribute("o");
 	Order or = (Order)request.getAttribute("or");
 	
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료페이지</title>

<style>
	/* 결제완료페이지 필요한 스타일 */
    .order_success h6 {
        margin: 3% 3% 3% 3%;
    }

    .order-num h6 {
        margin-right: 10px; 
        
        color: darkgray;
    }

    .order-num span, .order-date {
        font-weight: bold;
        color: gray;
    }
      /*주문안내 스타일 end*/


      /*주문 테이블 스타일 start*/
    .order_list{
        margin-left: 20%;
        max-width: 60%;
    }

    .order_list th{
        font-size: 25px;
        color: rgb(100, 135, 31);
    }

    .product-name{
        
        margin-left: 10%;
    }

    .product-img{
        display: flex;
        max-width: 30%;
    } 

    .product-info{
        display: flex;
        align-items: center;
        margin-left: 10%;
    }

    /*결제정보 스타일 start*/
    .order_infomation div{
        margin: 5% 5% 5% 5%;
    }

    .order-info{
        text-align: start;
        white-space: nowrap;
        color: rgb(78, 78, 78);
        
    }

     /*결제정보 스타일_언더바*/
     .line{
        display: flex;
        flex-direction: column;
        align-items: center;
        font-weight: bold;
        text-align: center;
    }
    
    .line::after{
        content: "";
        display: block;
        border-bottom: 2px solid rgba(169, 169, 169, 0.486);
        width: 20%;
        margin-bottom: 3%;
    }
    .flex-table {
        display: flex;
        width: 100%;
    }
    .flex-table th {
        flex: 1;
    }



</style>



</head>


<body>


	<div class="wrap container p-3">
		
      <%@ include file="/views/common/header.jsp" %>

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <!-- Section start -->
        <section class="main-content">

            <div class="main-wrap">
				<br><br>
                <div class="center" style="margin-top: 30px;">
                       		<h1><b>결제완료</b></h1>
                 </div>
            <br><br>

                <div class="d-flex flex-column" style="border: 3px solid black; border-radius: 10px; height: 300px;">
					
                    <div class="center" style="margin-top: 30px;">
                        <h3><b>주문/결제가 정상적으로 완료되었습니다.</b></h3>
                    </div>
                    <div class="center" style="padding: 10px;">
                        <h4><b>주문번호</b></h4>
                        &nbsp;&nbsp;<h3><span id="order-num" style="color:  green;"><%=or.getOrderNo() %></span></h3>
                    </div>
                    <div class="center" style="padding: 10px;">
                        <h5><b class="order-date">배송일자는 주문날짜로부터 2~3일 내에 상품이 도착할 예정입니다.</b></h5>
                    </div>
                    <div class="center" style="padding: 10px; margin-top: 30px;">
                        <h2><b><span style="color: green;" >So's tory</span>를 이용해주셔서 감사합니다.</b></h2>
                    </div>

                </div>
           
                <!--결제상품 테이블-->
                <table class="table order_list flex-table" style="margin-top: 7%;">
                    
                    <tr>
                        <th  colspan="2">상품 정보</th>
                        <th>금액</th>
                        <th>수량</th>
                    </tr>
                    
                    <!--  반복문 뿌려줄 구문 -->
                       <% for(Pay p : list) { %>
                    <tr>
                        <td colspan="2">  
                            <div class="product-info">
                                <img class="product-img" src="<%=p.getPath()%>">
                                <b class="product-name"><%=p.getProductName()%></b>
                            </div>
                        </td>
                        <%if(p.getDiscountPrice().equals("0")){ %>
                        
                        <td class="order-price" style="padding-top: 4%;"><b><%=p.getPrice() %></b></td>
                        
                        <%}else{ %>
                        
                        <td class="order-price" style="padding-top: 4%;">
		                    
						        <span style="font-size:20px"><b><%=p.getPriceMinusDcprice() %></b></span>
						        <span>&nbsp</span>
						        <span style="color:gray; font-size:20px"><b><s><%=p.getPrice() %></s></b></span>
						   
                        </td>
                        <%} %>
                        <td class="order-qty" style="padding-top: 4%;"><b><%=p.getCount() %></b></td>
                    </tr>
                    <%} %>
                 
                   
                   
                 
                   
                </table>                
               
                 <!--결제정보-->
                 <div style="margin-top: 7%;" class="line"><h2><b>결제 정보</b></h2></div>
               
                 <div style="display: flex; justify-content: center; align-items: center;">
                     <div class="order_infomation">
                         <div class="order-info">
                             <b>결제수단&nbsp; :&nbsp;</b>
                             <b>무통장 입금</b>
                         </div>
                         <div class="order-info">
                             <b>결제금액&nbsp; :&nbsp;</b>
                             <b><%=o.getPay() %>원</b>
                         </div>
                         <div class="order-info">
                             <b>결제일시&nbsp; :&nbsp;</b>
                             <b><%=or.getPayDate() %></b>
                          
                         </div>
                         <div class="order-info">
                              <b>입금자명 : <%=o.getAccountHolder() %> / 입금은행명 : <%=o.getBankName() %> / 입금은행계좌 : <%=o.getAccountNumber() %></b>
                         </div>
                     </div>
             </div>
             </div>
 
         </section>
         <!-- Section end -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

       <%@ include file="/views/common/footer.jsp" %>
	     
	 </div>












</body>
</html>