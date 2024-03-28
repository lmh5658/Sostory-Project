<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sos.common.model.vo.PageInfo, java.util.List" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Member> list = (List<Member>)request.getAttribute("list");
	String keyword = (String)request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>회원목록</title>
    <style>
        /* 메인페이지 Section 영역관련 스타일 */
        .main-content {
            display: flex;
            flex-direction: column;
        }

        .content-product-list {
            display: flex;
            flex-direction: column;
        }

        .product-thumbnail-list .product:hover,
        .recipe:hover,
        .recipe-product:hover {
            cursor: pointer;
            opacity: 0.8;
        }

        .recipe-product {
            display: flex;
        }

        .section_1 {
            margin: auto;
            width: 100%;
            min-height: 1300px;
            height: 800px;
            display: flex;
        }

        /*레시피관리>레시피등록 스타일*/
        .section_right {
            width: 100%;
            margin: 20px;
            margin-top: 30px;
        }

        .section_right label {
            font-weight: bolder;
            font-size: 17px;
        }

        .section_right>div {
            display: flex;

        }

        .mem_search {
            display: flex;
            margin-left: 10px;
            margin-top: 15px;
        }

        .mem_search button {
            width: 80px;
            background-color: #c20000;
            /* 배경색 설정 */
            color: #ffffff;
            /* 텍스트 색상 설정 */
            border: none;
            /* 테두리 제거 */
            font-weight: bold;
            height: 100%;
        }


        .mem_del {
            display: flex;
            justify-content: right;
        }

        table {
            margin-top: 20px;
            width: 80%;
            text-align: center;
            border: 1px solid #dddddd;
        }

        .table_title th {
            background-color: #dddddd;
            ;
            font-weight: bold;
            /* 헤더 글씨체를 굵게 설정 */
            padding: 8px;
            /* 셀 안의 여백 설정 */
        }

        .pro_name {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #dddddd;
            width: 100px;
            font-weight: bold;
            border-bottom-left-radius: 10px;
            border-top-left-radius: 10px;
            border: 1px solid rgb(148, 146, 146);
            border: none;
            /* 테두리 제거 */
            border-radius: 5px;
            /* 모서리를 둥글게 만듦 */
        }

        .select_div {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            align-items: center;

        }

        .select_div select {
            width: 100px;
        }

        .select_delete {
            margin-right: 50px;
            height: 40px;
            width: 100px;
            background-color: #c20000;
            /* 배경색 설정 */
            color: #ffffff;
            /* 텍스트 색상 설정 */
            border: none;
            /* 테두리 제거 */
            border-radius: 5px;
            /* 모서리를 둥글게 만듦 */
            font-weight: bold;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .table_d {
            display: flex;
            flex-direction: column;
        }

        .section_title>div {
            margin-left: 10px;
        }

        .section_title label {
            font-size: 20px;
            font-weight: bold;
        }

        .mem_del_btn {
            background-color: rgb(0, 0, 116);
            width: 120px;
            color: #ffffff;
            border: none;
            font-weight: bold;
            border-radius: 6px;
            margin-right: 30px;
            margin-left: 15px;
            height: 40px;
        }

        .mem_del_btn2 {
            width: 100px;
            background-color: #c20000;
            color: #ffffff;
            border: none;
            font-weight: bold;
            border-radius: 6px;
            margin-right: 30px;
            margin-left: 30px;
            height: 40px;
        }

        /*수정버튼 클릭시 모달 스타일*/
        .modal-content {
            margin-top: 220px;
            border-radius: 20px;
        }

        form>.modal-body>.form-field {
            margin-top: 30px;
        }

        form>.modal-body>div>label {
            width: 150px;
            font-size: 20px;
            font-weight: bold;
            margin-top: 5px;
        }

        .modal-body #addressDetail {
            margin-left: 130px;
        }

        form>.modal-body>.form-check>label {
            float: right;
            font-size: 18px;
            width: 165px;
            margin-top: 25px;
            color: rgb(123, 123, 123);
        }

        .modal-footer {
            margin: 30px 0 5px 0;
            display: flex;
            justify-content: center;
        }

        .form-field>input {
            width: 300px;
        }

        .section_title b {
            font-size: 20px;
        }
    </style>
</head>

<body>
    <div class="wrap">

        <%@ include file="/views/common/header.jsp" %>

        <!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

        <!-- Section start -->
        <section class="main-content">
            <div class="section_1">
                
                <%@ include file="/views/common/managerMenu.jsp" %>
                
                <% if(loginUser == null){ // alert 시킬 알람문구가 존재할 경우 %>
				  <script>
				     alert('로그인을 먼저 진행해주세요'); // 문자열 취급시 따옴표로 감싸야됨
				     location.href="<%=contextPath%>"
				  </script>
				<% } %>
                
                <!-- 사이드메뉴바 클릭시 바뀌는 화면-->
                <div class="section_right">
                    <div class="section_title" style="border-bottom: 2px solid gray">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                            class="bi bi-house-gear-fill" viewBox="0 0 16 16">
                            <path d="M7.293 1.5a1 1 0 0 1 1.414 0L11 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l2.354 2.353a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708z" />
                            <path d="M11.07 9.047a1.5 1.5 0 0 0-1.742.26l-.02.021a1.5 1.5 0 0 0-.261 1.742 1.5 1.5 0 0 0 0 2.86 1.5 1.5 0 0 0-.12 1.07H3.5A1.5 1.5 0 0 1 2 13.5V9.293l6-6 4.724 4.724a1.5 1.5 0 0 0-1.654 1.03" />
                            <path d="m13.158 9.608-.043-.148c-.181-.613-1.049-.613-1.23 0l-.043.148a.64.64 0 0 1-.921.382l-.136-.074c-.561-.306-1.175.308-.87.869l.075.136a.64.64 0 0 1-.382.92l-.148.045c-.613.18-.613 1.048 0 1.229l.148.043a.64.64 0 0 1 .382.921l-.074.136c-.306.561.308 1.175.869.87l.136-.075a.64.64 0 0 1 .92.382l.045.149c.18.612 1.048.612 1.229 0l.043-.15a.64.64 0 0 1 .921-.38l.136.074c.561.305 1.175-.309.87-.87l-.075-.136a.64.64 0 0 1 .382-.92l.149-.044c.612-.181.612-1.049 0-1.23l-.15-.043a.64.64 0 0 1-.38-.921l.074-.136c.305-.561-.309-1.175-.87-.87l-.136.075a.64.64 0 0 1-.92-.382ZM12.5 14a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3" />
                        </svg>회원관리><b>회원목록</b>
                    </div>

                    <!-- 회원목록 Content start -->
                    
                    <!-- 회원검색 -->
                   	<form action="<%= request.getContextPath() %>/searchMember.ma">
	                   <div class="mem_search">
	                       <div class="pro_name">회원ID</div>&nbsp;
	                       <div><input type="text" name="keyword" class="form-control"></div>
	                       <div><input type="hidden" name="page" value="1"></div>
	                       <div><button>조회</button></div>
	                   </div>
                    </form>
                    <div class="mem_del">

                        <button class="mem_del_btn2" onclick="deleteMember();">회원삭제</button>

                    </div>
                    <div class="table_d">
                        <div>
                            <table class="table table-hover">
                                <thead>
                                    <tr class="table_title">
                                        <th><input type="checkbox" id="cbx_chkAll"></th>
                                        <th>회원번호</th>
                                        <th>아이디</th>
                                        <th>닉네임</th>
                                        <th>이름</th>
                                        <th>전화번호</th>
                                        <th>이메일</th>
                                        <th>주소</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<% if(list.isEmpty()) { %>
                                	<!-- 회원 조회 결과가 없는 경우 -->
                                	<tr class="table_content">
                                        <td colspan="8" style="">회원이 존재하지 않습니다.</td>
                                    </tr>
                                	<% } else { %>
                                    <!-- 회원 조회 결과가 있는 경우 -->
	                                    <% for(Member m : list) { %>
	                                    <tr class="table_content">
	                                        <td><input type="checkbox" name="typArr"></td>
	                                        <td><%= m.getUserNo() %></td>
	                                        <td><%= m.getUserId() %></td>
	                                        <td><%= m.getNickName() %></td>
	                                        <td><%= m.getUserName() %></td>
	                                        <td><%= m.getPhone() %></td>
	                                        <td><%= m.getEmail() %></td>
	                                        <td><%= m.getAddress() %></td>
	                                    </tr>
	                                    <% } %>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                        <div>
                            총 회원 수 : <label style="color: red;"><%= pi.getListCount() %> 명</label>
                        </div>
                    </div>
                    <!-- 회원목록 Content end -->

                    <script>

                        $(function () {
                            // 전체 선택 / 해제
                            $("#cbx_chkAll").click(function () {
                                if ($("#cbx_chkAll").is(":checked")) {
                                    $("input[name=typArr]").prop("checked", true);
                                } else {
                                    $("input[name=typArr]").prop("checked", false);
                                }
                            });
                            $("input[name=typArr]").click(function () {
                                var totalArr = $("input[name=typArr]").length;
                                var checked = $("input[name=typArr]:checked").length;

                                if (totalArr != ckecked) {
                                    $("#cbx_chkAll").prop("checked", false);
                                } else {
                                    $("#cbx_chkAll").prop("checked", true);
                                }
                            });
                            
                        })
                        
                        // 회원 삭제
                        function deleteMember(){
                        	const $deleteMember = $("input[name=typArr]:checked");
                        	if($deleteMember.length != 0){
								if(confirm($deleteMember.length + "명의 회원을 삭제하시겠습니까?")){
									let addValues = "";
									for(let i=0; i<$deleteMember.length-1; i++){
										addValues += "userNo=" + $deleteMember.eq(i).parent().next().text() + "&";
									}
									addValues += "userNo=" + $deleteMember.eq($deleteMember.length - 1).parent().next().text();
									
									location.href="<%=contextPath%>/deleteMember.ma?" + addValues;
								}
                    		} else {
                    			alert("삭제할 회원을 선택해주세요.");
                    		}
                        }

                    </script>
                    
					<!-- 페이징 -->
					<% if(keyword == null) { %>
                    <ul class="pagination">
                    	<% if(pi.getCurrentPage() == 1) { %>
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <% } else { %>
                        <li class="page-item"><a class="page-link" href="<%= contextPath %>/memberList.ma?page=<%= pi.getCurrentPage() - 1 %>" >Previous</a></li>
                        <% } %>
                        
                        <% for (int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
                        	<% if(i == pi.getCurrentPage())	{ %>
                        	<li class="page-item active"><a class="page-link" href="<%= contextPath %>/memberList.ma?page=<%= i %>"><%= i %></a></li>
                        	<% } else {%>
                        	<li class="page-item"><a class="page-link" href="<%= contextPath %>/memberList.ma?page=<%= i %>"><%= i %></a></li>
                        	<% } %>
                        <% } %>
                        
                        <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                        <% } else { %>
                        <li class="page-item"><a class="page-link" href="<%= contextPath %>/memberList.ma?page=<%= pi.getCurrentPage() + 1 %>" >Previous</a></li>
                        <% } %>
                    </ul>
                    <% } else { %>
                    <ul class="pagination">
                    	<% if(pi.getCurrentPage() == 1) { %>
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <% } else { %>
                        <li class="page-item"><a class="page-link" href="<%= contextPath %>/searchMember.ma?page=<%= pi.getCurrentPage() - 1 %>&keyword=<%= keyword %>" >Previous</a></li>
                        <% } %>
                        
                        <% for (int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
                        	<% if(i == pi.getCurrentPage())	{ %>
                        	<li class="page-item active"><a class="page-link" href="<%= contextPath %>/searchMember.ma?page=<%= i %>&keyword=<%= keyword %>"><%= i %></a></li>
                        	<% } else {%>
                        	<li class="page-item"><a class="page-link" href="<%= contextPath %>/searchMember.ma?page=<%= i %>&keyword=<%= keyword %>"><%= i %></a></li>
                        	<% } %>
                        <% } %>
                        
                        <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                        <% } else { %>
                        <li class="page-item"><a class="page-link" href="<%= contextPath %>/searchMember.ma?page=<%= pi.getCurrentPage() + 1 %>&keyword=<%= keyword %>" >Next</a></li>
                        <% } %>
                    </ul>
                    <% } %>
                    
                </div>
            </div>
            <!-- 기능설명 : 삭제버튼 클릭시, confirm 팝업 후 삭제 
               기능구현 : 아래 삭제여부 확인용 팝업창있음
           -->

        </section>
        <!-- Section end -->

        <!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>

</html>
