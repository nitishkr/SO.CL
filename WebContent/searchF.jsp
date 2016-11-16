<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Friends</title>
<script type="text/javascript">
function openPage(pageURL)
{
window.location.href = pageURL;
}

function addRow(prid,prname,price,val, present)
{
	
	
         if (!document.getElementsByTagName) return;
         tabBody=document.getElementsByTagName("tbody").item(1);
         row=document.createElement("tr");
         cell1 = document.createElement("td");
         cell2 = document.createElement("td");
         cell3 = document.createElement("td");
         cell4 = document.createElement("td");
         cell5 = document.createElement("td");
         var textnode1=document.createElement('input');
         textnode1.type="text";
         textnode1.setAttribute("name","prid"+val.toString());
         textnode1.setAttribute("value",prid);
         textnode1.setAttribute("readOnly",true);
         textnode1.style.cssText = 'background-color:transparent;border:0px';
        
         var textnode2=document.createElement('input');
         textnode2.type="text";
         textnode2.setAttribute("name","e"+val.toString());
         textnode2.setAttribute("value",prname);
         textnode2.setAttribute("readOnly",true);
         textnode2.style.cssText = 'background-color:transparent;border:0px';
         //textnode3=document.createTextNode(price);
         var input = document.createElement('input'); 
         input.type = "text";        
         input.setAttribute("name","txt"+val.toString());
         input.setAttribute("value","1");
         var btn = document.createElement("BUTTON");
         var t = document.createTextNode("Send Request");
         btn.appendChild(t);
         btn.setAttribute("name", val.toString());
         btn.setAttribute("type", "submit");
       //  alert(present);
         if (present ==1)
       			 btn.setAttribute("disabled","disabled");
        // btn.setAttribute("onclick","javascript:doit(this.id);");
        
         var btn1 = document.createElement("BUTTON");
         var t1 = document.createTextNode("View Profile");
         btn1.appendChild(t1);
         btn1.setAttribute("name", "b"+val.toString());
      
         btn1.setAttribute("type", "submit");
         cell1.appendChild(textnode1);
         cell2.appendChild(textnode2);
         cell3.appendChild(btn1);
       
         cell5.appendChild(btn);
         row.appendChild(cell1);
         row.appendChild(cell2);
         row.appendChild(cell3);
        
         row.appendChild(cell5);
         tabBody.appendChild(row);


}
function searchdb()
{	
var val = 0;
// 
var Msg ='<%=session.getAttribute("sstring")%>';
//alert(Msg);
if (Msg == "null")
	document.getElementById("searchstring").value= "";
else
	{
	document.getElementById('table').style.visibility="visible" ;
	
	}

<%
if (session.getAttribute("sstring") != "null")
{
	 Connection connection=database.DbConnection.getConnection();
     Statement st=connection.createStatement();
     Statement st1= connection.createStatement();
  
     ResultSet rs = st.executeQuery("select * from user where name like '%"+session.getAttribute("sstring")+"%'") ;
      ResultSet rs1 ;
 while(rs.next())
{
	//int prid = rs.getInt("prid");
	String prn = rs.getString("name");
	
	//double price = rs.getDouble("price");
	String pid = rs.getString("email");
	
	String prices = "";//String.valueOf(price);
	int present = 0;
	rs1= st1.executeQuery("select * from request where efrom='"+pid+"' and eto='"+session.getAttribute("email")+"' AND STATUS = 1 UNION select * from request where eto='"+pid+"' and efrom='"+session.getAttribute("email")+"' AND STATUS = 1 ");
	while (rs1.next())
	{
		present =1;
	}
	if (pid.equals(session.getAttribute("email")))
			present =1;
	%>

	var prdid ='<%=pid%>';
var prname ='<%=prn%>';
var prprice ='<%=prices%>';
var present =<%=present%>;
	addRow(prname,prdid,prprice,val,present);
val++;
<%
}
	//session.setAttribute("sstring","null");
	}%>
}


</script>
<style type="text/css">
.button {
    margin-left: 47%;
}


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
	margin:4px;
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
</head>
<body bgcolor="#E4E7F1">
<h1 style="color: #3D5A99">So.Cl Network</h1>
<div style="width: 100%; ">

<form method="link" action="LogOut" style="align:right;">

    <input type="submit" value="Logout" style="float: right;"/>
</form>
</div>
<hr>
<form action="cart" method="post" align="center">
<table border='1' id='table' align="center" style="visibility:hidden;">
 <TH>Name</TH>
                <TH>Email</TH>
                <TH>View Profile</TH>
           
                <TH> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</TH>
           
<tbody>

</tbody>
</table>
</form>
<br>
<br>

<input type="button" onclick="openPage('wall.jsp')" value="Back" class="button"></input>
</body>
<script type="text/javascript"> window.onload = searchdb(); </script> 
</html>