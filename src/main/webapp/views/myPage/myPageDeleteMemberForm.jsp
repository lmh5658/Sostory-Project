<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<!-- 마이페이지(회원탈퇴) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageDeleteMember.css" rel="stylesheet">

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

                <!-- 회원탈퇴 페이지 영역 start -->
                <div class="main-page">

                    <!-- 페이지 제목 영역 start -->
                    <div class="page-title">
                        <svg id="main" style="pointer-events: visible; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>회원정보변경>회원탈퇴</b></h3>
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

                    <div class="jumbotron" style="padding: 15px 0px;">   
                        <p>
                            소스토리의 회원 탈퇴를 진행하시겠습니까?<br>
                            소스토리의 발전을 위해 아래 질문 사항에 답변해 주시면 감사하겠습니다.
                        </p>
                    </div>

                    <div class="confirm-area">
                        
                        <!-- 탙퇴사유 체크박스 영역 시작 -->
                        <h4><b>탈퇴사유(1개이상 필수 선택)</b></h4>

                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="가격이 합리적이지 않음" id="not-reasonable">
                            <label class="form-check-label" for="not-reasonable">가격이 합리적이지 않음</label>
                        </div>

                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="사이트의 편의성이 떨어짐" id="bad-convenient">
                            <label class="form-check-label" for="bad-convenient">사이트의 편의성이 떨어짐</label>
                        </div>

                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="레시피 커뮤니티의 정보가 만족스럽지 않음" id="bad-community">
                            <label class="form-check-label" for="bad-community">레시피 커뮤니티의 정보가 만족스럽지 않음</label>
                        </div>
                        <!-- 탙퇴사유 체크박스 영역 끝 -->

                        <!-- 추가사유 입력영역 시작 -->
                        <h4 class="mt-5"><b>추가 사유(선택)</b></h4>

                        <textarea class="form-control" style="resize: none;" rows="9" placeholder="내용을 입력해주세요"></textarea>
                        <!-- 추가사유 입력영역 끝 -->

                        <div class="button-area">
                            <button type="button" class="btn btn-secondary me-3 px-4" onclick="history.back();">뒤로가기</button>
                            <!-- 필수선택사항을 1개라도 선택하지 않았을 경우 회원탈퇴 버튼 비활성화 -->
                            <button type="button" class="btn btn-danger me-3 px-4 disabled"  data-toggle="modal" data-target="#delete-account" id="deleteMe">회원탈퇴</button>
                        </div>
                        
                        
                        <script>
                     		// 회원탈퇴 버튼 클릭시, 선택사항 최소 1개이상 필수선택 여부확인 함수
	                        $(".form-check>.form-check-input").change(function(){
	                        	
                           		let flag = 0;	// 체크여부 확인용 변수
                           		
        						$(this).each(function(){
        							if($(this).is(":checked")){
        								flag = 1;	// 1개라도 체크되어 있을 경우 ==> 1
        							}
        						})
        						
        						if(flag > 0){ // 선택사항 1개이상 체크되었을 경우
        							$("#deleteMe").removeClass("disabled");
        						}else{ // 아무것도 선택하지 않았을 경우
        							alert("탈퇴사유는 필수 선택사항입니다.");
        							$("#deleteMe").addClass("disabled");
        						}
	                        })
						</script>
						

                        <!-- 회원탈퇴 버튼 클릭시, 마지막 confrim 확인용 모달창 시작 -->
                        <div class="modal" id="delete-account">
                            <div class="modal-dialog">
                            <div class="modal-content">
                            
                                <!-- Modal body -->
                                <div class="modal-body my-4 center" style="font-size: 20px;">
                                    탈퇴시 소스토리의 서비스는 이용불가합니다. <br>
                                    회원 탈퇴를 진행하시겠습니까?
                                </div>
                                
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <div class="d-flex">
                                        <button type="reset" class="btn btn-secondary me-3 px-4" data-dismiss="modal">취소</button>
                                        <!-- 확인버튼 클릭시 삭제진행 -->
                                        <a href="<%= contextPath %>/delete.me" class="btn btn-danger px-4">확인</a>
                                    </div>
                                </div>
                                
                            </div>
                            </div>
                        </div>
                        <!-- 회원탈퇴 버튼 클릭시, 마지막 confrim 확인용 모달창 시작 -->

                    </div>

                </div>   
                <!-- 회원탈퇴 페이지 영역 end -->
            </div>

        </section>
        <!-- Section end -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
	     
	 </div>
</body>
</html>