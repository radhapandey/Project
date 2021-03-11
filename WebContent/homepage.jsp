<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>THE SPARKS BANK</title>
<link rel="stylesheet" href="css/menu.css">
<style>
body{background-image: url('img/bg1.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	}
	</style>
</head>
<body >

	<h1 style="color:white;">WELCOME TO THE SPARKS BANKING SYSTEM</h1>
	<br>
	<p style="color:white;">Transfer funds in one click!</p>
	<table class="menutab">
		<tr>
			<td><a class="cube fire" style="text-decoration: none;"
				href=CustomerServlet>View all Customers</a></td>
			<td><a class="cube ice" style="text-decoration: none;"
				href=CustomerServlet?actionType=getTransactionDetails>Transaction History</a></td>
		</tr>
	</table>
</body>
</html>