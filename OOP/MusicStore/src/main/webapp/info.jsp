<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Beatbox Music Store - Info</title>
    <link rel="icon" type="image/png" href="res/logo.png">
    <link rel="stylesheet" href="res/style.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url("res/a.jpg");
            background-size: cover;
            margin: 0;
            padding: 0;
            align-items: center;
            justify-content: center;
            display: flex;
            height: 100vh;
            flex-direction: column;
            
        }

        .container {
            width: 80%;
            margin: 50px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h2, h3 {
            color: #2c3e50;
            font-weight: 600;
        }

        p {
            color: #34495e;
        }

        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 20px;
            background-color: #2980b9;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }

        @media (max-width: 768px) {
            .container {
                width: 95%;
            }
        }
    </style>
</head>
<body>
	<div class="navbar">
		<div class="container">
			<img src="res/logo.png" alt="Beatbox Music Store" style="width: 200px; height: 200px; margin-top: 50px; margin-bottom: 20px;">
					        <h2>Beatbox Music Store</h2>
        <p>Discover the best in beatbox music and gear.</p>
		</div>

		
	</div>

    <div class="container">
            <a href="index.jsp" class="back-button">Home</a>
        <h3>Our Products</h3>
        <p>Equipment, tracks, lessons, and more.</p>

        <h3>Contact Us</h3>
        <p>Email: support@beatboxmusicstore.com</p>
    </div>

</body>
</html>
