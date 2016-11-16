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
 * Servlet implementation class rApprover
 */
@WebServlet("/rApprover")
public class rApprover extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rApprover() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	
		
		String button1=" ",button2=" ";
		int i;
		 HttpSession session=request.getSession();
		int  size = Integer.parseInt((String) session.getAttribute("nfrequest"));
		
		
		for ( i = 0;i<size;i++)
		{
			button1 = request.getParameter("A"+String.valueOf(i));
			button2 = request.getParameter("R"+String.valueOf(i));
		//	response.getWriter().append(String.valueOf(i)).append("app"+button1).append("rej"+button2).append("\n");
			if (button1 == "" || button2=="")
				break;
		}
		int b=0;
		if (button1=="" )
				b=1;
		else 	
			
			 b=2;
		
		String prid = request.getParameter("prid"+String.valueOf(i));
		String email = (String) session.getAttribute("email");
		//response.getWriter().append(String.valueOf(i)).append("app"+button1).append("rej"+button2);
		//response.getWriter().append("Served at: ").append(request.getContextPath()).append(" "+request.getParameter("prid"+String.valueOf(i))+" ");
		 Connection connection=database.DbConnection.getConnection();
	        try {
				Statement st=connection.createStatement();
				 ResultSet rs = st.executeQuery("Select email from user where name= '"+prid+"'" );
					while(rs.next())
			        {
			        	 prid =rs.getString("email");
			        	 
			        	response.getWriter().append(" "+String.valueOf(prid)+" "+email);
			        }
					if (b==1)
					st.executeUpdate("UPDATE request SET status = "+String.valueOf(b)+" WHERE efrom ='"+prid+"' AND eto='"+email+"'");
					else 
						st.executeUpdate("DELETE FROM request   WHERE efrom ='"+prid+"' AND eto='"+email+"'");
					//DELETE FROM `Social`.`request` WHERE `efrom`='nitish_kummar007@yahoo.com' and`eto`='hari';
					response.sendRedirect("wall.jsp");
					//UPDATE `Social`.`request` SET `status`='1' WHERE `efrom`='dimp@gmail.com' and`eto`='ramb@gmail.com';
					//st.executeUpdate("UPDATE cart SET qty="+String.valueOf(Integer.parseInt(qty)+qnty)+" WHERE prid="+prid+" AND uid ="+session.getAttribute("uid" ));
				
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
		
		
		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally{
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
