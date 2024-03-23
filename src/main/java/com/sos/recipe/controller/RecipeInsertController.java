package com.sos.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sos.member.model.service.MemberService;
import com.sos.recipe.model.sevice.RecipeService;
import com.sos.recipe.model.vo.Ingredient;
import com.sos.recipe.model.vo.OrderProduct;
import com.sos.recipe.model.vo.Recipe;
import com.sos.recipe.model.vo.Step;
import com.sos.member.model.vo.Member;

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
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
	  	System.out.println(categoryNo);
		
		HttpSession session = request.getSession();
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		//레시피 파라미터 받아서 한꺼번에 넘기기
		Recipe recipe = new Recipe( categoryNo,
									userNo,
									Integer.parseInt(request.getParameter("productNo")),//select된 것 드롭다운. select에 name 값 넣어서 보내기 
									request.getParameter("recipeTitle"),
									request.getParameter("thumbnailUrl"),
									request.getParameter("recipeIntro"),
									Integer.parseInt(request.getParameter("serving")), //인분
									Integer.parseInt(request.getParameter("cookingTime")),
									request.getParameter("difficulty")//select된 것 드롭다운. select에 name 값 넣어서 보내기 
				                    ); 
		
		
		//재료
		/*List<Recipe> list = ingredientName, ingredientAmount, 수량은 jsp에서 따로 파라미터 저장해서 보내기*/
			String[] IngredientName = request.getParameterValues("ingredientName");
			String[] amount = request.getParameterValues("amount");
			String[] unit = request.getParameterValues("unit");
			
			//차례대로 삭제가 아닌 어디서 삭제될지 모르므로 조건처리 해주며 unll이 아닌 값만 추가해줘야함
			List<Ingredient> Ingredient = new ArrayList<>();
			
			for(int i = 0; i<IngredientName.length; i++) {
				Ingredient.add(new Ingredient(IngredientName[i], amount[i], unit[i]));
			}
			
			

			/*Ingredient ingredient = new Ingredient (request.getParameter("ingredientName"),
											    	request.getParameter("amount"),
											     	request.getParameter("unit"));
		*/
		
		//스텝
		/*List<Recipe> steplist = stepNo, STEP_CONTENT, STEP_ATTACHMENT_URL*/
			String[] stepContent = request.getParameterValues("stepContent");
			String[] stepAttachUrl = request.getParameterValues("stepAttachUrl");
			
			List<Step> step = new ArrayList<>();
			for (int i = 0; i < stepContent.length; i++) {
			    step.add(new Step(i + 1, stepContent[i], stepAttachUrl[i]));
			}

			
			/*Step step = new Step (Integer.parseInt(request.getParameter("no")),
								 request.getParameter("stepContent"),
								 request.getParameter("stepAttachUrl"));
				*/  
		
		//재료 삭제는 i = 0 // 재료명 name = 0 -> 비교 for 같은 번호가 없을경우 스킵, 같은 번호가 존재할 경우 -> not null
		//키값으로 넘기면 사이즈또는 랭쓰로 서블릿측에서 알아내고 그만큼 포문을 돌리고 그 포문 안에서 if문으로 그 파라미터의 인덱스가 0부터 그 길이만큼 돌아서 null이 아닌것만 해가지고 

			int result = new RecipeService().insertRecipe(recipe, Ingredient, step);
			System.out.println(result);
			
			
			if(result > 0) {
				request.setAttribute("recipe", recipe);
				request.setAttribute("ingredient", Ingredient);
				request.setAttribute("step", step);
				
				request.getSession().setAttribute("alertMsg", "레시피 등록에 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/list.re?page=1");
			} else {
				request.getSession().setAttribute("alertMsg", "레시피 등록에 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/list.re?page=1");
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
