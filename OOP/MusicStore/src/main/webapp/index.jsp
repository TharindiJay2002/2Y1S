<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mstore.artist.*, com.mstore.user.*, com.mstore.song.*, com.mstore.dbutill.*, com.mstore.order.*, com.mstore.payment.*, java.util.List, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BeatBox</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .song-card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        
        .song-card {
        	background-image: url('res/h.jpg');
        	background-size: cover;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .song-card:hover {
            transform: translateY(-5px);
        }

        .song-card h4 {
            margin-bottom: 10px;
            color: #2c3e50;
        }

        .song-card p {
            color: #34495e;
            margin-bottom: 10px;
        }

        .song-card button {
            margin-top: 10px;
            padding: 8px 12px;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .song-card button:hover {
            background-color: #3498db;
        }
        
        .volume-control, .seek-bar {
            margin: 20px 0;
        }
        
        .song-divbox {
        	background-color: rgba(255,255,255,0.6);
		    padding: 20px;
		    border-radius: 10px;
		    backdrop-filter: blur(10px); /* Apply the blur effect */
		}
		
		.controls-divbox {
		    margin: 20px 0;
		}
		
		.controls-container {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    gap: 20px;
		    padding: 10px;
		    background-color: #f0f0f0;
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    width: 100%; /* Make the container take full width */
		}
		
		.control-item {
		    display: flex;
		    flex-direction: column; /* Labels appear below the slider */
		    align-items: center;
		    gap: 5px;
		    flex-grow: 1;
		}
		
		.playback {
		    flex-grow: 2; /* Make the playback bar longer */
		}
		
		.control-item input[type="range"] {
		    width: 100%;
		    appearance: none;
		    height: 6px;
		    background: #ddd;
		    border-radius: 5px;
		    outline: none;
		    transition: background 0.3s ease;
		}
		
		.control-item input[type="range"]::-webkit-slider-thumb {
		    appearance: none;
		    width: 15px;
		    height: 15px;
		    border-radius: 50%;
		    background-color: #2980b9;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}
		
		.control-item input[type="range"]:hover {
		    background: #ccc;
		}
		
		.control-item input[type="range"]::-webkit-slider-thumb:hover {
		    background-color: #3498db;
		}
		
		label {
		    font-size: 14px;
		    color: #34495e;
		    margin-top: 5px;
		    text-align: center;
		}
		
		/* Ensuring the playback bar looks like a form input */
		.playback input[type="range"] {
		    height: 8px;
		    background-color: #ddd;
		}
		
		
    </style>
    <script>
        let currentAudio = null;

        function togglePlayPause(link, button) {
            if (currentAudio && currentAudio.src === link) {
                if (!currentAudio.paused) {
                    currentAudio.pause();
                    button.textContent = "Play";
                } else {
                    currentAudio.play();
                    button.textContent = "Pause";
                }
            } else {
                if (currentAudio) {
                    currentAudio.pause();
                    currentAudio.currentTime = 0;
                    const previousButton = document.querySelector(`button[data-link="${currentAudio.src}"]`);
                    if (previousButton) previousButton.textContent = "Play";
                }

                currentAudio = new Audio(link);
                currentAudio.play();
                button.textContent = "Pause";
                button.setAttribute("data-link", link);
            }
        }

        function setVolume(value) {
            if (currentAudio) {
                currentAudio.volume = value;
            }
        }

        function seekAudio(value) {
            if (currentAudio) {
                currentAudio.currentTime = (value / 100) * currentAudio.duration;
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

                <div class="song-card-grid">
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

                    // Display songs in card view
                    if (songs.isEmpty()) {
                        out.println("<p>No songs found.</p>");
                    } else {
                        for (Song song : songs) {
                    %>
                    <div class="song-card">
                    	<div class="song-divbox">
	                        <h4><%= song.getTitle() %></h4>
	                        <p>Artist: <%= song.getArtist() %></p>
	                        <p>Album: <%= song.getAlbum() %></p>
	                        <p>Genre: <%= song.getGenre() %></p>
	                        <p>Release Date: <%= song.getReleaseDate() %></p>
	                        <p>Duration: <%= song.getDuration() %></p>
	                        <p>Price: <%= song.getPrice() %></p>
	                        <button type="button" onclick="window.location.href='buy.jsp?title=<%= song.getTitle() %>&redirect=admin.jsp#order'">Buy</button>
	                        <button type="button" onclick="togglePlayPause('<%= song.getLink() %>', this)">Play</button>
                        </div>
                    </div>
                    <%
                        }
                    }
                    %>
                </div>
					<div class="song-divbox">
					    <div class="controls-container">
					        <!-- Volume Control -->
					        <div class="control-item">
					            <input id="volume-control" type="range" min="0" max="1" step="0.01" value="0.5" onchange="setVolume(this.value)" title="Volume">
					            <label for="volume-control">Volume</label>
					        </div>
					        
					        <!-- Playback Control (Seek Bar) -->
					        <div class="control-item playback">
					            <input id="seek-bar" type="range" value="0" max="100" step="1" onchange="seekAudio(this.value)">
					            <label for="seek-bar">Playback</label>
					        </div>
					    </div>
					</div>
			<br>
			<br>
            <!-- Sidebar Section -->
            <div class="sidebar">
                <div class="artist-list">
                    <h3>Your Orders</h3>
                    <ul>
                        <%
                        List<Order> orders = new ArrayList<Order>();
                        if (request.getSession().getAttribute("user") != null) {
                            out.println(request.getSession().getAttribute("user"));
                            orders = OrderServlet.getAll();
                            for (Order order : orders) {
                        %>
                        <li>
                            <%= order.getSong() + " - " + order.getPrice() %> 
                            <form action="OrderServlet" method="post">
                                <input type="hidden" name="redirect" value="index.jsp"> 
                                <input type="hidden" name="action" value="delete"> 
                                <input type="hidden" name="orderid" value="<%=order.getOrderId()%>">
                                <button type="submit">Remove</button>
                            </form>
                        </li>
                        <%
                            }
                        }
                        if (orders.size() > 0) {
                        %>
                        <button type="button" onclick="window.location.href='checkout.jsp'">Checkout</button>
                        <%
                        } else {
                        %>
                        <p>Please login as a user to buy songs!</p>
                        <%
                        }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </div>
    
</body> 

    <%@ include file="components/footer.jsp" %>
</html>
