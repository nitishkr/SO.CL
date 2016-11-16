<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Person profile</title>

<script type="text/javascript">
function openPage(pageURL)
{
window.location.href = pageURL;
}
function genprofile()
{

	<%
	if (session.getAttribute("pemail") != "null")
	{
		 Connection connection=database.DbConnection.getConnection();
	     Statement st=connection.createStatement();
	     
	  
	     ResultSet rs = st.executeQuery("select * from user where email like '"+session.getAttribute("pemail")+"'") ;
	 
	 while(rs.next())
	{

		String prn = rs.getString("name");

		String pid = rs.getString("email");
		
		String prices = rs.getString("gender");
	%>

	var prdid ="Email :"+'<%=pid%>';
	var prname ="Name :"+'<%=prn%>';
	var prprice ="Gender :"+'<%=prices%>';

	document.getElementById("name").innerHTML = prdid;
	document.getElementById("email").innerHTML = prname;
	document.getElementById("gender").innerHTML = prprice;
	<%
	}
	rs = st.executeQuery("select * from request where eto = '"+session.getAttribute("email")+"' and efrom = '"+session.getAttribute("pemail")+"' and status = 1  UNION select * from request where efrom = '"+session.getAttribute("email")+"' and eto = '"+session.getAttribute("pemail")+"' and status =1" ); ;
	while(rs.next())
	{%>
		document.getElementById("unfriend").style.visibility="visible";
		<%
	}
		
	}%>
}
</script>
<style type="text/css">
.button {
    margin-left: 47%;
}
</style>
</head>
<body bgcolor="#E4E7F1">
<h1 style="color: #3D5A99">So.Cl Network</h1>
<div style="width: 100%; ">

<form method="link" action="LogOut" style="align:right;">

    <input type="submit" value="Logout" style="float: right;"/>
</form>
</div>

<div>
<hr>
<img alt="Profile pic" src=""></img>
<br>
<p id="name"></p>
<p id="email"></p>
<p id="gender"></p>


</div>

<div id ="unfriend" style="visibility:hidden;">
<form action="unfriend_request">
<button type="submit"> Unfriend</button>
</form>


</div>

<input type="button" onclick="openPage('searchF.jsp')" value="Back" class="button"></input>
</body>
<script type="text/javascript"> window.onload = genprofile(); </script> 
</html>