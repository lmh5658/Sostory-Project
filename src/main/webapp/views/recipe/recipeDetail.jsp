<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피상세</title>
<style>
	.main-content {
		margin-top: 50px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
	.detail_head{
		width: 100%;
		display: flex;
		justify-content: flex-start;
		align-items: center;
	}
	.detail_head>button{margin-left: auto;}
	.thumbnail{
		width: 100%;
		height: 500px;
		margin: 20px 0px;
		/* 임시 */
		background-color: grey;
	}
	.thumbnail>img{
		width: 100%;
		height: 100%;
	}
	.etc{
		width: 40%;
		display: flex;
		flex-direction: column;
		margin-right: auto;
		justify-content: flex-start;
	}
	.like{cursor: pointer;}
	.recipe_info{
		width: 350px;
		height: 200px;
		background-color: rgb(231, 76, 60);
		position: absolute;
		top: 700px;
		right: 380px;
		display: flex;
		flex-direction: column;
		align-items: center;
		box-shadow: 5px 5px 3px grey;
	}
	.recipe_info td{
		width: 100px;
		text-align: center;
		font-weight: bold;
	}
	.recipe_info *{color: white;}
	.recipe_info table{margin-top: 20px;}
	.info_top>td, .info_btm>td{font-size: large;}
	.info_mid>td{font-size: 35px;}
	.recipe_summary{
		border-top: 1px solid lightgray;
		font-size: large;
		color: grey;
		padding: 10px 0px;
	}
	.content{
		width: 100%;
		margin: 20px 0px;
		display: flex;
	}
	.content_detail{
		width: 60%;
		display: flex;
		flex-direction: column;
		align-items: flex-start;
	}
	.content_detail>div{width: 100%;}
	.recipe_step{
		font-size: 25px;
		color: rgb(231, 76, 60);
		font-weight: bold;
		margin-bottom: 5px;
	}
	.step_content{
		font-weight: bold;
		font-size: large;
		margin: 10px 0px;
	}
	.content_etc{
		width: 40%;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.step_img{
		background-color: grey;
		width: 100%;
		height: 400px;
		padding-right: 50px;
		background-clip: content-box;
		margin-bottom: 60px;
	}
	.ingredient_info{
		width: 80%;
		margin-bottom: 50px;
	}
	.ingredient_info>div{
		font-size: 20px;
		font-weight: bold;
		padding-bottom: 20px;
	}
	.content_etc table *{text-align: center;}
	.product:hover{
		cursor: pointer;
		opacity: 0.8;
	}
</style>
</head>
<body>
	<div class="wrap">
		
		<%@ include file="/views/common/header.jsp" %>
		
	    <!-- Section start -->
		<section class="main-content">
			<div class="detail_head">
				<span>홈  >  장류  >  간장</span>
				<button type="button" class="btn" style="background-color: rgb(231, 76, 60); color: white;">수정하기</button>
			</div>
			<!-- 대표사진 -->
			<div class="thumbnail">
				<img src="" alt="">
			</div>

			<!-- 레시피 요약 -->
			<div class="etc">
				<div class="recipe_info">
					<div style="margin-right: auto; margin-top: 5px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
							<path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z"/>
						</svg>
					</div>
					<table>
						<tr class="info_top">
							<td>조리시간</td>
							<td>인분수</td>
							<td>난이도</td>
						</tr>
						<tr class="info_mid">
							<td>60</td>
							<td>2</td>
							<td>상</td>
						</tr>
						<tr class="info_btm">
							<td>분</td>
							<td>인분</td>
							<td></td>
						</tr>
					</table>
				</div>
				<div>
					<h1 style="display: inline;"><b>고추장 불고기</b></h1>
					<!-- 내가 찜하지 않은 레시피인 경우 -->
					<span class="recipe_like" style="font-size: 20px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-heart like" viewBox="0 0 16 16">
							<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
						</svg>
						<!-- 내가 찜한 레시피인 경우 -->
						<!-- 
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
						</svg>
						-->
						(2000)
					</span>
					
				</div>
				<div style="height: 90px; margin: 10px 0px;" class="recipe_summary">칼로리 제로 고추장을 사용한 불고기 레시피!</div>
				<div>
					<div class="recipe_tag">
						<span>#고추장</span>
						<span>#불고기</span>
						<span>#칼로리</span>
					</div>
				</div>
			</div>

			<!-- 레시피 메인 컨텐츠 영역 -->
			<div class="content">
				<!-- 조리 방법 영역 -->
				<div class="content_detail">
					<div style="font-size: 30px; font-weight: bold; margin-bottom: 20px;">조리방법</div>

					<div class="recipe_step">Step 1.</div>
					<div class="step_content">조리 방법 설명 내용</div>
					<div class="step_img">
						<img src="" alt="">
					</div>

					<div class="recipe_step">Step 2.</div>
					<div class="step_content">조리 방법 설명 내용</div>
					<div class="step_img">
						<img src="" alt="">
					</div>

					<div class="recipe_step">Step 3.</div>
					<div class="step_content">조리 방법 설명 내용</div>
					<div class="step_img">
						<img src="" alt="">
					</div>
				</div>

				<!-- 레시피 부가 내용 -->
				<div class="content_etc">
					<div class="ingredient_info">
						<div>재료 정보</div>
						<table width="80%" class="table">
							<tr>
								<th>재료명</th>
								<th>수량</th>
							</tr>
							<tr>
								<td>돼지고기</td>
								<td>500g</td>
							</tr>
							<tr>
								<td>고추장</td>
								<td>100g</td>
							</tr>
							<tr>
								<td>물</td>
								<td>200ml</td>
							</tr>
						</table>
					</div>

					<!-- 상품 썸네일 start -->
					<div class="product img-thumbnail p-2" style="width:300px">
						<img class="product-img" src="<%=contextPath %>/resources/images/이미지1.jpg" alt="Card image" style="width:100%">
						<div class="product-body">
							<small class="product-category text-secondary d-block mb-3 mt-2">카테고리명</small>
							<h7 class="product-title"><b><b class="text-danger">[HOT] </b>칼로리 zero 머스타드</b></h7>
							<h7 class="product-price d-block my-4"><b>8,000원</b></h7>
							<div class="icon d-flex justify-content-end">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
									<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
								</svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
									<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
								</svg>
							</div>
						</div>
					</div>
					<!-- 상품 썸네일 end -->
				</div>
			</div>
		</section>
	     <!-- Section end -->
	     
	     <%@ include file="/views/common/footer.jsp" %>
	     
	</div>
</body>
</html>
