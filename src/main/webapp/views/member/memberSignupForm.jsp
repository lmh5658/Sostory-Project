<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			/*section 관련 스타일*/
			.main_content {
				margin-top: 120px;
				display: flex;
				justify-content: center;
				align-items: center;
			}
			.signup-table{margin-bottom: 20px;}
			.signup-table th {
				display: flex;
				justify-content: start;
				align-items: center;
				font-weight: bold;
				color: rgb(124, 121, 121);
				height: 50px;
				margin-bottom: 15px;
			}

			#signup-text {
				font-size: large;
				font-weight: bold;
				color: rgb(98, 98, 98);
				padding-top: 10%;
			}

			#signup-text::after {
				content: "";
				display: block;
				border-bottom: 2px solid rgba(169, 169, 169, 0.486);
				margin-bottom: 20px;
				width: 80%;
			}

			.dropdown-toggle,
			.dropdown-toggle:hover {
				border: 2px solid lightgray;
				height: 38px;
				width: 90%;
				color: grey;
				font-weight: bold;
				border-radius: 4pt;
				font-size: small;
			}

			.form-control {
				width: 90%;
			}

			.terms {
				display: flex;
				flex-direction: row;
				white-space: nowrap;
				margin-bottom: 5%;
			}
		</style>
	</head>

	<body>
		<div class="wrap">

			<%@ include file="/views/common/header.jsp" %>

				<!--section start-->
				<section class="main_content">

					<form action="<%=contextPath%>/signup.me" method="post">
						<table class="signup-table">
							<tr>
								<td colspan="2" class="signup_content" id="signup-text">회원가입</td>
							</tr>
							<tr>
								<th width="150px">* 아이디</th>
								<td colspan="2">
									<input type="text" name="userId" class="form-control" placeholder="아이디를 입력하세요 (6글자 이상, 영문, 숫자 포함)" required>
								</td>
								<td><button type="button" class="btn btn-secondary btn-sm" onclick="idCheck();">중복확인</button></td>
							</tr>

							<tr>
								<th>* 닉네임</th>
								<td colspan="2">
									<input type="text" name="nickName" class="form-control" placeholder="닉네임을 입력하세요" required>
								</td>
							</tr>

							<tr>
								<th>* 비밀번호</th>
								<td colspan="2">
									<input type="password" id="pwd" name="userPwd" class="form-control" placeholder="11글자이상, 영문자, 숫자, 특수문자 포함" required>
									<label>비밀번호를 입력해주세요.</label>	
								</td>
								<td></td>
							</tr>

							<tr>
								<th>* 비밀번호 확인</th>
								<td colspan="2">
									<input type="password" id="checkPwd" class="form-control" placeholder="비밀번호를 다시 입력해주세요" required>
									<label></label>	
								</td>
								<td></td>
							</tr>

							<tr>
								<th>* 이름</th>
								<td colspan="2"><input type="text" name="userName" class="form-control" placeholder="이름을 입력하세요"
										required> </td>
								<td></td>
							</tr>

							<tr>
								<th>* 휴대폰번호</th>
								<td colspan="2"><input type="text" name="phone" class="form-control" placeholder="휴대폰번호를 입력하세요"></td>
								<td></td>
							</tr>

							<tr>
								<th>* 이메일</th>
								<td colspan="2"><input type="email" name="email" class="form-control" placeholder="이메일 입력" required>
								</td>
							</tr>

							<tr>
								<th>* 주소</th>
								<td><input type="text" name="address" class="form-control" placeholder="주소 입력" required></td>
								<td><input type="text" name="addressDetail" class="form-control" placeholder="상세 주소 입력" required></td>
								<td><button type="button" class="btn btn-secondary btn-sm">주소검색</button></td>
								<td></td>
							</tr>

							<tr>
								<th>성별</th>
								<td colspan="2">
									<input type="radio" name="gender" id="no_gender" value="no_gender" checked><label
										for="no_gender">선택안함&nbsp;&nbsp;</label>
									<input type="radio" name="gender" id="male" value="M"> <label
										for="male">남자&nbsp;&nbsp;</label>
									<input type="radio" name="gender" id="female" value="F"> <label
										for="female">여자</label>
								</td>
								<td></td>
							</tr>

							<tr>
								<th>생년월일</th>
								<td>
									<input type="date" name="birthDate" class="form-control">
								</td>
							</tr>
						</table>
						
						<script>
						function idCheck() {
							const $idInput = $(".signup-table input[name=userId]");
	                		console.log($idInput.prop("readonly"));
	                		let regExp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,}$/;
	                		if(regExp.test($idInput.val())){
	                			$.ajax({
									url: "<%=contextPath%>/idCheck.me",
									data: {checkId: $idInput.val()},
									success: function(checkResult){
										if(checkResult == "NNNNY"){
											if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
												$idInput.attr("readonly", true);
											}
										} else {
											alert("이미 존재하는 회원입니다.");
										}
									}, error: function(){
										console.log("아이디 중복확인 ajax 에러");
									}
								})
	                		} else {
	                			alert("유효하지 않는 아이디 형식입니다.");
	                		}
							
						}
						
						$(function(){
							$("#pwd").keyup(function(){
								let regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&+=])[A-Za-z\d!@#$%^&+=]{9,}$/;
								console.log($("#pwd").val());
								if(regExp.test($("#pwd").val())){
									$("#pwd").next("label").text("사용가능한 비밀번호입니다.").css("color", "green");
								}else if($("#pwd").val() == ""){
									$("#pwd").next("label").text("비밀번호를 입력해주세요.").css("color", "black");
								}else{
									$("#pwd").next("label").text("유효하지 않는 비밀번호입니다.").css("color", "red");
								}
							})
							
							$("#checkPwd").keyup(function(){
								if($("#checkPwd").val() != "" && $("#pwd").val() == $("#checkPwd").val()){
									$("#checkPwd").next("label").text("비밀번호가 일치합니다.").css("color", "green");
								}else if($("#checkPwd").val() == ""){
									$("#checkPwd").next("label").text("");
								}else{
									$("#checkPwd").next("label").text("비밀번호가 일치하지 않습니다.").css("color", "red");
								}
							})
						})
						</script>

						<!--이용약관-->
						<table class="terms_table" style="width=100%">
							<tr>
								<td colspan="2" class="signup_content" id="signup-text">이용 약관
								</td>
							</tr>
							<tr>
								<td class="terms" width="300px"><label><input type="checkbox" class="all_agree">&nbsp;전체 약관 동의</label></td>
							</tr>
							<tr>
								<td class="terms"><label><input class="terms_checkbox" type="checkbox">&nbsp;이용 약관 동의(필수)</label></td>
								<!-- + 버튼 누르면 이용약관 팝업 창 뜨도록-->
								<td style="vertical-align:top; cursor: pointer;">
									<div class="terms_button">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
										  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
										  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
										</svg>
									</div>
								</td>
							</tr>
							<tr>
								<td class="terms"><label><input class="terms_checkbox" type="checkbox">&nbsp;개인정보 수집 및 이용 동의(필수)</label></td>
								<!-- + 버튼 누르면 이용약관 팝업 창 뜨도록-->
								<td style="vertical-align:top; cursor: pointer;">
									<div class="terms_button">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
										  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
										  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
										</svg>
									</div>
								</td>
							</tr>
							<tr>
								<td class="terms"><label><input class="terms_checkbox" type="checkbox">&nbsp;만 14세 이상(필수)</label></td>
							</tr>

						</table>

						<script>
							$(".all_agree").change(function(){
								if($(this).prop("checked")){
									$(".terms :checkbox").each(function(){
										$(this).attr("checked", true);
									})
								} else {
									$(".terms :checkbox").each(function(){
										$(this).attr("checked", false);
									})
								}
							})

							$
						</script>
						<br>

						<!--초기화&회원가입 버튼-->
						<div align="center" style="margin-bottom: 40px;">
							<button type="submit" class="btn btn-secondary" onclick="return validate();">회원가입</button>
							<button type="reset" class="btn btn-warning">초기화</button>
						</div>
					</form>
					<br><br>
					
					<script>
						function validate(){
							if(!$(".signup-table input[name=userId]").prop("readonly")){
								alert("아이디 중복확인을 진행해주세요.");
								return false;
							}
							
							if($("#pwd").next("label").text() != "사용가능한 비밀번호입니다." 
									|| $("#checkPwd").next("label").text() != "비밀번호가 일치합니다."){
								alert("비밀번호를 확인해주세요.");
								return false;
							}
							
							$(".terms_checkbox").each(function(){
								if(!$(this).prop("checked")){
									return false;
								}
							})
						}
					</script>
				
				</section>
				<!--section end-->

				<%@ include file="/views/common/footer.jsp" %>

		</div>
	</body>

	</html>
