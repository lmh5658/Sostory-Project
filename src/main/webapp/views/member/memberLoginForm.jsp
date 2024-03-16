<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <style> 
        /* Section 영역관련 스타일 */
        .section-logo > img {
            max-height: 30px; 
            max-width: 30%; 
            margin: 7% 0 10px 0; 
        }

        #login-text{
            text-align: center;
            font-weight: bold;
        }
        
        .login-table{
        	height: 500px;
        }
        
        .login-table>tbody{
        	width: 510px;
        	margin-left: 20px
        	display: flex;
        	margin-top: -200px;
        	
        }
        
        .login-table>tr{
        	width: 400px;
        	margin-left:100px;
        }

        .login-table td {
            font-size: small;
        }

        .login-table input {
            margin: 2% 0% 5% 0%;
        }

        #login-button {
            background-color: rgb(255, 205, 3);
            color: black;
            border: 2px solid rgb(255, 205, 3); 
            width: 100%;
            font-weight: bold;
        }

        #signup-button{
            background-color: rgb(243, 156, 18);
            color: white;
            border: 2px solid rgb(243, 156, 18); 
            width: 100%;
            font-weight: bold;
        }

       .form-control{width: 183%;}

       .login-table a {
            text-decoration: none; 
            color: black;
        }
    </style>
</head>
<body>
	<div class="wrap p-3">

      <%@ include file="/views/common/header.jsp" %>

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
        
        <!-- Section start -->
        <!--로그인 전-->
        <section class="main-content">

                <div class="section-logo center">
                    <img src="<%= contextPath %>/resources/images/소스1.png" alt="소스토리 로고이미지">
                </div>

                <h3 id="login-text">로그인</h3>
                
                <form action="<%= contextPath %>/login.me" method="post">
                    <table class="login-table center" margin-top: 0px;">
                        <tbody>
                        	<tr>
                            	<td colspan="2"><input class="form-control" type="text" placeholder="아이디를 입력해주세요" required style="width: 500px;" name="userId"></td>
                        	</tr>
                        	<tr>  
                            	<td colspan="2"><input class="form-control" type="password"  placeholder="비밀번호를 입력해주세요" required name="userPwd"></td>
                       		</tr>
                        	<tr>
                            	<td><input type="checkbox" id="#saved"><label for="#saved">&nbsp;아이디 저장</label></td>
                            	<td style="text-align: right;">
	                            	<a href="#">아이디 찾기 &nbsp;</a>
	                            	<a href="#">비밀번호 찾기</a>
                            	</td>
                        	</tr>
	                        <tr>
	                            <td colspan="2" style="padding-top:12px;">
	                                <button type="submit" id="login-button" class="btn btn-secondary btn-sm">로그인</button>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td colspan="2" style= "padding-top:12px;">
	                                <button type="button" id="signup-button" class="btn btn-secondary btn-sm">회원가입</button>
	                            </td>
	                        </tr>
                        </tbody>
                    </table>
                </form>
      	</section>
            <!--로그인 성공-->
            <!--로그인 실패-->

        <!-- Section end -->

<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>