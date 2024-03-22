package com.sos.recipe.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeEnroll
 */
@WebServlet("/insert.re")
public class RecipeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("no"));
	
		
		//레시피 a 파라미터 받아서 한꺼번에 넘기기
			Recipe a = new Recipe(request.getParameter("productName"),//select된 것 드롭다운. select에 name 값 넣어서 보내기 
									request.getParameter("recipeTitle"),
									request.getParameter("thumbnailUrl"),
									request.getParameter("recipeIntro"),
									request.getParameter("difficulty"),//select된 것 드롭다운. select에 name 값 넣어서 보내기 
									request.getParameter(Integer.parseInt(("serving")),
									request.getParameter(Integer.parseInt(("cookingTime"))); //파라미터 값 인트형으로 바꾸기

		//재료
		/*List<Recipe> list = ingredientName, ingredientAmount, 수량은 jsp에서 따로 파라미터 저장해서 보내기*/
		
		//스텝
		/*List<Recipe> steplist = stepNo, STEP_CONTENT, STEP_ATTACHMENT_URL*/

		
		
		//재료 삭제는 i = 0 // 재료명 name = 0 -> 비교 for 같은 번호가 없을경우 스킵, 같은 번호가 존재할 경우 -> not null
		//키값으로 넘기면 사이즈또는 랭쓰로 서블릿측에서 알아내고 그만큼 포문을 돌리고 그 포문 안에서 if문으로 그 파라미터의 인덱스가 0부터 그 길이만큼 돌아서 null이 아닌것만 해가지고 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
