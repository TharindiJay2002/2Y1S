<%@page import="com.mstore.user.*, com.mstore.payment.*, java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            background-image: url("res/a.jpg");
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
    // Assume the user's email is stored in the session
    User userx = (User) session.getAttribute("user");
    if (userx == null) {
        out.println("<script>alert('You must log in as a user first!'); window.location='userlogin.jsp';</script>");
    } else {
        // Fetch user's last payment details (Assuming you have a method to get the last payment)
        List<Payment> PList = PaymentServlet.getAll();
        Payment lastPayment = PList.getLast();
    // Placeholder method
%>

    <div class="divbox">
        <h2>Payment Details</h2>
        <div class="payment-details">
            <label>User Email:</label> <%= userx.getEmail() %><br>
            <label>Last Payment Amount:</label> $<%= lastPayment != null ? lastPayment.getTotalPrice() : "N/A" %><br>
            <label>Last Payment Date:</label> <%= lastPayment != null ? lastPayment.getDate() : "N/A" %><br>
        </div>

        <form action="PaymentServlet" method="post">
        	<input type="hidden" name="action" value="updatemethod">
        	<input type="hidden" name="redirect" value="paymentcompleted.jsp">
            <label for="paymentMethod">Select Payment Method:</label>
            <select id="paymentmethod" name="paymentmethod" required>
                <option value="creditCard">Credit Card</option>
                <option value="paypal">PayPal</option>
                <option value="bankTransfer">Bank Transfer</option>
            </select>
			<input type="hidden" name="status" value="completed">
            <input type="hidden" name="paymentid" value="<%= lastPayment.getPaymentId() %>">
            <input type="hidden" name="totalAmount" value="<%= lastPayment != null ? lastPayment.getTotalPrice() : "0" %>">

            <button type="submit">Pay</button>
        </form>
    </div>

<%
    }
%>

</body>
  <%@ include file="components/footer.jsp" %>
</html>
