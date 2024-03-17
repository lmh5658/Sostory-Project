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

			.terms-btn {
				background-color: lightgray;
				border: 1px solid lightgray;
				font-size: small;
				width: 1px;
				height: 25px;
				margin-bottom: 5%;
			}
		</style>
	</head>

	<body>
		<div class="wrap">

			<%@ include file="/views/common/header.jsp" %>

				<!--section start-->
				<section class="main_content">

					<form action="signup.me" method="post">
						<table class="signup-table">
							<tr>
								<td colspan="2" class="signup_content" id="signup-text">회원가입</td>
							</tr>
							<tr>
								<th width="150px">* 아이디</th>
								<td colspan="2">
									<input type="text" class="form-control" placeholder="아이디를 입력하세요" required>
								</td>
								<td><button type="button" class="btn btn-secondary btn-sm">중복확인</button></td>
							</tr>

							<tr>
								<th>* 닉네임</th>
								<td colspan="2">
									<input type="text" class="form-control" placeholder="닉네임을 입력하세요" required>
								</td>
							</tr>

							<tr>
								<th>* 비밀번호</th>
								<td colspan="2"><input type="password" class="form-control" placeholder="비밀번호를 입력하세요"
										required></td>
								<td></td>
							</tr>

							<tr>
								<th>* 비밀번호 확인</th>
								<td colspan="2"><input type="password" class="form-control"
										placeholder="비밀번호를 다시 입력해주세요" required></td>
								<td></td>
							</tr>

							<tr>
								<th>* 이름</th>
								<td colspan="2"><input type="text" class="form-control" placeholder="이름을 입력하세요"
										required> </tdc>
								<td></td>
							</tr>

							<tr>
								<th>* 휴대폰번호</th>
								<td colspan="2"><input type="text" class="form-control" placeholder="휴대폰번호를 입력하세요"></td>
								<td></td>
							</tr>

							<tr>
								<th>* 이메일</th>
								<td colspan="2"><input type="email" class="form-control" placeholder="이메일 입력" required>
								</td>
							</tr>

							<tr>
								<th>* 주소</th>
								<td><input type="text" class="form-control" placeholder="주소 입력"></td>
								<td><input type="text" class="form-control" placeholder="상세 주소 입력"></td>
								<td><button type="button" class="btn btn-secondary btn-sm">주소검색</button></td>
								<td></td>
							</tr>

							<tr>
								<th>성별</th>
								<td colspan="2">
									<input type="radio" name="gender" id="no_gender" value="no_gender"><label
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
									<input type="date" class="form-control">
								</td>
							</tr>
						</table>

						<!--이용약관-->
						<table class="terms">
							<tr>
								<td colspan="2" class="signup_content" id="signup-text">이용 약관
								</td>
							</tr>
							<tr>
								<td class="terms"><label><input type="checkbox" class="all_agree">&nbsp;전체 약관 동의</label></td>
							</tr>
							<tr>
								<td class="terms"><label><input type="checkbox">&nbsp;이용 약관 동의(필수)</label></td>
								<!-- + 버튼 누르면 이용약관 팝업 창 뜨도록-->
								<td><button type="button" class="btn btn-secondary mx-3 center terms-btn">+</button>
								</td>
							</tr>
							<tr>
								<td class="terms"><label><input type="checkbox">&nbsp;개인정보 수집 및 이용 동의(필수)</label></td>
								<!-- + 버튼 누르면 이용약관 팝업 창 뜨도록-->
								<td><button type="button" class="btn btn-secondary mx-3 center terms-btn">+</button>
								</td>
							</tr>
							<tr>
								<td class="terms"><label><input type="checkbox">&nbsp;만 14세 이상(필수)</label></td>
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
						</script>
						<br>

						<!--초기화&회원가입 버튼-->
						<div align="center" style="margin-bottom: 40px;">
							<button type="submit" class="btn btn-secondary">회원가입</button>
							<button type="reset" class="btn btn-warning">초기화</button>
						</div>
					</form>
					<br><br>

				</section>
				<!--section end-->

				<%@ include file="/views/common/footer.jsp" %>

		</div>
	</body>

	</html>