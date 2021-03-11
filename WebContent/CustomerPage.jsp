<%@page import="com.bean.Customer"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Page</title>
<link rel="stylesheet" href="css/menu.css">

</head>
<body>
	<table>
		<tr>
			<td><a class="cube fire" style="text-decoration: none;"
				href=homepage.jsp>Home Page</a></td>
			<td><a class="cube ice" style="text-decoration: none;"
				href=CustomerServlet>View all Customers</a></td>

			<td><a class="cube fire" style="text-decoration: none;"
				href=CustomerServlet?actionType=getTransactionDetails>Transaction
					History</a></td>
		</tr>
	</table>
	<br>
	<table class="responstable">
		<tr>
			<th>Customer ID</th>
			<th>Name of Customer</th>
			<th>Email ID</th>
			<th>Current balance</th>
		</tr>

		<%
			@SuppressWarnings("unchecked")
			Customer sender = (Customer) request.getAttribute("customer");
			request.setAttribute("sender", sender);
		%>

		<tr>
			<td><%=sender.getC_id()%></td>
			<td><%=sender.getName()%></td>
			<td><%=sender.getEmail()%></td>
			<td><%=sender.getC_balance()%></td>

		</tr>
	</table>
	<br>
	<b>Sender:</b>
	<span style="border: 1px solid blue; display:
		inline; 
  width: 100px;
  height: 100px;
  padding: 5px;
  border: 1px
		solidblue;  
  background-color:#80ccff;"><%=sender.getName()%></span>
	<form action="CustomerServlet?actionType=transfer" method="post">

		<input type="hidden" name="senderId" value="<%=sender.getC_id()%>">
		<br> <b> Receiver:  </b><select name="receiverId"
			style="width: 200px; text-align: center; height: 35px;
  padding: 5px; background-color: #ffd6cc;">
			<%
				Object map1 = request.getSession(false).getAttribute("customermap");
				if (map1 != null) {
					@SuppressWarnings("unchecked")
					Map<String, Customer> customermap = (Map<String, Customer>) map1;
					for (String cname : customermap.keySet()) {
						Customer receiver = customermap.get(cname);
						if (receiver.getName().equals(sender.getName())) {
							continue;
						}
			%>



			<option value="<%=receiver.getC_id()%>"><%=receiver.getName()%></option>

			<%
				}
				}
			%>
		</select> <br> <br> <b>Amount</b><br> <input type="number"
			name="amount" id="tr_amount" required min="0.000001"
			max="<%=sender.getC_balance()%>" step="any"><br><br> <input class="cube ice" style="margin-left: 30px;text-decoration: none;"
			type="submit" value="Transfer">

	</form>
</body>
</html>