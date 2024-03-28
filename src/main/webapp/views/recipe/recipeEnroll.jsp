<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.recipe.model.vo.Recipe"%>
<%@ page import="com.sos.recipe.model.vo.OrderProduct"%>
<%@ page import="java.util.List" %>
<%@ page import="com.sos.recipe.model.vo.Step"%>
<%@ page import="com.sos.recipe.model.vo.Ingredient"%>
<% 
List<OrderProduct> list = (List<OrderProduct>)request.getAttribute("orderProduct");
Recipe recipe = (Recipe)request.getAttribute("recipe");
List<Step> step = (List<Step>)request.getAttribute("step");
List<Ingredient> ingredient = (List<Ingredient>)request.getAttribute("ingredient");
%>
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
    /*
    input[type=file]{display: none;}
    */
</style>
</head>
<body>

<div class="wrap">
		
		<%@ include file="/views/common/header.jsp" %>
		
		<% if(loginUser == null){ // alert 시킬 알람문구가 존재할 경우 %>
		  <script>
		     alert('로그인을 먼저 진행해주세요'); // 문자열 취급시 따옴표로 감싸야됨
		     location.href="<%=contextPath%>"
		  </script>
		<% } %>
		
	     <!-- Section start -->
	     <section class="main-content">

	         <!-- 커뮤니티 로고 -->
	        <div class="community_logo">
	            <p style="margin-bottom: 0;">community</p>
	            <img src="<%= contextPath %>/resources/images/community_logo.png" alt="community_logo">
	        </div>
	        <div class="underbar"></div>
	        <br><br><br>
            
            <form action="<%=contextPath %>/insert.re" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <th colspan="2" style="font-size: 20px; padding: 20px 0px; border-bottom: 1px solid lightgrey;">레시피등록</th>
                    </tr>
                    <!-- 레시피 정보 입력 여기 히든 다시 공부 -->
                    <tr>
                        <td width="150px">상품명</td>
                        <td width="400px">
                          <select class="product_name" name="productNo" onchange="updateHiddenCategoryNo()" required>
							    <option hidden selected value="disabled">상품을 선택하세요</option>
							    <!-- 히든으로 카테고리 번호도 같이 넘기기. -->
							    <% if (list != null) { %>
							        <% for (OrderProduct o : list) { %>
							            <option value="<%= o.getProductNo() %>" data-category-no="<%= o.getCategoryNo() %>"><%= o.getProductName() %></option>
							        <% } %>
							    <% } %>
							</select>
							<input type="hidden" id="categoryNo" name="categoryNo">
							<script>
							function updateHiddenCategoryNo() {
							    var selectedOption = document.querySelector('.product_name option:checked');
							    var selectedCategoryNo = selectedOption.dataset.categoryNo;
							    var hiddenCategoryNoField = document.getElementById('categoryNo');
							    hiddenCategoryNoField.value = selectedCategoryNo;
							}
							</script>
						
                        </td>
                    </tr>
                    <tr>
                        <td>제목</td>
                        <td><input class="form-control recipeTitle" type="text" name="recipeTitle" placeholder="최대 12글자" required></td>
                    </tr>
                    <tr>
                        <td>대표사진</td>
                        <td>
                        	<!-- 
                            <div class="thumbnail_img"><input type="file" name="thumbnailUrl" >대표사진 선택하기</div>
                             -->
                            <input type="file" name="thumbnailUpfile">
                        </td>
                    </tr>
                    <tr>
                        <td>간단소개</td>
                        <td><textarea class="form-control" name="recipeIntro" rows="2" placeholder="레시피 소개를 작성해주세요" style="resize: none;"></textarea></td>
                    </tr>
                    <tr>
                        <td>요리정보</td>
                        <td>
                        <input type="number" class="recipe_info" min="1" max="20" name="serving" placeholder="인원수" style="width: 70px;">&nbsp;인분&nbsp;&nbsp;&nbsp;
                        <input type="number" class="recipe_info" min="1" placeholder="소요시간" name="cookingTime" style="width: 90px;">&nbsp;분&nbsp;&nbsp;&nbsp;
                        <select class="recipe_info" name="difficulty" style="width: 80px;">
                            <option selected hidden value="disabled">난이도</option>
                            <option value="상">상</option>
                            <option value="중">중</option>
                            <option value="하">하</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>재료</td>
                        <td id="ingredientForm">
                            <input class="ingredient" type="text" style="width: 120px; margin-right: 20px;" name="ingredientName" placeholder="재료명" required>
                            <input class="ingredient" type="number" min="1" style="width: 120px;" name="amount" placeholder="수량" required>
                            <select class="ingredient" name="unit" style="width: 70px;" required>
                                <option selected hidden value="disabled">단위</option>
                                <option value="g">g</option>
                                <option value="kg">kg</option>
                                <option value="ml">ml</option>
                                <option value="L">L</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <button id="addIngredientButton" type="button" class="btn btn-sm" style="width: 80px; background-color: rgb(94, 94, 94); color: white;">재료추가</button>
                        </td>
                    </tr>
                    <script>
                        $(function(){
                            $("#addIngredientButton").click(function(){
                                const ingName = '<input class="ingredient" name="ingredientName" type="text" style="width: 120px; margin-right: 20px;" placeholder="재료명" required>';
                                const ingMount = '<input class="ingredient" name="amount" type="number" style="width: 120px;" placeholder="수량" required>';
                                const unit = '<select class="ingredient" name="unit" style="width: 70px;" required><option selected hidden>단위</option><option value="g">g</option><option value="kg">kg</option><option value="ml">ml</option><option value="L">L</option></select>';
                                const deleteButton = '<button type="button" class="btn btn-sm deleteButton" style="background-color: rgb(224, 224, 224);">삭제</button>';
                                let el = $("<tr></tr>").html("<td></td>" + '<td id="ingredientForm">' + ingName + "&nbsp;" +  ingMount + "&nbsp;" + unit + "&nbsp;" + deleteButton + "</td>");
                                $("#addIngredientButton").parent().parent().before(el);
                            })
    
                            $(document).on("click", ".deleteButton", function(){
                            	console.log("실행");
					            $(this).closest("tr").remove();
					        })
                        })
                    </script>
                    <!-- 조리순서 입력 -->
                    <tr>
                        <th colspan="3" style="font-size: 20px; padding: 20px 0px;">조리 순서</th>
                    </tr>
                    <tr class="input_step">
                        <td name="stepNo">Step 1.</td>
                        <td>
                            <textarea class="form-control" name="stepContent" rows="6" style="resize: none;" required></textarea>
                        </td>
                        <!-- 순서 이미지 파일 첨부 -->
                        <!-- 이미지 추가 누르면 파일 첨부 가능하게 -->
                        <td>
                        	<!-- 
                            <div class="add_step_img" name="stepAttachUrl">
                                이미지 추가
                            </div>
                             -->
                            <input type="file" name="stepUpfile1">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <button type="button" id="addStep" class="btn btn-sm" style="width: 80px; background-color: rgb(94, 94, 94); color: white;">순서추가</button>
                            <button type="button" id="deleteStep" class="btn btn-outline-danger btn-sm" style="width: 80px;">순서삭제</button>
                            <input type="hidden" id="stepCount" name="stepCount" value="1">
                        </td>
                    </tr>
                    <script>
                    	// 스텝 순서
                        let countStep = 1;

                        // 스텝 추가 버튼 이벤트
                        $("#addStep").click(function(){
                            countStep++;
                            const stepContent = '<td><textarea class="form-control" name="stepContent" rows="6" style="resize: none;" required></textarea></td>';
                            // const stepImg = '<td><div class="add_step_img">이미지 추가<input type="file" required></div></td>';
                            const stepFile = '<td><input type="file" name="stepUpfile' + countStep + '"></td>'
                            // let el = $("<tr></tr>").addClass("input_step").html("<td>Step " + countStep + ".</td>" + stepContent + stepImg);
                            let el = $("<tr></tr>").addClass("input_step").html("<td>Step " + countStep + ".</td>" + stepContent + stepFile);
                            $("#addStep").parent().parent().before(el);
                        })

                        $("#deleteStep").click(function(){
                            if(countStep > 1){
                                countStep--;
                                $(this).parent().parent().prev().remove();
                            }
                        })
                    	
                    	$("#addStep").click(function(){
                    		$("#stepCount").val(countStep);
                    	})
                    	$("#deleteStep").click(function(){
                    		$("#stepCount").val(countStep);
                    	})
                        
                        // 영역 클릭만으로 첨부가능
                        function chooseFile(index){
                            $(":file").eq(index).click();
                        }
						// 파일 첨부
                        function loadImg(index){
                            const inputFile = window.event.target;
                            console.log(inputFile.files[1]);
                            // 파일이 첨부 유무
                            if(inputFile.files.length == 1){
                                // fileReader : 파일을 읽어들이는 객체
                                const reader = new FileReader();
                                // 고유한 임시 url 생성
                                reader.readAsDataURL(inputFile.files[0]);
                                // 파일읽기 완료 시 실행할 함수 정의
                                reader.onload = function(e){
                                    // e.target.result : 읽어들인 파일로 생성된 임시 url
                                    $(".img_preview").eq(index).attr("src", e.target.result);
                                }
                            }else{ // 파일이 첨부에서 제거된 경우
                                $(".img_preview").eq(index).attr("src", null);
                            }
                        }
                    </script>
                   
                </table>
                <br>
                <div align="center">
                    <button class="btn" onclick="return enroll();" style="width: 100px; background-color: rgb(192, 57, 43); color: white;">등록</button>
                </div>
                <br><br>
            </form>
            
            <script>
            	function enroll(){
            		let disableSelected = true;
            		$("option:selected").each(function(){
            			if($(this).val() == "disabled"){
            				disableSelected = false;
            			}
            		})
            		if(!disableSelected){
            			alert("필수 입력사항을 확인해주세요");
            			return disableSelected;
            		}
            		
            		const regExp = /^.{1,12}$/;
            		console.log("실행됨");
            		if(!regExp.test($(".recipeTitle").val())){
            			alert("레시피 제목을 확인해주세요");
            			disableSelected = false;
            		}
            		
            		return disableSelected;
            	}
            </script>
	     </section>
	     <!-- Section end -->
	     
	     <%@ include file="/views/common/footer.jsp" %>
	     
	 </div>

</body>
</html>
