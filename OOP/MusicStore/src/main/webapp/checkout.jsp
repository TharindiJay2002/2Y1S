<%@page import="com.mstore.order.OrderServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, com.mstore.user.*, 
com.mstore.order.*, java.util.ArrayList, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #28a745;
            color: white;
        }

        .total {
            font-weight: bold;
            font-size: 18px;
            margin-top: 20px;
            text-align: right;
        }
        
        
	    button {
	        padding: 10px;
	        margin-top: 20px;
	        background-color: #28a745;
	        color: white;
	        font-size: 16px;
	        border: none;
	        border-radius: 4px;
	        cursor: pointer;
	        transition: background-color 0.3s;
	    }
	
	    button:hover {
	        background-color: #218838;
	    }
    </style>
</head>
<body>

<%
    // Assume the user's email is stored in the session
    User userx = (User) session.getAttribute("user");
	List<Order> orders = new ArrayList<Order>();
    double totalAmount = 0;
    if (userx == null) {
        response.sendRedirect("userlogin.jsp");
    } else {
    	List<Order> ordersList = new ArrayList<Order>();
    	ordersList = OrderServlet.getAll();
		String email = userx.getEmail();

		
		for (Order order : ordersList) {
			if (order.getUser().equals(email)) {
				orders.add(order);
				totalAmount += order.getPrice();
			}
		}
		
    }

%>
   <%@ include file="components/header.jsp" %>
    <div class="divbox">
        <h2>Your Orders</h2>
        <table>
            <tr>
            	<th>Order ID</th>
                <th>Song Title</th>
                <th>Released Date</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>

			<%
			for (Order order : orders) {
			%>
            <tr>
            	<td><%= order.getOrderId() %></td>
                <td><%= order.getSong() %></td>
                <td><%= order.getDate() %></td>
                <td><%= order.getPrice() %></td>
				<td>
					<form action="OrderServlet" method="post">
						<input type="hidden" name="redirect" value="checkout.jsp">
						<input type="hidden" name="action" value="delete"> 
						<input type="hidden" name="orderid" value="<%=order.getOrderId()%>">
						<button type="submit">Delete</button>
					</form>
					<form action="OrderServlet" method="post">
					    <input type="hidden" name="redirect" value="checkout.jsp">
					    <input type="hidden" name="action" value="updateTitle"> 
					    <input type="hidden" name="orderid" value="<%= order.getOrderId() %>">
					
					    <label for="newTitle">Update Song Title:</label>
					    <input type="text" id="newTitle" name="newTitle" value="<%= order.getSong() %>" required>
					
					    <button type="submit">Update Title</button>
					</form>
			</tr>
				<%
				}
				String ordersSTR = "";
				for (Order order : orders) {
					ordersSTR += order.getSong() + ";";
				}
				%>
        </table>
        <div class="total">Total Amount: $<%= totalAmount %></div>
        			<form action="PaymentServlet" method="post">
        				<input type="hidden" name="action" value="create">
        				<input type="hidden" name="redirect" value="payment.jsp">
        				<input type="hidden" name="status" value="pending">
						<input type="hidden" id="user" name="user" value=<%= userx.getEmail() %>>
						<input type="hidden" id="orders" name="orders" value=<%= ordersSTR %>>
						<input type="hidden" id="date" name="date" value=<%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>>
						<input type="hidden" id="totalprice" name="totalprice" value=<%= totalAmount %>>
						<button type="submit">Buy These Songs</button>
					</form>
        <button type="button" onclick="window.location.href='index.jsp'">Add More</button>
    </div>
	<br>	<br>	<br>	<br>
   <%@ include file="components/footer.jsp" %>
</body>
</html>
