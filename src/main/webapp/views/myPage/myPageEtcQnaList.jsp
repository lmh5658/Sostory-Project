<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1 : 1 문의</title>

<!-- 마이페이지(1:1문의페이지) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageEtcQna.css" rel="stylesheet">

</head>
<body>
<div class="wrap">
		
        <%@ include file="/views/common/header.jsp" %>

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <!-- Section start -->
        <section class="main-content">

            <div class="main-wrap">

<!-- =========================================================================================================================== -->

               <!-- 사이드 nav바 start -->
		      <div class="menu_wrap" >
		
		          <div class="side_menu">
		              <button class="list">회원정보</button>
		              <div><a href="" id="updateMemInfo" style="color:white; text-decoration-line:none;">회원정보 변경</a></div>
		              <div><a href="<%= contextPath %>/updatePwdForm.me" style="color:white; text-decoration-line:none;">비밀변호 변경</a></div>
		              <div><a href="<%= contextPath %>/address.me" style="color:white; text-decoration-line:none;">배송지관리</a></div>
		              <div><a href="" id="deleteMember" style="color:white; text-decoration-line:none;">회원탈퇴</a></div>
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
		
			   <!-- 네비메뉴바 스크립트 -->
		       <script>
			   $(function(){
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

                <!-- 1 : 1문의 페이지 영역 start -->
                <div class="main-page pt-3">

                    <!-- 페이지 제목 영역 start -->
                    <div class="page-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>1 : 1 문의</b></h3>
                    </div>
                    <!-- 페이지 제목 영역 end -->

                    <div class="jumbotron" style="padding: 20px 0px; width: 90%">   
                        <p>
                            홈페이지 및 소스토리에 대한 문의 페이지입니다. <br>
                            개별 상품에 대한 문의는 '마이페이지>상품문의'를 이용해주세요.
                        </p>
                    </div>

                    <!-- 필터링 드롭다운 영역 start -->
                    <div class="dropdown my-3">
                        <a href="" class="btn dropdown-toggle px-5" data-toggle="dropdown">전체</a>
                        <div class="dropdown-menu">
                          <a href="#" class="dropdown-item">진행중</a>
                          <a href="#" class="dropdown-item">답변완료</a>
                        </div>
                    </div>
                    <!-- 필터링 드롭다운 영역 end -->

                    <script>
                        $(function(){
                            // 사용자가 드롭다운 메뉴에서 다른 필터링 옵션을 선택했을 경우, 드롭다운 노출값과 선택된 옵션값을 변경하는 함수
                            $(".dropdown-menu").on("click", ".dropdown-item", function(){
                                const $oldVal = $(".dropdown>.dropdown-toggle").text();
                                $(".dropdown>.dropdown-toggle").text($(this).text());
                                $(this).text($oldVal);
                            })
                        })
                    </script>

                     <!-- 1:1 문의목록 테이블 영역 start -->
                     <div class="qna-list">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>문의번호</th>
                                    <th>작성일</th>
                                    <th>제목</th>
                                    <th>진행상태</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>212325</td>
                                    <td>2024-02-26</td>
                                    <!-- 
                                        기능설명 : 제목 클릭시, 상세페이지이동
                                        기능구현 : 아래 스크립트에 URL 넣어주면됨
                                    -->
                                    <td id="qna-title">환불관련</td>
                                    <td>답변완료</td>
                                    <td>
                                        <!--
                                            기능설명 : 수정버튼 클릭시 팝업창으로 문의수정창 띄워주기
                                            기능구현 : 
                                        -->
                                        <button type="button" class="btn text-primary" data-toggle="modal" data-target="#update-qna">수정</button>
                                        | 
                                        <!-- 
                                            기능설명 : 삭제버튼 클릭시, confirm 팝업 후 삭제진행 
                                            기능구현 : 아래 삭제여부 확인용 팝업창(모달)있음
                                        -->
                                        <button type="button" class="btn text-danger" data-toggle="modal" data-target="#delete-qna">삭제</button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>212325</td>
                                    <td>2024-02-26</td>
                                    <!-- 
                                        기능설명 : 제목 클릭시, 상세페이지이동
                                        기능구현 : 아래 스크립트에 URL 넣어주면됨
                                     -->
                                    <td id="qna-title">환불관련</td>
                                    <td>답변완료</td>
                                    <td>
                                        <!--
                                            기능설명 : 수정버튼 클릭시 팝업창으로 문의수정창 띄워주기
                                            기능구현 : 
                                        -->
                                        <button type="button" class="btn text-primary" data-toggle="modal" data-target="#update-qna">수정</button>
                                        | 
                                        <!-- 
                                            기능설명 : 삭제버튼 클릭시, confirm 팝업 후 삭제진행 
                                            기능구현 : 아래 삭제여부 확인용 팝업창(모달)있음
                                        -->
                                        <button type="button" class="btn text-danger" data-toggle="modal" data-target="#delete-qna">삭제</button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>212325</td>
                                    <td>2024-02-26</td>
                                    <!-- 
                                        기능설명 : 제목 클릭시, 상세페이지이동
                                        기능구현 : 아래 스크립트에 URL 넣어주면됨
                                     -->
                                    <td id="qna-title">환불관련</td>
                                    <td>답변완료</td>
                                    <td>
                                        <!--
                                            기능설명 : 수정버튼 클릭시 팝업창으로 문의수정창 띄워주기
                                            기능구현 : 
                                        -->
                                        <button type="button" class="btn text-primary" data-toggle="modal" data-target="#update-qna">수정</button>
                                        | 
                                        <!-- 
                                            기능설명 : 삭제버튼 클릭시, confirm 팝업 후 삭제진행 
                                            기능구현 : 아래 삭제여부 확인용 팝업창(모달)있음
                                        -->
                                        <button type="button" class="btn text-danger" data-toggle="modal" data-target="#delete-qna">삭제</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- 1:1 문의목록 테이블 영역 end -->

                        <!-- 문의수정 팝업창(수정버튼 클릭시 팝업창뜸) start -->
                        <div class="modal" id="update-qna">
                        <div class="modal-dialog modal-lg">
                        <div class="modal-content px-3" style="border: 1px solid;">
                        
                            <!-- 문의수정 팝업창 Header -->
                            <div class="modal-header modal-title">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                                </svg>
                                <h4><b>1 : 1 문의 > 수정하기</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- 문의수정 팝업창 body -->
                            <div class="modal-body">

                                <form action="" method="" class="form-group">

                                    <div class="d-flex form-field">
                                        <label for="qna-title" class="mr-sm-2">제목</label>
                                        <input type="text" class="form-control qna-title" id="qna-title" value="기존 문의제목">
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="qna-attachment" class="mr-sm-2">첨부파일</label>
                                        <input type="file" class="form-control" id="qna-attachment">
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="qna-content" class="mr-sm-2">내용</label>
                                        <textarea id="qna-content" class="form-control qna-content" cols="30" rows="10" maxlength="500" style="resize: none; text-align: justify;" placeholder="내용을 입력해주세요 / 500자"></textarea>
                                        <div class="count-text-area">
                                            <label class="count-text"></label>/500
                                        </div>
                                    </div>

                                    <div class="modal-button">
                                        <button type="reset" class="btn btn-secondary me-3 px-4" data-dismiss="modal">뒤로가기</button>
                                        <button type="submit" class="btn btn-danger me-3 px-4">수정</button>
                                    </div>

                                </form>

                            </div>
                            
                        </div>
                        </div>
                    </div>
                    <!-- 문의수정 팝업창 end -->


                    <!-- 문의삭제 여부 확인 팝업창 start -->
                    <div class="modal" id="delete-qna">
                        <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal body -->
                            <div class="modal-body my-4" style="font-size: 20px;">
                                문의내역을 정말 삭제하시겠습니까?
                            </div>
                            
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <div class="d-flex">
                                    <button type="reset" class="btn btn-secondary me-3 px-4" data-dismiss="modal">취소</button>
                                    <!-- 확인버튼 클릭시 삭제진행 -->
                                    <a href="삭제요청URL" class="btn btn-danger px-4" data-dismiss="modal">확인</a>
                                </div>
                            </div>
                            
                        </div>
                        </div>
                    </div>
                    <!-- 문의삭제 여부 확인 팝업창 end -->

                    <script>
                        $(function(){
                            // 문의제목 클릭시, 해당문의 상세페이지로 이동하는 함수
                            $(".qna-list>.table>tbody").on("click", "#qna-title", function(){
                                location.href="해당문의 상세페이지 이동URL";
                            })

                            // 1:1 문의수정, 문의작성 모달창 문의제목 입력글자수 제한함수
                            $(".qna-title").each(function(idx, element){
                                // 최대 글자수 20자일때 계속 입력하고자 할시 입력제한 알림
                                $(element).keyup(function(){
                                    if($(element).val().length >= 20){
                                        alert("최대 20자까지 입력 가능합니다.");
                                    }
                                })
                            })

                            // 1:1 문의수정, 문의작성 모달창 문의내용 textarea 입력글자수 세주는 함수
                            $(".qna-content").each(function(idx, element){
                                $(element).keyup(function(){
                                    // 실시간 글자수 세주는 함수
                                    if($(element).val().length == 0){
                                        $(element).next().children(".count-text").text(0);
                                    }else{
                                        $(element).next().children(".count-text").text($(element).val().length);
                                    }

                                    // 최대 글자수 입력시 입자수 입력제한 알림
                                    if($(element).val().length >= 500){
                                        alert("최대 500자까지 입력 가능합니다.");
                                    }


                                })
                            })
                            
                        })
                    </script>

                    <div class="qna-button">
                        <!--
                            기능설명 : 문의하기 버튼 클릭시, 문의작성 페이지로 이동
                            기능구현 : X
                        -->
                        <button type="button" class="btn btn-danger px-4" data-toggle="modal" data-target="#insert-qna">문의하기</button>
                    </div>

                    <!-- 문의작성 팝업창(수정버튼 클릭시 팝업창뜸) start -->
                    <div class="modal" id="insert-qna">
                        <div class="modal-dialog modal-lg">
                        <div class="modal-content px-3" style="border: 1px solid;">
                        
                            <!-- 문의작성 팝업창 Header -->
                            <div class="modal-header modal-title">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                                </svg>
                                <h4><b>1 : 1 문의 > 문의하기</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- 문의작성 팝업창 body -->
                            <div class="modal-body">

                                <form action="" method="" class="form-group">

                                    <div class="d-flex form-field">
                                        <label for="qna-title" class="mr-sm-2">제목</label>
                                        <input type="text" class="form-control qna-title" id="qna-title" placeholder="내용을 입력해주세요/20자">
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="qna-category" class="mr-sm-2">종류</label>
                                        <select name="" id="qna-category" class="form-control">
                                            <option value="">취소/환불/교환</option>
                                            <option value="">배송관련</option>
                                            <option value="">홈페이지</option>
                                            <option value="">레시피</option>
                                            <option value="">기타</option>
                                        </select>
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="qna-attachment" class="mr-sm-2">첨부파일</label>
                                        <input type="file" class="form-control" id="qna-attachment">
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="qna-content" class="mr-sm-2">내용</label>
                                        <textarea id="qna-content" class="form-control qna-content" cols="30" rows="10" maxlength="500" style="resize: none; text-align: justify;" placeholder="내용을 입력해주세요 / 500자"></textarea>
                                        <div class="count-text-area">
                                            <label class="count-text"></label>/500
                                        </div>
                                    </div>

                                    <div class="modal-button">
                                        <button type="reset" class="btn btn-secondary me-3 px-4" data-dismiss="modal">뒤로가기</button>
                                        <button type="submit" class="btn btn-danger me-3 px-4">수정</button>
                                    </div>

                                </form>

                            </div>
                            
                        </div>
                        </div>
                    </div>
                    <!-- 문의작성 팝업창 end -->
                        
                        <!-- 기능 : 10개 단위 페이징처리 -->
                        <div class="center">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">6</a></li>
                                <li class="page-item"><a class="page-link" href="#">7</a></li>
                                <li class="page-item"><a class="page-link" href="#">8</a></li>
                                <li class="page-item"><a class="page-link" href="#">9</a></li>
                                <li class="page-item"><a class="page-link" href="#">10</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </div>

                    </div>
                    <!-- 1:1문의 테이블 영역 end -->

                </div>   
                <!-- 1:1문의 페이지 영역 end -->
            </div>

        </section>
        <!-- Section end -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
	     
	 </div>
</body>
</html>