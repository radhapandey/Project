<%@page import="java.util.Map"%>
<%@page import="com.bean.Customer"%>
<%@page import="com.bean.Transaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customers</title>
<link rel="stylesheet" href="css/menu.css">
<style>
body {
	background-image: url('img/bg3.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>

</head>
<body>
	<%
		String successMsg = (String) request.getAttribute("successMsg");
	%>
	<span style="text-align: center;"> <%=successMsg == null ? "" : "<b><font size=5 color='green'></b>" + successMsg + "</font><br><br>"%>
	</span>
	<table>
		<tr>
			<td><a class="cube fire" style="text-decoration: none;"
				href=homepage.jsp>Home</a></td>
			<td><a class="cube ice" style="text-decoration: none;"
				href=CustomerServlet?actionType=getTransactionDetails>Transaction
					History</a></td>
		</tr>
	</table>
	<table class="responstable">
		<tr>
			<th>Customer ID</th>
			<th>Name of Customer</th>
			<th>Email ID</th>
			<th>Current balance</th>
			<th></th>
		</tr>
		<%
			Object map = request.getSession(false).getAttribute("customermap");
			if (map != null) {
				@SuppressWarnings("unchecked")
				Map<String, Customer> customermap = (Map<String, Customer>) map;
				for (String cname : customermap.keySet()) {
					Customer cust = customermap.get(cname);
		%>
		<tr>
			<td><%=cust.getC_id()%></td>
			<td><%=cust.getName()%></td>
			<td><%=cust.getEmail()%></td>
			<td><%=cust.getC_balance()%></td>
			<td><a
				href="CustomerServlet?actionType=getCustomerbyId&id=<%=cust.getC_id()%>"><img
					border="0" alt="select" src="img/sb1.jfif" width="80" height="40"></a>
		</tr>

		<%
			}
			}
		%>


	</table>


</body>
</html>