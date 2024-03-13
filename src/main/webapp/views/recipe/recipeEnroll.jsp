<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피등록</title>
<style>
    .main-content {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .community_logo{margin-top: 100px;}
    td{padding: 20px 0px;}
    .product_name{
        width: 100%;
        height: 38px;
        border: 1px solid lightgrey;
        border-radius: 6px;
        outline: none;
    }
    .recipe_info{
        width: 90px;
    }
    .input_step>td{
        vertical-align: top;
        font-size: large;
        color: rgb(192, 57, 43);
    }
    .add_step_img{
        width: 150px;
        height: 150px;
        background-color: rgb(224, 224, 224);
        display: flex;
        justify-content: center;
        align-items: center;
        font-weight: bold;
        color: rgb(94, 94, 94);
        border-radius: 30px;
        cursor: pointer;
        margin-left: 20px;
    }
    textarea{resize: none;}
</style>
</head>
<body>

<div class="wrap">
		
		<%@ include file="/views/common/header.jsp" %>
		
	     <!-- Section start -->
	     <section class="main-content">

	         <!-- 커뮤니티 로고 -->
	        <div class="community_logo">
	            <p style="margin-bottom: 0;">community</p>
	            <img src="<%= contextPath %>/resources/images/community_logo.png" alt="community_logo">
	        </div>
	        <div class="underbar"></div>
	        <br><br><br>
            
            <form action="">
                <table>
                    <tr>
                        <th colspan="2" style="font-size: 20px; padding: 20px 0px; border-bottom: 1px solid lightgrey;">레시피등록</th>
                    </tr>
                    <!-- 레시피 정보 입력 -->
                    <tr>
                        <td width="150px">상품명</td>
                        <td width="400px">
                            <select class="product_name" name="">
                                <option selected hidden>상품을 선택하세요</option>
                                <option value="">칼로리 zero 마요네즈</option>
                                <option value="">케찹 떡볶이 밀키트</option>
                                <option value="">칼로리 zero 고추장</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>제목</td>
                        <td><input class="form-control" type="text" placeholder="레시피 제목을 입력해주세요"></td>
                    </tr>
                    <tr>
                        <td>대표사진</td>
                    </tr>
                    <tr>
                        <td>간단소개</td>
                        <td><textarea class="form-control" name="" rows="2" placeholder="레시피 소개를 작성해주세요" style="resize: none;"></textarea></td>
                    </tr>
                    <tr>
                        <td>요리정보</td>
                        <td>
                        <select class="recipe_info" name="">
                            <option selected hidden>인원수</option>
                            <option value="">칼로리 zero 마요네즈</option>
                            <option value="">케찹 떡볶이 밀키트</option>
                            <option value="">칼로리 zero 고추장</option>
                        </select>인분&nbsp;&nbsp;&nbsp;
                        <select class="recipe_info" name="">
                            <option selected hidden>소요시간</option>
                            <option value="">5</option>
                            <option value="">15</option>
                            <option value="">20</option>
                        </select>분&nbsp;&nbsp;&nbsp;
                        <select class="recipe_info" name="">
                            <option selected hidden>난이도</option>
                            <option value="">상</option>
                            <option value="">중</option>
                            <option value="">하</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="input_ingredient">재료</td>
                        <td>
                            <input class="form-control" type="text">
                            <input class="form-control" type="text">
                            <button class="btn btn-sm" style="background-color: rgb(224, 224, 224);">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <button class="btn btn-sm" style="width: 80px; background-color: rgb(94, 94, 94); color: white;">재료추가</button>
                        </td>
                    </tr>
                    <!-- 조리순서 입력 -->
                    <tr>
                        <th colspan="3" style="font-size: 20px; padding: 20px 0px;">조리 순서</th>
                    </tr>
                    <tr class="input_step">
                        <td>Step 1.</td>
                        <td>
                            <textarea class="form-control" name="" rows="6" style="resize: none;"></textarea>
                        </td>
                        <!-- 순서 이미지 파일 첨부 -->
                        <td>
                            <div class="add_step_img">이미지 추가</div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <button class="btn btn-sm" style="width: 80px; background-color: rgb(94, 94, 94); color: white;">순서추가</button>
                        </td>
                    </tr>
                    <!-- 태그 입력 -->
                    <tr>
                        <!-- 정규표현식으로 공백문자로 구분이 안되어있으면 등록 안되게 -->
                        <td>태그</td>
                        <td><input class="form-control" type="text"placeholder="#간장 #고추장 (태그 사이 공백으로 구분)"></td>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <button class="btn" style="width: 100px; background-color: rgb(192, 57, 43); color: white;">등록</button>
                </div>
                <br><br>
            </form>
	     </section>
	     <!-- Section end -->
	     
	     <%@ include file="/views/common/footer.jsp" %>
	     
	 </div>

</body>
</html>
