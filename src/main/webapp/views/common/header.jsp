<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.member.model.vo.Member" %>
<%
	// 웹 애플리케이션 ContextPath == /sos
	String contextPath = request.getContextPath();
	
	// 팝업알림창에 출력할 Session값 가져오기
	String alertMsg = (String)session.getAttribute("alertMsg");
	
	/* 로그인한 회원정보가 담겨있는 회원객체
	   회원번호, 회원아이디, 회원비밀번호, 회원명, 생년월일, 닉네임, 전화번호, 
	   이메일, 우편주소, 상세주소, 성별, 가입일, 최종수정일, 회원유형, 회원상태, 프로필URL
	*/
	Member loginUser = (Member)session.getAttribute("loginUser");
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<!-- 부트스트랩 기능을 위한 CDN 방식 연결 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- ---------------------------------- -->

<!-- 매페이지마다 공통적으로 반영할 css 스타일 파일 링크 연결 (Header, Footer) -->
<link href="<%= contextPath %>/resources/css/common.css" rel="stylesheet">

</head>
<body>
	
	<!-- Session값 유효여부 판단
		 - Session에 전달받은 alertMsg값이 있을경우 : Session값 알림팝업으로 띄워주기
		 - Session에 전달받은 alertMsg값이 없을경우 : Session값 삭제하기	
	 -->
	<% if(alertMsg != null){ %>
		<script>
			alert('<%= alertMsg %>');
		</script>
	<% 
		session.removeAttribute("alertMsg");
	   } 
	%>
	
	<!-- Header start -->
    <header class="header border-bottom border-2">


        <!-- Header 왼쪽(로고) 영역 start -->
        <div class="header-left-logo center">
            <img src="<%= contextPath %>/resources/images/로고.png" alt="소스토리 로고이미지" onclick="gotoMain();">
        </div>
        <!-- Header 왼쪽(로고) 영역 end -->
        
        <!-- Header 로고 클릭 시 메인페이지로 이동 -->
        <script>
        	function gotoMain(){
        		location.href="<%=contextPath%>";
        	}
        
        
        </script>


        <!-- Header 오른쪽 영역(상단: 유저관련 | 하단: nav바) start -->
        <div class="header-right">

            <!-- Header 오른쪽-상단(로그인, 마이페이지, 장바구니) 영역 start -->
            <div class="header-right-top">
                <div class="header-user d-flex justify-content-end center">
                    <!-- 로그인 x  -->
                    <% if(loginUser == null) { %>
                    	<a class="btn btn-outline-secondary btn-sm mx-2 py-0" href="<%= contextPath %>/loginForm.me">login</a>
                    	<svg id="loginPage" style="pointer-events: visible" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="user mx-2" viewBox="0 0 16 16">
	                        <path style="pointer-events: visible" d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
	                    </svg>
	                    <svg id="loginPage2" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart mx-2" viewBox="0 0 16 16">
	                    	<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
	                    </svg>
                    <% } else { %>
                    <!-- 로그인 o -->
                    	<% if(loginUser.getUserType().equals("Y")) { %>
	                    	<span><b><%= loginUser.getUserName() %></b>님</span>
	                    	<svg id="myPage" style="pointer-events: visible" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="user mx-2" viewBox="0 0 16 16">
		                        <path style="pointer-events: visible" d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
		                    </svg>
		                    <svg id="cart" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart mx-2" viewBox="0 0 16 16">
	                    		<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
		                    </svg>
		                    <a type="button" class="btn btn-outline-secondary btn-sm mx-2 py-0" href="<%= contextPath %>/logout.me">logout</a>
	                    <% } else { %>
		                    <span><b><%= loginUser.getUserName() %></b>님</span>&nbsp;
	                    	<svg id="managerPage" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
							  	<path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
							</svg>
		                    <a type="button" class="btn btn-outline-secondary btn-sm mx-2 py-0" href="<%= contextPath %>/logout.me">logout</a>
	                    <% } %>
                    <% } %>
                    
                </div>
            </div>
            <!-- Header 오른쪽-상단(로그인, 마이페이지, 장바구니) 영역 end -->
       		
       		<script>
       			$(function(){
       				$("#myPage").click(function(){
       					location.href = "<%= contextPath %>/myPage.me";
       				})
       				
       				$("#managerPage").click(function(){
       					location.href = "<%= contextPath %>/manager.ma";
       				})
       				
       				$("#loginPage").click(function(){
       					alert("로그인을 먼저진행해주세요.");
       					location.href = "<%= contextPath %>/loginForm.me";
       				})
       				
       				$("#cart").click(function(){
       					location.href = "<%= contextPath %>/list.ca";
       				})
       				
       				$("#loginPage2").click(function(){
       					alert("로그인을 먼저진행해주세요.");
       					location.href = "<%= contextPath %>/loginForm.me";
       				})
       				
       				
       			})
       			
       			
       			
       			
       			
       		</script>

            <!-- Header 오른쪽-하단(nav바) 영역 start -->
            <div class="header-right-bottom">
                <div class="header-nav py-4 mb-3">
                    <nav class="nav nav-underline justify-content-around">
                        <a class="nav-item nav-link link-body-emphasis active" href="#">HOME</a>
                        <a class="nav-item nav-link link-body-emphasis" href="<%= contextPath %>/list.pr?page=1">전체상품</a>
                        <a class="nav-item nav-link link-body-emphasis" href="<%= contextPath%>/listNew.pr?page=1">신상품</a>
                        <a class="nav-item nav-link link-body-emphasis" href="#">타임세일</a>
                        <a class="nav-item nav-link link-body-emphasis" href="<%=contextPath%>/rank.pr?page=1">랭킹</a>
                        <a class="nav-item nav-link link-body-emphasis" href="<%= contextPath %>/list.re?page=1">소스트리</a>
                    </nav>
                </div>
            </div>
            <!-- Header 오른쪽-하단(nav바) 영역 start -->
        </div>
        <!-- Header 오른쪽 영역(상단: 유저관련 | 하단: nav바) end -->
    </header>
    <!-- Header end -->
</body>
</html>