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
        padding: 2% 0%;
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
        padding: 0% 0% 5% 0%;
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
            <div id="find-id-section" class="find-section">
                <form action="" method="">
                    <table class="find-table center">
                        <tr>
                            <th width="180px"><a class="find_id" href="#">아이디 찾기</a></th>
                            <th width="180px"><a class="find_pwd" href="#">비밀번호 찾기</a></th>
                        </tr>
                        <tr>
                            <td id="email-text" colspan="2">FIND ID</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            	<input class="form-control" type="text" style="width: 100%;" placeholder="이름" required>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-bottom: 20px;">
                                <input class="form-control" type="email" placeholder="이메일을 입력해주세요" style="width: 100%;" required>
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
            <div id="find-password-section" class="find-section" style="display: none;">
                <form action="" method="">
                    <table class="find-table center">
                        <tr>
                            <th width="200px"><a class="find_id" href="#">아이디 찾기</a></th>
                            <th width="200px"><a class="find_pwd" href="#">비밀번호 찾기</a></th>
                        </tr>
                        <tr>
                            <td id="email-text" colspan="2">FIND PASSWORD</td>
                        </tr>
                        <tr>
                            <td>
                            	<input class="form-control" colspan="2" type="text" style="width: 100%;" placeholder="이름">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input class="form-control" type="email" placeholder="이메일을 입력해주세요" style="width: 177%;" required>
                            </td>
                        </tr>
                        <tr>
                            <td><input class="form-control" type="text" style="width: 177%;"
                                    placeholder="인증번호를 입력해주세요"></td>
                        </tr>
                        <tr>
                            <td>
                                <button type="submit" id="check-button" class="btn btn-secondary"
                                    style="margin-top: 13%;">확인</button>
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
