<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.product.model.vo.* , java.util.List, com.sos.common.model.vo.PageInfo" %>
    
<%
	List<ProductQnaReply> list = (List<ProductQnaReply>)request.getAttribute("list");
	//문의번호, 상품번호, 사용자 아이디, 문의날짜, 문의제목, 처리&미처리
	int listCount = (int)request.getAttribute("listCount");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<style>
/*문의관리>1대1문의 스타일*/
         .section_right{
            width: 100%;
            margin: 30px;
         }
         .section_right label{
            font-weight: bolder;
            font-size: 17px;
            
         }
         .section_right>div{
            display: flex;
            
         }
         .pro_search{
            display: flex;
            margin-left: 10px;
            margin-top: 15px;
         }

         .pro_search button{
            width: 80px;
            background-color: #c20000; /* 배경색 설정 */
            color: #ffffff; /* 텍스트 색상 설정 */
            border: none; /* 테두리 제거 */
            font-weight: bold;
            height: 100%;
         }

        table{
            margin-top: 20px;
            width: 80%;
            text-align: center;
            border: 1px solid #dddddd;
         }
         td:hover{
            cursor: pointer;
         }
         
         .table_title th{
            background-color: #dddddd;;
            font-weight: bold; /* 헤더 글씨체를 굵게 설정 */
            padding: 8px; /* 셀 안의 여백 설정 */
         }

         .pro_name{
            display: flex;
            align-items: center; 
            justify-content: center;  
            background-color: #dddddd; 
            width: 100px; 
            font-weight: bold;
            border-bottom-left-radius: 10px;
            border-top-left-radius: 10px;
            border: 1px solid rgb(148, 146, 146);
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 모서리를 둥글게 만듦 */
         }

         .select_div{
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            align-items: center;
            
         }
         .select_div select{
            width: 100px;
         }
         .select_delete{
            margin-right: 50px;
            height: 40px;
            width: 100px;
            background-color: #c20000; /* 배경색 설정 */
            color: #ffffff; /* 텍스트 색상 설정 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 모서리를 둥글게 만듦 */
            font-weight: bold;
         }
         .pagination{
            display: flex; justify-content: center; margin-top: 10px;
         }
         .table_d{display: flex; flex-direction: column;}
         .section_title b{font-size: 20px;}
</style>
</head>
<body>
<div class="wrap">

        <%@ include file="/views/common/header.jsp" %>
        
        <% if(loginUser == null){ // alert 시킬 알람문구가 존재할 경우 %>
		  <script>
		     alert('로그인을 먼저 진행해주세요'); // 문자열 취급시 따옴표로 감싸야됨
		     location.href="<%=contextPath%>"
		  </script>
		<% } %>

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
        
        <!-- Section start -->
        <section class="main-content">
            <div class="section_1">
                <%@ include file="/views/common/managerMenu.jsp" %>
        <!-- 사이드메뉴바 클릭시 바뀌는 화면-->
        <div class="section_right">
            <div class="section_title" style="border-bottom: 2px solid gray">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-house-gear-fill" viewBox="0 0 16 16">
                    <path d="M7.293 1.5a1 1 0 0 1 1.414 0L11 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l2.354 2.353a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708z"/>
                    <path d="M11.07 9.047a1.5 1.5 0 0 0-1.742.26l-.02.021a1.5 1.5 0 0 0-.261 1.742 1.5 1.5 0 0 0 0 2.86 1.5 1.5 0 0 0-.12 1.07H3.5A1.5 1.5 0 0 1 2 13.5V9.293l6-6 4.724 4.724a1.5 1.5 0 0 0-1.654 1.03"/>
                    <path d="m13.158 9.608-.043-.148c-.181-.613-1.049-.613-1.23 0l-.043.148a.64.64 0 0 1-.921.382l-.136-.074c-.561-.306-1.175.308-.87.869l.075.136a.64.64 0 0 1-.382.92l-.148.045c-.613.18-.613 1.048 0 1.229l.148.043a.64.64 0 0 1 .382.921l-.074.136c-.306.561.308 1.175.869.87l.136-.075a.64.64 0 0 1 .92.382l.045.149c.18.612 1.048.612 1.229 0l.043-.15a.64.64 0 0 1 .921-.38l.136.074c.561.305 1.175-.309.87-.87l-.075-.136a.64.64 0 0 1 .382-.92l.149-.044c.612-.181.612-1.049 0-1.23l-.15-.043a.64.64 0 0 1-.38-.921l.074-.136c.305-.561-.309-1.175-.87-.87l-.136.075a.64.64 0 0 1-.92-.382ZM12.5 14a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
                </svg>문의관리><b>1대1문의</b>
            </div>
            <div class="pro_search">
                <div class="pro_name">회원ID</div>
                <div><input type="text" class="form-control" name="memId" id="memId"></div>
                <div><button class="searchBtn" onclick="member(1);">조회</button></div>
            </div>
            <div class="select_div">
                <div>
                    
                </div>
                <div class="option_2">
                    <button id="select_btn" class="select_delete" onclick="return alert('정말로 삭제하시겠습니까?');">선택삭제</button>
                    <select name="select" id="selecte" onchange="statusData(1);">
                        <option value="all">전체</option>
                        <option value="processed">처리</option>
                        <option value="unprocessed">미처리</option>
                    </select>
                </div>
            </div>
            
            <script>
            	
	            function member(page){
	        		
	            		$.ajax({
	            			url:"<%=contextPath%>/msearch.ma",
	            			data:{
	            				search:$("#memId").val(),
	            				page:page
	            			},
	            			type:"post",
	            			success:function(result){
	            				
	            				if(result.list != null && result.pi != null){
	            					
	            					let list = "";
	               					for(let i=0; i<result.list.length; i++){
	               						list += "<tr class='table_content'>"
	               						     + "<td onclick='event.stopPropagation()'><input type='checkbox' class='typArr'></td>"
	               						     + "<td class='answerNo'>" + result.list[i].answerNo + "</td>"
	               						     + "<td>" + result.list[i].answerDate + "</td>"
	               						     + "<td>" + result.list[i].userNo + "</td>"
	               						     + "<td>" + result.list[i].answerTitle + "</td>"
	               						     + "<td>" + result.list[i].answerStatus + "</td>"; 
	               						     + "</tr>"
	               						
	               					}
	               					
	               					$("#table_div tbody").html("");
	               					$("#table_div tbody").html(list);
	               					
	               					let paging = "";
	               				 	
	               					if(1 == result.pi.currentPage) {
	               						paging += "<li class='page-item disabled'><a class='page-link'>Previous</a></li>";
	               	                }else {
	               	                	paging += "<li class='page-item'><a class='page-link' onclick='member(" + (page- 1) + ")'>Previous</a></li>";
	               	                }
	               	                
	               	               for(let p=result.pi.startPage; p<=result.pi.endPage; p++) {
	               		                if (p == result.pi.currentPage){
	               		                	paging += '<li class="page-item active"><a class="page-link">' + p + '</a></li>';
	               		                } else {
	               		                	paging += '<li class="page-item"><a class="page-link" onclick="member(' + p + ')">' + p + '</a></li>';
	               		                }
	               	                }
	               					
	               					if(result.pi.endPage != result.pi.maxPage){			
	               						paging += '<li class="page-item"><a class="page-link" onclick="member(' + (page + 1) + ')>Next</a></li>'
	               	                }else{
	               	                	paging += '<li class="page-item disabled"><a class="page-link">Next</a></li>'
	               	                }
	               					
	               	            	$("#paging").html("");
	               	            	$("#paging").html(paging);
	               	            	
	               	            	let count = result.search + ' 문의 수 : <label style="color: red;">' + result.pi.listCount + '</label>'
	               	            	

	               	            	$("#listCount").html("");
	               	            	$("#listCount").html(count);
	            					
	            				}else{
	            					alert("검색한 " + $("#memId").val() + " 회원 아이디는 존재하지않습니다.");
	            				}
	            			
	            				
               	           	
	            				
	            				
	            			}
	            			
	            			
	            		})
	            		
	            	
	        		
	        		
	        	}
            	
            	
            	
            	
           		function statusData(page){
                		let status = "미처리";
                		$.ajax({
               				url:"<%=contextPath%>/qnaselect.ma",
               				data:{
               					select:$("#selecte").val(),
               					page:page
               				},
               				type:"post",
               				success:function(result){
               					
               					//{pi: {…}, list: [{..},{..},]}
               					if(result.list != null){
               						
               						let list = "";
               						
                 					for(let i=0; i<result.list.length; i++){
                 						if(result.list[i].answerStatus == status){
                 							list += "<tr class='table_content'>"
                    						     + "<td onclick='event.stopPropagation()'><input type='checkbox' class='typArr'></td>"
                    						     + "<td class='answerNo'>" + result.list[i].answerNo + "</td>"
                    						     + "<td>" + result.list[i].answerDate + "</td>"
                    						     + "<td>" + result.list[i].userNo + "</td>"
                    						     + "<td>" + result.list[i].answerTitle + "</td>"
                    						     + "<td style='color:red'>" + result.list[i].answerStatus + "</td>"; 
                    						     + "</tr>" 
                 							
                 						}else{
                 							list += "<tr class='table_content'>"
                   						     + "<td onclick='event.stopPropagation()'><input type='checkbox' class='typArr'></td>"
                   						     + "<td class='answerNo'>" + result.list[i].answerNo + "</td>"
                   						     + "<td>" + result.list[i].answerDate + "</td>"
                   						     + "<td>" + result.list[i].userNo + "</td>"
                   						     + "<td>" + result.list[i].answerTitle + "</td>"
                   						     + "<td>" + result.list[i].answerStatus + "</td>"; 
                   						     + "</tr>" 
                 						}
                 						
                 					}
                 					
                 					$("#table_div tbody").html("");
                 					$("#table_div tbody").html(list);
                 					
                 					let paging = "";
                 				 	if(result.pi != null){
                 				 		if(1 == result.pi.currentPage) {
                     						paging += "<li class='page-item disabled'><a class='page-link'>Previous</a></li>";
                     	                }else {
                     	                	paging += "<li class='page-item'><a class='page-link' onclick='statusData(" + (page- 1) + ")'>Previous</a></li>";
                     	                }
                     	                
                     	               for(let p=result.pi.startPage; p<=result.pi.endPage; p++) {
                     		                if (p == result.pi.currentPage){
                     		                	paging += '<li class="page-item active"><a class="page-link">' + p + '</a></li>';
                     		                } else {
                     		                	paging += '<li class="page-item"><a class="page-link" onclick="statusData(' + p + ')">' + p + '</a></li>';
                     		                }
                     	                }
                     					
                     					if(result.pi.endPage != result.pi.maxPage){			
                     						paging += '<li class="page-item"><a class="page-link" onclick="statusData(' + (page + 1) + ')>Next</a></li>'
                     	                }else{
                     	                	paging += '<li class="page-item disabled"><a class="page-link">Next</a></li>'
                     	                }
                 				 		
                 				 	}else{
                 				 		
                 				 	}
                 					
                 					
                 	            	$("#paging").html("");
                 	            	$("#paging").html(paging);
                 	            	console.log(result.select);
                 	            	
                 	            	let count = "";
                 	            	if(result.select == "all"){
                 	            		count +=  '총 문의 수 : <label style="color: red;">' + result.pi.listCount + '</label>';
                 	            	}else if(result.select == "processed"){
                 	            		count += '처리 문의 수 : <label style="color: red;">'  + result.pi.listCount + '</label>';        	            		
                 	            	}else if(result.select == "unprocessed"){
                 	            		count += '미처리 문의 수 : <label style="color: red;">' + result.pi.listCount + '</label>';           	            		
                 	            	}
                 	            	
                 	            	$("#listCount").html("");
                 	            	$("#listCount").html(count);
               						
               					}else{
               						let list = "";
                 					
                					list += "<tr class='table_content'>" 
                						 + "<td colspan='6' onclick='event.stopPropagation()'>존재하는 문의내역이 없습니다.</td>"
                						 + "</tr>" 
                 					
                 					
                 					$("#table_div tbody").html("");
                 					$("#table_div tbody").html(list);
                 					
                 					$("#listCount").html("");
                 					$("#paging").html("");
                 					
                 					
                 					
               					}
             							
               							
               						
               					
               				}
               				
               					
               				
               			})
                		
                		
                	
            		
            	}
            	
            	
            	$("#select_btn").click(function(){
            		
            		$(".typArr").each(function(){
            			if($(this).is(":checked")){
            				location.href="<%=contextPath%>/mpdelete.ma?no=" + $(this).parent().next().text();
            				
            			}
            		})
            		
            	})
            	
            	
            	
            	
            </script>
        
            
            
            
            <div class="table_d" id="table_div">
                <div>
                    <table class="table table-hover">
                        <thead>
                            <tr class="table_title">
                                <th><input type="checkbox" id="cbx_chkAll"></th>
                                <th>번호</th>
                                <th>작성일자</th>
                                <th>아이디</th>
                                <th>문의내역</th>
                                <th>처리결과</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<% if(!list.isEmpty()) { %>
                        	<% for(ProductQnaReply p : list){ %>
                            <tr class="table_content">
                                <td onclick="event.stopPropagation()"><input type="checkbox" class="typArr"></td>
                                <td class="answerNo"><%= p.getAnswerNo() %></td>
                                <td><%= p.getAnswerDate() %></td>
                                <td><%= p.getUserNo() %></td>
                                <td class="content"><%= p.getAnswerTitle() %></td>
                                <td><%= p.getAnswerStatus()%></td>
                            </tr>
                            <% } %>
                            <% }else { %>
                            	<tr class="table_content">
                                <td class="answerNo" colspan="6" onclick="event.stopPropagation()">존재하는 문의내역이 없습니다.</td>
                            	</tr>
                            <% } %>
                        </tbody>
                    </table>     
                </div>
                    <div style="font-weight: bold;" id="listCount">
                        총 문의 수 : <label style="color: red;"><%= listCount %></label>
                    </div>                  
            </div>
            
            <script>
            
            
           		$(document).on("click",".table_content", function(){
           			// let select = $(".table_content").children().eq(1).text();
           			location.href="<%=contextPath%>/mselect.ma?answerNo=" + $(this).find(".answerNo").text();
           		})
            	
            
            </script>
            
       
            
            
             
            <ul class="pagination" id="paging">
           	<% if(pi != null) { %>
            	<% if(1 == pi.getCurrentPage()) { %>
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <% }else {%>
                <li class="page-item"><a class="page-link" href="<%=contextPath%>/qnaPersonal.ma?page=<%= pi.getCurrentPage() - 1%>">Previous</a></li>
                <% } %>
                
                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
	                <% if (p == pi.getCurrentPage()){ %>
	                <li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                <% } else { %>
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/qnaPersonal.ma?page=<%=p%>"><%= p %></a></li>
	                <% } %>
                <% } %>
				
				<% if(pi.getEndPage() != pi.getMaxPage()) {%>					
                <li class="page-item"><a class="page-link" href="<%=contextPath%>/qnaPersonal.ma?page=<%= pi.getCurrentPage() + 1%>">Next</a></li>
                <% }else { %>
                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                <% } %>
             <% } %> 
              </ul>
              
            <script>
           
                $(function(){
                        // 전체 선택 / 해제
                    $("#cbx_chkAll").click(function(){
                        if($("#cbx_chkAll").is(":checked")){
                        $("input[name=typArr]").prop("checked", true);
                        }else {
                        $("input[name=typArr]").prop("checked", false);
                        }
                    });
                    
                    $("input[name=typArr]").click(function(){
                        var totalArr = $("input[name=typArr]").length;
                        var checked = $("input[name=typArr]:checked").length;
                        
                        if(totalArr != ckecked){
                        $("#cbx_chkAll").prop("checked", false);
                        }else{
                        $("#cbx_chkAll").prop("checked", true);
                        }
                    });
                    
                    $(".table_content td").each(function(){
                        if($(this).text() == "미처리"){
                            $(this).css("color", "red");
                        }else{
                            $(this).css("color", "black");
                        }
                    })
                   
                })
                
              </script>

        </div>

            
        </section>
        <!-- Section end -->

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

		<%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>