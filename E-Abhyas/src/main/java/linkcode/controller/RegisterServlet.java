package linkcode.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import linkcode.model.Register;
import linkcode.service.RegisterImpl;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		Register reg = new Register(id,name,email,pass);
		List<Register> lst = new ArrayList<Register>();
		lst.add(reg);
		
		RegisterImpl rdao = new RegisterImpl();
		int i = rdao.create(lst);
		HttpSession session;
		if(i>0)
		{
			session=request.getSession();
			session.setAttribute("reg-sucess", "Register Successfully ! Please Login");
			response.sendRedirect("Login.jsp");
		}
		else
		{
			session=request.getSession();
			session.setAttribute("failed-msg", "Something Went Wrong !");
			response.sendRedirect("Register.jsp");
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
