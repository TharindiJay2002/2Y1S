<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artist Registration</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        background-image: url('res/a.jpg');
        background-size: cover;
        background-position: center;
    }

    .registration-section {
        width: 100%;
        max-width: 400px;
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

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        margin: 10px 0 5px;
        color: #555;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 100%;
        box-sizing: border-box;
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

    .error-message {
        color: red;
        font-size: 14px;
    }
</style>

</head>
<body>
   <%@ include file="components/header.jsp" %>
<!-- Artist Registration -->
<div class="registration-section">
    <h2>Artist Registration</h2>
    <form action="ArtistServlet" method="post" onsubmit="return validateArtistForm()">
        <input type="hidden" name="action" value="create">
        <input type="hidden" name="redirect" value="artistlogin.jsp">
        <label for="name">First Name:</label>
        <input type="text" id="fname" name="fname" placeholder="Enter your first name" required>
        
        <label for="name">Last Name:</label> 
        <input type="text" id="lname" name="lname" placeholder="Enter your last name" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>
        
        <label for="confirm-password">Confirm Password:</label>
        <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password" required>
        
        <label for="name">Biography :</label>
        <input type="text" id="artistbio" name="artistbio" placeholder="Enter description about you" required>
        
        <button type="submit">Register</button>
    </form>

</div>
    <br>    <br>    <br>    <br>    <br>    <br>    <br>    <br>
   <%@ include file="components/footer.jsp" %>
<script>
function validateArtistForm() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirm-password").value;
    var email = document.getElementById("email").value;
    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    
    // Check if passwords match
    if (password !== confirmPassword) {
        alert("Passwords do not match.");
        return false;
    }
    
    if (!email.match(emailPattern)) {
        alert("Please enter a valid email address.");
        return false;
    }
    
    // Password length check (you can add more checks)
    if (password.length < 6) {
        alert("Password must be at least 6 characters long.");
        return false;
    }
    
    
    // Add any additional validation if needed
    return true; // Allow form submission if validation passes
}
</script>

</body>
</html>
