<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Roles Interface</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container styling */
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        /* Heading styling */
        h1 {
            text-align: center;
            color: #333;
        }

        h2 {
            color: #555;
            margin-bottom: 10px;
        }

        /* Role section styling */
        .role-section {
            margin-bottom: 20px;
        }

        /* Label styling */
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #666;
        }

        /* Button styling */
        .role-button {
            display: block;
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: orange;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .role-button:hover {
            background: #e68900;
        }

        .login-link {
            text-align: center;
            margin-top: 1rem;
        }

        .login-link a {
            color: orange;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
    <div class="container">
        <h1>Key Provider Interface</h1>
        <form action="roleSelection" method="post">
            <div class="role-section">
                <h2>Data Owner</h2>
                <button type="submit" name="role" value="dataOwner" class="role-button">Data Owner</button>
            </div>

            <div class="role-section">
                <h2>Data User</h2>
                <button type="submit" name="role" value="dataUser" class="role-button">Data User</button>
            </div>

            <div class="login-link">
                <p>Back to <a href="index.html">Home</a></p>
            </div>
        </form>
    </div>
</body>
</html>
