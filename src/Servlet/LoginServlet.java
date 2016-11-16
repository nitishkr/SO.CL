package Servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final int BUFFER_SIZE = 4096;
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
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String password="";
		
		try{int i=0;
	        String name= request.getParameter("email");    
	        String pwd= request.getParameter("pwd");
	        response.getWriter().append(name);
	        HttpSession session=request.getSession();
	        Connection connection=database.DbConnection.getConnection();
	        Statement st=connection.createStatement();
	        
	        ResultSet rs=st.executeQuery("select * from user where email ='"+name+"'");
	        if (name == "" || pwd=="")
	        {
	        	request.setAttribute("errorMessage", " Field empty !!");
	        	request.getRequestDispatcher("/Login.jsp").forward(request, response);
	        }
	        if(rs.next()){
	        	session.setAttribute("email", name);
	        	password = rs.getString(2);
	        	name = rs.getString(5);
	        	if (password.equals(pwd))
	        	{
	        		
	        	 
	        	  session.setAttribute("name",name);
	        	  String filePath = "/Users/Admin/Documents/workspace/ConnectBook/WebContent/images/profile.jpg";

	        	
	        	      

	        	      String sql = "SELECT photo FROM user WHERE email=?";
	        	      PreparedStatement statements = connection.prepareStatement(sql);
	        	      statements.setString(1, (String)session.getAttribute("email"));
	        	    

	        	      ResultSet result = statements.executeQuery();
	        	      if (result.next()) {
	        	          Blob blob = result.getBlob("photo");
	        	          InputStream inputStream = blob.getBinaryStream();
	        	          OutputStream outputStream = new FileOutputStream(filePath);

	        	          int bytesRead = -1;
	        	          byte[] buffer = new byte[BUFFER_SIZE];
	        	          while ((bytesRead = inputStream.read(buffer)) != -1) {
	        	              outputStream.write(buffer, 0, bytesRead);
	        	          }

	        	          inputStream.close();
	        	          outputStream.close();
	        	          System.out.println("File saved");
	        	      }
	        	      connection.close();
	        	
               
      		   response.sendRedirect("wall.jsp");
	        	}
	        	else
	        	{
	        		 request.setAttribute("errorMessage", "Password Incorrect !");
	           	  request.getRequestDispatcher("/Login.jsp").forward(request, response);
	        	}
         }
	        else{
        	  request.setAttribute("errorMessage", "User not present !!");
        	  request.getRequestDispatcher("/Login.jsp").forward(request, response);
            //response.sendRedirect("login.html");
         }       
	    }catch(Exception e)
        {
        	e.printStackTrace();
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



