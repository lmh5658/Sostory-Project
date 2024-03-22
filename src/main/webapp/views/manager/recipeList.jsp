<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>레시피 목록</title>
        <style>
        	.section_1{
	            margin: auto;
	            width: 100%;
	            max-width: 100%;
	            height: 80%;
	            display: flex;
	         }
	        
            /*레시피관리>레시피조회 스타일*/
            .section_right {
                margin: 30px;
                width: 100%;
                min-height: 1300px;
            }

            .section_title {
                display: flex;
                border-bottom: 2px solid gray;
            }

            .section_title label {
                font-weight: bold;
                font-size: 23px;
            }

            .pagination {
                z-index: 0;
            }

            .rec_user {
                display: flex;
                justify-content: space-between;
                margin-top: 40px;
                border-bottom: 2px solid gray;
            }

            .rec_search {
                display: flex;
                justify-content: center;
                width: 400px;
            }

            .rec_search button {
                width: 100px;
                background-color: #c20000;
                /* 배경색 설정 */
                color: #ffffff;
                /* 텍스트 색상 설정 */
                border: none;
                /* 테두리 제거 */
                font-weight: bold;
                height: 100%;
                border-radius: 6px;
            }

            .rec_m {
                width: 95%;
                min-height: 1000px;
                display: flex;
                flex-wrap: wrap;
                margin: auto;
                justify-content: space-around;
            }

            .user_rec {
                margin-left: 40px;
                background-color: gray;
                width: 400px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 20px;
                font-weight: bold;
                color: white;
            }

            .rec_name {
                width: 120px;
                background-color: rgb(213, 213, 213);
                display: flex;
                justify-content: center;
                align-items: center;
                font-weight: bold;
            }

            .rec_main {
                border: 1px solid black;
                margin-top: 50px;
                width: 450px;
                height: 500px;
            }

            .pagination {
                margin-top: 20px;
                display: flex;
                justify-content: center;
            }

            .rec_top {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 5px;
            }

            .rec_img {
                width: 90%;
                height: 200px;
                border: 1px solid black;
                margin-left: 22px;
            }

            .good_count {
                height: 40px;
                border-bottom: 2px solid gray;
                text-align: right;
            }

            .good_count>label {
                margin-top: 7px;
                margin-right: 20px;
                font-weight: bold;
            }

            .rec_bottom {
                display: flex;
                width: 100%;
                height: 41%;
            }

            .rec_bottom_img {
                width: 100%;
                height: 210px;
                display: flex;
                flex-direction: column;
                border-left: 2px solid gray;
            }

            .rec_bottom_img img {
                width: 80%;
                height: 80%;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-left: 18px;
                margin-top: 13px;
                margin-bottom: 3px;
                border: 2px solid rgb(191, 191, 191);
            }

            .rec_bottom_img label {
                width: 100%;
                height: 20%;
                text-align: center;
                background-color: gainsboro;
                border-radius: 10px;
            }

            tr {
                border: 1px solid black;
            }

            .section_title b {
                font-size: 20px;
            }
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

                <!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

                <!-- Section start -->
                <section class="main-content">
                    <div class="section_1">

                        <%@ include file="/views/common/managerMenu.jsp" %>

                        <!-- 사이드메뉴바 클릭시 바뀌는 화면-->
                        <div class="section_right">
                            <div class="section_title" style="border-bottom: 2px solid gray">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                    class="bi bi-house-gear-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M7.293 1.5a1 1 0 0 1 1.414 0L11 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l2.354 2.353a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708z" />
                                    <path
                                        d="M11.07 9.047a1.5 1.5 0 0 0-1.742.26l-.02.021a1.5 1.5 0 0 0-.261 1.742 1.5 1.5 0 0 0 0 2.86 1.5 1.5 0 0 0-.12 1.07H3.5A1.5 1.5 0 0 1 2 13.5V9.293l6-6 4.724 4.724a1.5 1.5 0 0 0-1.654 1.03" />
                                    <path
                                        d="m13.158 9.608-.043-.148c-.181-.613-1.049-.613-1.23 0l-.043.148a.64.64 0 0 1-.921.382l-.136-.074c-.561-.306-1.175.308-.87.869l.075.136a.64.64 0 0 1-.382.92l-.148.045c-.613.18-.613 1.048 0 1.229l.148.043a.64.64 0 0 1 .382.921l-.074.136c-.306.561.308 1.175.869.87l.136-.075a.64.64 0 0 1 .92.382l.045.149c.18.612 1.048.612 1.229 0l.043-.15a.64.64 0 0 1 .921-.38l.136.074c.561.305 1.175-.309.87-.87l-.075-.136a.64.64 0 0 1 .382-.92l.149-.044c.612-.181.612-1.049 0-1.23l-.15-.043a.64.64 0 0 1-.38-.921l.074-.136c.305-.561-.309-1.175-.87-.87l-.136.075a.64.64 0 0 1-.92-.382ZM12.5 14a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3" />
                                </svg>레시피관리><b>레시피조회</b>
                            </div>

                            <!-- 레시피 조회 -->
                            <div class="rec_user">
                                <div class="user_rec">사용자 등록 레시피</div>
                                <div class="rec_search">
                                    <div class="rec_name">상품명</div>
                                    <input type="text" class="form-control">
                                    <button>조회</button>
                                </div>
                            </div>

                            <div class="rec_m">
                                <div class="rec_main">
                                    <div class="rec_top">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="33" height="33"
                                                fill="currentColor" class="bi bi-person-square" viewBox="0 0 16 16"
                                                style="margin-top: -4px;">
                                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                                                <path
                                                    d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z" />
                                            </svg>
                                            <label style="font-weight: bold; font-size: 20px;">사용자 아이디</label>
                                        </div>
                                        <div style="margin-right: 10px;">
                                            <label>작성일 2024 02-26</label>
                                        </div>
                                    </div>

                                    <div class="rec_img">
                                        <img src="resourcces/images/이미지2.jpg" alt=""
                                            style="width: 100%; height: 100%;">
                                    </div>
                                    <div class="good_count">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                            fill="currentColor" class="bi bi-hand-thumbs-up-fill"
                                            viewBox="0 0 16 16" style="color: red; margin-bottom: 5px">
                                            <path
                                                d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
                                        </svg>
                                        <label>(100)</label>
                                        <label>조회수 4.1만</label>
                                    </div>
                                    <div class="rec_bottom">
                                        <div style="margin: 7px;">
                                            <table style="width: 250px; text-align: center; height: 100%;">
                                                <tr>
                                                    <th colspan="3">관련 상품 매출현황</th>
                                                </tr>
                                                <tr>
                                                    <th>일간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                                <tr>
                                                    <th>주간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                                <tr>
                                                    <th>월간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="rec_bottom_img">
                                            <img src="resourcces/images/이미지3.jpg" alt="">
                                            <label>칼로리 zero 머스타드</label>
                                        </div>
                                    </div>

                                </div>
                                <div class="rec_main">
                                    <div class="rec_top">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="33" height="33"
                                                fill="currentColor" class="bi bi-person-square" viewBox="0 0 16 16"
                                                style="margin-top: -4px;">
                                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                                                <path
                                                    d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z" />
                                            </svg>
                                            <label style="font-weight: bold; font-size: 20px;">사용자 아이디</label>
                                        </div>
                                        <div style="margin-right: 10px;">
                                            <label>작성일 2024 02-26</label>
                                        </div>
                                    </div>

                                    <div class="rec_img">
                                        <img src="resourcces/images/이미지2.jpg" alt=""
                                            style="width: 100%; height: 100%;">
                                    </div>
                                    <div class="good_count">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                            fill="currentColor" class="bi bi-hand-thumbs-up-fill"
                                            viewBox="0 0 16 16" style="color: red; margin-bottom: 5px">
                                            <path
                                                d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
                                        </svg>
                                        <label>(100)</label>
                                        <label>조회수 4.1만</label>
                                    </div>
                                    <div class="rec_bottom">
                                        <div style="margin: 7px;">
                                            <table style="width: 250px; text-align: center; height: 100%;">
                                                <tr>
                                                    <th colspan="3">관련 상품 매출현황</th>
                                                </tr>
                                                <tr>
                                                    <th>일간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                                <tr>
                                                    <th>주간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                                <tr>
                                                    <th>월간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="rec_bottom_img">
                                            <img src="resourcces/images/이미지3.jpg" alt="">
                                            <label>칼로리 zero 머스타드</label>
                                        </div>
                                    </div>

                                </div>
                                <div class="rec_main">
                                    <div class="rec_top">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="33" height="33"
                                                fill="currentColor" class="bi bi-person-square" viewBox="0 0 16 16"
                                                style="margin-top: -4px;">
                                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                                                <path
                                                    d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z" />
                                            </svg>
                                            <label style="font-weight: bold; font-size: 20px;">사용자 아이디</label>
                                        </div>
                                        <div style="margin-right: 10px;">
                                            <label>작성일 2024 02-26</label>
                                        </div>
                                    </div>

                                    <div class="rec_img">
                                        <img src="resourcces/images/이미지2.jpg" alt=""
                                            style="width: 100%; height: 100%;">
                                    </div>
                                    <div class="good_count">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                            fill="currentColor" class="bi bi-hand-thumbs-up-fill"
                                            viewBox="0 0 16 16" style="color: red; margin-bottom: 5px">
                                            <path
                                                d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
                                        </svg>
                                        <label>(100)</label>
                                        <label>조회수 4.1만</label>
                                    </div>
                                    <div class="rec_bottom">
                                        <div style="margin: 7px;">
                                            <table style="width: 250px; text-align: center; height: 100%;">
                                                <tr>
                                                    <th colspan="3">관련 상품 매출현황</th>
                                                </tr>
                                                <tr>
                                                    <th>일간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                                <tr>
                                                    <th>주간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                                <tr>
                                                    <th>월간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="rec_bottom_img">
                                            <img src="resourcces/images/이미지3.jpg" alt="">
                                            <label>칼로리 zero 머스타드</label>
                                        </div>
                                    </div>

                                </div>
                                <div class="rec_main">
                                    <div class="rec_top">
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="33" height="33"
                                                fill="currentColor" class="bi bi-person-square" viewBox="0 0 16 16"
                                                style="margin-top: -4px;">
                                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                                                <path
                                                    d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z" />
                                            </svg>
                                            <label style="font-weight: bold; font-size: 20px;">사용자 아이디</label>
                                        </div>
                                        <div style="margin-right: 10px;">
                                            <label>작성일 2024 02-26</label>
                                        </div>
                                    </div>

                                    <div class="rec_img">
                                        <img src="resourcces/images/이미지2.jpg" alt=""
                                            style="width: 100%; height: 100%;">
                                    </div>
                                    <div class="good_count">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                            fill="currentColor" class="bi bi-hand-thumbs-up-fill"
                                            viewBox="0 0 16 16" style="color: red; margin-bottom: 5px">
                                            <path
                                                d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
                                        </svg>
                                        <label>(100)</label>
                                        <label>조회수 4.1만</label>
                                    </div>
                                    <div class="rec_bottom">
                                        <div style="margin: 7px;">
                                            <table style="width: 250px; text-align: center; height: 100%;">
                                                <tr>
                                                    <th colspan="3">관련 상품 매출현황</th>
                                                </tr>
                                                <tr>
                                                    <th>일간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                                <tr>
                                                    <th>주간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                                <tr>
                                                    <th>월간</th>
                                                    <th style="color: red;">180,000</th>
                                                    <td>(수량 : 19개)</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="rec_bottom_img">
                                            <img src="resourcces/images/이미지3.jpg" alt="">
                                            <label>칼로리 zero 머스타드</label>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </div>
                    </div>


                </section>
                <!-- Section end -->

                <!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

                <%@ include file="/views/common/footer.jsp" %>
        </div>
    </body>

    </html>
