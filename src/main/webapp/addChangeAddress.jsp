<%@page import="project.ConnectionProviderClass" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Update Address</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%}%>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>
<%
try
{
   Connection con=ConnectionProviderClass.getCon();
   Statement st=con.createStatement ();
   ResultSet rs=st.executeQuery("select *from users where email='"+email+"'");
   while(rs.next())
   {
%>
<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" value="<%=rs.getString(7)%>" placeholder="Enter Address" required>
 
 <hr>
 
 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
}
	}catch(Exception e)
	{
		System.out.println(e);
	}
%>
</body>
<br><br><br>

</html>