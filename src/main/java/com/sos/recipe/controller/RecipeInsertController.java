package com.sos.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.member.model.service.MemberService;
import com.sos.recipe.model.sevice.RecipeService;
import com.sos.recipe.model.vo.OrderProduct;
import com.sos.recipe.model.vo.Recipe;
import com.sos.recipe.model.vo.RecipeInsert;

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
		//int userNo = Integer.parseInt(request.getParameter("no"));

		
		//레시피 a 파라미터 받아서 한꺼번에 넘기기
		RecipeInsert a = new RecipeInsert(request.getParameter("productName"),//select된 것 드롭다운. select에 name 값 넣어서 보내기 
									request.getParameter("recipeName"),
									request.getParameter("thumbnailUrl"),
									request.getParameter("recipeIntro"),
									Integer.parseInt(request.getParameter("serving")),
									Integer.parseInt(request.getParameter("cookingTime")),
									request.getParameter("difficulty")//select된 것 드롭다운. select에 name 값 넣어서 보내기 
				                    ); // cookingTime 파라미터를 정수로 변환
		//재료
		/*List<Recipe> list = ingredientName, ingredientAmount, 수량은 jsp에서 따로 파라미터 저장해서 보내기*/

			RecipeInsert ingredient = new RecipeInsert (request.getParameter("ingredientName"),
											    	request.getParameter("amount"),
											     	request.getParameter("unit"));
		
		
		//스텝
		/*List<Recipe> steplist = stepNo, STEP_CONTENT, STEP_ATTACHMENT_URL*/

			RecipeInsert step = new RecipeInsert (Integer.parseInt(request.getParameter("stepNo")),
													Integer.parseInt(request.getParameter("no")),
											    	request.getParameter("stepContent"),
											     	request.getParameter("stepAttachUrl"));
				  
		
		//재료 삭제는 i = 0 // 재료명 name = 0 -> 비교 for 같은 번호가 없을경우 스킵, 같은 번호가 존재할 경우 -> not null
		//키값으로 넘기면 사이즈또는 랭쓰로 서블릿측에서 알아내고 그만큼 포문을 돌리고 그 포문 안에서 if문으로 그 파라미터의 인덱스가 0부터 그 길이만큼 돌아서 null이 아닌것만 해가지고 

			int aRsult = new MemberService().insertMember(a); //강의 한 번 듣고 하자
			int ingredientResult = new RecipeService().insertIngredientList(ingredient);
			int stepResult = new RecipeService().insertStepList(step);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
