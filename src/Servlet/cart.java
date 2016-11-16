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
 * Servlet implementation class cart
 */
@WebServlet("/cart")
public class cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String button,button1 = null;
		int i;
		 HttpSession session=request.getSession();
		int  size = Integer.parseInt((String) session.getAttribute("size"));
	
		
		for ( i = 0;i<size;i++)
		{
			button = request.getParameter(String.valueOf(i));
			button1 = request.getParameter("b"+String.valueOf(i));
			if (button == ""||button1=="")
				break;
		}
		if (button1=="")
		{
String email  = 	request.getParameter("e"+String.valueOf(i));
session.setAttribute("pemail", email);
response.sendRedirect("ViewProfile.jsp");
		}
		else
		{
		String prid = request.getParameter("prid"+String.valueOf(i));
		response.getWriter().append(String.valueOf(i)+" "+prid);
		 Connection connection=database.DbConnection.getConnection();
	        try {
				Statement st=connection.createStatement();
				
				//ResultSet rs=st.executeQuery("Select * from cart where prid="+prid+"AND uid ="+session.getAttribute("uid" ));
				ResultSet rs=st.executeQuery("Select * from user where name='"+prid+"'");
				
				if (rs.next())
				{
					String email = rs.getString(1);
					st.executeUpdate("INSERT INTO request VALUES ('"+session.getAttribute("email" )+"','"+email+"',"+String.valueOf(0)+")");
					response.sendRedirect("searchF.jsp");
					//st.executeUpdate("UPDATE cart SET qty="+String.valueOf(Integer.parseInt(qty)+qnty)+" WHERE prid="+prid+" AND uid ="+session.getAttribute("uid" ));
				}
	        }
//			    rs = st.executeQuery("Select COUNT(Distinct prid) from cart where uid="+session.getAttribute("uid" ) );
//				while(rs.next())
//		        {
//		        	 i =rs.getInt(1);
//		        	 
//		        	response.getWriter().append(" "+String.valueOf(i));
//		        }
//				 session.setAttribute("cartsize",String.valueOf(i));
//				 session.setAttribute("cartadd","true");
//				 session.setAttribute("productpresent", "true");
//				  response.sendRedirect("search.jsp");
		
		
		
			 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("searchF.jsp");
			 }
	        
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
