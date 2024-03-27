<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.common.model.vo.PageInfo" %>
<%@ page import="com.sos.recipe.model.vo.Recipe"%>
<%@ page import="java.util.List" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String search = (String)request.getAttribute("search");
	List<Recipe> list = (List<Recipe>)request.getAttribute("list");
	String no = (String)request.getParameter("no");
	List<Integer> userLikeList = (List<Integer>)request.getAttribute("userLikeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피메인</title>
<style>
    .main-content {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .community_logo{margin-top: 70px;}
    .community_logo>img {width: 300px;}

    .underbar {
        width: 200px;
        height: 10px;
        border-bottom: 1px solid lightgrey;
    }
    .category_wrap {
        display: flex;
        gap: 70px;
    }

    .category_button {
        width: 100px;
        height: 40px;
        background-color: white;
        border:solid 2px grey;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 5px;
    }
    .category_button:hover{
        cursor: pointer;
        background-color: lightgrey;
    }
    .recipe_search{
        height: 100px;
        padding: 30px 0px;
    }
    .recipe_search input{
		font-size: 20px;
        width: 800px;
        height: 100%;
        border: none;
        border-bottom: 2px solid lightgrey;
        outline: none;
    }
    .recipe_search>img{
        height: 100%;
        cursor: pointer;
    }
    .etc_wrap{
        width: 100%;
        display: flex;
        justify-content: right;
        gap: 20px;
        margin: 50px;
    }
    .etc_wrap>select{
        align-self: self-end;
        height: 70%;
    }
    .recipe_wrap{
        width: 100%;
        background-color: rgb(248, 243, 236);
        display: flex;
        flex-wrap: wrap;
        padding: 30px 15px;
        
    }
    .recipe{
        width: 330px;
        height: 450px;
        margin: 20px 30px;
        padding: 20px;
        flex-shrink: 0;
    }
    .recipe:hover{
        background-color: antiquewhite;
    }
    .recipe_thumbnail{
        width: 100%;
        height: 45%;
        background-color: white;
        border-radius: 40px;
    }
    .recipe_thumbnail:hover{
    	cursor: pointer;
    	opacity: 0.8;
    }
	.recipe_thumbnail>img{
		width: 100%;
		height: 100%;
        border-radius: 40px;
	}
    .recipe_category{
        font-size: 12px;
        margin-top: 15px;
    }
    .recipe_detail{color: grey;}
    .recipe_etc{
        display: flex;
        padding: 10px 0px;
        border-bottom: 1px solid grey;
        justify-content: space-between;
    }
    .recipe_etc div{
        font-size: small;
        font-weight: bold;
    }
    .recipe_product{
        border-top: 1px solid grey;
        margin-top: 5px;
        padding: 10px 0px;
        display: flex;
    }
    .recipe_product:hover{
    	cursor:pointer;
    	opacity:0.8;
    }
    .product_img{margin-right: 10px;}
    .product_img>img{
    	width: 100%;
    	height: 100%;
    }
    .recipe_product>.product_img{
        width: 40%;
        height: 20%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #like:hover{cursor:pointer}
</style>
</head>
<body>

<div class="wrap">
		
	<%@ include file="/views/common/header.jsp" %>
		
	<!-- Section start -->
	<section class="main-content">
		<!-- 커뮤니티 로고 -->
		<div class="community_logo">
			<p style="margin-bottom: 0;">community</p>
			<img src="<%= contextPath %>/resources/images/community_logo.png" alt="community_logo">
		</div>
		<div class="underbar"></div>
		<br><br><br>
	
		<!-- 카테고리 -->
		<div class="category_wrap">
			<div class="category_button" value="0">전체</div>
			<div class="category_button" value="1">장류</div>
			<div class="category_button" value="2">드레싱</div>
			<div class="category_button" value="3">기타</div>
			<button data-toggle="collapse" data-target="#search" style="border: none; background: none;">
				<svg xmlns="http://www.w3.org/2000/svg" width="" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
				</svg>
			</button>
		</div>
		<script>
		$(".category_button").click(function() {
			let categoryNo = $(this).attr("value");
			if (categoryNo === "0") {
				location.href = "<%= request.getContextPath() %>/list.re?page=1";
			} else {
					let currentPage = 1; 
					location.href = "<%=contextPath%>/category.re?page=" + currentPage + "&no=" + categoryNo;		 
			}
		});
		</script>
	
	
		<!-- 검색바 -->
		<div class="recipe_search collapse" id="search">
			<form action="<%=contextPath%>/search.re">
			<input type="hidden" name="page" value=1> 
				<input type="text" placeholder="검색어를 입력해주세요." name="search">
				<input type="submit" hidden>
			</form>
		</div>
	
		<div class="etc_wrap">
			<!-- 
			<select name="">
				<option value="">인기순</option>
				<option value="">낮은 인기순</option>
			</select>  
			 --> 
			<% if (loginUser != null) { %>
				<a href="<%=contextPath %>/enroll.re?no=<%=loginUser.getUserNo() %>" class="btn btn-secondary">글쓰기</a>
			<% }else{ %>
				<a href="<%=contextPath %>/loginForm.me" class="btn btn-secondary">글쓰기</a>
			<%} %> 	
		</div>
	          	    	
		<!-- 레시피 컨텐츠 -->
	
	    <!-- 레시피가 있는 경우 -->
	    <div class="recipe_wrap">
	        <!-- 레시피가 없을 경우 -->
	        <%if(list.isEmpty()){%>
		    <h4 style="padding : 3%; color:gray; font-weight:bold; width:100%; text-align:center;">레시피가 존재하지 않습니다.</h4>
			<% } else { %>
  			    <% for (Recipe r : list) { %>
				<!-- 가로로 세 개 둬야함 현재 세로로 9개  -->  	
				<div class="recipe" recipeNo="<%= r.getRecipeNo() %>">
					<div class="recipe_thumbnail">
						<input type="hidden" value="<%= r.getRecipeNo() %>">
						<img src='<%= contextPath + "/" + r.getThumbnailUrl()%>'>
					</div>
					<div class="recipe_category">분류><%=r.getCategoryName()%></div>
					<div class="recipe_name" style="font-weight: bolder;"><%=r.getRecipeTitle()%></div>
					<div class="recipe_detail">
						<%=r.getRecipeIntro()%>
					</div>
					<div class="recipe_etc">
						<div class="recipe_userProfile">
							<img src=<%=r.getUserPath()%> alt="프로필" height="15px">
							<%=r.getUserName()%>
						</div>
						<div class="recipe_like">
							<svg class="like" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart like" viewBox="0 0 16 16">
								<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
							</svg>
						</div>
					</div>
					
					<div class="recipe_product" >
						<input type="hidden" value="<%= r.getProductNo() %>">
						<div class="product_img">
							<img src="<%=contextPath%>/resources/images/이미지2.jpg" alt="상품">
						</div>
							<div class="product_name" style="display: flex; flex-direction: column;">
							<%=r.getProductName()%>

						<div class="product_etc">
							<!-- 할인하고 있지 않을 때 -->
							<% if(r.getDiscountPrice() == 0) { %> 
							<div class="product_price"><%=r.getPrice()%>원</div>                        
							<%}else if(r.getDiscountPrice() != 0){ %>
							<!-- 할인하고 있을 때 -->
							<div class="product_price"><s style="color:grey; font-size:14px"><%=r.getPrice()%>원</s>&nbsp;<%=r.getPrice()-r.getDiscountPrice()%>원</div>
							<% } %>
							</div>
						</div>
					</div>
				</div>
				<% } %>
			<% } %>
			<script>
			$(function(){
				if(<%= loginUser != null && userLikeList != null%>){
					let userLikeList = <%=userLikeList%>
					$(".recipe").each(function(){
						let rNo = $(this).find(".recipe_thumbnail").find("input").val();
						for(let i=0; i<userLikeList.length; i++){
       						if(rNo == userLikeList[i]){
       							$(this).find(".like").attr("fill", "red");
       						}
       					}
					})
				}
			})
			
			$(".recipe_thumbnail").click(function(){
				location.href = "<%= contextPath %>/detail.re?no=" + $(".recipe_thumbnail>input").val(); //레시피 번호와 같이 넘기기 경로 넘길때
			});
			$(".recipe_product").click(function(){
				location.href = "<%= contextPath %>/detail.pr?no=" + $(".recipe_product>input").val(); //레시피 번호와 같이 넘기기 경로 넘길때
			});
			
			$(".like").click(function(){
     			if(<%=loginUser == null%>){
     				alert("로그인후에 사용가능합니다.");
     			}else{
     				const $this = $(this);
     				const $recipe = $(this).parent().parent().parent();
     				console.log($recipe.find(".recipe_thumbnail").find("input").val());
             		if($(this).attr("fill") == "red"){
             			$.ajax({
             				url:"<%=contextPath%>/dlike.re",
             				data:{
             					rNo: $recipe.find(".recipe_thumbnail").find("input").val()
             				},
             				type:"post",
             				success:function(){
	                 			$this.attr("fill", "black");
             					alert("레시피 찜 목록에서 삭제되었습니다.");
             				}, error:function(){
             					console.log("추가실패");
             				}
             			})
             			
             		}else{
             			$.ajax({
             				url:"<%=contextPath%>/like.re",
             				data:{
             					rNo:$recipe.find(".recipe_thumbnail").find("input").val()
             				},
             				type:"post",
             				success:function(){
	                 			$this.attr("fill", "red");
             					alert("레시피 찜 목록에 저장되었습니다.");
             				}, error:function(){
             					console.log("삭제실패");
             				}
             			})
             		}
     			}
     		})
			</script>
			<br><br>
		</div>
		<ul class="pagination" style="margin-top:30px">
			<!-- search 검색의 경우 , 카테고리도 추가해줘야함 --> 
			<%if(search == null && no == null) {%>
				<% if(pi.getCurrentPage() == 1) { %>
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
				<% }else { %>
				<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.re?page=<%=pi.getCurrentPage()-1%>">Previous</a></li>
				<% } %>
				
				<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
				
					<% if(p == pi.getCurrentPage()) { %>
					<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
					<% }else{ %>
					<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.re?page=<%= p %>"><%= p %></a></li>
					<% } %>
					
				<% } %>
				
				<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				<% }else{ %>
				<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.re?page=<%= pi.getCurrentPage() + 1 %>">Next</a></li>
				<% } %>
				
			<% } else if(search == null && no != null) { %>
				<% if(pi.getCurrentPage() == 1) { %>
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
				<% }else { %>
				<li class="page-item"><a class="page-link" >Previous</a></li>
				<% } %>
				
				<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
					<% if(p == pi.getCurrentPage()) { %>
					<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
					<% }else{ %>
						<li class="page-item"><a class="page-link" href="<%= contextPath %>/category.re?page=<%= p %>&no=<%=no%>"><%= p %></a></li>
					<% } %>
				<% } %>
				
				<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				<% }else{ %>
				<li class="page-item"><a class="page-link" href="<%= contextPath %>/category.re?page=<%= pi.getCurrentPage() + 1 %>&no=<%=no%>">Next</a></li>
				<% } %>
			<% } else { %>
			<!-- search 검색의 경우 , 카테고리도 추가해줘야함 --> 
				<% if(pi.getCurrentPage() == 1) { %>
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
				<% }else { %>
				<li class="page-item"><a class="page-link" href="<%= contextPath %>/search.re?no=<%=pi.getCurrentPage()-1%>&search=<%=search%>">Previous</a></li>
				<% } %>
				
				<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
				
					<% if(p == pi.getCurrentPage()) { %>
					<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
					<% }else{ %>
					<li class="page-item"><a class="page-link" href="<%= contextPath %>/search.re?no=<%= p %>&search=<%=search%>"><%= p %></a></li>
					<% } %>
					
				<% } %>
				
				<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				<% }else{ %>
				<li class="page-item"><a class="page-link" href="<%= contextPath %>/search.re?no=<%= pi.getCurrentPage() + 1 %>&search=<%=search%>">Next</a></li>
				<% } %>
			<% } %>
		</ul>
	</section>
	<!-- Section end -->
	
	<%@ include file="/views/common/footer.jsp" %>
	     
</div>

</body>
</html>
