package Servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
@MultipartConfig(maxFileSize = 16177215)
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    
    
    private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    public static String randomAlphaNumeric() {
    	int count =10;
    StringBuilder builder = new StringBuilder();
    while (count-- != 0) {
    int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
    builder.append(ALPHA_NUMERIC_STRING.charAt(character));
    }
    return builder.toString();
    }
    
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		try{
			int i=0;
	        String name= request.getParameter("Name");  
	        String gender= request.getParameter("gender"); 
	        String pwd= request.getParameter("pwd");
	        String email= request.getParameter("email");
	        response.getWriter().append(name);
	        InputStream inputStream = null; // input stream of the upload file
	     // obtains the upload file part in this multipart request
	        Part filePart = request.getPart("photo");
	        if (filePart != null) {
	          
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	          
	            inputStream = filePart.getInputStream();
	        }System.out.println("ghus gaya");
	        
	        Connection connection=database.DbConnection.getConnection();

            String querySetLimit = "SET GLOBAL max_allowed_packet=104857600;";  // 10 MB
            Statement stSetLimit = connection.createStatement();
            stSetLimit.execute(querySetLimit);
            stSetLimit.close();
	        Statement st=connection.createStatement();
	        
	        ResultSet rs=st.executeQuery("select * from User where name ='"+name+"'");
	        if (name == "" || pwd=="" || gender==""||email=="")
	        {
	        	request.setAttribute("errorMessage", " Field empty !!");
	        	request.getRequestDispatcher("/Login.jsp").forward(request, response);
	        }
	        if(!rs.next()){
	      	   HttpSession session=request.getSession();
		       session.setAttribute("getAlert", "Yes");
	  	       session.setAttribute("emails", email); 
	  	       session.setAttribute("verify", "true");
	  	    
	  	       String s = randomAlphaNumeric();
	  	       st.close();
	  	     st=connection.createStatement();
	  	     st.executeUpdate("INSERT INTO Verification (email,code) values ('"+email+"','"+s+"')");
	  	 
  			// System.out.println("ghus gaya");
	  	       SendMail.send_mail(s, email);
	            String sql = "INSERT INTO user (email, password, gender, name,photo) values ( ?, ?,?,?,?)";
	          
	            PreparedStatement statement = connection.prepareStatement(sql);
	            statement.setString(1, email);
	            statement.setString(2, pwd);
	            statement.setString(3, gender);
	            statement.setString(4, name);
	            statement.setBinaryStream(5, inputStream,inputStream.available());
	            int row = statement.executeUpdate();
	            request.setAttribute("errorMessage1", "A mail with verification text has been sent !");
	        	request.getRequestDispatcher("/Login.jsp").forward(request, response);
	          
	            statement.close();  
			  			
			  			//response.sendRedirect("wall.jsp");
			  			
			  	   
	      }
	        else
	        {
        	  request.setAttribute("errorMessage1", "User already registered !!");
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
