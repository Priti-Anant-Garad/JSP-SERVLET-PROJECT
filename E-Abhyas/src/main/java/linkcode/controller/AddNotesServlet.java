package linkcode.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import linkcode.service.NotesImpl;

/**
 * Servlet implementation class AddNotesServlet
 */

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNotesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("uid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");		
		
		NotesImpl rdao = new NotesImpl();
		boolean f = rdao.AddNotes(title, content, id);
		HttpSession session;
		if(f)
		{
			session=request.getSession();
			session.setAttribute("add-sucess", "Notes Added Successfully ! Add More");
			response.sendRedirect("AddNotes.jsp");
		}
		else
		{
			session=request.getSession();
			session.setAttribute("fail-msg", "Please Login !");
			response.sendRedirect("Login.jsp");
		}
	}

}
