<%@page import="com.mstore.payment.PaymentServlet"%>
<%@page import="com.mstore.payment.Payment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mstore.order.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Order - Online Music Store</title>
    <style>
        /* Same CSS styles as before */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        button {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
   <%@ include file="components/header.jsp" %>
    <div class="divbox">
        <h1>Update Payment Details</h1>
        <%
            String paymentid = request.getParameter("paymentid");
            Payment payment = PaymentServlet.getOne(paymentid);
        %>
        <form action="PaymentServlet" method="post" onsubmit="return confirm('Do you want to update this order?');">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="redirect" value="admin.jsp#payment">
			<input type="hidden" name="paymentid" value="<%= payment.getPaymentId()  %>">
			<input type="hidden" name="user" value="<%= payment.getUser() %>">
			
			<div class="form-group">
				<label for="paymentid">Payment ID</label> <input type="text"
					id="paymentid" disabled name="paymentid" value="<%=payment.getPaymentId()%>"
					required>
			</div>
			
			<div class="form-group">
				<label for="user">User Email</label> <input type="text"
					id="user" disabled name="user"
					value="<%=payment.getUser()%>" required>
			</div>

			<div class="form-group">
				<label for="orders">Orders</label> <input type="text" id="orders"
					name="orders" value="<%=payment.getOrders()%>" required>
			</div>
			
			<div class="form-group">
				<label for="date">Date</label> <input type="text" id="status"
					name="date" value="<%=payment.getDate()%>" required>
			</div>
			
			<div class="form-group">
			<label for="totalprice">Total Price</label> <input type="text" id="totalprice"
				name="totalprice" value="<%=payment.getTotalPrice()%>" required>
			</div>
			
			<div class="form-group">
					<button type="submit">Update Payment</button>
				</div>
		</form>
    </div>

       <%@ include file="components/footer.jsp" %>
</body>
</html>
