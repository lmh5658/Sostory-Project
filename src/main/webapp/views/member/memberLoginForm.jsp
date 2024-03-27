<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String failMsg = (String)request.getAttribute("failMsg"); %>
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
	<!-- Session값 유효여부 판단
		 - Session에 전달받은 alertMsg값이 있을경우 : Session값 알림팝업으로 띄워주기
		 - Session에 전달받은 alertMsg값이 없을경우 : Session값 삭제하기	
	 -->
	<% if(failMsg != null){ %>
		<script>
			alert('<%= failMsg %>');
		</script>
	<% 
		request.removeAttribute("alertMsg");
	   } 
	%>
	
	<div class="wrap">

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
                    <table class="login-table center">
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
	                            	<a href="findForm.me">아이디 비밀번호 찾기</a>
                            	</td>
                        	</tr>
	                        <tr>
	                            <td colspan="2" style="padding-top:12px;">
	                                <button type="submit" id="login-button" class="btn btn-secondary btn-sm">로그인</button>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td colspan="2" style= "padding-top:12px;">
	                                <a href="signupForm.me" id="signup-button" class="btn btn-secondary btn-sm">회원가입</a>
	                            </td>
	                        </tr>
                        </tbody>
                    </table>
                </form>
      	</section>
            <!--로그인 성공-->
            <!--로그인 실패-->

        <!-- Section end -->
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
	                document.getElementById("addressName").value = addr;
	                // 커서를 상세주소 필드로 이동한다. 상세주소는 입력받아야함
	                // 상세주소 input id값설정. ==> 밑에 코드경우 addressDetail
	                document.getElementById("addressDetail").focus();
	            }
	        }).open();
		}
          
    </script>
        
        
        
        </script>

<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>
