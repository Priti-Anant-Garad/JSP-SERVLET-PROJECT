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
 * Servlet implementation class EditNotesServlet
 */
@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditNotesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String course_code = request.getParameter("course_code");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			NotesImpl rdao = new NotesImpl();
			boolean f = rdao.update(course_code, title, content);
			
			if(f)
			{
				System.out.println("Data Updated");
				HttpSession session = request.getSession();
				session.setAttribute("updateMsg", "Notes Updated Successfully...!");
				response.sendRedirect("ShowNotes.jsp");
			}
			else
			{
				System.out.println("Data Not Updated");
				HttpSession session = request.getSession();
				session.setAttribute("invalid", "Something Went Wrong...!");
				response.sendRedirect("ShowNotes.jsp");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
