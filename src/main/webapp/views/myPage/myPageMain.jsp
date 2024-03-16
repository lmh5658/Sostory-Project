<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.member.model.vo.Member" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인페이지</title>

<!-- 마이페이지(메인페이지) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageMain.css" rel="stylesheet">

</head>
<body>

	 <div class="wrap">
	 
    	<%@ include file="/views/common/header.jsp" %>

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

	    <!-- Section start -->
	    <section class="main-content pt-3">
	
	        <div class="main-wrap">
				<!-- 
					css 안먹히는 문제때문에 마이페이지(메인페이지)에서만 include처리 안함
					직접 인라인스타일을 먹이지 않으면 CSS스타일 적용이 잘 안되어서 메뉴바(마이페이지) 찌그러짐 현상있음 
					공통 메뉴바(마이페이지) HTML코드에는 메뉴바 스타일이 인라인으로 되어있지 않음
				-->
	            <!-- 마이페이지 사이드 nav바 start -->
				<div class="menu_wrap" style="margin-top: 120px; width:200px;">
				
				    <div class="side_menu">
				        <button class="list">회원정보</button>
				        <div><a href="" class="" style="color:white; text-decoration-line:none;">회원정보 변경</a></div>
				        <div><a href="<%= contextPath %>/updatePwdForm.me" style="color:white; text-decoration-line:none;">비밀변호 변경</a></div>
				        <div><a href="" style="color:white; text-decoration-line:none;">배송지관리</a></div>
				        <div><a href="" style="color:white; text-decoration-line:none;">회원탈퇴</a></div>
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
				        <a href="" style="color:white; text-decoration-line:none;">상품문의</a><br>
				        <a href="" style="color:white; text-decoration-line:none;">1:1 문의</a>
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
	
	            <!-- nav바 별 메인페이지 (보이는 페이지) : nav바 옆에 start -->
	            <div class="main-page" style="margin-top: 120px;">
	
	                <!-- 페이지 제목 영역 start -->
	                <div class="page-title">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
	                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
	                    </svg>
	                    <h3><b>마이페이지</b></h3>
	                </div>
	                <!-- 페이지 제목 영역 end -->
	
	                <!-- 회원정보 영역(오른쪽 상단) start -->
	                <div class="user-info">
	                    
	                    <div class="profile">
	                        <img src="프로필이미지" alt="" id="userProfile">
	                    </div>
	
	                    <div class="profile-right">
	                        <h3><b id="userName">xxx</b>님! 안녕하세요</h3>
	                        
	                        <!-- 각 메뉴 클릭시, 해당페이지로 이동 -->
	                        <div class="profile-right-bottom">
	                            
	                            <div class="user-info-etc" style="border-right: 2px solid lightgray;">
	                                <b class="d-block">배송중</b>
	                                <h6><b>1</b>개</h6>
	                            </div>
	
	                            <!--
	                                뺐지만, 일단 화면에 넣으는 놓음
	                            -->
	                            <div class="user-info-etc" style="border-right: 2px solid lightgray;">
	                                <b class="d-block">환불/반품</b>
	                                <h6><b>1</b>개</h6>
	                            </div>
	
	                            <div class="user-info-etc" style="border-right: 2px solid lightgray;">
	                                <b class="d-block">찜한상품</b>
	                                <h6><b>5</b>개</h6>
	                            </div>
	
	                            <div class="user-info-etc" style="border-right: 2px solid lightgray;">
	                                <b class="d-block">찜한레시피</b>
	                                <h6><b>3</b>개</h6>
	                            </div>
	
	                        </div>
	                    </div>
	
	                </div>
	                <!-- 회원정보 영역(오른쪽 상단) end -->
	
	                <!-- 고객문의 진행사항 영역(오른쪽 하단) start-->
	                <div class="customer-qna-area">
	                    
	                    <h3><b>고객문의 진행사항</b></h3>
	
	                    <div class="qna-wrap">
	                        <!-- 상품문의 -->
	                        <div class="product-qna">
	                            <h4 class="my-4"><b>상품문의</b></h4>
	
	                            <!-- 현재 진행중인 고객문의 표시 -->
	                            <h6 class="mt-2 mb-3 pb-3" style="width: 250px; text-align: center; padding-bottom:6px; border-bottom:1px solid grey;"><b>진행중 문의</b></h6>
	                            <h6 style="color: rgb(158, 155, 155);">진행 중인 문의가 존재하지 않습니다.</h6>
	
	                            <!-- 미확인 문의는 확인하면 표시안됨 -->
	                            <h6 class="mt-5 mb-3 pb-3" style="width: 250px; text-align: center; padding-bottom:6px; border-bottom:1px solid grey;"><b>미확인 완료문의</b></h6>
	                            <b>확인하지 않은 2건의 완료 문의가 있습니다.</b>
	
	                            <!-- 클릭시 해당 문의페이지로 이동-->
	                            <a class="btn btn-secondary mt-5">확인하기</a>
	                        </div>
	
	                        <!-- 1:1 문의 -->
	                        <div class="etc-qna">
	                            <h4 class="my-4"><b>1 : 1 문의</b></h4>
	
	                            <!-- 현재 진행중인 고객문의 표시 -->
	                            <h6 class="mt-2 mb-3 pb-3" style="width: 250px; text-align: center; padding-bottom:6px; border-bottom:1px solid grey;"><b>진행중 문의</b></h6>
	                            <h6 style="color: rgb(158, 155, 155);">진행 중인 문의가 존재하지 않습니다.</h6>
	
	                            <!-- 미확인 문의는 확인하면 표시안됨 -->
	                            <h6 class="mt-5 mb-3 pb-3" style="width: 250px; text-align: center; padding-bottom:6px; border-bottom:1px solid grey;"><b>미확인 완료문의</b></h6>
	                            <b>확인하지 않은 2건의 완료 문의가 있습니다.</b>
	
	                            <!-- 클릭시 해당 문의페이지로 이동-->
	                            <a class="btn btn-secondary mt-5">확인하기</a>
	                        </div>
	                    </div>
	                    
	
	                </div>
	                <!-- 고객문의 진행사항 영역(오른쪽 하단) end-->
	
	            </div>
	            <!-- nav바 별 메인페이지 (보이는 페이지) : nav바 옆에 end -->
	
	        </div>
	
	    </section>
	    <!-- Section end -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
        
</body>
</html>