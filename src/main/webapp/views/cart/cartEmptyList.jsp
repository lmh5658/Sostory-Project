<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 빈 목록페이지</title>
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
            <br>
            <!-- 상품 상단 영역 end -->
            <div style="background-color: rgb(240, 240, 240); height: 500px;" class="d-flex flex-column">

                <div class="center" style="margin-top: 120px; margin-bottom: 30px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-shield-exclamation" viewBox="0 0 16 16">
                        <path d="M5.338 1.59a61 61 0 0 0-2.837.856.48.48 0 0 0-.328.39c-.554 4.157.726 7.19 2.253 9.188a10.7 10.7 0 0 0 2.287 2.233c.346.244.652.42.893.533q.18.085.293.118a1 1 0 0 0 .101.025 1 1 0 0 0 .1-.025q.114-.034.294-.118c.24-.113.547-.29.893-.533a10.7 10.7 0 0 0 2.287-2.233c1.527-1.997 2.807-5.031 2.253-9.188a.48.48 0 0 0-.328-.39c-.651-.213-1.75-.56-2.837-.855C9.552 1.29 8.531 1.067 8 1.067c-.53 0-1.552.223-2.662.524zM5.072.56C6.157.265 7.31 0 8 0s1.843.265 2.928.56c1.11.3 2.229.655 2.887.87a1.54 1.54 0 0 1 1.044 1.262c.596 4.477-.787 7.795-2.465 9.99a11.8 11.8 0 0 1-2.517 2.453 7 7 0 0 1-1.048.625c-.28.132-.581.24-.829.24s-.548-.108-.829-.24a7 7 0 0 1-1.048-.625 11.8 11.8 0 0 1-2.517-2.453C1.928 10.487.545 7.169 1.141 2.692A1.54 1.54 0 0 1 2.185 1.43 63 63 0 0 1 5.072.56"/>
                        <path d="M7.001 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.553.553 0 0 1-1.1 0z"/>
                    </svg>
                </div>

                <div class="center" style="margin-bottom: 30px;">
                    <h1>장바구니에 담긴 상품이 없습니다.</h1>
                </div>

                <div class="center">
                    
                    <button id="gotoProduct" type="button" class="btn btn-outline-dark" style="background-color: rgb(206, 73, 73); border-radius: 15px; color: white; width: 200px;">상품보러가기</button>
                </div>




            </div>



                  
        </section>
        <!-- Section end -->
	</div>
	
	<script>
		$(function(){
			$("#gotoProduct").click(function(){
				
				// 상품보러가기 버튼 클릭시 전체상품목록페이지로 이동
				location.href="<%=contextPath%>/views/product/productList.jsp"
				
				
			})
			
			
		
		
		})
		
		
	
	
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

       <%@ include file="/views/common/footer.jsp" %>

</body>
</html>