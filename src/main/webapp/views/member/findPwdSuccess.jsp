<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
    /* Section 영역관련 스타일 */
    .main-content{display: flex; flex-direction: column;}

    .find-table {
        padding: 10% 10% 10% 10%;
    }

    .find-table th {
        text-align: center;
        font-size: medium;
        padding-bottom: 5%;
    }


    .find-table tr td {
        font-size: small;
    }
    .find-table td{
    	padding: 8px;
    }

    #check-button {
        background-color: rgb(255, 205, 3);
        color: black;
        border: 2px solid rgb(255, 205, 3); 
        width: 100%;
        font-weight: bold;
    }

    .find-table th a {
        text-decoration: none; 
        color: black;
        font-weight: bold;
        position: relative;
    }

    .find-table th a:hover:after {
        content: ""; 
        position: absolute; 
        left: 0;
        bottom: -13px;
        width: 100%;
        height: 2px; 
        background-color: darkgray;
    }


    #find-id-section #email-text{
        font-size: medium;
        font-weight: bold;
        text-align: center;
        padding: 25px 0px;
        color: rgb(124, 121, 121);
    }
    
    #find-id-section #email-text::after {
        content: "";
        display: block;
        border-bottom: 2px solid rgba(169, 169, 169, 0.486);
        margin: 2% 0% 5% 0%;
        width: 100%;
    }

    #find-password-section #email-text{
        font-size: medium;
        font-weight: bold;
        text-align: center;
        padding: 25px 0px;
        color: rgb(124, 121, 121);
    }

    #find-password-section #email-text::after {
        content: "";
        display: block;
        border-bottom: 2px solid rgba(169, 169, 169, 0.486);
        padding: 0% 0% 5% 0%;
        width: 100%;
    }
    </style>
</head>

<body>
    <div class="wrap">

        <%@ include file="/views/common/header.jsp" %>

        <!-- Section start -->
        <section class="main-content">

            <!--  아이디 찾기 -->
            <div id="find-id-section" class="find-section" style="display: none;">
                <form action="findId.me" method="post">
                    <table class="find-table center">
                        <tr>
                            <th width="180px"><a class="find_id" href="#">아이디 찾기</a></th>
                            <th width="180px"><a class="find_pwd" href="#">비밀번호 찾기</a></th>
                        </tr>
                        <tr>
                            <td id="email-text" colspan="2">아이디 찾기</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            	<input class="form-control" name="userName" type="text" style="width: 100%;" placeholder="이름을 입력해주세요" required>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-bottom: 20px;">
                                <input class="form-control" name="email" type="email" placeholder="이메일을 입력해주세요" style="width: 100%;" required>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit" id="check-button" class="btn btn-secondary">확인</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <!-- 비밀번호 찾기 -->
            <div id="find-password-section" class="find-section">
                <form action="findPwd.me" method="post">
                    <table class="find-table center">
                    <tr>
                        <th width="180px"><a class="find_id" href="#">아이디 찾기</a></th>
                        <th width="180px"><a class="find_pwd" href="#">비밀번호 찾기</a></th>
                    </tr>
                    <tr>
                        <td id="email-text" colspan="2">아이디 찾기 결과</td>
                    </tr>
                    <tr>
                        <th id="findId_name" class="find-id">아이디</th>
                        <th id="findId_date" class="find-id">비밀번호</th>
                    </tr>
                    <% if(request.getAttribute("userPwd") == null) { %>
                    <tr>
                    	<td colspan="2">
                    		비밀번호를 찾지 못했습니다.
                    	</td>
                    </tr>
                    <% } else { %>
                    <tr>
                        <td colspan="2" style="text-align: center;"><b><%= request.getAttribute("userId") %></b> 님의 비밀번호는</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center"><b><%= request.getAttribute("userPwd") %></b> 입니다.</td>
                    </tr>
                    <% } %>
                    <tr>
                        <td colspan="2">
                            <button type="button" id="check-button" class="btn btn-secondary" onclick="location.href='<%=contextPath%>/loginForm.me'">로그인 페이지로 가기</button>
                        </td>
                    </tr>
                </table>
                </form>
            </div>
        </section>
        <!-- Section end -->

        <%@ include file="/views/common/footer.jsp" %>

    </div>


    <script>
        $(".find_id").click(function () {
            $("#find-id-section").show();
            $("#find-password-section").hide();
        });

        $(".find_pwd").click(function () {
            $("#find-password-section").show();
            $("#find-id-section").hide();
        });
    </script>

</body>

</html>
