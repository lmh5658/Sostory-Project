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
    .product_name, .recipe_info, .ingredient{
        width: 100%;
        height: 38px;
        border: 1px solid lightgrey;
        border-radius: 6px;
        outline: none;
    }
    .input_step>td{
        vertical-align: top;
        font-size: large;
        color: rgb(192, 57, 43);
    }
    .add_step_img, .thumbnail_img{
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
    }
    .add_step_img{margin-left: 20px;}
    input[type=file]{display: none;}
</style>
</head>
<body>
<!-- 
    기본적인 form은 레시피 등록 페이지와 동일
    기능 구현할때 기존 값이 표시되게 할것
 -->
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
                            <select class="product_name" name="" required>
                                <option hidden>상품을 선택하세요</option>
                                <option name="productName" value="" selected><%= %></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>제목</td>
                        <td><input class="form-control" type="text" name="recipeName" placeholder="레시피 제목을 입력해주세요" required></td>
                    </tr>
                    <tr>
                        <td>대표사진</td>
                        <td>
                            <div class="thumbnail_img"><input type="file" name="thumbnailUrl" >대표사진 선택하기</div>
                        </td>
                    </tr>
                    <tr>
                        <td>간단소개</td>
                        <td><textarea class="form-control" name="recipeIntro" rows="2" placeholder="레시피 소개를 작성해주세요" style="resize: none;"></textarea></td>
                    </tr>
                    <tr>
                        <td>요리정보</td>
                        <td>
                        <input type="number" class="recipe_info" minlength="0" maxlength="20" name="serving" placeholder="인원수" style="width: 70px;">
                        </input>인분&nbsp;&nbsp;&nbsp;
                        <input type="number" class="recipe_info" minlength="0" placeholder="소요시간" name="cookingTime" style="width: 90px;">
                        </input>분&nbsp;&nbsp;&nbsp;
                        <select class="recipe_info" name="" style="width: 80px;">
                            <option selected hidden>난이도</option>
                            <option name="difficulty" value="상">상</option>
                            <option name="difficulty" value="중">중</option>
                            <option name="difficulty" value="하">하</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>재료</td>
                        <td id="ingredientForm">
                            <input class="ingredient" type="text" style="width: 120px; margin-right: 20px;" placeholder="재료명" required>
                            <input class="ingredient" type="number" style="width: 120px;" placeholder="수량" required>
                            <select class="ingredient" name="" style="width: 70px;" required>
                                <option selected hidden>단위</option>
                                <option value="">g</option>
                                <option value="">kg</option>
                                <option value="">ml</option>
                                <option value="">L</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <button id="addIngredientButton" type="button" class="btn btn-sm" style="width: 80px; background-color: rgb(94, 94, 94); color: white;"  onclick="addIngredient(this);">재료추가</button>
                        </td>
                    </tr>
                    <script>
                        $(function(){
                            $("#addIngredientButton").click(function(){
                                const ingName = '<input class="ingredient" type="text" style="width: 120px; margin-right: 20px;" placeholder="재료명" required>';
                                const ingMount = '<input class="ingredient" type="number" style="width: 120px;" placeholder="수량" required>';
                                const unit = '<select class="ingredient" name="" style="width: 70px;" required><option selected hidden>단위</option><option value="">g</option><option value="">kg</option><option value="">ml</option><option value="">L</option></select>';
                                const addButton = '<button type="button" class="btn btn-sm" style="background-color: rgb(224, 224, 224);">삭제</button>';
                                let el = $("<tr></tr>").html("<td></td>" + '<td id="ingredientForm">' + ingName + "&nbsp;" +  ingMount + "&nbsp;" + unit + "&nbsp;" + addButton + "</td>");
                                $("#addIngredientButton").parent().parent().before(el);
                            })
    
                            $("#ingredientForm").on("click", "button", function(){
                                $(this).parent().remove();
                            })
                        })
                    </script>
                    <!-- 조리순서 입력 -->
                    <tr>
                        <th colspan="3" style="font-size: 20px; padding: 20px 0px;">조리 순서</th>
                    </tr>
                    <tr class="input_step">
                        <td>Step 1.</td>
                        <td>
                            <textarea class="form-control" name="" rows="6" style="resize: none;" required></textarea>
                        </td>
                        <!-- 순서 이미지 파일 첨부 -->
                        <!-- 이미지 추가 누르면 파일 첨부 가능하게 -->
                        <td>
                            <div class="add_step_img">
                                이미지 추가
                                <input type="file">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <button type="button" id="addStep" class="btn btn-sm" style="width: 80px; background-color: rgb(94, 94, 94); color: white;">순서추가</button>
                            <button type="button" id="deleteStep" class="btn btn-outline-danger btn-sm" style="width: 80px;">순서삭제</button>
                        </td>
                    </tr>
                    <script>
                        let countStep = 1;

                        $("#addStep").click(function(){
                            countStep++;
                            const stepContent = '<td><textarea class="form-control" name="" rows="6" style="resize: none;" required></textarea></td>';
                            const stepImg = '<td><div class="add_step_img">이미지 추가<input type="file" required></div></td>';
                            let el = $("<tr></tr>").addClass("input_step").html("<td>Step " + countStep + ".</td>" + stepContent + stepImg);
                            $("#addStep").parent().parent().before(el);
                        })

                        $("#deleteStep").click(function(){
                            if(countStep > 1){
                                countStep--;
                                $(this).parent().parent().prev().remove();
                            }
                        })
                    </script>
                    <!-- 태그 입력 -->
                    <tr>
                        <!-- 정규표현식으로 공백문자로 구분이 안되어있으면 등록 안되게 -->
                        <td>태그</td>
                        <td><input class="form-control" type="text" placeholder="#간장 #고추장 (태그 사이 공백으로 구분)"></td>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <button class="btn" style="width: 100px; background-color: rgb(192, 57, 43); color: white;">수정</button>
                </div>
                <br><br>
            </form>
	     </section>
	     <!-- Section end -->
	     
	     <%@ include file="/views/common/footer.jsp" %>
	     
	 </div>

</body>
</html>
