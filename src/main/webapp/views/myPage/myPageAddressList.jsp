<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.sos.myPage.model.vo.Address" %>
    
<%
	List<Address> list = (List<Address>)request.getAttribute("addressList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 관리</title>

<!-- 마이페이지(배송지관리) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageAddressList.css" rel="stylesheet">

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
		
			   <!-- 네비메뉴바 스크립트 -->
		       <script>
			   $(function(){
				   // 회원정보변경페이지 요청시 실행될 함수
				   $("#updateMemInfo").click(function(e){
					  // 회원정보변경페이지 진입이후 동일페이지를 재요청할 경우 : 비밀번호확인 x
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

                <!-- 배송관리 페이지 영역 start -->
                <div class="main-page pt-3">

                    <!-- 페이지 제목 영역 start -->
                    <div class="page-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>배송지 관리</b><b style="font-size: 16px; margin-left: 20px;">* 배송지는 최대 10개까지 등록 가능합니다.</b></h3>
                    </div>
                    <!-- 페이지 제목 영역 end -->

                    <!-- 배송지 테이블 영역 start -->
                    <div class="address-list">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>배송지</th>
                                    <th>이름</th>
                                    <th>배송주소</th>
                                    <th>연락처</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- 조회된 배송지가 없을경우 -->
                            <% if(list == null) { %>
                            	<tr>
                            		<td colspan="5">등록된 배송지가 없습니다. 배송지를 등록해주세요.</td>
                            	</tr>
                            <% } else {%> <!-- 조회된 배송지가 있을경우 -->
	                            <% for(Address addr : list) { %>
	                                <tr>
	                                    <td><%= addr.getAddressLocal() %></td>
	                                    <td><%= addr.getAddressWriter() %></td>
	                                    <td class="address-size-limit">
	                                    	<label class="text-primary"><%= addr.getAddressType().equals("Y") ? "[기본배송지]" : "" %></label>
	                                   		<%= addr.getAddress() %>
	                                    </td>
	                                    <td><%= addr.getAddressPhone() %></td>
	                                    <td>
	                                        <a href="" class="btn text-primary" data-toggle="modal" data-target="#updateAddr">수정</a> 
	                                        | 
	                                        <a href="" class="btn text-danger">삭제</a>
	                                    </td>
	                                </tr>
								<% } %>
							<% } %>
							
							
                            </tbody>
                        </table>
                        
                        <div class="center mt-5">

                        <!-- 배송지수정 팝업창(수정버튼 클릭시 팝업창뜸) start -->
                        <div class="modal" id="updateAddr">
                        <div class="modal-dialog modal-lg">
                        <div class="modal-content px-3" style="border: 1px solid;">
                        
                            <!-- 배송지수정 팝업창 Header -->
                            <div class="modal-header">
                            <h4 class="modal-title"><b>배송지 수정</b></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <form action="" method="" class="form-group">
                                <!-- 배송지수정 팝업창 body -->
                                <div class="modal-body">

                                    <div class="d-flex form-field">
                                        <label for="addressName" class="mr-sm-2">* 배송지명</label>
                                        <input type="text" class="form-control" id="addressName" value="기존배송지명">
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="recipient-name" class="mr-sm-2">* 이름</label>
                                        <input type="text" class="form-control" id="recipient-name" value="기존이름">
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="phone" class="mr-sm-2">* 연락처</label>
                                        <input type="tel" class="form-control" id="phone" value="기존연락처">
                                    </div>

                                    <div class="d-flex form-field">
                                        
                                        <label for="address" class="mr-sm-2">* 주소</label>
                                        <input type="text" class="form-control" id="address" value="기존주소">
                                    </div>

                                    <div class="d-flex form-field mt-2">
                                        <input type="text" class="form-control" id="addressDetail" value="기존상세주소">
                                    </div>

                                    <div class="form-check">
                                        <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" value="">기본 배송지로 선택</label>
                                    </div>

                                </div>
                                
                                <!-- 배송지수정 팝업창 footer -->
                                <div class="modal-footer">
                                    <div class="d-flex">
                                        <button type="reset" class="btn btn-secondary me-3 px-4" data-dismiss="modal">취소</button>
                                        <button type="submit" class="btn btn-danger px-4">수정</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                        </div>
                    </div>
                    <!-- 배송지수정 팝업창 end -->

	
                    <!-- 배송지추가 버튼(클릭시 팝업창뜸) : 총 배송지 수가 10개 이하일 경우에만 보여짐 -->
                    <% if(list.size() < 10) { %>
                    	<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#insertAddr">배송지 추가</button>
					<% } %>
                     <!-- 배송지추가 팝업창(수정버튼 클릭시 팝업창뜸) start -->
                     <div class="modal" id="insertAddr">
                        <div class="modal-dialog modal-lg">
                        <div class="modal-content px-3" style="border: 1px solid;">
                        
                            <!-- 배송지추가 팝업창 Header -->
                            <div class="modal-header">
                            <h4 class="modal-title"><b>배송지 추가</b></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <form action="<%= contextPath %>/insertAddr.me" method="post" class="form-group">
                                <!-- 배송지추가 팝업창 body -->
                                <div class="modal-body">

                                    <div class="d-flex form-field">
                                        <label for="addressName" class="mr-sm-2">* 배송지명</label>
                                        <input type="text" class="form-control" id="addressName" placeholder="내용을 입력해주세요" required name="addressLocal">
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="recipient-name" class="mr-sm-2">* 이름</label>
                                        <input type="text" class="form-control" id="recipient-name" required name="addressName">
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="phone" class="mr-sm-2">* 연락처</label>
                                        <input type="tel" class="form-control" id="phone" required name="addressPhone">
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="address" class="mr-sm-2">* 주소</label>
                                        <input type="text" class="form-control" id="address" placeholder="우편번호 찾기" required name="addressAddress">
                                    </div>

                                    <div class="d-flex form-field mt-2">
                                        <input type="text" class="form-control" id="addressDetail" required name="addressDetail">
                                    </div>

                                    <div class="form-check">
                                        <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" value="Y" name="addressType">기본 배송지로 선택</label>
                                    </div>

                                </div>
                                
                                <!-- 배송지추가 팝업창 footer -->
                                <div class="modal-footer">
                                    <div class="d-flex">
                                        <button type="reset" class="btn btn-secondary me-3 px-4" data-dismiss="modal">취소</button>
                                        <!-- 기능 : 추가버튼 클릭시, 배송지 관리 페이지 새로고침 -->
                                        <button type="submit" class="btn btn-danger px-4" id="insert">추가</button>
                                    </div>
                                </div>
                                
                            </form>
                            
                        </div>
                        </div>
                    </div>
                    <!-- 배송지추가 팝업창 end -->
                    
                    <script>
                    	$(function(){
                    		$("#insert").click(function(){
                    			console.log("추가버튼 클릭됨");
                    		})
                    	})
                    </script>

                    </div>

                    </div>
                    <!-- 배송지 테이블 영역 end -->

                </div>   
                <!-- 배송관리 페이지 영역 end -->
            </div>

        </section>
        <!-- Section end -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
	     
	 </div>
</body>
</html>