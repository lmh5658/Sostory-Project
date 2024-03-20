<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.product.model.vo.*, java.util.List, com.sos.member.model.vo.Member" %>
<%
	Product pro = (Product)request.getAttribute("pro");
	
	List<Member> list = (List<Member>)request.getAttribute("list");
	// 결제 여부 확인 리스트 회원번호, 회원아이디
	List<ProductRecipe> rlist =(List<ProductRecipe>)request.getAttribute("rlist");
	// 레시피번호, 사용자아이디, 상품이름, 카테고리이름, 레시피제목, 파일경로, 레시피설명, 레시피좋아요수 COUNT
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  
    	/* 상품상세페이지 관련 스타일 */
        .main-content{display: flex; flex-direction: column;}
        .content-product-list{display: flex; flex-direction: column;}
        .product-thumbnail-list .product:hover, .recipe:hover, .recipe-product:hover{cursor: pointer; opacity: 0.8;}
        .recipe-product{display: flex;}

        .more-product{
            margin-top: 20px;
        }

        .pagination{
            margin-top: 30px;
        }
        .select-product{
            margin-bottom: 20px;
        }

        
        .main_left{
            margin-right: 30px;
        }
        .address_information{
            margin-bottom: 30px;
        }

        .product_detail_nav{height: 30%; display: flex; background: gray;}
        .product_detail_nav>a {
            color: black;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
            flex-grow: 1; /* a태그 균일하게 4등분*/
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .product_detail_nav>a:hover{
            background:lightgrey;
        }
        
		.modal-title{
		    padding: 8px 0;
		}
		
		.modal-content{
		    margin-top: 220px;
		    border-radius: 20px;
		}
		
		.modal-body>form>.form-field{
		    margin-top: 30px;
		}
		
		.modal-body>form>div>label{
		    width: 150px;
		    font-size: 20px;
		    font-weight: bold;
		    margin-top: 5px;
		}
		
		.modal-content .modal-button{
		    margin: 30px 0 5px 0;
		    display: flex;
		    justify-content: center;
		}
		
		.modal-content #qna-content{
		    position: relative;
		    z-index: 1;
		}
		
		.modal-content .count-text-area{
		    position: absolute;
		    z-index: 10;
		    bottom: 120px;
		    right: 40px;
		    color: rgb(186, 181, 181);
		}


</style>

</head>
<body>
<div class="wrap">
	 <!-- Header start -->
        <%@ include file="/views/common/header.jsp" %>

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
            
            <!-- Section start -->
            <section class="main">
                <h3 style="margin-top: 150px; margin-bottom: 20px;">HOME><%= pro.getCategoryNo() %></h3>

                <!-- 상품상세 상단 start -->
                <div class="main_top d-flex flex-direction">


                        <div class="main_left">
                            <img class="product-img" src="<%= pro.getPath() %>" style="width:500px; height: 100%;">

                        </div>

                        <div class="main_right d-flex flex-column">

                                    <div class="main_right_top">
                                        <h1><b><%= pro.getProductName() %></b></h1>
                                         <% if(pro.getDiscountPrice() == 0){ %>
                                        <span><h1 style="padding-top: 20px; color: rgba(173, 10, 10, 0.674);"><b><%= pro.getPrice()+ pro.getDiscountPrice() %>원</b></h1></span>
                                        <% }else{ %>
                                        <span><h1 style="padding-top: 20px; color: rgba(173, 10, 10, 0.674);"><b><%= pro.getPrice() - pro.getDiscountPrice()%>원</b></h1></span>
                                        <h4 style="color: gray;">&nbsp;<del><%= pro.getPrice()+ pro.getDiscountPrice() %>원</del></h4>
                                        <hr>
                                        <% } %>
                                        
                                    </div>

                                    <div class="main_right_middle d-flex flex-column">
                                        
                                            <div class="address_information">
                                                <button type="button" class="btn btn-outline-dark">배송정보</button>
                                            
                                                <span style="font-size: 20px; color: gray;"> 3,000원 </span>
                                                
                                            </div>
                                            <div class="amount">
                                                
                                                <button type="button" class="btn btn-outline-dark">수량선택</button>
                                                <input type="button" value="-" style="width: 30px;" onclick= id="minus">
                                                <div id="result">0</div>
                                                <input type="button" value="+" style="width: 30px;" id="plus">
        
                                            </div>
                                            <hr>
                                            
                                            
                                        
                                    </div>
                                    


                                    <div class="main_right_bottom d-flex flex-column">

                                            <div class="main_right_bottom_top">
                                                <span class="d-flex center" style="font-size: 30px;"><b>총 금액</b></span>
                                                <span class="d-flex center"><b style="color:rgba(173, 10, 10, 0.674); font-size: 30px;"> 50,000원</b></span>
                                                
                                            </div>

                                            <div class="main_right_bottom_bottom d-flex flex-direction ">


                                                <div class="my-5 w-100 center">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="like me-4" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                                        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
                                                    </svg>
                                                </div>
                                                <div class="my-5 w-100 center">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="cart me-3" viewBox="0 0 16 16" onclick="클릭시실행될함수">
                                                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                                                    </svg>
                                                </div>
                                                <div class="my-5 w-100">
                                                    <button type="button" class="btn btn-outline-dark" style="width: 150px;">구매하기</button>
                                                </div>

                                            </div>

                                    </div>




                        </div>

                 </div>
                  <!-- 상품상세 상단 end -->
                 <br><br>

                 <!-- 상품상세 하단 start -->
                <div class="main_bottom">
                    <nav class="product_detail_nav">
                        <a href="#proinfor">상세정보</a>
                        <a href="#proReview">상품리뷰</a>
                        <a href="#proQna">상품문의</a>
                    
                    </nav>

                    <div class="main_bottom_img" id="proinfor">
                        <img src="./resources/images/상품상세이미지.png" style="width:100%; height: 100%;">
                    </div>
                    <!-- 레시피 커뮤니티 리스트 start -->
                    <div class="recipe-list  d-flex w-100 justify-content-evenly p-5" style="background-color:cornsilk;">

                        <!-- 레시피 썸네일 start -->
                       <% if(!rlist.isEmpty()) { %>
                        <% for(ProductRecipe pr : rlist) {  %>
                        
                        <div class="recipe-wrap">
                            <div class="recipe" style="width:300px">
                            	<div style="height:300px; width:300px;">
                                	<img class="recipe-img-top" src="<%= contextPath + "/" + pr.getThumbnailUrl() %>" alt="Card image" style="width:100%; height:100%; border-radius: 30px;">
                            	</div>
                                <div class="recipe-body">
                                    <small class="recipe-category d-block text-secondary my-3">분류><%= pr.getCategoryNo() %></small>
                                    <h7 class="recipe-title"><b><%= pr.getRecipeTitle() %></b></h7>
                                    <small class="recipe-intro d-block text-secondary text-wrap my-2"><%= pr.getRecipeIntro() %></small>
                                    <div class="recipe-etc d-flex my-3 mt-4 border-bottom pb-2">
                                        <div class="recipe-writer" style="padding-right: 100px;">
                                            <h6 class="profile">
                                                <!-- 레시피 작성자 프로필 사진 -->
                                                <img src="<%=contextPath + "/" + pr.getUserPath() %>" alt="user profile image" class="rounded-circle border" style="width: 20px; height: 20px;">
                                                <div class="d-inline center ms-1"><small><%= pr.getUserNo() %> </small></div>
                                            </h6>
                                        </div>
                                        <div class="recipe-good d-flex justify-content-end">
                                            <!-- 레시피 좋아요 -->
                                            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="icon-good me-3" viewBox="0 0 16 16" onclick="클릭시실행함수()">
                                                <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                            </svg>
                                            <!-- 레시피 좋아요 총 갯수 -->
                                            <div class="total-good">(<%=pr.getLikeCount() %>)</div>
                                        </div>
                                    </div> <!-- 레시피 etc end -->
                                </div> <!-- 레시피 body end -->

                                <!-- 레시피 관련상품 영역 start -->
                                <div class="recipe-product border-top d-flex pt-4" style="display: flex;">
                                    <div class="recipe-product-img border me-4" style="width: 100px; height: 100px;">
                                        <!-- 레시피 관련 상품 이미지 -->
                                        <img src="<%= contextPath + "/" + pr.getProductPath() %>" alt="" style="width: 100%; height: 100%;">
                                    </div>
                                    <div class="recipe-product-detail">
                                        <div class="recipe-product-title"><h6 class="fw-bold"><b class="text-danger">[HOT]&nbsp;</b><%=pr.getProductNo() %></h6></div>
                                        <div class="recipe-product-price text-secondary mt-5"><h6><%= pr.getProductPrice() %>원</h6></div>
                                    </div>
                                </div>
                                <!-- 레시피 관련상품 영역 end -->
                            </div>
                        </div>
                        <!-- 레시피 썸네일 end -->
                        
						<% } %>
					 <% } %>
                    </div>
                    <!-- 레시피 커뮤니티 리스트 end -->

                    <br><br>
                    
                
                    <!-- 상품상세 리뷰 start-->
                    <!-- 상품상세 리뷰에 첨부파일 없이 -->
                    <div class="main_bottom_rev d-flex flex-column" id="proReview">

                        <div>
                            <span><b style="font-size: 30px;">상품리뷰</b></span>

                            <!-- 상품을 구매한 회원에게 보여지는 요소 -->
                            <span class="d-flex justify-content-end">
                            <% for(Member m : list) { %>
	                            <% if(loginUser != null && loginUser.getUserId().equalsIgnoreCase(m.getUserId())) { %>
	                            <button class="btn btn-outline-dark" onclick="insertReview();">후기 작성하기</button>
                            	<% } %>
                            <% } %>                            
                            </span>
                        </div>

                        <br>
                      
                        <div class="d-flex" style="border: 1px solid black; border-radius: 10px; height: 200px;">
                            <div class="" style="margin-top: 20px; margin-bottom: 20px; margin-right: 20px;">
                                <h2 style="margin-left: 10px;">평점</h2>
								
                                <select class="form-control" style="width: 100px; margin-left: 10px;" id="category">
                                <% for(int i=1; i<=5; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                <% } %>
                                </select>         
                                    
                            </div>
                                
                             <div class="" style="margin-top: 20px; margin-bottom: 20px; margin-right: 20px;">
                                <h2>리뷰내용</h2>
                                <textarea rows="3" class="form-control" style="resize: none; width: 600px;" id="reply_content" name="content"></textarea>
                                
                            </div>
                            
                        </div>
                                
						
						
                        <hr>
                        <div class="rev_content" id="tableReview">
                           
                            <table class="table"> <!-- 부트스트랩 테이블에 줄넣어주기 -->
                                <thead>
                                    <tr>
                                        <th width="400px">리뷰내용</th>
                                        <th>평점</th>
                                        <th width="120px">작성자</th>
                                        <th>작성일</th>
                                    </tr>
                                </thead>
        
                                <tbody>
                                    
                                </tbody>
        
        
                            </table>
                            <!-- 페이징 바 -->
                            <ul class="pagination justify-content center" id="reviewPaging">
                               
                             </ul>
        
                        </div>


                    </div>
                    <!-- 상품상세 리뷰 end -->
                    
                    <script>

                       	$(function(){
                       		
                       		selectReview(1);
                       		selectQna(1);
                       		
                       		$("#prod_btn").click(function(){
                       			alert("로그인 먼저 해주세요");
                       		})
                       	})
                       	
                       	function insertReview(){
                       		
	                       	$.ajax({
                        		url:"<%=contextPath%>/rinsert.pr",
                        		data:{
                        			proNo:<%=pro.getProductNo()%>,
                        			category:$("#category").val(),
                        			content:$("#reply_content").val()
                        		},
                        		type:"post",
                        		success:function(result){
                        			if(result > 0){
                        				selectReview(1);
                        			}
                        		}
	                        })
                       		
                       	}
                       	
                       	function selectReview(requestPage){
                       		$.ajax({
                       			url:"<%=contextPath%>/rlist.pr",
                       			data:{
                       				proNo:<%= pro.getProductNo() %>,
                             				page:requestPage//요청할페이지번호(매개변수활용)
                             			}, // 실행되는 servlet에서는 응답데이터로 PageInfo, ArrayList<리뷰>
                             			type:"post",
                             			success:function(result){
                             				console.log(result); // {pi:{}, rlist:[{}, {},.. ]}
                             				
                             				
                             				let page = "";
                             				// pi(PageInfo객체)가지고 아래의 li요소들 만들어서 #reviewPaging(ul) 요소 내에 넣어주기
                             				if(1 == result.pi.currentPage){
                             					page += '<li class="page-item disabled"><a class="page-link">previous</a><li>';
                             				}else{
                             					page += '<li class="page-item"><a class="page-link" onclick="selectReview(' + (requestPage - 1) + ')">previous</a><li>';
                             				}
  				
                        					for(let i= result.pi.startPage; i<=result.pi.endPage; i++){
                        						if(i == result.pi.currentPage){
                        							page += '<li class="page-item active"><a class="page-link">' + i + '</a></li>';
                        						}else{
                        							page += '<li class="page-item" onclick="selectReview(' + i + ')"><a class="page-link">' + i + '</a></li>';                        							
                        						}
                        					}
                        					
                        					if(result.pi.currentPage == result.pi.MaxPage){
                             					page +='<li class="page-item disabled"><a class="page-link">Next</a></li>';			                        						
                        					}else{
                        						page +='<li class="page-item "><a class="page-link" onclick="selectReview(' + (requestPage + 1) + ')">Next</a></li>';	
                        					}
                        					
                        					console.log(page);
											
                             				$("#reviewPaging").html(page);
                             			
                             				
                             				/*
                             					   <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					                               <li class="page-item active"><a class="page-link" onclick=""selectReview(1);">1</a></li>
					                               <li class="page-item"><a class="page-link">2</a></li>
					                               <li class="page-item"><a class="page-link">3</a></li>
					                               <li class="page-item"><a class="page-link">4</a></li>
					                               <li class="page-item"><a class="page-link">5</a></li>
					                               <li class="page-item"><a class="page-link">Next</a></li>
                             				*/
                             				
                             				// rlist(List<Review>객체) 가지고 반복적으로 아래의 tr요소들 만들어서 tbody에 뿌리기 
                             				
                             			
                             				let value = "";
                             				
                           					for(let i=0; i<result.rlist.length; i++){
                            					value += "<tr>"
                            						   + "<td>" + result.rlist[i].reviewContent + "</td>"
                            						   + "<td>" + result.rlist[i].rating + "</td>"
                            						   + "<td>" + result.rlist[i].writerNo + "</td>"
                            						   + "<td>" + result.rlist[i].postDate + "</td>"
                            						   + "</tr>";
                           					}
                           					$("#tableReview tbody").html(value);
                             				
                             				
                             			}
                             		})
                             	}
                             	
                             
                             	function selectQna(requestPage){
                             		$.ajax({
                             			url:"<%=contextPath%>/qlist.pr",
                             			data:{
                             				proNo:<%= pro.getProductNo() %>,
                             				page : requestPage
                             			},
                             			post:"post",
                             			success:function(result){
                             				console.log(result);
  
                             				let page = "";
                             				if(1 == result.pi.currengPage){
                             					page += '<li class="page-item disabled"><a class="page-link">previous</a><li>';
                             				}else{
                             					page += '<li class="page-item"><a class="page-link" onclick="selectReview(' + (requestPage - 1) + ')">previous</a><li>';
                             				}
  				
                        					for(let i= result.pi.startPage; i<=result.pi.endPage; i++){
                        						if(i == result.pi.currentPage){
                        							page += '<li class="page-item active"><a class="page-link">' + i + '</a></li>';
                        						}else{
                        							page += '<li class="page-item" onclick="selectReview(' + i + ')"><a class="page-link">' + i + '</a></li>';                        							
                        						}
                        					}
                        					
                        					if(result.pi.currentPage == result.pi.MaxPage){
                             					page +='<li class="page-item disabled"><a class="page-link">Next</a></li>';			                        						
                        					}else{
                        						page +='<li class="page-item "><a class="page-link" onclick="selectReview(' + (requestPage + 1) + ')">Next</a></li>';	
                        					}
                        					
                        					$("#qna_page").html(page);
                        					
                        					let value = "";            					
                        					for(let i=0; i<result.qlist.length; i++){
                            					value += "<tr>"
                            						   + "<td>" + result.qlist[i].answerNo + "</td>"
                            						   + "<td>" + result.qlist[i].answerTitle + "</td>"
                            						   + "<td>" + result.qlist[i].userNo + "</td>"
                            						   + "<td>" + result.qlist[i].answerType + "</td>"
                            						   + "<td>" + result.qlist[i].answerDate + "</td>"
                            						   + "</tr>";
                           					}
                        					
                           					$("#qna_table tbody").html(value);
                           					
                           					
                             				
                             			}                            			
                             		})
                             	}
                             	
                           		function insertQna(){
                           			/*
                           			a.jax({
                           				url: "<%=contextPath%>/minsert.pr",
                           				data:{
                           					title:$("#qna-title").val(),
                           					content:$("#qna-content").val()
                           					proNo:<%= pro.getProductNo() %>
                           					upfile:
                           				},
                           				type:"post",
                           				success:function(){
                           					
                           				}
                           	
                           			})
                           			*/
                           			
                           			location.reload();
                           			
                           		}
                             		
                             		
                             		
                             	
                             </script>


                    <!-- 상품상세 문의 start -->

                       <!-- 상품상세 문의 팝업창으로 띄워주기 jsp -->
                    <div class="main_bottom_rev d-flex flex-column">

                        <div>
                            <span><b style="font-size: 30px;">상품문의</b></span>
						</div>
                            <!-- 현재 로그인된 상태일 경우 보여지는 요소 -->
                         <% if(loginUser != null) { %>
                         <span class="d-flex justify-content-end"> <button type="button" class="btn text-primary" data-toggle="modal" data-target="#qna">상품문의</button></span>
                            
                            

                        <!-- 문의수정 팝업창(수정버튼 클릭시 팝업창뜸) start -->
                        <div class="modal" id="qna">
                            <div class="modal-dialog modal-lg">
                            <div class="modal-content px-3" style="border: 1px solid;">
                            
                                <!-- 문의수정 팝업창 Header -->
                                <div class="modal-header modal-title">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="user-icon me-4 mb-2" viewBox="0 0 16 16">
                                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                                    </svg>
                                    <h4><b>상품문의</b></h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <!-- 문의수정 팝업창 body -->
                                <div class="modal-body">
    
                                    <form action="<%= contextPath %>/minsert.pr" method="post" class="form-group" enctype="multipart/form-data">
    									<input type="hidden" name="proNo" value="<%= pro.getProductNo() %>">
    									<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                                        <div class="d-flex form-field">
                                            <label for="qna-title" class="mr-sm-2">제목</label>
                                            <input type="text" class="form-control qna-title" id="qna-title" name="title">
                                        </div>
                                        
                                        <div class="d-flex form-field">
                                            <label for="qna-content" class="mr-sm-2">문의사항</label>
                                            <textarea id="qna-content" class="form-control qna-content" cols="30" rows="10" maxlength="500" style="resize: none; text-align: justify;" placeholder="내용을 입력해주세요 / 500자" name="content"></textarea>
                                            <div class="count-text-area" style="margin:30px;">
                                                <label class="count-text"></label>/500
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex form-field">
                                            <label for="qna-attachment" class="mr-sm-2">첨부파일</label>
                                            <input type="file" class="form-control" id="qna-attachment" name="upfiles">
                                        </div>

                                        <div class="modal-button">
                                            <button type="reset" class="btn btn-secondary me-3 px-4" data-dismiss="modal">뒤로가기</button>
                                            <button type="submit" class="btn btn-danger me-3 px-4" >문의</button>
                                        </div>
    
                                   </form>
    
                                </div>
                                
                            </div>
                            </div>
                            <% }else{%>
                            <span class="d-flex justify-content-end"> <button type="button" class="btn text-primary" id="prod_btn">상품문의</button></span>
                            <% } %>
                        </div>
                        <!-- 문의수정 팝업창 end -->

                        <hr>
                        <div class="qna_content">
                           
                            <table class="table" id="qna_table"> <!-- 부트스트랩 테이블에 줄넣어주기 -->
                                <thead>
                                    <tr>
                                        <th width="100px">문의번호</th>
                                        <th width="400px">문의제목</th>
                                        <th width="120px">작성자</th>
                                        <th>답변상태</th>
                                        <th>작성일</th>
                                    </tr>
                                </thead>
        
                                <tbody>
                                    
                                    
                                </tbody>
        
        
                            </table>
                            <!-- 페이징 바 -->
                            <ul class="pagination justify-content center" id="qna_page">
                              
                            </ul>
        
                        </div>


                    </div>


                    <!-- 상품상세 문의 end -->







                   
                    
                </div>
                <!-- 상품상세 하단 end -->
                 


                </section>
                <!-- Section end -->






        

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

        <!-- Footer start -->
        <%@ include file="/views/common/footer.jsp" %>
        <!-- Footer end -->
    </div>
    
</div>
</body>
</html>