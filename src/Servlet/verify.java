package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class verify
 */
@WebServlet("/verify")
public class verify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String text = request.getParameter("key");
		 HttpSession session=request.getSession();
		 String email = (String) session.getAttribute("emails");

		 Connection connection=database.DbConnection.getConnection();
	        try {
				Statement st=connection.createStatement();
				
				//ResultSet rs=st.executeQuery("Select * from cart where prid="+prid+"AND uid ="+session.getAttribute("uid" ));
				ResultSet rs=st.executeQuery("Select * from Verification where email='"+email+"'");
				
				if (rs.next())
				{
					String key1 = rs.getString(2);
					if (key1.equals(text))
					{
						request.setAttribute("errorMessage1", "User  registered successfully !!");
						session.setAttribute("verify","false");
						request.getRequestDispatcher("/Login.jsp").forward(request, response);
					}
					
					else
					{
						//st.executeUpdate("DELETE FROM user WHERE email='"+email+"'");
						request.setAttribute("errorMessage1", "Wrong code ! Enter again  !!");
						request.getRequestDispatcher("/Login.jsp").forward(request, response);
					}
		        	  
								
						
					
					//st.executeUpdate("UPDATE cart SET qty="+String.valueOf(Integer.parseInt(qty)+qnty)+" WHERE prid="+prid+" AND uid ="+session.getAttribute("uid" ));
				}
	       
	}catch(Exception e)
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
