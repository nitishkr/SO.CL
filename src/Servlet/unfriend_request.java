package Servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class unfriend_request
 */
@WebServlet("/unfriend_request")
public class unfriend_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public unfriend_request() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 HttpSession session=request.getSession();
		String pemail = (String) session.getAttribute("pemail");
		String email = (String) session.getAttribute("email");
		//response.getWriter().append(String.valueOf(i)).append("app"+button1).append("rej"+button2);
		//response.getWriter().append("Served at: ").append(request.getContextPath()).append(" "+request.getParameter("prid"+String.valueOf(i))+" ");
		 Connection connection=database.DbConnection.getConnection();
	        try {
				Statement st=connection.createStatement();	
				st.executeUpdate("DELETE FROM request   WHERE efrom ='"+pemail+"' AND eto='"+email+"'");
				st.executeUpdate("DELETE FROM request   WHERE eto ='"+pemail+"' AND efrom='"+email+"'");
				st.close();
				connection.close();
				response.sendRedirect("ViewProfile.jsp");
	        	}
	        	catch(Exception e)
	        {
	        		
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
