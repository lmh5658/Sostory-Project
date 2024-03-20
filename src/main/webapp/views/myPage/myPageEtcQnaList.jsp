<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.common.model.vo.PageInfo
				, java.util.List
				, com.sos.product.model.vo.Qna" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
	List<Qna> list = (List<Qna>)request.getAttribute("qnaList");
%>
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
		              <a href="<%= contextPath %>/qna.me?type=1&page=1" style="color:white; text-decoration-line:none;">상품문의</a><br>
		              <a href="<%= contextPath %>/qna.me?type=2&page=1" style="color:white; text-decoration-line:none;">1:1 문의</a>
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
                        <a href="<%= contextPath %>/qna.me?type=2&page=1" class="btn dropdown-toggle px-5" data-toggle="dropdown">전체</a>
                        <div class="dropdown-menu">
                          <a href="<%= contextPath %>/qna.me?type=2&page=1&status=on" class="dropdown-item">진행중</a>
                          <a href="<%= contextPath %>/qna.me?type=2&page=1&status=off" class="dropdown-item">답변완료</a>
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
                            <% if(list != null) { %>
	                            <% for(Qna q : list) { %>
	                                <tr>
	                                    <td><%= q.getAnswerNo() %></td>
	                                    <td><%= q.getAnswerDate() %></td>
	                                    <!-- 
	                                        기능설명 : 제목 클릭시, 상세페이지이동
	                                        기능구현 : 아래 스크립트에 URL 넣어주면됨
	                                    -->
	                                    <td id="qna-title"><%= q.getAnswerTitle() %></td>
	                                    <td><%= q.getAnswerStatus().equals("처리") ? "답변완료" : "진행중" %></td>
	                                    <td>
	                                        <!-- 
	                                            기능설명 : 삭제버튼 클릭시, confirm 팝업 후 삭제진행 
	                                            기능구현 : 아래 삭제여부 확인용 팝업창(모달)있음
	                                        -->
	                                        <button type="button" class="btn text-danger" onclick="deleteQna(<%= q.getAnswerNo() %>);">삭제</button>
	                                    </td>
	                                </tr>
								<% } %>
                            <% } else if(list.size() == 0) { %>
                            	<tr>
                            		<td colspan="5">문의 내역이 존재하지 않습니다.</td>
                            	</tr>
                            <% } %>
                            </tbody>
                        </table>
                        <!-- 1:1 문의목록 테이블 영역 end -->


	                    <script>
		                 	// 문의삭제 클릭시, 삭제여부 재확인후 삭제요청 진행하는 함수
	                    	function deleteQna(no){
	                    		
	                    		if(confirm("문의내역 삭제시 복구가 불가합니다. 해당 문의내역을 삭제하시겠습니까?")){
	                    			location.href = "<%= contextPath %>/deleteQna.me?type=2&qNo=" + no;
	                    		}
	                    		
	                    	}
		                 	
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
	
	                    <!-- 문의작성 팝업창(문의하기 클릭시 팝업창뜸) start -->
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
	
	                                <form action="<%= contextPath %>/insertEq.me" method="post" enctype="multipart/form-data" class="form-group">
	
	                                    <div class="d-flex form-field">
	                                        <label for="qna-title" class="mr-sm-2">제목</label>
	                                        <input type="text" class="form-control qna-title" id="qna-title" placeholder="내용을 입력해주세요/20자" name="answerTitle">
	                                    </div>
	
	                                    <div class="d-flex form-field">
	                                        <label for="qna-attachment" class="mr-sm-2">첨부파일</label>
	                                        <input type="file" class="form-control" id="qna-attachment" name="uploadFile">
	                                    </div>
	
	                                    <div class="d-flex form-field">
	                                        <label for="qna-content" class="mr-sm-2">내용</label>
	                                        <textarea id="qna-content" class="form-control qna-content" cols="30" rows="10" maxlength="500" style="resize: none; text-align: justify;" placeholder="내용을 입력해주세요 / 500자" name="answerContent"></textarea>
	                                        <div class="count-text-area">
	                                            <label class="count-text"></label>/500
	                                        </div>
	                                    </div>
	
	                                    <div class="modal-button">
	                                        <button type="reset" class="btn btn-secondary me-3 px-4" data-dismiss="modal">뒤로가기</button>
	                                        <button type="submit" class="btn btn-danger me-3 px-4">등록</button>
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
	                            <!-- 이전페이지 이동버튼 활성화여부 
	                            	 case 01) 비활성화 : 현재페이지 == 1페이지
	                            	 case 02)  활성화 : 현재페이지 != 1페이지 ==> (현재페이지 - 1)페이지이동 URL요청
	                             -->
	                            <% if(pi.getCurrentPage() == 1) { %>
                                	<li class="page-item disabled"><a class="page-link">Previous</a></li>
                                <% } else { %>
                                	<li class="page-item"><a class="page-link" href="<%= contextPath %>/qna.me?type=2&page=<%= (pi.getCurrentPage() - 1) %>">Previous</a></li>
                                <% } %>
                                <!-- 페이지 번호버튼 활성화여부
                                	 case 01) 비활성화 : 해당페이지 == 현재페이지
                                	 case 02)  활성화 : 해당페이지 != 현재페이지 ==> 해당페이지이동 URL요청
                                 -->
                                <% for(int p=pi.getStartPage() ; p<=pi.getEndPage() ; p++) { %>
                                	<%if(pi.getCurrentPage() == p) { %>
                                		<li class="page-item active"><a class="page-link"><%= p %></a></li>
                                	<% } else { %>
                                		 <li class="page-item"><a class="page-link" href="<%= contextPath %>/qna.me?type=2&page=<%= p %>"><%= p %></a></li>
                                	<% } %>
                                <% } %>
                                <!-- 이후페이지 이동버튼 활성화여부
                                	 case 01) 비활성화 : 현재페이지 == 최대페이지 || 문의목록 존재하지 않을때
                                	 case 02)  활성화 : 현재페이지 != 최대페이지 ==> (현재페이지 + 1) 페이지이동 URL요청
                                 -->
                                <% if(pi.getCurrentPage() == pi.getMaxPage() || pi.getMaxPage() == 0) { %>
                                	<li class="page-item disabled"><a class="page-link">Next</a></li>
                                <% } else { %>
                                	<li class="page-item"><a class="page-link" href="<%= contextPath %>/qna.me?type=2&page=<%= (pi.getCurrentPage() + 1) %>">Next</a></li>
                                <% } %>
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