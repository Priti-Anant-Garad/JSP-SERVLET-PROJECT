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
 * Servlet implementation class deleteservlet
 */
@WebServlet("/deleteservlet")
public class deleteservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String course_code = request.getParameter("course_code");
		NotesImpl rdao = new NotesImpl();
		boolean f = rdao.deletenote(course_code);
		if(f)
		{
			HttpSession session = request.getSession();
			session.setAttribute("DeleteMsg", "Notes Delete Successfully...!");
			response.sendRedirect("ShowNotes.jsp");
		}
		else
		{
			HttpSession session = request.getSession();
			session.setAttribute("WrongMsg1", "Something Went Wrong...!");
			response.sendRedirect("ShowNotes.jsp");
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
