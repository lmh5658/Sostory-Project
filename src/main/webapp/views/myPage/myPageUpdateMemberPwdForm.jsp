<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호변경</title>

	<!-- 마이페이지(비밀번호변경) css 파일 링크연결 -->
	<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageUpdateMemberPwdForm.css" rel="stylesheet">

</head>
<body>
    <div class="wrap">
		
        <%@ include file="/views/common/header.jsp" %>

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <!-- Section start -->
        <section class="main-content">

            <div class="main-wrap">

                <!-- 사이드 nav바 start -->
                <div class="menu_wrap" >

                    <div class="side_menu">
                        <button class="list">회원정보</button>
                        <div><a href="" id="updateMemInfo">회원정보 변경</a></div>
                        <div><a href="<%= contextPath %>/updatePwdForm.me">비밀변호 변경</a></div>
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


                <!-- 네비메뉴바 스크립트 -->
		       <script>
			   $(function(){
				   // 회원정보 변경페이지 요청시 실행될 함수
				   $("#updateMemInfo").click(function(e){
					  console.log(location.href);
					  console.log(location.href.indexOf("<%= contextPath %>/updateForm.me"));
					   if(location.href.indexOf("<%= contextPath %>/updateForm.me") == -1){
						   let userPwd = prompt("본인확인을 위해 비밀번호를 입력해주세요.", "");
						   if("<%= loginUser.getUserPwd() %>" == userPwd){
								   /* 
								    * 로그인한 회원(정보변경을 요청한 회원)의 비밀번호와 사용자가 입력한 비밀번호가 일치할경우
								   	* ==> 회원정보변경 페이지 이동
								   */
								   $(this).attr("href", "<%= contextPath %>/updateForm.me");
							   }
						   
						   if("<%= loginUser.getUserPwd() %>" != userPwd){
								   /*
								    * 로그인한 회원(정보변경 요청한 회원)의 비밀번호와 사용자가 입력한 비밀번호가 일치하지 않을경우
								    * ==> alert("실패메세지")
								   */
								   alert("비밀번호가 일치하지 않습니다.");
						   } 
					   }

				   })
				   
					// 마이페이지 nav메뉴바 목록 슬라이딩 처리용 함수
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
                <!-- 사이드 nav바 end -->

                <!-- 비밀번호 페이지 영역 start -->
                <div class="main-page">

                    <!-- 페이지 제목 영역 start -->
                    <div class="page-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>비밀번호변경</b></h3>
                    </div>
                    <!-- 페이지 제목 영역 end -->

                    <!-- 비밀번호 변경 양식영역 시작 -->
                    <div class="change-pwd">
                        <form action="<%= contextPath %>/updatePwd.me" method="post" id="form">
	                         <h3>현재 비밀번호</h3>
	                         <input type="password" class="form-control" placeholder="현재 비밀번호를 입력하세요" required id="oldPwd" name="oldPwd">
	                         
	                         <!--
	                             기능설명 : 비밀번호 유효성검사로 "사용가능한 비밀번호입니다" 유효성체크
	                         -->
	                         <h3>변경 비밀번호</h3>
	                         <input type="password" class="form-control" placeholder="변경할 비밀번호를 입력하세요" required id="checkPwd" name="newPwd">
	                         <label id="checkMsg" style="display:hidden; color:Lime; float:left; margin-top:5px;"></label>
	                         <input type="password" class="form-control mt-4" placeholder="비밀번호 확인" required id="confirmPwd">
	                         <label id="confirmMsg" style="display:hidden; color:tomato; float:left; margin-top:5px;"></label>
	                         
	                         <div class="button-area">
	                             <div class="d-flex">
	                                 <button type="button" class="btn btn-secondary me-3 px-4" onclick="history.back()">뒤로가기</button>
	                                 <!--
	                                     기능설명 : 변경하기 클릭시
	                                               - 문제 없을 경우 : 성공 팝업뜨고 마이페이지 메인페이지로 이동
	                                               - 현재비밀번호 or 비밀번호 확인 불일치 : 팝업 경고후 해당페이지에 머무름
	                                 -->
	                                 <button type="submit" class="btn btn-danger px-4">변경하기</a>
	                             </div>
	                         </div>
	                     </form>
	                     
	                     <script>
							$(function(){
								
								// 새로운 비밀번호 입력시, 비밀번호 유효성체크용 함수
								$("#checkPwd").keyup(function(){
									console.log("하이");
									// 비밀번호 유효성체크용 정규표현식 : 영문자, 숫자, 특수문자 포함 11글자이상 여부판단
									const regexPwd = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[#?!@$ %^&*-]).{11,}$/;
									
									if(regexPwd.test($("#checkPwd").val())){ // 유효한 비밀번호형식일 경우
										$("#checkMsg").text("사용가능한 비밀번호입니다.");
									}else{ // 유효하지않은 비밀번호형식일 경우
										$("#checkMsg").text("영문자, 숫자, 특수문자를 조합해서 11자이상으로 입력해주세요.")
									}
								})
								
								// 변경할 비밀번호 일치여부 확인용 함수
								$("#confirmPwd").keyup(function(){
									console.log($(this).val());
									console.log($("#checkPwd").val());
									console.log($(this).val() == $("#checkPwd").val());
									if($(this).val() == $("#checkPwd").val()){
										$("#confirmMsg").text("비밀번호가 일치합니다.");
									}else{
										$("#confirmMsg").text("비밀번호가 일치하지 않습니다.")
									}
									
								})
								
								/* form submit 기본이벤트 방지용 함수
								   case 01) 기존 비밀번호가 일치하지 않을 경우
								   case 02) 변경할 비밀번호 일치하나 비밀번호 입력형식이 맞지않을 경우
								   case 03) 변경할 비밀번호 일치하지 않을 경우
								*/
								$("#form").submit(function(e){
									
									// 비밀번호 유효성체크용 정규표현식 : 영문자, 숫자, 특수문자 포함 11글자이상 여부판단
									const regexPwd = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[#?!@$ %^&*-]).{11,}$/;
									
									if($("#oldPwd").val() != "<%= loginUser.getUserPwd() %>"){
										alert("기존 비밀번호가 일치하지 않습니다.");
										$("#oldPwd").select();
										e.preventDefault();
									}else if(!regexPwd.test($("#checkPwd").val())){
										alert("입력한 비밀번호가 사용가능한 형식이 아닙니다.");
										$("#checkPwd").select();
										e.preventDefault();
									}else if($("#checkPwd").val() != $("#confirmPwd").val()){
										alert("변경할 비밀번호가 일치하지 않습니다.");
										$("#confirmPwd").select();
										e.preventDefault();
									}
								})
																
							})
						</script>


                    </div>
                    <!-- 비밀번호 변경 양식영역 끝 -->

                </div>   
                <!-- 비밀번호 페이지 영역 end -->
            </div>

        </section>
        <!-- Section end -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
	     
	 </div>
</body>
</html>