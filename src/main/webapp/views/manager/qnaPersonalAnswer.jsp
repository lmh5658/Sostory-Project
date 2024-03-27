<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.product.model.vo.*" %>
<%
	ProductQnaReply pq = (ProductQnaReply)request.getAttribute("pq");
	AttachmentProduct ap = (AttachmentProduct)request.getAttribute("ap");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의상세</title>
<style>
/*문의관리>1:1문의상세 스타일*/
         .section_right{
            width: 100%;
            margin: 30px;
         }
         .table{
            width: 800px;
            margin: 20px;
            margin-left: 80px;    
         }
         .table th{
            width: 150px;
            text-align: center;
         }
         .table input{
            width: 400px;
            margin-left: 10px;
         }
         .table textarea{
            width: 400px;
            height: 200px;
            margin-left: 10px;
            resize: none;
         }

         .files{
            display: flex;
            justify-content: center;
            margin-right: 265px;
         }
         .btn{
            display: flex;
            justify-content: center;
            align-items: center;
            border: none;
            margin-left: 380px;
         }
        
         .btn button{
            width: 80px;
            height: 35px;
            background-color: #c20000; /* 배경색 설정 */
            color: #ffffff; /* 텍스트 색상 설정 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 모서리를 둥글게 만듦 */
            font-weight: bold;
            
            
         }
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
            <form action="<%=contextPath%>/updataReply.ma" method="post">
                <table class="table">
                    <tr>
                        <th>번호</th>
                        <td><input type="text" readonly class="form-control" name="answerNo" value="<%= pq.getAnswerNo() %>"></td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" readonly value="<%=pq.getAnswerTitle() %>"  class="form-control" name="title"></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea id="" cols="30" rows="10" readonly class="form-control" name="content"><%= pq.getAnswerContent() %></textarea>                        	
                        </td>
                    </tr>
                    <tr>
                        <th>답변</th>
                        <td>
                        	<% if(pq.getReply() == null) {%>
                            <textarea cols="30" rows="10" class="form-control" name="replyContent" placeholder="내용을 입력해주세요"></textarea>
                        	<% }else {%>
                            <textarea cols="30" rows="10" class="form-control" name="replyContent"><%= pq.getReply() %></textarea>
                        	<% } %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="files" class="fomt-">
                            <% if(ap != null) { %>
								<%= ap.getFileName() %>
								<input type="hidden" name="originFileNo" value="<%= ap.getProFileNo() %>">                          	
                            <% } else { %>
                            <input type="file" class="form-control" name="upfile">
                            <% } %>
                            </div>
                        </td>
                    </tr>
                </table> 
                <div class="btn"><button>등록</button></div>
            </form>
        </div>
        </section>
        <!-- Section end -->

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

		<%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>