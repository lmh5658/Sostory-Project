<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.product.model.vo.Product, java.util.List, com.sos.common.model.vo.PageInfo"%>
<%
	List<Product> list = (List<Product>)request.getAttribute("list");
	// 상품번호, 카테고리이름, 상품이름, 가격, 사진경로
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    
    /* 전체상품목록페이지 관련 스타일 */
        .more-product{
            margin-top: 20px;
        }

        .pagination{
            margin-top: 30px;
        }
        .select-product{
            margin-bottom: 20px;
        }
        .main-content{display: flex; flex-direction: column;}
        .content-product-list{display: flex; flex-direction: column;}
        .product-thumbnail-list .product:hover, .recipe:hover, .recipe-product:hover{cursor: pointer; opacity: 0.8;}
    	.thumbnail-list-top d-flex w-100 justify-content-evenly{ 
    		display: flex;
           flex-wrap: wrap;
        }
        
       
        .product-thumbnail-list d-flex flex-column w-100{display: flex; flex-wrap: wrap; max-height: 900px;}
    
</style>
<body>
<div class="wrap container p-3">

        <%@ include file="/views/common/header.jsp" %>

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
        
        <!-- Section start -->
        <section class="main-content">
            

            <!-- 상품 페이지 상단 영역 start -->
            <div class="content-product-list center my-5">

                    <!-- 상품 리스트 제목 영역 start -->
                    <div class="product-list-title">
                        <h1 class="d-inline text-warning"><b>Our </b></h1><h1 class="d-inline"><b>Product</b></h1>
                    </div>
                    <!-- 상품 리스트 제목 영역 end -->

                    <!-- 상품 카테고리 영역 start -->
                    <div class="product-category my-5 w-100 d-flex justify-content-evenly">
                        <a href="#" class="btn btn-outline-danger btn-sm py-1 px-3">전체</a>
                        <a href="#" class="btn btn-outline-danger btn-sm py-1 px-3">장류</a>
                        <a href="#" class="btn btn-outline-danger btn-sm py-1 px-3">드레싱</a>
                        <a href="#" class="btn btn-outline-danger btn-sm py-1 px-3">기타</a>
                        <!-- 검색 영역-->
                        <a href="#" style="color: black;"><svg xmlns="http://www.w3.org/2000/svg"  height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                          </svg></a>
                    </div>
                    <!-- 상품 카테고리 영역 end -->

                </div>
                
                 <!-- 상품 정렬 Select start -->
            <div class="select-product d-flex justify-content-end">
                <select class="selectpicker" style="width: 120px;">
                    <option>조회순</option>
                    <option>판매순</option>
                    <option>낮은가격순</option>
                    <option>높은가격순</option>
                </select>
            </div>
            <!-- 상품 정렬 Select end -->
                
                <!-- 상품 페이지 상단 영역 end -->


                    <!-- 상품 리스트 start -->
                    <div class="product-thumbnail-list d-flex flex-column w-100" style="display: flex; flex-wrap: wrap;">
                        <!-- 상품 썸네일 상단 start -->
                            <!-- 상품 썸네일 start -->
                        <% for(Product p : list) { %>
                        <div class="thumbnail"> 
                            <input type="hidden" name="productNo" value="<%= p.getProductNo() %>">
                            <div class="product img-thumbnail p-2" style="width:300px">
                                <img class="product-img" src="<%= contextPath + "/" + p.getPath() %>" alt="Card image" style="width:100%">
                                <div class="product-body">
                                    <small class="product-category text-secondary d-block mb-3 mt-2"><%= p.getCategoryNo() %></small>
                                    <h7 class="product-title"><b><b class="text-danger">[HOT] </b><%= p.getProductName() %></b></h7>
                                    <h7 class="product-price d-block my-4"><b><%= p.getPrice() %>원</b></h7>
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
                       </div>
                       <% } %>
                    <!-- 상품 리스트 end--> 
                   
					
					  <!-- 페이징바 영역 start -->
                        <ul class="pagination justify-content center">
                        <% if(pi.getCurrentPage() == 1) { %>
                            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <% } else { %>
                            <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.pr?page=<%= pi.getCurrentPage() - 1%>">Previous</a></li>
                        <% } %>
                        
                        <% for(int p = pi.getStartPage(); p<=pi.getEndPage(); p++) {  %>
                            <% if(p == pi.getCurrentPage()) { %>
                            <li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
                            <% } else { %>
                            <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.pr?page=<%= p %>"><%= p %></a></li>
                            <% } %>
                        <% } %>
                            
						<% if(pi.getCurrentPage() == pi.getMaxPage() ) { %>
                         	<li class="page-item disalbed"><a class="page-link" href="#">Next</a></li>
                        <% } else { %>
                            <li class="page-item"><a class="page-link" href="<%= contextPath%>/list.pr?page=<%= pi.getCurrentPage() + 1 %>">Next</a></li>
                        <% } %>
                          </ul>
                        <!-- 페이징바 영역 end -->
                    
                   </div>
                   
                    

        </section>
        <!-- Section end -->

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

        <%@ include file="/views/common/footer.jsp" %>
    </div>
    
    <script>
        $(function(){
          $(".thumbnail").click(function(){
             	location.href = "<%= contextPath %>/detail.pr?no=" + $(this).children().eq(0).val();
          })
  
        })	
    </script>


</body>
</html>