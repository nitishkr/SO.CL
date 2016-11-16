<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table a:link {
	color: #666;
	font-weight: bold;
	text-decoration:none;
}
table a:visited {
	color: #999999;
	font-weight:bold;
	text-decoration:none;
}
table a:active,
table a:hover {
	color: #bd5a35;
	text-decoration:underline;
}
table {
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:12px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin:5px;
	border:#ccc 1px solid;

	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;

	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table th {
	padding:21px 25px 22px 25px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;

	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
table th:first-child {
	text-align: left;
	padding-left:20px;
}
table tr:first-child th:first-child {
	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
}
table tr:first-child th:last-child {
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
table tr {
	text-align: center;
	padding-left:20px;
}
table td:first-child {
	text-align: left;
	padding-left:20px;
	border-left: 0;
}
table td {
	padding:18px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;

	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table tr.even td {
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
	background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
}
table tr:last-child td {
	border-bottom:0;
}
table tr:last-child td:first-child {
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
table tr:last-child td:last-child {
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}

</style>

<script type="text/javascript">
function addRowpost(prname,prdid, val)
{
	
	
         if (!document.getElementsByTagName) return;
         tabBody=document.getElementsByTagName("tbody").item(4);
         row=document.createElement("tr");
         cell1 = document.createElement("td");
       
         cell5 = document.createElement("td");
         cell6 = document.createElement("td");
      	 textnode1=document.createTextNode(prdid+": "+prname);
         
       /*   var textnode1=document.createElement('input');
         textnode1.type="text";
         textnode1.setAttribute("name","prid"+val.toString());
         textnode1.setAttribute("value",prdid+": "+ prname);
         textnode1.setAttribute("readOnly",true);
         textnode1.style.cssText = 'background-color:transparent;border:0px;width:100%;';
        */
        
         cell1.appendChild(textnode1);
   //      cell1.setAttribute("name", "t"+val.toString());
     	 
    
         row.appendChild(cell1);
  
      
         tabBody.appendChild(row);


}
function getpost()
{	
var val = 0,x=0;
// 
var Msg ='<%=session.getAttribute("email")%>';
//alert(Msg);
if (Msg == "null")
	;
	//document.getElementById("searchstring").value= "";
else
	{
	document.getElementById('table').style.visibility="visible" ;
	
	}

<%

	 Connection connection=database.DbConnection.getConnection();
     Statement st=connection.createStatement();
     int count=0;
     ResultSet rs = st.executeQuery("select * from posts where email in (select efrom from request where eto = '"+session.getAttribute("email")+"' and status=1  UNION select eto from request where efrom = '"+session.getAttribute("email")+"' and status=1 UNION select email from user where name ='"+session.getAttribute("name")+"') ORDER BY date DESC") ;
while(rs.next())
{
	//int prid = rs.getInt("prid");
	String prn = rs.getString(2);
	String pid =rs.getString(3);
	//double price = rs.getDouble("price");
	String prices = "";//String.valueOf(price);
	count++;
%>

var prdid ='<%=pid%>';
var prname ='<%=prn%>';
var prprice ='<%=prices%>';

	addRowpost(prname,prdid,val);
	
val++;

<%
}
session.setAttribute("nfrequest",String.valueOf(count));
	%>
}




function addRowfriend(prname,val)
{
	
	
         if (!document.getElementsByTagName) return;
         tabBody=document.getElementsByTagName("tbody").item(6);
         row=document.createElement("tr");
         cell1 = document.createElement("td");
       
         cell5 = document.createElement("td");
         cell6 = document.createElement("td");
       //  textnode1=document.createTextNode(prname);
         
         var textnode1=document.createElement('input');
         textnode1.type="text";
         textnode1.setAttribute("name","prid"+val.toString());
         textnode1.setAttribute("value",prname);
         textnode1.setAttribute("readOnly",true);
         textnode1.style.cssText = 'background-color:transparent;border:0px';
         var btn = document.createElement("BUTTON");
         var t = document.createTextNode("Approve");
         btn.appendChild(t);
         btn.setAttribute("name", "A"+val.toString());
         btn.setAttribute("type", "submit");
        // btn.setAttribute("onclick","javascript:doit(this.id);");
        
         
         
         var btn1 = document.createElement("BUTTON");
         var t1 = document.createTextNode("Reject");
         btn1.appendChild(t1);
         btn1.setAttribute("name", "R"+val.toString());
         btn1.setAttribute("type", "submit");
        // btn.setAttribute("onclick","javascript:doit(this.id);");
        
         cell1.appendChild(textnode1);
   //      cell1.setAttribute("name", "t"+val.toString());
     	 
         cell5.appendChild(btn);
         cell6.appendChild(btn1);
         row.appendChild(cell1);
  
      
         tabBody.appendChild(row);


}
function displayfriendlist()
{	
var val = 0,x=0;
// 
var Msg ='<%=session.getAttribute("email")%>';
//alert(Msg);
if (Msg == "null")
	;
	//document.getElementById("searchstring").value= "";
else
	{
	document.getElementById('table').style.visibility="visible" ;
	
	}

<%

	connection=database.DbConnection.getConnection();
      st=connection.createStatement();
      count=0;
      rs = st.executeQuery("select DISTINCT name from user where email in (select efrom from request where eto = '"+session.getAttribute("email")+"' and status=1  UNION select eto from request where efrom = '"+session.getAttribute("email")+"' and status=1 )") ;
while(rs.next())
{
	//int prid = rs.getInt("prid");
	String prn = rs.getString(1);
	//double price = rs.getDouble("price");
	String pid = "";//String.valueOf(prid);
	String prices = "";//String.valueOf(price);
	count++;
%>

var prdid ='<%=pid%>';
var prname ='<%=prn%>';
var prprice ='<%=prices%>';

	addRowfriend(prname,val);
	
val++;

<%
}
session.setAttribute("nfrequest",String.valueOf(count));
	%>
}




function addRow(prname,val)
{
	
	
         if (!document.getElementsByTagName) return;
         tabBody=document.getElementsByTagName("tbody").item(2);
         row=document.createElement("tr");
         cell1 = document.createElement("td");
       
         cell5 = document.createElement("td");
         cell6 = document.createElement("td");
       //  textnode1=document.createTextNode(prname);
         
         var textnode1=document.createElement('input');
         textnode1.type="text";
         textnode1.setAttribute("name","prid"+val.toString());
         textnode1.setAttribute("value",prname);
         textnode1.setAttribute("readOnly",true);
         textnode1.style.cssText = 'background-color:transparent;border:0px';
        
         var btn = document.createElement("BUTTON");
         var t = document.createTextNode("Approve");
         btn.appendChild(t);
         btn.setAttribute("name", "A"+val.toString());
         btn.setAttribute("type", "submit");
        // btn.setAttribute("onclick","javascript:doit(this.id);");
        
         
         
         var btn1 = document.createElement("BUTTON");
         var t1 = document.createTextNode("Reject");
         btn1.appendChild(t1);
         btn1.setAttribute("name", "R"+val.toString());
         btn1.setAttribute("type", "submit");
        // btn.setAttribute("onclick","javascript:doit(this.id);");
        
         cell1.appendChild(textnode1);
   //      cell1.setAttribute("name", "t"+val.toString());
     	 
         cell5.appendChild(btn);
         cell6.appendChild(btn1);
         row.appendChild(cell1);
  
         row.appendChild(cell5);
         row.appendChild(cell6);
         tabBody.appendChild(row);


}
function searchdb()
{	
var val = 0,x=0;
// 
var Msg ='<%=session.getAttribute("email")%>';
//alert(Msg);
if (Msg == "null")
	;
	//document.getElementById("searchstring").value= "";
else
	{
	document.getElementById('table').style.visibility="visible" ;
	
	}

<%

	  connection=database.DbConnection.getConnection();
     st=connection.createStatement();
     count=0;
     rs = st.executeQuery("select name from user where email in (select efrom from request where eto = '"+session.getAttribute("email")+"' and status=0 )") ;
while(rs.next())
{
	//int prid = rs.getInt("prid");
	String prn = rs.getString(1);
	//double price = rs.getDouble("price");
	String pid = "";//String.valueOf(prid);
	String prices = "";//String.valueOf(price);
	count++;
%>

var prdid ='<%=pid%>';
var prname ='<%=prn%>';
var prprice ='<%=prices%>';

	addRow(prname,val);
	
val++;

<%
}
session.setAttribute("nfrequest",String.valueOf(count));
	%>
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Wall</title>
</head>
<body bgcolor="#E4E7F1">
<div style="width: 100%; ">

<form method="link" action="LogOut" style="align:right;">
<h1 style="color: #3D5A99">So.Cl Network</h1>
    <input type="submit" value="Logout" style="float: right;"/>
</form>
</div>
<br/>

<hr/>
 <table style="width: 100%;align:top;">
 <tr>
 <td style="width:20%" align="center">
 <img src="images/profile.jpg" alt="Photo" style="width:80px;height:90px;"></img>
 <br>
 <br>
<p><%=session.getAttribute("name") %></p>
 <br>
 <div style="width:100%;background-color: #eaebec;height:20px;"><h3>Notification Area</h3></div>
 <br>
 <form action="rApprover" method="post">
<table border='1' id='friendrequest' align="center" style="visibility:visible;">

<TH></TH>
               
       
<tbody>

</tbody>
</table>
</form>
 </td>
 
 <td style="width:60%">
 <form action="Post" align='center'>
  <textarea name="message" rows="8"  style="overflow:auto;resize:none ;width:90%;"> </textarea>
  <br>
<button  style="color: #3D5A99;" type="submit" value="Submit" style="height:35px;width:60px;">Post </button>  
</form>
<br>
 <table border='1' id='post' align="center" style="visibility:block;width:90%;">
 <TH style="width:100%;">Posts  &nbsp;&nbsp;</TH>
                 
<tbody>

</tbody>
</table>
 
 
 
 
 </td>
 
  <td style="width:20%">
<form  action="SearchFriend" method="post"  align="center"  >
<input type="text" id="searchstring"  name="searchstr" placeholder="Search your friends !" style="height:20px;font-size:10 pt;width: 120px">
<button type="submit"  " style="cursor:pointer;";>Search</button>
</form>
 <br>
 
<form action="cart" method="post">
<table border='1' id='table' align="center" style="visibility:block;">
 <TH>Friend List</TH>

           
<tbody>

</tbody>
</table>
</form>
 
 
 </td>
 </tr>
 
 
 </table>

 <br/> 

<br/>
<br/>




<br>





</body> 
<script type="text/javascript"> window.onload = searchdb(); </script> 
<script type="text/javascript"> window.onload = displayfriendlist(); </script> 
<script type="text/javascript"> window.onload = getpost(); </script> 
</html>