<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.common.model.vo.PageInfo, java.util.List" %>
<%@ page import="com.sos.product.model.vo.Product" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Product> list = (List<Product>)request.getAttribute("list");
	String keyword = (String)request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*상품관리>상품조회 스타일*/
     .section_right{
        width: 100%;
        margin: 20px;
        margin-top: 30px;
     }
     .section_right label{
        font-weight: bolder;
        font-size: 17px;
        
     }
     .section_right>div{
        display: flex;
        
     }
     .mem_search{
        display: flex;
        margin-left: 10px;
        margin-top: 15px;
     }

     .mem_search button{
        width: 80px;
        background-color: #c20000; /* 배경색 설정 */
        color: #ffffff; /* 텍스트 색상 설정 */
        border: none; /* 테두리 제거 */
        font-weight: bold;
        height: 100%;
        border-radius: 6px;
     }
     .mem_del button{
        width: 120px;
        background-color: #c20000; /* 배경색 설정 */
        color: #ffffff; /* 텍스트 색상 설정 */
        border: none; /* 테두리 제거 */
        font-weight: bold;
        border-radius: 6px;
        margin-right: 30px;
        margin-left: 15px;
        height: 40px;

     }
     .mem_del{display: flex; justify-content: right;}

    table{
        margin-top: 20px;
        width: 80%;
        text-align: center;
        border: 1px solid #dddddd;
     }

     .table_title th{
        background-color: #dddddd;;
        font-weight: bold; /* 헤더 글씨체를 굵게 설정 */
        padding: 8px; /* 셀 안의 여백 설정 */
     }

     .pro_name{
        display: flex;
        align-items: center; 
        justify-content: center;  
        background-color: #dddddd; 
        width: 100px; 
        font-weight: bold;
        border-bottom-left-radius: 10px;
        border-top-left-radius: 10px;
        border: 1px solid rgb(148, 146, 146);
        border: none; /* 테두리 제거 */
        border-radius: 5px; /* 모서리를 둥글게 만듦 */
     }

     .select_div{
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
        align-items: center;
        
     }
     .select_div select{
        width: 100px;
     }
     .select_delete{
        margin-right: 50px;
        height: 40px;
        width: 100px;
        background-color: #c20000; /* 배경색 설정 */
        color: #ffffff; /* 텍스트 색상 설정 */
        border: none; /* 테두리 제거 */
        border-radius: 5px; /* 모서리를 둥글게 만듦 */
        font-weight: bold;
     }
     .pagination{
        display: flex; justify-content: center; margin-top: 10px;
     }
     .table_d{display: flex; flex-direction: column;}
     .section_title>div{margin-left: 10px;}
     .section_title b{font-size: 20px;}
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
                </svg>상품관리><b>상품조회</b>
            </div>
            
            <!-- 상품검색 -->
            <form action="<%= contextPath %>/searchProduct.ma">
	            <div class="mem_search">
	                <div class="pro_name">상품명</div>
	                <div><input type="text" class="form-control" name="keyword"></div>
	                <input type="hidden" name="page" value="1">
	                <div><button>조회</button></div>
	            </div>
            </form>
            <div class="mem_del">
                <button onclick='location.href="<%= contextPath %>/enrollProductForm.ma"' style="background-color: rgb(0, 0, 113);">상품등록</button>
                <button onclick="deleteProduct();">상품삭제</button>
            </div>
            <div class="table_d">
                <div>
                    <table class="table table-hover">
                        <thead>
                            <tr class="table_title">
                                <th><input type="checkbox" id="cbx_chkAll"></th>
                                <th>상품번호</th>
                                <th>상품명</th>
                                <th>가격(원)</th>
                                <th>할인가</th>
                                <th>재고수량</th>
                                <th>상품노출</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<% if(list.isEmpty()) { %>
                        	<tr>
                        		<td colspan="7" align="center">상품이 존재하지 않습니다.</td>
                        	</tr>
                        	<% } else { %>
                        		<% for(Product p : list) { %>
	                            <tr class="table_title">
	                                <td><input type="checkbox" name="typArr"></td>
	                                <td><%= p.getProductNo() %></td>
	                                <td style="cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/updateProductForm.ma?productNo=<%=p.getProductNo()%>'"><%= p.getProductName() %></td>
	                                <td><%= String.format("%,d", p.getPrice()) %></td>
	                                <td><%= String.format("%,d", p.getPrice() - p.getDiscountPrice()) %></td>
	                                <td><%= p.getInventory() %></td>
	                                <td><%= p.getStatus().equals("Y") ? "정상" : p.getStatus().equals("S") ? "품절" : "삭제" %></td>
	                            </tr>
	                            <% } %>
                            <% } %>
                        </tbody>
                    </table>     
                </div>
                    <div>
                        총 상품 수 : <label style="color: red;"><%= pi.getListCount() %></label>
                    </div>                  
            </div>
            
            <script>
	            function deleteProduct(){
	            	const $deleteProduct = $("input[name=typArr]:checked");
	            	
	            	if($deleteProduct != 0){
						if(confirm($deleteProduct.length + "개의 상품을 삭제하시겠습니까?")){
							let addValues = "";
							for(let i=0; i<$deleteProduct.length-1; i++){
								addValues += "productNo=" + $deleteProduct.eq(i).parent().next().text() + "&";
							}
							addValues += "productNo=" + $deleteProduct.eq($deleteProduct.length - 1).parent().next().text();
							
							location.href="<%=contextPath%>/deleteProduct.ma?" + addValues;
						}
	        		} else {
	        			alert("삭제할 상품을 선택해주세요.");
	        		}
	            }
            </script>
            <!-- 페이징 -->
			<% if(keyword == null) { %>
               <ul class="pagination">
               	<% if(pi.getCurrentPage() == 1) { %>
                   <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                   <% } else { %>
                   <li class="page-item"><a class="page-link" href="<%= contextPath %>/productList.ma?page=<%= pi.getCurrentPage() - 1 %>" >Previous</a></li>
                   <% } %>
                   
                   <% for (int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
                   	<% if(i == pi.getCurrentPage())	{ %>
                   	<li class="page-item active"><a class="page-link" href="<%= contextPath %>/productList.ma?page=<%= i %>"><%= i %></a></li>
                   	<% } else {%>
                   	<li class="page-item"><a class="page-link" href="<%= contextPath %>/productList.ma?page=<%= i %>"><%= i %></a></li>
                   	<% } %>
                   <% } %>
                   
                   <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                   <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                   <% } else { %>
                   <li class="page-item"><a class="page-link" href="<%= contextPath %>/productList.ma?page=<%= pi.getCurrentPage() + 1 %>" >Next</a></li>
                   <% } %>
               </ul>
               <% } else { %>
               <ul class="pagination">
               	<% if(pi.getCurrentPage() == 1) { %>
                   <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                   <% } else { %>
                   <li class="page-item"><a class="page-link" href="<%= contextPath %>/searchProduct.ma?page=<%= pi.getCurrentPage() - 1 %>&keyword=<%= keyword %>" >Previous</a></li>
                   <% } %>
                   
                   <% for (int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
                   	<% if(i == pi.getCurrentPage())	{ %>
                   	<li class="page-item active"><a class="page-link" href="<%= contextPath %>/searchProduct.ma?page=<%= i %>&keyword=<%= keyword %>"><%= i %></a></li>
                   	<% } else {%>
                   	<li class="page-item"><a class="page-link" href="<%= contextPath %>/searchProduct.ma?page=<%= i %>&keyword=<%= keyword %>"><%= i %></a></li>
                   	<% } %>
                   <% } %>
                   
                   <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                   <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                   <% } else { %>
                   <li class="page-item"><a class="page-link" href="<%= contextPath %>/searchProduct.ma?page=<%= pi.getCurrentPage() + 1 %>&keyword=<%= keyword %>" >Next</a></li>
                   <% } %>
               </ul>
               <% } %>
            <script>
                
            </script>

        </div>

        
        </section>
        <!-- Section end -->

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>