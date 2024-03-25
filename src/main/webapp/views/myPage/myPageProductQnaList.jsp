<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의</title>

<!-- 마이페이지(상품문의목록페이지) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageProductQnaList.css" rel="stylesheet">

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


                <!-- 1 : 1문의 페이지 영역 start -->
                <div class="main-page pt-3" style="width:85%;">

                    <!-- 페이지 제목 영역 start -->
                    <div class="page-title">
                        <svg id="main" style="pointer-events: visible; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>상품문의</b></h3>
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

                    <div class="jumbotron" style="padding: 20px 0px; width: 90%">   
                        <p>
                            특정 상품에 대한 개별 문의입니다. <br>
                            상품상세페이지로 이동하오니 해당 페이지에서 문의 내용을 확인해주세요.
                        </p>
                    </div>

                    <!-- 필터링 드롭다운 영역 start -->
                    <select id="filter" style="width:120px; margin: 20px 0 40px 900px;" onchange="selectQnaList(1);">
                    	<option value="all">전체</option>
                    	<option value="on">진행중</option>
                    	<option value="off">답변완료</option>
                    </select>
                    <!-- 필터링 드롭다운 영역 end -->
                    
                    <script>
                    	/* 상품문의 목록조회 Ajax 통신요청을 해야할 경우
                    	 * 
                    	 * case 01) 해당페이지 로드즉시 (마이페이지 사이드네비바에서 문의목록조회요청)
                    	 *          * "전체" 상품문의 목록조회 Ajax 통신요청 ==> selectQnaList(1);
                    	 *            매개변수 type = 1 (정적)
                    	 *            매개변수 page = 1 (전체 문의목록 1페이지)
                    	 *            매개변수 status = "all" 
                    	 *
                    	 * case 02) 필터링옵션(slect태그)값 변경이벤트 발생시
                    	 *          * "답변상태별(진행중 | 답변완료)" 문의목록조회 Ajax 통신요청 ==> selectQnaList(1);
                    	 *            매개변수 type = 1 (정적)
                    	 *            매개변수 page = 1 (해당 필터링된 목록중 1페이지)
                    	 *            매개변수 status = 선택한옵션값 (동적)
                    	 *
                    	 * case 03) 페이징바 클릭이벤트 발생시
                    	 *          * "답변상태가" 필터링값이면서 && 페이지가 "요청한페이지"인 문의목록 Ajax 통신요청 ==> selectQnaList(사용자가 요청한 페이지번호);
                    	 *            매개변수 type = 1 (정적)
                    	 *            매개변수 page = 선택한페이지값 (동적)
                    	 *            매개변수 status = 선택된옵션값 (동적)
                    	 * 
                    	*/
                    	
                    	
                    	$(function(){
                    		// case 01) 페이지로드 즉시 목록조회 Ajax통신 요청 함수실행
                    		selectQnaList(1);
                    	})
                    	
                    	// 문의목록 조회요청 Ajax 통신요청시 실행될 함수
                    	function selectQnaList(requestPage){
                    		
                    		$.ajax({
                        		url:"<%= contextPath %>/qna.me",
                        		data:{
                        			"type" : 1, 					// 문의유형 == 상품문의
                        			"page" : requestPage,			// 사용자가 요청한 페이지번호
                        			"status" : $("#filter").val()	// 답변상태 (전체 | 진행중 |답변완료)
                        		},success:function(result){

                        			// 상품문의 리스트테이블 및 페이징바 생성
                        			const qnaList = result[0];		// 조회된 상품문의 리스트
                        			const pageInfo = result[1];		// 조회된 상품문의 리스트에 대한 페이징바
                        			
                        			let list = "";					// 테이블 생성 HTML구문을 담을변수
                        			let paging = "";				// 페이징 생성 HTML구문을 담을변수
                        			
                        			/* 조회된 문의내역 존재여부
                        			 *
                        			 * case 01) qnaList.length == 0 : 조회된 문의내역이 없을경우
                        			 * case 02) qnaList.length != 0 : 조회된 문의내역이 있을경우
                        			 *
                        			*/
                        			if(qnaList.length == 0){
                        				// case 01-1) 조회된 문의내역이 없을경우 생성될 테이블 HTML
                        				list += "<tr>";
                        				list += 	"<td colspan='4'>" + "조회된 문의내역이 없습니다." + "</td>";
                        				list += "</tr>"
                        				
                        				// case 01-2) 조회된 문의내역이 없을경우 생성될 페이징 HTML (없음)
                        				
                        			}else{
                        				
                        				// case 02-1) 조회된 문의내역이 있을경우 생성될 테이블 HTML
                        				let status = "";
                            			for(let q=0 ; q<qnaList.length ; q++){
                            				
                            				status = qnaList[q].answerStatus == "미처리" ? "진행중" : "답변완료";
                            				
                            				list += "<tr>";
                            				list += 	"<input type='hidden' value='" + qnaList[q].productNo + "'>"
                            				list += 	"<td>" + qnaList[q].productName + "</td>";
                            				list += 	"<td>" + qnaList[q].answerDate + "</td>";
                            				list += 	"<td>" + qnaList[q].answerTitle + "</td>";
                            				list += 	"<td>" + status + "</td>";
                            				list += "</tr>";

                            			}
                        				
                        				// case 02-2) 조회된 문의내역이 없을경우 생성될 페이징 HTML
                        				// 이전페이지 이동버튼
                        				if(pageInfo.currentPage == 1 || pi.getMaxPage() == 0){
                        					paging += "<li class='page-item disabled' style='cursor:pointer;'><a class='page-link'>Previous</a></li>";
                        				}else{
                        					paging += "<li class='page-item' style='cursor:pointer;' onclick='selectQnaList(" + (pageInfo.currentPage - 1) + ");'><a class='page-link'>Previous</a></li>";
                        				}
                        				
                        				// 지정페이지 이동버튼
                        				for(let p=pageInfo.startPage ; p<= pageInfo.endPage ; p++){
                        					if(pageInfo.currentPage == p){
                        						paging += "<li class='page-item active' style='cursor:pointer;'><a class='page-link'>" + p + "</a></li>";
                        					}else{
                        						paging += "<li class='page-item' style='cursor:pointer;' onclick='selectQnaList(" + p + ")'><a class='page-link'>" + p + "</a></li>";
                        					}
                        				}
                        				
                        				// 다음페이지 이동버튼
                        				if(pageInfo.currentPage == pageInfo.maxPage || pi.getMaxPage() == 0){
                        					paging += "<li class='page-item disabled' style='cursor:pointer;'><a class='page-link'>Next</a.</li>";	
                        				}else{
                        					paging += "<li class='page-item' style='cursor:pointer;' onclick='seletQnaList(" + (pageInfo.currentPage + 1) + ");'><a class='page-link'>Next</a.</li>";
                        				}
                        				
                        			}
                        			 
                        			// 문의목록 테이블생성
                    				$(".qna-list>.table>tbody").html(list);
                    				
                    				// 페이징바 생성
                    				$(".pagination").html(paging);
                    				
                        		 }
                        	})
                    	}
                    </script>

                     <!-- 1:1 문의목록 테이블 영역 start -->
                     <div class="qna-list">
                        <table class="table">
                            <thead>
                                <tr>
                                  <th>제품명</th>
                                  <th>작성일</th>
                                  <th>제목</th>
                                  <th>진행상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<!-- 동적으로 생성될 문의목록테이블 영역 -->
                            </tbody>
                        </table>
                        <!-- 1:1 문의목록 테이블 영역 end -->

	                    <script>
	                        $(function(){
	                            // 문의제목 클릭시, 해당문의 상세페이지로 이동하는 함수
	                            $(".qna-list>.table").on("click", "tr", function(){
	                                
	                            	location.href="<%= contextPath %>/detail.pr?no=" + $(this).children(":hidden").val(); 
	                            
	                            })
	                        })
	                    </script>

                        
                       
                        
                     
                    </div>
                    <!-- 1:1문의 테이블 영역 end -->

					 <!-- 기능 : 10개 단위 페이징처리 -->
                     <div class="center" style="margin-top:100px;">
                         <ul class="pagination">
                      		<!-- 동적으로 생성될 페이징바 영역 -->   
                         </ul>
                     </div>
                        
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