<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.product.model.vo.Product, java.util.List, com.sos.common.model.vo.PageInfo"%>
<%
	List<Product> list = (List<Product>)request.getAttribute("list");
	// 상품번호, 카테고리이름, 상품이름, 가격, 사진경로
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	String search = (String)request.getAttribute("search"); // null | 검색단어
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
        .product-thumbnail-list .thumbnail1:hover, .recipe:hover, .recipe-product:hover{cursor: pointer; opacity: 0.8;}
    	.thumbnail-list-top d-flex w-100 justify-content-evenly{ 
    		display: flex;
           flex-wrap: wrap;
        }
        
       
        .product-thumbnail-list d-flex flex-column w-100{display: flex; flex-wrap: wrap; max-height: 900px;}
        
        <!-- Section end-->
         /* 검색결과없음페이지 관련 스타일 */

        .main_content>div{
            border: 1px solid lightgray;
            width: 80%;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 50px;
            min-height: 400px;
            padding: 50px;
            border-radius: 5px;
        }
                    
          
    
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
                        <a href="<%= contextPath %>/alist.pr" class="btn btn-outline-danger btn-sm py-1 px-3">전체</a>
                        <a href="<%= contextPath %>/jlist.pr?page=1" class="btn btn-outline-danger btn-sm py-1 px-3">장류</a>
                        <a href="<%= contextPath %>/dlist.pr?page=1" class="btn btn-outline-danger btn-sm py-1 px-3">드레싱</a>
                        <a href="<%= contextPath %>/elist.pr?page=1" class="btn btn-outline-danger btn-sm py-1 px-3">기타</a>
                        <!-- 검색 영역-->
                        
                      
						  <!-- Button to Open the Modal -->
						   <a href="#" style="color: black;" data-toggle="modal" data-target="#myModal"><svg xmlns="http://www.w3.org/2000/svg"  height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                          </svg></a>
						  
						
						  <!-- The Modal -->
						  
							  <div class="modal fade" id="myModal" style="margin-top:300px; margin-left:-200px;">
							    <div class="modal-dialog" style="width:900px;">
							      <div class="modal-content" style="width:900px; height:200px;">
							              
							        <!-- Modal body -->
							        <div style="display:flex;">
								        <div class="modal-body">
								          <input type="text" class="form-control" style="width:700px; height:50px; margin:50px;" placeholder="검색어를 입력하세요" id="search">
								        </div>

								        <!-- Modal footer -->
								        <div style="width:200px;  margin-left:-70px; display: flex; justify-content: center; align-items: center;">
									        <a class="btn" style="color: black;"  data-dismiss="modal" data-target="#myModal" id="search_btn"><svg xmlns="http://www.w3.org/2000/svg"  height="50" margin-left="-70px" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
				                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
				                          	</svg></a>					        
								        </div>						     
							        </div>
							      </div>
							    </div>
							  </div>
						  
						  
						
                       
                    </div>
                    <!-- 상품 카테고리 영역 end -->

                </div>
         
                    <section class="main_content"> 
	
	                <div class="search_error_content">
	                    <h1 align="center" style="color:grey">검색결과가 없습니다</h1> 
	
	                </div>
	
		           
		            </section>
	          
                   
                    
					
                   
                 

        </section>
        <!-- Section end -->

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

        <%@ include file="/views/common/footer.jsp" %>
    </div>
       <script>
        $(function(){
 
            $("#search_btn").click(function(){
          	  location.href = "<%=contextPath%>/sdlist.pr?search=" + $("#search").val() + "&page=1";
            })
            

        })	
    </script>
  


</body>
</html>