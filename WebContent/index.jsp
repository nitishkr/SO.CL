<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>So.Cl</title>

<script type="text/javascript">
	
	function verify() {
		var Msg ='<%=session.getAttribute("verify")%>';
		//alert(Msg);
		if (Msg == "true")
			{
			document.getElementById("text").style.visibility="visible";
			
			<%//session.setAttribute("verify","false");%>
			}
		
	}

	
</script>
<style type="text/css">
.vr {
    width:2px;
    background-color:#4965A0;
    margin-right:10px;
  height: 280px;
}
</style>
</head>
<body bgcolor="#E4E7F1">
<h1 style="color: #3D5A99">So.Cl Network</h1>

<hr/>
 <br/>  
 <br/>
 <br/>


 <table >


<tr style="vertical-align: top;"> 
<td style="width:650px;">
<p>
<h3>So.Cl helps you connect and share with the people in your life.</h3>
</p>
<img src="images/img.png" alt="Graph Connect"  >
</td>
<td >
<u><i><h4>SignIn Form</h4></i></u>
<form action="LoginServlet" method="post"> 
Username:&nbsp;
<input type="text" style="border: 0px;color: #c0392b;height:20px;" name="email"/>
<br>
<br>
Password:&nbsp;
<input type="password" style="border: 0px;color: #c0392b;height:20px;" name="pwd"/>
<div style="height:14px;color: #FF0000;font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${errorMessage}</div><br/>
<button style="color: #3D5A99" type="submit" value="Submit" style="height:25px; width:60px">SignIn </button>  

</form>  

</td>
<td>
<div class="vr">&nbsp;</div>

</td>
<td >

<u><i><h4>SignUp Form</h4></i></u>
<form action="SignUp" method="post" enctype="multipart/form-data">  

Name:&nbsp;&nbsp;&nbsp;
<input type="text" style="border: 0px;color: #c0392b;height:20px;" name="Name"/>
<br>
<br>
Email ID:&nbsp;&nbsp;&nbsp;
<input type="text" style="border: 0px;color: #c0392b;height:20px;" name="email"/>
<br>
<br>
Password:&nbsp;&nbsp;&nbsp;
<input type="password" style="border: 0px;color: #c0392b;height:20px;" name="pwd"/>
<br>
<br>
Gender :&nbsp;&nbsp;&nbsp;
<select name="gender">
  <option value="MALE"> MALE </option>
  <option value="FEMALE"> FEMALE </option>
</select>

<br>
<br>
Portrait Photo: 
<input type="file" name="photo" size="50"/>
 <br>
 <br>
<button type="submit" value="Submit" style="color: #3D5A99">SignUp </button>  

<div style="height:20px;color: #FF0000;font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${errorMessage1}</div><br/>

</form>  

<br>

<div id="text" style="visibility: hidden;">
<form action="verify" method="post" id="text" >
<b>Enter verification text  :</b> <input type ="text" name="key" /> 
&nbsp;&nbsp;<button type="submit" value="submit" style="color: #3D5A99">Submit</button>

<div style="height:20px;color: #FF0000;font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${errorMessage2}</div><br/>

</form> 
</div>
</td>
</tr>
<br>
</table>
<br/>
<br/>
<br/>

<br/>
<br/> 
<br/>
<br/>
<br/>
<br/>
<hr/>


<div id="footer" style="text-align:center;vertical-align: middle;">
		<p>~~ © 2007-2016 All rights reserved ~~</p>
</div>



</body>

<script type="text/javascript"> window.onload = verify(); </script> 
</html>