<%@page import="com.mstore.user.*, com.mstore.payment.*, java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Completed</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            background-image: url("https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0");
        }
        
        .container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.9);)
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .payment-details {
            margin: 20px 0;
        }

        label {
            font-weight: bold;
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
    <%@ include file="components/header.jsp" %>
<%
    // Retrieve user and payment details from the session or request
    User userx = (User) session.getAttribute("user");
	List<Payment> PList = PaymentServlet.getAll();
	Payment lastPayment = PList.getLast();

    if (userx == null || lastPayment == null) {
        out.println("<script>alert('Payment details not found.'); window.location='userlogin.jsp';</script>");
    } else {
%>

    <div class="divbox">
        <h2>Payment Completed</h2>
        <div class="details">
            <label>User Email:</label> <strong><%= userx.getEmail() %></strong><br>
            <label>Total Price:</label> <span class="total-price">$<%= lastPayment.getTotalPrice() %></span><br>
            <p>Your payment has been completed successfully!</p>
        </div>

        <button onclick="window.location.href='index.jsp'">Continue to Homepage</button>
    </div>

<%
    }
%>

</body>
  <%@ include file="components/footer.jsp" %>
</html>
