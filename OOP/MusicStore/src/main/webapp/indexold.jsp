<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mstore.artist.*, com.mstore.user.*, com.mstore.song.*, com.mstore.dbutill.*, com.mstore.order.*, 
com.mstore.payment.*, java.util.List, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BeatBox</title>
    <link rel="stylesheet" href="css/styles.css">
<script>
let currentAudio = null;

function togglePlayPause(link, button) {
    // If the current audio is playing and it's the same song, pause it
    if (currentAudio && currentAudio.src === link) {
        if (!currentAudio.paused) {
            currentAudio.pause();
            button.textContent = "Play";
        } else {
            currentAudio.play();
            button.textContent = "Pause";
        }
    } else {
        // Stop current audio if it's playing
        if (currentAudio) {
            currentAudio.pause();
            currentAudio.currentTime = 0; // Reset time
            const previousButton = document.querySelector(`button[data-link="${currentAudio.src}"]`);
            if (previousButton) previousButton.textContent = "Play"; // Reset previous button
        }
        // Create and play new audio
        currentAudio = new Audio(link);
        currentAudio.play();
        button.textContent = "Pause";
        button.setAttribute("data-link", link); // Set data attribute for tracking

        // Update the progress bar
        updateProgressBar();
    }
}

// Function to set volume
function setVolume(value) {
    if (currentAudio) {
        currentAudio.volume = value; // Set volume level (0.0 to 1.0)
    }
}

// Function to seek audio
function seekAudio(value) {
    if (currentAudio) {
        currentAudio.currentTime = (value / 100) * currentAudio.duration; // Set current time based on progress bar value
    }
}

// Update progress bar based on audio playback
function updateProgressBar() {
    if (currentAudio) {
        const progressBar = document.querySelector('input[type="range"][max="100"]');
        const update = setInterval(() => {
            if (currentAudio.ended) {
                clearInterval(update);
            }
            progressBar.value = (currentAudio.currentTime / currentAudio.duration) * 100;
        }, 1000); // Update every second
    }
}

</script>
</head> 
<body> 
    <%@ include file="components/header.jsp" %>
    <!-- Login Section --> 
    <div class="container">
        <!-- Content Section -->
        <div class="content">
 
            <!-- Song List Section -->      
            <div class="song-list">
			    <h2>Song List</h2>
			    <table>
			        <tr>
			            <th>Song Title</th>
			            <th>Artist</th>
			            <th>Album</th>
			            <th>Genre</th>
			            <th>Released Date</th>
			            <th>Duration</th>
			            <th>Link</th>
			            <th>Price</th>
			            <th>Action</th>
			        </tr>
			        <%
			        User userx = (User) request.getSession().getAttribute("user");
			        
			        // Revised Search Logic
			        List<Song> songs = new ArrayList<Song>(); 
			        List<Song> songlist = SongServlet.getAll();
			
			        // Get search query
			        String searchQuery = request.getParameter("searchQuery");
			
			        // Validate and filter songs based on the search query
			        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
			            for (Song song : songlist) {
			                if (song.getTitle().toLowerCase().contains(searchQuery.toLowerCase()) || 
			                    song.getArtist().toLowerCase().contains(searchQuery.toLowerCase())) {
			                    songs.add(song);
			                }
			            }
			        } else {
			            songs = songlist; // Show all songs if no query
			        }
			
			        // Display songs
			        if (songs.isEmpty()) {
			            out.println("<tr><td colspan='9'>No songs found.</td></tr>");
			        } else {
			            for (Song song : songs) {
			        %>
			                <tr>
			                    <td><%= song.getTitle() %></td>
			                    <td><%= song.getArtist() %></td>
			                    <td><%= song.getAlbum() %></td>
			                    <td><%= song.getGenre() %></td>
			                    <td><%= song.getReleaseDate() %></td>
			                    <td><%= song.getDuration() %></td>
			                    <td><%= song.getLink() %></td>
			                    <td><%= song.getPrice() %></td>
<td>
    <button type="button" onclick="window.location.href='buy.jsp?title=<%= song.getTitle() %>&redirect=admin.jsp#order'">Buy</button>
    <button type="button" onclick="togglePlayPause('<%= song.getLink() %>', this)">Play</button>
</td>
			                    
			                </tr>
			        <%
			            }
			        }
			        %>
			    </table>
			    
			</div>
			<br>
			<br>
			    <input type="range" min="0" max="1" step="0.01" value="0.5" onchange="setVolume(this.value)" style="width: 100px;" title="Volume">
    <input type="range" value="0" max="100" step="1" style="width: 1000px;" onchange="seekAudio(this.value)">
        </div>

        <!-- Sidebar Section -->
        <div class="sidebar">
            <!-- Site News Section -->

            <div class="artist-list">
                <h3>Your Orders</h3>
                <ul>
					<%
                	if (request.getSession().getAttribute("user") != null) {
                		out.println(request.getSession().getAttribute("user"));
						List<Order> orders = OrderServlet.getAll();
                    	for (Order order : orders) {
					%>
					
					<td>
					<%= order.getSong() + "-" + order.getPrice() %> 
					<form action="OrderServlet" method="post">
							<input type="hidden" name="redirect" value="index.jsp"> 
							<input type="hidden" name="action" value="delete"> 
							<input type="hidden" name="orderid" value="<%=order.getOrderId()%>">
							<button type="submit">Remove</button>
					</form>				
					</td>
					<%
                    	}
					%>
                </ul>
                
                <%
                	if (orders.size() > 0) {									
                %>
                		<button type="button" onclick="window.location.href='checkout.jsp'">Checkout</button>
				<%
                	}
                } else {
                %>
                <td> Please Login as a user to buy songs ! </td>

				<%
                }
				%>
            </div>
            
                    
            
        </div>
    </div>
	<!--  Footer Section -->
	<%@ include file="components/footer.jsp" %></body>
</html>
