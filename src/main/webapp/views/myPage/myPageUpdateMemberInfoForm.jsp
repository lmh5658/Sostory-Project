<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경</title>

<!-- 마이페이지(MyTree) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageUpdateForm.css" rel="stylesheet">
    
</head>
<body>
	<div class="wrap">
		
		<%@ include file="/views/common/header.jsp" %>
		
		<% if(loginUser == null){ // alert 시킬 알람문구가 존재할 경우 %>
	        <script>
	           alert('로그인을 먼저 진행해주세요'); // 문자열 취급시 따옴표로 감싸야됨
	           location.href="<%=contextPath%>/loginForm.me";
	        </script>
		<% } %>
<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <!-- Section start -->
        <section class="main-content">

            <div class="main-wrap">
            
<!-- =========================================================================================================================== -->

               <!-- 사이드 nav바 start -->
		      <div class="menu_wrap" style="width:200px;">
		
		          <div class="side_menu">
		              <button class="list">회원정보</button>
		              <div><a href="" id="updateMemInfo" style="color:white; text-decoration-line:none;">회원정보 변경</a></div>
		              <div><a href="<%= contextPath %>/updatePwdForm.me" style="color:white; text-decoration-line:none;">비밀변호 변경</a></div>
		              <div><a href="<%= contextPath %>/address.me" style="color:white; text-decoration-line:none;">배송지관리</a></div>
		              <div><a href="" id="deleteMember" style="color:white; text-decoration-line:none;">회원탈퇴</a></div>
		          </div>
		
		          <div class="side_menu">
		              <button class="list" id="my-tree">My Tree</button>
		          </div>
		
		          <div class="side_menu">
				        <button type="button" id="likeList" class="list">찜목록</button>
				   </div>
		
		          <div class="side_menu">
		              <button class="list">고객문의</button>
		              <div>
		              <a href="<%= contextPath %>/qlist.me?type=1" style="color:white; text-decoration-line:none;">상품문의</a><br>
		              <a href="<%= contextPath %>/qlist.me?type=2" style="color:white; text-decoration-line:none;">1:1 문의</a>
		              </div>
		          </div>
		
		          <div class="side_menu">
				        <button class="list" id="orderList">주문조회</button>
				  </div>
		
		      </div>
		
			   <!-- 네비메뉴바 스크립트 -->
		       <script>
			   $(function(){
					
				   // 사이드메뉴-MyTree(내가 작성한 레피시목록페이지) 이동요청 버튼클릭시 실행될 함수
				   	$("#my-tree").click(function(){
				   		location.href = "<%= contextPath %>/recipe.me?page=1";
				   	})
				   
					// 사이드메뉴-주문조회 이동요청 버튼클릭시 실해될 함수
				   	$("#orderList").click(function(){
				   		location.href = "<%= contextPath %>/olist.me";
				   	})
				   	
					// 사이드메뉴-찜목록 이동요청 버튼클릭시 실행될 함수
				    $("#likeList").click(function(){
				    	location.href="<%= contextPath %>/like.me?type=p&page=1";
				    })	
				   
				   // 회원탈퇴페이지 요청시 실행될 함수
				   $("#deleteMember").click(function(e){
					   
					  /* 
					   * case 01) 회원탈퇴페이지 진입이후 동일페이지를 재요청할 경우 : 비밀번호확인 x
					   * case 02) 이외페이지에서 회원탈퇴페이지 요청할 경우 : 비밀번호확인
					  */
					   if(location.href.indexOf("<%= contextPath %>/deleteForm.me") == -1){
						   
						   let userPwd = prompt("본인확인을 위해 비밀번호를 입력해주세요.", "");
						   
						   if("<%= loginUser.getUserPwd() %>" == userPwd){
								   /* 
								    * 로그인한 회원(회원탈퇴 요청회원)의 비밀번호와 사용자가 입력한 비밀번호가 일치할경우
								   	* ==> 회원탈퇴페이지 이동
								   */
								   $(this).attr("href", "<%= contextPath %>/deleteForm.me");
							   }
						   
						   if("<%= loginUser.getUserPwd() %>" != userPwd){
								   /*
								    * 로그인한 회원(회원탈퇴 요청회원)의 비밀번호와 사용자가 입력한 비밀번호가 일치하지 않을경우
								    * ==> alert("실패메세지")
								   */
								   alert("비밀번호가 일치하지 않습니다.");
						   } 
					   }
					   
					   
				   })
				   
				   // 회원정보변경페이지 요청시 실행될 함수
				   $("#updateMemInfo").click(function(e){
					   
					   /* 
					    * case 01) 회원정보변경페이지 진입이후 동일페이지를 재요청할 경우 : 비밀번호확인 x
					    * case 02) 이외페이지에서 회원정보변경페이지 요청할 경우 : 비밀번호확인
					    */
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

<!-- =========================================================================================================================== -->

                <!-- 회원정보 페이지 영역 start -->
                <div class="main-page">

                    <!-- 페이지 제목 영역 start -->
                    <div class="page-title">
                        <svg id="main" style="pointer-events: visible; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>회원정보변경</b></h3>
                    </div>
                    <!-- 페이지 제목 영역 end -->
                    
                    <script>
                    	$(function(){
                    		// 회원아이콘 클릭시, 마이페이지-메인페이지 이동요청시 실행될 함수
                    		$("#main").click(function(){
                    			location.href="<%= contextPath %>/myPage.me";
                    		})
                    	})
                    </script>

                    <!-- 정보변경 양식영역 시작 -->
                    <div class="update-info">
                        <form action="<%= contextPath %>/update.me" method="post" enctype="multipart/form-data">

                            <div class="profile">
                                <b>프로필사진</b>
                                <img class="preview-profile" src="<%= contextPath %>/<%= loginUser.getUserPath() %>"></img>
                                <button type="button" class="btn btn-secondary" id="request-upload" style="height: 40px; margin: 50px 0; margin-left: 30px;">프로필사진 변경</button>
                                <input type="file" style="display: none;" name="upProfile">
                            </div>

                            <div class="user-id">
                                <b style="margin-right: 60px;">아이디</b>
                                <input type="text" class="form-control" readonly value="<%= loginUser.getUserId() %>" name="userId">
                            </div>

                            <div class="nickname">
                                <b style="margin-right: 60px;">닉네임</b>
                                <input type="text" class="form-control" value="<%= loginUser.getNickName() %>" name="nickname" required>
                            </div>

                            <div class="user-name">
                                <b style="margin-right: 60px;">이름</b>
                                <input type="text" class="form-control" readonly value="<%= loginUser.getUserName() %>">
                            </div>

                            <div class="phone">
                                <b style="margin-right: 60px;">전화번호</b>
                                <input type="phone" class="form-control" value="<%= loginUser.getPhone() %>" name="phone" required>
                            </div>

                            <!--
                                기능설명 : 인증완료된 이메일은 변경 불가, 관리자가 변경해줘야함
                            -->
                            <div class="email">
                                <b style="margin-right: 60px;">이메일</b>
                                <input type="text" class="form-control" readonly value="<%= loginUser.getEmail() == null ? "" : loginUser.getEmail() %>">
                            </div>

                            <div class="gender">
                                <b style="margin-right: 60px; width: 110px;">성별</b>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" style="width:20px; height: 20px;" name="gender" id="x" value="X">
                                    <label class="form-check-label me-5" style="font-size: 18px;" for="x">선택안함</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio"  style="width:20px; height: 20px;" name="gender" id="m" value="M">
                                    <label class="form-check-label me-5" style="font-size: 18px;" for="m">남자</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" style="width:20px; height: 20px;" name="gender" id="f" value="F">
                                    <label class="form-check-label" style="font-size: 18px;" for="f">여자</label>
                                </div>
                            </div>

                            <div class="birthday">
                                <b style="margin-right: 60px; padding: 15px;">생년월일</b>
                                <input type="date" class="form-control" value="<%= loginUser.getBirthDate() %>" name="birthDate" required>
                            </div>

                            <!--
                                기능설명 : 저장버튼 클릭시, 변경 내용 저장 후 마이페이지 메인으로 이동
                            -->
                            <div class="d-flex justify-content-center">
                                <button type="submit" class="btn btn-danger px-4 py-2 ms-5 mt-3">저장하기</button>
                            </div>

                        </form>
						
						<!-- 페이지스크립트 -->
                        <script>
                            $(function(){
                            	
                            	// 반복문을 통해 기존 회원의 성별정보를 체크되어 있게하기 위한 함수
                            	$(":radio").each(function(idx, element){
                            		if("<%= loginUser.getGender() %>" == $(this).val()){
                            			$(this).prop("checked", true);
                            		}
                            	})
                            	
                                // 프로필사진 변경버튼 클릭시 실행될 함수 : input type="file" (숨겨진요소)에 강제로 클릭이벤트 부여
                                $("#request-upload").click(function(){
                                    $(":file").click();
                                })
                                
                                // 숨겨놓은 input type="file"에 파일선택 or 파일삭제 이벤트가 발생되었을 경우
                                $(":file").change(function(){
                        
                                    console.log($(this)); // $this는 input태그요소의 정보를 담은 object 출력
                                    console.log($(this).get(0)); // .get(0) 내가 선택한 태그의 정보만 출력
                                    console.log(this)
                        
                                    // console.log(e.target.files);
                        
                                    // 이벤트가 발생한 input type="file" 요소가 존재할 경우
                                    if(this.files.length == 1){
                        
                                        const reader = new FileReader();
                                        // 파일을 읽어들이는 메소드 호출
                                        reader.readAsDataURL(this.files[0]); // file이 배열로 담겨있음 ==> 첫번쨰 사진 0번으로 뽑아주기
                                        
                                        reader.onload = function(e){ // 파일 읽어들이기가 완료되었을 경우 ==> 이미지 첨부파일 미리보기
                                            $(".preview-profile").attr("src", e.target.result);
                                        }
                        
                        
                                    }else{ // 선택되었던 파일에 제거 되었을 경우 ==> 이미지 첨부파일 미리보기 제거
                                        $(".preview-profile").attr("src", null);
                                    }
                        
                                })
                        
                            })
                        </script>


                    </div>
                    <!-- 정보번호 변경 양식영역 끝 -->


                   

                </div>   
                <!-- 회원정보변경 페이지 영역 end -->
            </div>

        </section>
        <!-- Section end -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->
	
		<%@ include file="/views/common/footer.jsp" %>
	     
	 </div>
</body>
</html>