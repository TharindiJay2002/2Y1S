<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mstore.artist.*, com.mstore.user.*, com.mstore.song.*, com.mstore.dbutill.*, com.mstore.order.*, 
com.mstore.payment.*, java.util.List, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Online Music Store</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	background-image: url('res/h.jpg');
	background-size: cover; /* or contain */
	background-position: center; /* centers the image */
}

.header {
	background-color: #333;
	color: white;
	padding: 20px;
	text-align: center;
	background: rgba(0, 0, 0, 0.7); /* Light background for contrast */
	border-radius: 10px;
	backdrop-filter: blur(10px); /* Apply the blur effect */
}

.container {
	padding: 20px;
}

input[type=text], input[type=email], input[type=date], input[type=password],
	input[type=number], select {
	width: 100%;
	padding: 12px;
	margin: 8px 0;
	box-sizing: border-box;
}

button {
	background: rgba(170, 140, 255, 0.9);
	color: black;
	padding: 7px 10px;
	margin: 2px 0px 10px;
	border: none;
	border-radius: 4px;
}

button:hover {
	background: rgba(120, 120, 155, 0.9);
}

table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #ddd;
	padding: 8px;
}

th {
	background-color: #333;
	color: white;
}

/* Tab styles */
.tabs {
	display: flex;
	justify-content: space-between;
}

.tab {
	padding: 10px 20px;
	cursor: pointer;
	background-color: rgba(60, 60, 80, 0.8); 
	margin-right : 5px;
	border: 1px solid #333;
	border-radius: 8px;
	margin-right: 5px;
}

.tab:hover {
	border-color: #fff;
	box-shadow: 0px 0 25px 0 rgba(0, 0, 0, 0.1);
	transform: scale(1.1);
}

.tab.active {
	background-color: #333;
	color: white;
}

.tab-content {
	display: none;
}

.tab-content.active {
	display: block;
	background-color: rgba(255, 255, 255, 0.8);
	margin: 20px;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	backdrop-filter: blur(10px);
}
</style>
<script>
    // Validate phone number
    function validatePhoneNumber() {
        var phone = document.getElementById("phone").value;
        var phonePattern = /^[0-9]{10}$/; // 10-digit phone number pattern
        
        if (phone.match(phonePattern)) {
            return true; // Valid phone number
        } else {
            alert("Please enter a valid 10-digit phone number.");
            return false; // Invalid phone number
        }
    }

    // Validate song form
    function validateSongForm() {
        // Validate Duration as a decimal number
        var duration = document.getElementById("duration").value;
        var durationPattern = /^[0-9]+(\.[0-9]+)?$/; // Decimal number pattern
        if (!duration.match(durationPattern)) {
            alert("Please enter a valid duration in minutes (e.g., 3.5).");
            return false;
        }


        // Validate Release Date to ensure it's not a future date
        var releaseDate = document.getElementById("releasedate").value;
        var currentDate = new Date().toISOString().split('T')[0];
        if (releaseDate > currentDate) {
            alert("Release date cannot be in the future.");
            return false;
        }

        // Additional validation can go here

        return true; // If all validations pass
    }

    // Tab navigation logic
    function openTab(tabId) {
        // Hide all tab contents
        var contents = document.getElementsByClassName('tab-content');
        for (var i = 0; i < contents.length; i++) {
            contents[i].classList.remove('active');
        }

        // Show the selected tab content
        document.getElementById(tabId).classList.add('active');

        // Remove 'active' class from all tabs
        var tabs = document.getElementsByClassName('tab');
        for (var i = 0; i < tabs.length; i++) {
            tabs[i].classList.remove('active');
        }

        // Add 'active' class to the clicked tab
        document.querySelector(`[data-tab="${tabId}"]`).classList.add('active');

        // Update the URL hash without reloading the page
        window.history.pushState(null, null, '#' + tabId);
    }

    // Check for the hash in the URL when the page loads
    window.onload = function() {
        var hash = window.location.hash.substring(1); // Get the hash, excluding the '#'
        if (hash) {
            openTab(hash); // Open the tab specified by the hash
        } else {
            openTab('artist'); // Default tab if no hash is provided
        }
    }

</script>

</head>
<body>

    <div class="header">
        <h1>Admin Panel - Online Music Store</h1>
                <!-- Tabs for different CRUD sections -->
        <div class="tabs">
            <div class="tab active" onclick="openTab('artist')">Artists</div>
            <div class="tab" onclick="openTab('user')">Users</div>
            <div class="tab" onclick="openTab('order')">Orders</div>
            <div class="tab" onclick="openTab('songs')">Songs</div>
            <div class="tab" onclick="openTab('payment')">Payments</div>
            <div class="tab" href="index.jsp" onclick="window.location.href='index.jsp'">Home</div>
        </div>
    </div>

    <div class="container" style="max-width: 1000px;">


        <!-- Artist Section -->
        <div id="artist" class="tab-content active">
		<h2>Manage Artists</h2>
		<form action="ArtistServlet" method="post">
			<input type="hidden" name="redirect" value="admin.jsp">
		    <input type="hidden" name="action" value="create">
		    
		    <label for="email">Email:</label>
		    <input type="email" id="email" name="email" required placeholder="Enter artist's email">
		    
		    <label for="password">Password:</label>
		    <input type="password" id="password" name="password" required placeholder="Enter a password">
		    
		    <label for="fname">First Name:</label>
		    <input type="text" id="fname" name="fname" required placeholder="Enter first name">
		    
		    <label for="lname">Last Name:</label>
		    <input type="text" id="lname" name="lname" required placeholder="Enter last name">
		    
		    <label for="artistBio">Biography:</label>
		    <textarea id="artistBio" name="artistBio" required placeholder="Write a short biography" rows="4"></textarea>
		    
		    <button type="submit">Add Artist</button>
		</form>

            <table>
                <tr>
                    <th>Artist Email</th>
                    <th>Artist Name</th>
                    <th>Artist Bio</th>
                    <th>Actions</th>
                </tr>
                <!-- Loop through artists (Example) -->
                <%
                	List<Artist> artists = ArtistServlet.getAll();
                    for (Artist artist : artists) {
                %>
                    <tr>
                        <td><%= artist.getEmail() %></td>
                        <td><%= artist.getfName() + " " + artist.getlName() %></td>
                        <td><%= artist.getArtistBio() %></td>
                        <td>
							<button type="button" onclick="window.location.href='updateartist.jsp?email=<%= artist.getEmail() %>&redirect=admin.jsp#artist'">Update</button>
                            <form action="ArtistServlet" method="post" style="display:inline;">
                            	<input type="hidden" name="redirect" value="admin.jsp">
                                <input type="hidden" name="email" value=<%= artist.getEmail() %>>
                                <input type="hidden" name="action" value="delete">
                                <button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                            </form>
                        </td>
                    </tr>
				<%
                    }
                %>
            </table>
        </div>

       <!-- User Section -->
        <div id="user" class="tab-content">
            <h2>Manage Users</h2>
            <form onsubmit="return validatePhoneNumber()" action="UserServlet" method="post">
                <input type="hidden" name="redirect" value="admin.jsp#user">
                <input type="hidden" name="action" value="create">

                <label>Email</label>
                <input type="email" name="email" required>
                <label>Password</label>
                <input type="password" name="password" required>
                <label>First Name</label>
                <input type="text" name="fName" required>
                <label>Last Name</label>
                <input type="text" name="lName" required>
                <label>Role</label>
                <select name="role" required>
                    <option value="Admin">Admin</option>
                    <option value="User">User</option>
                </select>
                <label>DOB</label>
                <input type="date" name="dob" required>
                <label>Mobile</label>
                <input type="text" id="phone" name="phone" required>
                <label>Address</label>
                <input type="text" name="address" required>

                <button type="submit">Add User</button>
            </form>

            <table>
                <tr>
                    <th>User Email</th>
                    <th>User Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>DOB</th>
                    <th>Actions</th>
                </tr>
                <!-- Loop through users -->
                <%
                    List<User> users = UserServlet.getAll();
                    for (User user : users) {
                %>
                    <tr>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getfName() + " " + user.getlName() %></td>
                        <td><%= user.getAddress() %></td>
                        <td><%= user.getPhone() %></td>
                        <td><%= user.getRole() %></td>
                        <td><%= user.getDOB() %></td>
                                                                                                                                      
                        <td>
							<form action="UserServlet" method="post" style="display:inline;">
							    <input type="hidden" name="redirect" value="admin.jsp#user">
							    <input type="hidden" name="email" value="<%= user.getEmail() %>">
							    <input type="hidden" name="action" value="edit">
								<button type="button" onclick="window.location.href='updateuser.jsp?email=<%= user.getEmail() %>&redirect=admin.jsp#user'">Edit</button>

							</form>
                            <form action="UserServlet" method="post" style="display:inline;">
                                <input type="hidden" name="redirect" value="admin.jsp#user">
                                <input type="hidden" name="email" value="<%= user.getEmail() %>">
                                <input type="hidden" name="action" value="delete">
                                <button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                %>
            </table>
        </div>
  <!-- Order Section -->
        <div id="order" class="tab-content">
            <h2>Manage Orders</h2>
            <form  action="OrderServlet" method="post">
                <input type="hidden" name="redirect" value="admin.jsp#order">
                <input type="hidden" name="action" value="create">

                <label for="orderId">Order ID :</label>
                <input type="text" id="orderid" name="orderid" required placeholder="Enter order ID">

                <label for="user">User ID :</label>
                <input type="text" id="user" name="user" required placeholder="Enter user ID">

                <label for="song">Song :</label>
                <input type="text" id="song" name="song" required placeholder="Enter Song Name">
                
                <label for="date">Date :</label>
                <input type="Date" id="date" name="date" required placeholder="Enter Date">
                
                <label for="price">Total Amount:</label>
                <input type="text" id="price" name="price" required placeholder="Enter total amount">


                <button type="submit">Add Order</button>
            </form>

            <table>
                <tr>
                    <th>Order ID</th>
                    <th>User</th>
                    <th>Song</th>
                    <th>Date</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
                <!-- Loop through orders -->
                <%
                    List<Order> orders = OrderServlet.getAll();
                    for (Order order : orders) {
                %>
                    <tr>
                        <td><%= order.getOrderId() %></td>
                        <td><%= order.getUser() %></td>
                        <td><%= order.getSong() %></td>
                        <td><%= order.getDate() %></td>
                        <td><%= order.getPrice() %></td>                        
                        <td>
                            <form action="OrderServlet" method="post" style="display:inline;">
								<button type="button" onclick="window.location.href='updateorder.jsp?orderid=<%= order.getOrderId() %>&redirect=admin.jsp#order'">Update</button>
                            </form>
                            <form action="OrderServlet" method="post" style="display:inline;">
                                <input type="hidden" name="redirect" value="admin.jsp#order">
                                <input type="hidden" name="orderid" value="<%= order.getOrderId() %>">
                                <input type="hidden" name="action" value="delete">
                                <button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                %>
            </table>
        </div>
       <!-- Song Section -->
       	<div id="songs" class="tab-content" style="max-width: 1000px;">
            <h2>Manage Songs</h2>
            <form action="SongServlet" method="post" onsubmit="return validateSongForm()">
                <input type="hidden" name="redirect" value="admin.jsp#songs">
                <input type="hidden" name="action" value="create">

                <label for="title">Song Title:</label>
                <input type="text" id="title" name="title" required placeholder="Enter song Title">

                <label for="Artist">Artist:</label>
                <input type="text" id="artist" name="artist" required placeholder="Enter Artist">

                <label for="album">Album:</label>
                <input type="text" id="album" name="album" required placeholder="Enter album">
                
                <label for="genre">Genre:</label>
                <input type="text" id="genre" name="genre" required placeholder="Enter genre">
                
                <label for="releasedate">Release Date:</label>
                <input type="Date" id="releasedate" name="releasedate" required placeholder="Enter release date">
                
                <label for="duration">Duration:</label>
                <input type="text" id="duration" name="duration" required placeholder="Enter duration">
                
                <label for="link">Link:</label>
                <input type="text" id="link" name="link" required placeholder="Enter link">
                
                <label for="price">Price:</label>
                <input type="text" id="price" name="price" required placeholder="Enter price">

                <button type="submit">Add Song</button>
            </form>
            
				<table style="max-width: 1000px;">
                <tr>
					<th> Song Title </th>
					<th> Artist </th>
					<th> Album </th>
					<th> Genre </th>
					<th> Released Date </th>
					<th> Duration </th>
					<th> Price </th>
					<th> Action </th>
                </tr>
                <!-- Loop through songs -->
                <%
                    List<Song> songs = SongServlet.getAll();
                    for (Song song : songs) {
                %>
                    <tr>
                        <td><%= song.getTitle() %></td>
                        <td><%= song.getArtist() %></td>
                        <td><%= song.getAlbum() %></td>
                        <td><%= song.getGenre() %></td>
                        <td><%= song.getReleaseDate() %></td>
                        <td><%= song.getDuration() %></td>
                        <td><%= song.getPrice() %></td>
                        

                        <td>
							<button type="button" onclick="window.location.href='updatesong.jsp?title=<%= song.getTitle() %>&redirect=admin.jsp#songs'">Update</button>
                            <form action="SongServlet" method="post" style="display:inline;">
                				<input type="hidden" name="redirect" value="admin.jsp#songs">
                                <input type="hidden" name="title" value="<%= song.getTitle() %>">
                                <input type="hidden" name="action" value="delete">
                                <button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                %>
            </table>
        </div>


        <!-- Payment Section -->
        <div id="payment" class="tab-content">
            <h2>Manage Payments</h2>
            <form action="PaymentServlet" method="post">
                <input type="hidden" name="redirect" value="admin.jsp#payment">
                <input type="hidden" name="action" value="create">

				<label for="user">User:</label>
				<input type="text" id="user" name="user" required placeholder="Enter user">
				
				<label for="orders">Order:</label>
                <input type="text" id="orders" name="orders" required placeholder="Enter order">

				<label for="Date">Date:</label>
				<input type="Date" id="date" name="date" required placeholder="Enter date">

                <label for="totalprice">Payment Amount:</label>
                <input type="text" id="totalprice" name="totalprice" required placeholder="Enter payment amount">

                <button type="submit">Add Payment</button>
            </form>

            <table>
                <tr>
                    <th>Payment ID</th>
                    <th>User</th>
                    <th>Orders</th>
                    <th>Date</th>
                    <th>Payment Amount</th>
                    <th>Actions</th>
                </tr>
                <!-- Loop through payments -->
                <%
                    List<Payment> payments = PaymentServlet.getAll();
                    for (Payment payment : payments) {
                %>
                    <tr>
                        <td><%= payment.getPaymentId() %></td>
                        <td><%= payment.getUser() %></td>
                        <td><%= payment.getOrders() %></td>
                        <td><%= payment.getDate() %></td>
                        <td><%= payment.getTotalPrice() %></td>
                        <td>
                        	<button type="button" onclick="window.location.href='updatepayment.jsp?paymentid=<%= payment.getPaymentId() %>&redirect=admin.jsp#payment'">Update</button>
                            <form action="PaymentServlet" method="post" style="display:inline;">
                                <input type="hidden" name="redirect" value="admin.jsp#payment">
                                <input type="hidden" name="paymentid" value="<%= payment.getPaymentId() %>">
                                <input type="hidden" name="action" value="delete">
                                <button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                %>
            </table>
        </div>
</div>
</body>
   <%@ include file="components/footer.jsp" %>
</html>
