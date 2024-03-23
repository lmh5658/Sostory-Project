<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1 : 1 문의</title>

<!-- 마이페이지(1:1문의페이지) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageEtcQnaList.css" rel="stylesheet">

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
                    <select id="filter" style="width:120px; margin: 20px 0 40px 900px;" onchange="selectQnaList(1);">
                    	<option value="all">전체</option>
                    	<option value="on">진행중</option>
                    	<option value="off">답변완료</option>
                    </select>
                    <!-- 필터링 드롭다운 영역 end -->
                    
                    <script>
                    	/* 1:1문의 목록조회 Ajax 통신요청을 해야할 경우
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
                    		console.log("실행")
                    		$.ajax({
                        		url:"<%= contextPath %>/qna.me",
                        		data:{
                        			"type" : 2, 					// 문의유형 == 상품문의
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
                        				console.log("리스트 없음");
                        				// case 01-1) 조회된 문의내역이 없을경우 생성될 테이블 HTML
                        				list += "<tr>";
                        				list += 	"<td colspan='5'>" + "조회된 문의내역이 없습니다." + "</td>";
                        				list += "</tr>"
                        			
                        				// case 01-2) 조회된 문의내역이 없을경우 생성될 페이징 HTML (없음)
                        				
                        			}else{
                        				console.log("리스트 있음");
                        				console.log(qnaList.length);
                        				// case 02-1) 조회된 문의내역이 있을경우 생성될 테이블 HTML
                        				let status = "";
                            			for(let q=0 ; q<qnaList.length ; q++){
                            				
                            				status = qnaList[q].answerStatus == "미처리" ? "진행중" : "답변완료";
                            				
                            				list += "<tr>";
                            				list += 	"<td>" + qnaList[q].answerNo + "</td>";
                            				list += 	"<td>" + qnaList[q].answerDate + "</td>";
                            				list += 	"<td class='title'>" + qnaList[q].answerTitle + "</td>";
                            				list += 	"<td>" + status + "</td>";
                            				list += 	"<td><button type='button' class='btn text-danger' onclick='deleteQna(" + qnaList[q].answerNo + ");'>삭제</button></td>";
                            				list += "</tr>";

                            			}
                        				
                        				// case 02-2) 조회된 문의내역이 없을경우 생성될 페이징 HTML
                        				// 이전페이지 이동버튼
                        				if(pageInfo.currentPage == 1){
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
                        				if(pageInfo.currentPage == pageInfo.maxPage){
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
                                    <th>문의번호</th>
                                    <th>작성일</th>
                                    <th>제목</th>
                                    <th>진행상태</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<!-- 조회된 문의목록이 출력될 테이블영역 -->
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
	                            $(".qna-list>.table>tbody").on("click", "td.title", function(){
									const qNo = $(this).prevAll().eq(1).text();
									location.href = "<%= contextPath %>/detailQna.me?qNo=" + qNo;
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

                    </div>
                    <!-- 1:1문의 테이블 영역 end -->
                    
					<!-- 기능 : 10개 단위 페이징처리 -->
                    <div class="center">
                        <ul class="pagination">
                        <!-- 조회된 문의목록에 대한 페이징바가 출력될 영역 -->
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