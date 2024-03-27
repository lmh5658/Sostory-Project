<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문조회</title>

<!-- 마이페이지(주문조회페이지) css 파일 링크연결 -->
<link href="<%= request.getContextPath() %>/resources/css/myPage/myPageOrderList.css" rel="stylesheet">

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

                <!-- 찜목록 영역 start -->
                <div class="main-page">

                    <!-- 페이지 제목 영역 start -->
                    <div class="page-title">
                        <svg id="main" style="pointer-events: visible; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <h3><b>주문조회</b></h3>
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

                    <!-- 컨텐츠 영역 start -->
                    <div class="period">
                        <button class="btn btn-outline-secondary btn-sm me-3" id="all">전체</button>
                        <button class="btn btn-outline-secondary btn-sm me-3" id="week">1주일</button>
                        <button class="btn btn-outline-secondary btn-sm me-3" id="month3">3개월</button>               
                        <label style="margin-left: 20px; margin-top:5px; padding-top: 5px;">
                        	<input class="" type="date" id="from">&nbsp;~
	                        <input type="date" name="to" id="to">
	                        <button type="button" id="select" class="btn btn-secondary btn-sm ms-3" style="width:80px; margin-bottom:8px;">조회</button>
                        </label>
                    </div>
                    
                    <script>
                    	const offset = new Date().getTimezoneOffset() * 60000;	// 시차
                    	
                    	$(function(){
                    		/* 전체 | 1주일 | 3개월 버튼 클릭시 실행될 함수
	                       	 *
	                       	 * case "전체" 
	                       	 *      (1) input type=date 폼영역 날짜변환
	                       	 *          영역 1) 오늘날짜 - 5년
	                       	 *          영역 2) 오늘날짜
	                       	 *      (2) 전체주문내역조회 Ajax통신용 함수호출 selectList(from, 오늘)
	                       	 *
	                       	 * case "1주일"
	                       	 *      (1) input type=date 폼영역 날짜변환
	                       	 *          영역 1) 오늘날짜 - 7
	                       	 *          영역 2) 오늘날짜
	                       	 *      (2) 1주일사이주문내역 조회 Ajax통신용 함수호출 selectList((오늘 - 7), 오늘)
	                       	 * 
	                       	 * case "3개월"
	                       	 *      (1) input type=date 폼영역 날짜변화
	                       	 *          영역 1) 오늘날짜 - 3개월
	                       	 *          영역 2) 오늘날짜
	                       	 *      (2) 3개월사이주문내역 조회 Ajax통신용 함수호출 selectLsit((오늘 -3개월), 오늘)
	                       	 *
	                       	 * case "사용자지정"
	                       	 *      (1) input type=date 폼영역의 값들을 가져오기
	                       	 *          영역 1) 시작날짜
	                       	 *          영역 2)  끝날짜
	                       	 *      (2) 해당기간사이주문내역 조회 Ajax통신용 함수호출 selectList(시작, 끝)
	                       	 * 
	                       	*/
	                       	
	                       	// 페이지로드 즉시 함수호출시 전달할 시작날짜 매개변수
	                       	let defaultTo = new Date(Date.now() - offset).toISOString().slice(0, 10);	
	                       	
	                       	// 페이지로드 즉시 함수호출시 전달할 끝날짜 매개변수
	                       	let fromDate = new Date(new Date(Date.now() - offset));
	                       	fromDate.setFullYear(fromDate.getFullYear() -5);
	                       	let defaultFrom = fromDate.toISOString().substring(0,10)
	                       	
	                       	// 페이지로드 즉시 전체주문 목록조회 요청함수 호출
	                       	selectList(defaultFrom, defaultTo, 1);
	                       	
	                       	// case "전체" 주문내역 조회요청 (default)
	                       	$("#all").click(function(){
	                       		// (1) input type=date 폼영역 날짜변환
	                       		let from = new Date(new Date(Date.now() - offset));		// 조회시작 날짜변수값
	                       		from.setFullYear(from.getFullYear() - 5);
	                           	$("#from").val(from.toISOString().substring(0,10));
	                           	$("#to").val(new Date(Date.now() - offset).toISOString().slice(0, 10));
	                           	
	                       		// (2) 전체주문내역 조회요청
	                           	selectList($("#from").val(), $("#to").val(), 1);
	                       	})
	                       	
	                       	// case "1주일" 주문내역 조회요청
	                       	$("#week").click(function(){
	                       		// (1) input type=date 폼영역 날짜변환
	                       		let from = new Date(new Date(Date.now() - offset));		// 조회시작 날짜변수값
	                       		from.setDate(from.getDate() - 7);
	                           	$("#from").val(from.toISOString().substring(0,10));
	                           	$("#to").val(new Date(Date.now() - offset).toISOString().slice(0, 10));
	                           	
	                           	// (2) 1주일기간주문내역 조회요청
	                           	selectList($("#from").val(), $("#to").val(), 1);
	                           	
	                       	})
	                       	
	                       	// case "3개월" 주문내역 조회요청
	                       	$("#month3").click(function(){
	                       		// (1) input type=date 폼영역 날짜변환
	                       		let from = new Date(new Date(Date.now() - offset));		// 조회시작 날짜변수값
	                       		from.setMonth(from.getMonth() - 3);
	                           	$("#from").val(from.toISOString().substring(0,10));
	                           	$("#to").val(new Date(Date.now() - offset).toISOString().slice(0, 10));
	                           	
	                           	// (2) "3개월" 주문내역 조회요청
	                       		selectList($("#from").val(), $("#to").val(), 1);
	                       	})
	                       	
	                       	// case "사용자지정기간" 주문내역 조회요청 
	                       	$("#select").click(function(){
	                       		// (1) 해당기간 주문내역 조회요청
	                       		selectList($("#from").val(), $("#to").val(), 1);
	                       	})
	                       	
                    	})
                    	
                    	// 주문목록조회 요청용 Ajax통신용 함수
                       	function selectList(from, to, requestPage){ // 조회시작날짜, 조회끝날짜
                       		$.ajax({
   	                   			 url:"<%= contextPath %>/order.me",
   	                   			 method:"post",
   	                   			 data:{
   	                   				 "from" : from,
   	                   				 "to" : to,
   	                   				 "page" : requestPage
   	                   			 	},success : function(result){
   	                   			 		console.log(result);
   	                   			 		const orderList = result[0];
   	                   			 		const pageInfo = result[1];
   	                   			 		
   	                   			 		let list = "";		// 주문목록 테이블 생성 HTML구문을 담을변수
   	                   			 		let paging = "";	// 페이징바 생성 HTML구문을 담을변수
   	                   			 		
   	                   			 		if(orderList.length == 0){// 조회된 주문내역이 없을경우
   	                   			 			list += "<tr>";
   	                   			 			list += 	"<td colspan='5'>조회된 주문내역이 없습니다.</td>";
   	                   			 			list += "</tr>";
   	                   			 		}else{ // 조회된 주문내역이 있을경우
   	                   			 			for(let o=0 ; o<orderList.length ; o++){
	   	                   			 			list += "<tr>";
	   	                   			 			list += 	"<td>" + orderList[o].orderNo + "</td>";
	   	                   			 			if((orderList[o].totalOrder - 1) != 0) {
	   	                   			 				list += "<td class='order_content' onclick='detail(" + orderList[o].orderNo + ");'>" 
	   	                   			 						+ orderList[o].titleProductName + " " + "외 " + (orderList[o].totalOrder - 1)  + "건" + "</td>";
	   	                   			 			}else{
	   	                   			 				list += "<td class='order_content' onclick='detail(" + orderList[o].orderNo + ");'>" 
              			 									+ orderList[o].titleProductName + "</td>";
	   	                   			 			}
	   	                   			 			list +=		"<td>" + orderList[o].orderDate + "</td>";
	   	                   			 			list += 	"<td>" + orderList[o].orderStatus + "</td>";
	   	                   			 			
	   	                   			 			if(orderList[o].orderStatus == 3 || orderList[o].orderStatus == 4){
	   	                   			 				list += "<td class='text-danger'><b>불가</b></td>";
	   	                   			 			}else{
	   	                   			 				list += "<td><button type='button' class='btn btn-secondary' onclick='cancle("+ orderList[o].orderNo + ")';" + ">주문취소</button></td>";
	   	                   			 			}
	   	                   			 			
	   	                   			 			list += "</tr>";
   	                   			 			}
   	                   			 		
   	                   			 			/* 페이징바로 페이지 이동요청시 input type=date value값별 전달될 매개변수
   	                        				 *
   	                        				 * case 01) value값이 없을경우 (특정날짜를 지정하지 않음 or 페이지첫로딩)
                       						 * case 02) value값이 있을경우 (특정기간을 선택함)
   	                        				*/
   	                        				
   	                        				// case01) input type=date value값이 없을경우 전달될 매개변수(조회시작날짜, 조회마지막날짜)
   	                        				let defaultTo = new Date(Date.now() - offset).toISOString().slice(0, 10);	

					                       	let fromDate = new Date(new Date(Date.now() - offset));
					                       	fromDate.setFullYear(fromDate.getFullYear() -5);
					                       	let defaultFrom = fromDate.toISOString().substring(0,10);
   	                   			 			
   	                        				// 이전페이지 이동버튼
					   	                    if(pageInfo.currentPage == 1 || pageInfo.getMaxPage == 0){
   	                        					paging += "<li class='page-item disabled' style='cursor:pointer;'><a class='page-link'>Previous</a></li>";
   	                        				}else{
						                       	if($("#from").val() == "" && $("#to").val() == ""){ // input type=date value값이 없을경우
						                       		paging += "<li class='page-item' style='cursor:pointer;' onclick='selectList("
                   										+ '"' + defaultFrom + '"' + ', ' + '"' + defaultTo + '"' + ', '  + (pageInfo.currentPage - 1) 
                   									+ ");'" + "><a class='page-link'>Previous</a></li>";
						                       	}else{ // input type=date value값이 있을경우
						                       		paging += "<li class='page-item' style='cursor:pointer;' onclick='selectList("
                   										+ '"' + defaultFrom + '"' + ', ' + '"' + defaultTo + '"' + ', '  + (pageInfo.currentPage - 1) 
                   									+ ");'" + "><a class='page-link'>Previous</a></li>";
						                       	}
   	                        				}
   	                        				
   	                        				// 지정페이지 이동버튼
   	                        				for(let p=pageInfo.startPage ; p<= pageInfo.endPage ; p++){
   	                        					if(pageInfo.currentPage == p){
   	                        						paging += "<li class='page-item active' style='cursor:pointer;'><a class='page-link'>" + p + "</a></li>";
   	                        					}else{
   	                        						if($("#from").val() == "" && $("#to").val() == ""){ // input type=date value값이 없을경우
   	                        							paging += "<li class='page-item' style='cursor:pointer;' onclick='selectList("
                       										+ '"' + defaultFrom + '"' + ', ' + '"' + defaultTo + '"' + ', '  + p
                       									+ ");'" + "><a class='page-link'>" + p + "</a></li>";
							                       	}else{ // input type=date value값이 있을경우
							                       		paging += "<li class='page-item' style='cursor:pointer;' onclick='selectList("
                       										+ '"' + defaultFrom + '"' + ', ' + '"' + defaultTo + '"' + ', '  + p 
                       									+ ");'" + "><a class='page-link'>" + p + "</a></li>";
							                       	}
   	                        						
   	                        					}
   	                        				}
   	                        				
   	                        				// 다음페이지 이동버튼
   	                        				if(pageInfo.currentPage == pageInfo.maxPage || pageInfo.getMaxPage == 0){
   	                        					paging += "<li class='page-item disabled' style='cursor:pointer;'><a class='page-link'>Next</a.</li>";	
   	                        				}else{
   	                        					
   	                        					if($("#from").val() == "" && $("#to").val() == ""){ // input type=date value값이 없을경우
   	                        						paging += "<li class='page-item' style='cursor:pointer;' onclick='selectList("
   	                        										+ '"' + defaultFrom + '"' + ', ' + '"' + defaultTo + '"' + ', '  + (pageInfo.currentPage + 1) 
   	                        									+ ");'" + "><a class='page-link'>Next</a></li>";
						                       	}else{ // input type=date value값이 있을경우
						                       		paging += "<li class='page-item' style='cursor:pointer;' onclick='selectList("
                   										+ '"' + $("#from").val() + '"' + ', ' + '"' + $("#to").val() + '"' + ', '  + (pageInfo.currentPage + 1) 
                   									+ ");'" + "><a class='page-link'>Next</a></li>";
						                       	}
   	                        					
   	                        				}

   	                   			 		}
   	                   			 		
   	                   			 		// 주문목록 리스트생성
   	                   			 		$(".table>tbody").html(list);
   	                   			 		
   	                   			 		// 페이징바 생성
   	                   			 		$(".pagination").html(paging);
   	                   			 		
   	                   			 	} // success end
                      		 	})
                      		 
                       	}
                    	
                    	// 주문취소 요청시 실행될 함수
                    	function cancle(orderNo){
                    		
                    		if(confirm("주문을 취소하시겠습니까?")){
                    			$.ajax({
                        			url:"<%= contextPath %>/deleteOrder.me",
                        			data:{"recipeNo" : orderNo},
                        			success:function(result){
                        				if(result > 0){
                        					alert("주문이 취소되었습니다.");
                        					location.reload();
                        				}else{
                        					alert("주문취소가 정상적으로 처리되지 않았습니다. 유효한 주문인지 다시확인해주세요.");
                        				}	
                        			}
                        		})	
                    		}
                    		
                    	}
                    	
                    	// 주문내용 클릭시, 해당주문상세페이지 이동요청시 실행될 함수
                    	function detail(orderNo){
                    		location.href="<%= contextPath %>/detailOrder.me?oNo=" + orderNo;
                    	}
                    </script>
                    
                    <table class="table order_list">
                       <thead>
                       	 	<!-- 주문조회 테이블 header -->
	                        <tr style="align:center;">
	                            <th width="150px">주문번호</th>
	                            <th width="400px">주문내용</th>
	                            <th width="150px">주문일시</th>
	                            <th width="150px">상태</th>
	                            <th>주문취소</th>
	                        </tr>
                       </thead>

                       <tbody>
                        	<!-- 조회된 주문목록 리스트가 생성될 영역 -->
                        </tbody>
                    </table>
                    <!-- 컨텐츠 영역 end -->
                    
                    <div style="display: flex; justify-content: center; margin-top: 100px;">
                        <ul class="pagination">
                            <!-- 해당 목록에대한 페이징바 생성영역 -->
                        </ul>
                    </div>
                </div>

	        </div>

            
        </section>
        <!-- Section end -->
        
<!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>