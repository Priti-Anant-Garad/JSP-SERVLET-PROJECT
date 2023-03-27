package linkcode.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


import linkcode.model.Login;
import linkcode.model.Register;
import linkcode.service.RegisterImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("uemail");
		String pass = request.getParameter("upass");
		Login lobj = new Login();
		lobj.setEmail(email);
		lobj.setPass(pass);
		RegisterImpl rd = new RegisterImpl();
		Register reg = rd.validateUser(lobj);
		if(reg!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("RegDetail", reg);
			response.sendRedirect("UserHome.jsp");
		}
		else
		{
			HttpSession session=request.getSession();
			session.setAttribute("failedmsg", "Invalid Login !");
			response.sendRedirect("Login.jsp");
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
