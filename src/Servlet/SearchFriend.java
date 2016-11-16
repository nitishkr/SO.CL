package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchFriend
 */
@WebServlet("/SearchFriend")
public class SearchFriend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchFriend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int size = 0;
		String query= request.getParameter("searchstr"); 
		response.getWriter().append("Served at: ").append(query);
	     HttpSession session=request.getSession();
	     if (query == "")
	     {
	    	 session.setAttribute("sstring", "null");
	    	 response.sendRedirect("wall.jsp"); 
	     }
	     else
	     {
	    	 Connection connection=database.DbConnection.getConnection();
	         Statement st;
			try {
				st = connection.createStatement();
				 ResultSet rs = st.executeQuery("select * from user where name like '%"+query+"%'") ;
			    while (rs.next())
			    {
			    	response.getWriter().append(rs.getString(5)).append(" ");
			    	size++;
			    }
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	          
	    	 session.setAttribute("sstring", query);
	     }
	     session.setAttribute("size", String.valueOf(size));
	     response.getWriter().append("Served at: ").append(String.valueOf(size));
	     response.sendRedirect("searchF.jsp"); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
