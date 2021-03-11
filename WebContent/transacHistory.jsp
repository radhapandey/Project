<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.bean.Transaction"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction History</title>
<link rel="stylesheet" href="css/menu.css">
</head>
<body>
	<table>
		<tr>
			<td><a class="cube fire" style="text-decoration: none;"
				href=homepage.jsp>Home</a></td>
			<td><a class="cube ice" style="text-decoration: none;"
				href=CustomerServlet>View all Customers</a></td>
			<td><a class="cube fire" style="text-decoration: none;"
				href=CustomerServlet?actionType=getTransactionDetails>Transaction
					History</a></td>
		</tr>
	</table>
	<table class="responstable">
		<tr>
			<th>Transaction ID</th>
			<th>Sender ID</th>
			<th>Sender Name</th>
			<th>Receiver ID</th>
			<th>Receiver Name</th>
			<th>Transfer Amount</th>
			<th>Time And Date</th>

		</tr>
		<%
			Object map = request.getSession(false).getAttribute("transactionmap");
			if (map != null) {
				@SuppressWarnings("unchecked")
				Map<Integer, Transaction> transactionmap = (Map<Integer, Transaction>) map;
				for (Integer trid : transactionmap.keySet()) {
					Transaction transac = transactionmap.get(trid);
		%>
		<tr>
			<td><%=transac.getTrid()%></td>
			<td><%=transac.getSenderid()%></td>
			<td><%=transac.getSenderName()%></td>
			<td><%=transac.getReceiverid()%></td>
			<td><%=transac.getReceiverName()%></td>
			<td><%=transac.getAmount()%></td>
			<td><%=transac.getTimestamp()%></td>


		</tr>

		<%
			}
			}
		%>


	</table>
</body>
</html>