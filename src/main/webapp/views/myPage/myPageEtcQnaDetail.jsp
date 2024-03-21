<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.product.model.vo.*" %>

<%
	Qna q = (Qna)request.getAttribute("qna");
	AttachmentProduct file = (AttachmentProduct)request.getAttribute("file");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의상세</title>

<!-- 마이페이지(1:1문의상세페이지) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageEtcQnaDetail.css" rel="stylesheet">
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
                
                
                <!-- 1 : 1문의 상세페이지 영역 start -->
                <div class="main-page pt-3">

                    <!-- 페이지 제목 영역 start -->
                    <div class="page-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>1 : 1 문의</b></h3>
                    </div>
                    <!-- 페이지 제목 영역 end -->

                     <!-- 1:1 문의상세 테이블 영역 start -->
                     <div class="qna-detail">
                        
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td colspan="2" class="regist-date" style="border: none; text-align:right;"><%= q.getAnswerDate() %></td>
                                </tr>

                                <tr>
                                    <th>제목</th>
                                    <td><%= q.getAnswerTitle() %></td>
                                </tr>


                                <tr>
                                    <th>첨부파일</th>
                                    <!-- 첨부파일이 있을경우 -->
                                    <% if(file != null) { %>
                                    	<td>
                                    		<a download="<%= file.getFileName() %>" href="<%= contextPath + "/" + file.getFileUrl() %>"><%= file.getFileName() %></a>
                                    	</td> 
                                    <% } else { %>
                                    <!-- 첨부파일이 없을경우 -->
                                    	<td style="color:lightgray;">첨부파일이 없습니다.</td>
                                    <% } %>
                                </tr>
                                
                                <tr>
                                    <th>내용</th>
                                    <td>
                                        <textarea readonly cols="30" rows="10" class="text-secondary form-control" style="resize: none; width: 100%; border: none;"><%= q.getAnswerContent() %></textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <th cols="2" style="border: none;">답변</th>
                                </tr>

                                <tr>
                                    <th></th>
                                    <td>
                                    	<!-- 미처리 문의일 경우 (미답변) -->
                                    	<% if(q.getReply() == null) { %>
                                        	<textarea readonly cols="30" rows="10" class="text-secondary form-control" style="resize: none; width: 100%; border: none;">관리자 답변을 진행중입니다. 빠른시일 내에 답변드리겠습니다.</textarea>
                                        <% } else { %>
                                        <!-- 처리된 문의일 경우 (답변완료) -->
                                        	<textarea readonly cols="30" rows="10" class="text-secondary form-control" style="resize: none; width: 100%; border: none;"><%= q.getReply() %></textarea>
                                        <% } %>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <!-- 1:1문의상세 테이블 영역 end -->

                    <div class="table-button">
                        <button type="button" class="btn btn-secondary me-3 px-4" onclick="history.back();">목록가기</button>
                    </div>


                </div>   
                <!-- 1:1문의 상세페이지 영역 end -->
            </div>

        </section>
        <!-- Section end -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
	     
	 </div>
</body>
</html>