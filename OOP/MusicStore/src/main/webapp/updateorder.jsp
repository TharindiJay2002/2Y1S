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
        <h1>Update Order Details</h1>
        <%
            String orderId_Update = request.getParameter("orderid");
            Order order = OrderServlet.getOne(orderId_Update);
        %>
        <form action="OrderServlet" method="post" onsubmit="return confirm('Do you want to update this order?');">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="redirect" value="admin.jsp#order">
			<input type="hidden" name="orderid" value="<%= order.getOrderId() %>">
			
            <div class="form-group">
                <label for="orderidshow">Order ID</label>
                <input type="text" disabled id="orderidshow" name="orderidshow" value="<%= order.getOrderId() %>" required>
            </div>

            <div class="form-group">
                <label for="songId">User ID</label>
                <input type="text" id="user" name="user" value="<%= order.getUser() %>" required>
            </div>

            <div class="form-group">
                <label for="quantity">Song</label>
                <input type="number" id="song" name="song" value="<%= order.getSong() %>" required>
            </div>

            <div class="form-group">
                <label for="price">Total Price</label>
                <input type="text" id="price" name="price" value="<%= order.getPrice() %>" required>
            </div>
            
            <div class="form-group">
                <label for="totalPrice">Date</label>
                <input type="date" id="date" name="date" value="<%= order.getDate() %>" required>
            </div>

            <div class="form-group">
                <button type="submit">Update Order</button>
            </div>
        </form>
    </div>
       <%@ include file="components/footer.jsp" %>
</body>
</html>
