<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Section 영역관련 스타일 */
       
.main-content{
    margin-bottom: 10%;
}

.success-logo{
    display: flex;
    justify-content: center; 
    align-items: center;
    margin: 8% 0% 2% 0%;
}

.success-logo > img{
    display: flex;
    width: 60%;
    
}

.success_comment{font-size: x-large;}

#login-button{
    background-color: rgb(243, 156, 18);
    color: white;
    border: 2px solid rgb(243, 156, 18); 
    font-weight: bold;
    margin-top: 3%;

}
</style>
</head>
<body>
<div class="wrap">

    <%@ include file="/views/common/header.jsp" %>

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
        
        <!-- Section start -->
        <!--로그인 전-->
      <section class="main-content">
        <div class="signup_success">
            <div class="success-logo">
                <img src="<%= request.getContextPath() %>/resources/images/회원가입성공.png" alt="소스토리 로고이미지">
            </div>                
            <div class="success_comment center">
                <b><%= request.getAttribute("userName") %>님 가입을 축하합니다.</b>
            </div>
            <div align="center">
                <a href="<%=contextPath %>/loginForm.me" id="login-button" class="btn btn-secondary">로그인</a>
            </div>
        </div>
      </section>

    <!-- Section end -->
    
	<%@ include file="/views/common/footer.jsp" %>
    
</div>
</body>
</html>