<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 네비메뉴바</title>

<!-- 매페이지마다 공통적으로 반영할 마이페이지 네비바 스타일 파일 링크 연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageCommon/myPageNav.css" rel="stylesheet">

</head>
<body>

	<!-- 마이페이지 사이드 nav바 start -->
	<div class="menu_wrap" >
	
	    <div class="side_menu">
	        <button class="list">회원정보</button>
	        <div><a href="" class="">회원정보 변경</a></div>
	        <div><a href="<%= request.getContextPath() %>/updatePwdForm.me">비밀변호 변경</a></div>
	        <div><a href="">배송지관리</a></div>
	        <div><a href="">회원탈퇴</a></div>
	    </div>
	
	    <div class="side_menu">
	        <button class="list">My Tree</button>
	    </div>
	
	    <div class="side_menu">
	        <button class="list">찜목록</button>
	    </div>
	
	    <div class="side_menu">
	        <button class="list">고객문의</button>
	        <div>
	        <a href="">상품문의</a><br>
	        <a href="">1:1 문의</a>
	        </div>
	    </div>
	
	    <div class="side_menu">
	        <button class="list">주문조회</button>
	    </div>
	
	</div>
	
	
	<script>
	   $(function(){
	        $(".side_menu>button").click(function(){       
	            const $b = $(this).nextAll();
	
	            if($b.css("display") == "none") {          
	                $(".list").siblings("div").slideUp();
	                $b.slideDown();         
	            }else{
	                $b.slideUp();
	            }
	
	        })
	    })
	</script>
	<!-- 마이페이지 사이드 nav바 end -->

</body>
</html>