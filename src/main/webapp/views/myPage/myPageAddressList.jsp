<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.sos.myPage.model.vo.Address" %>
    
<%
	// 배송지번호, 배송지명, 이름, 주소(우편주소+상세주소), 연락처, 배송지유형(Y(기본배송지) | N(기타배송지))
	List<Address> list = (List<Address>)request.getAttribute("addressList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 관리</title>

<!-- 마이페이지(배송지관리) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageAddressList.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
						   
						   if(userPwd != null && "<%= loginUser.getUserPwd() %>" != userPwd){
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
						   
						   if(userPwd != null && "<%= loginUser.getUserPwd() %>" != userPwd){
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
                        <svg id="main" style="pointer-events: visible; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>배송지 관리</b><b style="font-size: 16px; margin-left: 20px;">* 배송지는 최대 10개까지 등록 가능합니다.</b></h3>
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
                            <% if(list.isEmpty()) { %>
                            	<tr>
                            		<td colspan="5">등록된 배송지가 없습니다. 배송지를 등록해주세요.</td>
                            	</tr>
                            <% } else {%> <!-- 조회된 배송지가 있을경우 -->
	                            <% for(Address addr : list) { %>
	                                <tr>
	                                    <td><%= addr.getAddressLocal() %></td>
	                                    <td><%= addr.getAddressName() %></td>
	                                    <td class="address-size-limit">
	                                    	<label class="text-primary"><%= addr.getAddressType().equals("Y") ? "[기본배송지]" : "" %></label>
	                                   		<%= addr.getAddress() %>
	                                    </td>
	                                    <td><%= addr.getAddressPhone() %></td>
	                                    <td>
	                                        <button class="btn text-primary" data-toggle="modal" data-target="#updateAddr" onclick="selectAddress(<%= addr.getAddressNo() %>);">수정</button> 
	                                        | 
	                                        <a href="<%= contextPath %>/deleteAddr.me?addressNo=<%= addr.getAddressNo() %>" class="btn text-danger">삭제</a>
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
                            
                            <form action="<%= contextPath %>/updateAddr.me" method="post" class="form-group">
                                <!-- 배송지수정 팝업창 body -->
                                <div class="modal-body">
									
									<input type="hidden" id="addressNo" name="addressNo">
									
                                    <div class="d-flex form-field">
                                        <label for="addressName" class="mr-sm-2">* 배송지명</label>
                                        <input type="text" class="form-control" id="addressName" name="addressLocal">
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="recipient-name" class="mr-sm-2">* 이름</label>
                                        <input type="text" class="form-control" id="recipient-name" name="addressName">
                                    </div>

                                    <div class="d-flex form-field">
                                        <label for="phone" class="mr-sm-2">* 연락처</label>
                                        <input type="tel" class="form-control" id="phone" name="addressPhone">
                                    </div>

                                    <div class="d-flex form-field">
                                        
                                        <label for="address" class="mr-sm-2">* 주소</label>
                                        <input type="text" class="form-control" id="addressModify" name="addressAddress">
                                    </div>

                                    <div class="d-flex form-field mt-2 justify-content-end">
                                        <input type="text" class="form-control" id="addressDetailModify" name="addressDetail" style="width: 603px;">
                                    </div>
                                    <div class="d-flex form-field mt-2 justify-content-end">
                                        <button type="button" class="btn btn-secondary" onclick="findAddress()">주소검색</button>
                                    </div>

                                    <div class="form-check">
                                        <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" value="Y" name="addressType">기본 배송지로 선택</label>
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
                    
                    <script>
						
                   		// 기존배송지 정보수정 요청시 해당배송지 정보조회용 ajax 통신
                   		function selectAddress(addressNo){

                   			$.ajax({
                   				url:"<%= contextPath %>/addrDetail.me",
                   				method:"post",
                   				data:{addressNo:addressNo},
                   				success:function(addr){
                   					
                   					const $updateAddr = $("#updateAddr");

                   					$updateAddr.find("#addressNo").val(addr.addressNo);
                   					$updateAddr.find("#addressName").val(addr.addressLocal);
                   					$updateAddr.find("#recipient-name").val(addr.addressName);
                   					$updateAddr.find("#phone").val(addr.addressPhone);
                   					$updateAddr.find("#address").val(addr.addressAddress);
                   					$updateAddr.find("#addressDetail").val(addr.addressDetail);
                   					
                   					if(addr.addressType == 'Y'){
                   						$updateAddr.find(":checkbox").attr("checked", true);
                   					}else if(addr.addressType == 'N'){
                   						$updateAddr.find(":checkbox").attr("checked", false);
                   					}
                   					
                   				},error:function(){
                   					alert("배송지 정보조회에 실패했습니다. 다시 시도해주세요.");
                   				}
                   				
                   			})
                   			
                   		}
                    		
                    </script>

	
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
                                        <input type="text" class="form-control" id="addressAdd" placeholder="우편번호 찾기" required name="addressAddress">
                                       
                                    </div>

                                    <div class="d-flex form-field mt-2 justify-content-end">
                                        <input type="text" class="form-control" id="addressDetailAdd" required name="addressDetail" style="width: 603px;">
                                    </div>
                                    <div class="d-flex form-field mt-2 justify-content-end">
                                         <button type="button" class="btn btn-secondary" onclick="findAddress()">주소검색</button>
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
                    
                    <script>
                    // 우편번호찾기 API관련 스크립트
                    function findAddress() {
    			        new daum.Postcode({
    			            oncomplete: function(data) {
    			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    			
    			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
    			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    			                var addr = ''; // 주소 변수
    			                var extraAddr = ''; // 참고항목 변수
    			
    			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
    			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
    			                    addr = data.roadAddress;
    			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
    			                
    			                	addr = data.jibunAddress;
    			                	
    			                }
    			
    			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
    			                if(data.userSelectedType === 'R'){
    			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
    			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
    			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
    			                        extraAddr += data.bname;
    			                    }
    			                    // 건물명이 있고, 공동주택일 경우 추가한다.
    			                    if(data.buildingName !== '' && data.apartment === 'Y'){
    			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
    			                    }
    			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
    			                    if(extraAddr !== ''){
    			                        extraAddr = ' (' + extraAddr + ')';
    			                    }
    			                    // 조합된 참고항목을 해당 필드에 넣는다.
    			                
    			                } 
    			
    			                // 우편번호와 주소 정보를 해당 필드에 넣는다. 
    			                // 주소를 넣어줄 input id값설정. ==> 밑에 코드경우 addressName
    			                document.getElementById("addressModify").value = addr;
    			                document.getElementById("addressAdd").value = addr;
    			                // 커서를 상세주소 필드로 이동한다. 상세주소는 입력받아야함
    			                // 상세주소 input id값설정. ==> 밑에 코드경우 addressDetail
    			                document.getElementById("addressDetailModify").focus();
    			                document.getElementById("addressDetailAdd").focus();
    			            }
    			        }).open();
        			}
                    
                    
                    
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