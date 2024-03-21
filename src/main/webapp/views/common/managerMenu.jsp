<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.section_1{
            margin: auto;
            width: 100%;
            min-height: 1300px;
            height: 800px;
            display: flex;
         }
	.menu_wrap{text-align: center;display: flex;flex-direction: column;background-color: gray; padding-top: 30px;}
    .menu_wrap{font-size: 20px; width: 15%; align-items: center;}
    .side_menu>button{width: 100%; height: 70px; background-color: gray;}      
    .side_menu div{display:none; font-size: 17px;}
    .list{border: none;}
    .side_menu a{color: white;}
    a{text-decoration: none; color: black}
    .side_menu a:hover{color: red; text-decoration-line: none;}
</style>
</head>
<body>
	<div class="menu_wrap" style="background-color: gray;">
		<div class="side_menu">
			<button class="list">회원관리</button>
			<div>
				<a href="<%= request.getContextPath() %>/memberList.ma?page=1">회원목록</a>
			</div>
		</div>
		<div class="side_menu">
			<button class="list">상품관리</button>
			<div>
				<a href="<%= request.getContextPath() %>/productList.ma?page=1">상품조회</a><br> 
				<a href="<%= request.getContextPath() %>/enrollProduct.ma">상품등록</a><br> 
				<a href="<%= request.getContextPath() %>/updateProduct.ma">상품수정</a><br>
				<a href="">TimeSale</a>
			</div>
		</div>
		<div class="side_menu">
			<button class="list">주문관리</button>
			<div>
				<a href="">결제관리</a>
			</div>

		</div>
		<div class="side_menu">
			<button class="list">레시피관리</button>
			<div>
				<a href="<%= request.getContextPath() %>/recipeList.ma">레시피조회</a><br> 
				<!-- <a href="<%= request.getContextPath() %>/updateForm.re">레시피등록</a> -->
			</div>
		</div>
		<div class="side_menu">
			<button class="list">리뷰관리</button>
			<div>
				<a href="<%= request.getContextPath() %>/productReview.ma">상품리뷰</a><br> 
				<!-- <a href="">레시피리뷰</a>  -->
			</div>
		</div>
		<div class="side_menu">
			<button class="list">문의관리</button>
			<div>
				<a href="<%= request.getContextPath() %>/qnaProduct.ma">상품문의</a><br> 
				<a href="<%= request.getContextPath() %>/qnaPersonal.ma">1:1문의</a>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$(".side_menu>button").click(function() {
				const $b = $(this).nextAll();

				if ($b.css("display") == "none") {
					$(".list").siblings("div").slideUp();
					$b.slideDown();
				} else {
					$b.slideUp();
				}
			})
		})
	</script>
</body>
</html>