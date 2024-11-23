<%@ page import="javax.servlet.*, javax.servlet.http.*, java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Download File</title>
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
            .container {
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 300px;
                text-align: center;
            }
            h2 {
                color: #333;
                margin-bottom: 20px;
            }
            label {
                display: block;
                margin: 10px 0 5px;
                color: #555;
            }
            input[type="text"], input[type="password"] {
                width: calc(100% - 22px);
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: orange;
                color: #fff;
                border: none;
                padding: 10px 15px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 10px;
            }
            input[type="submit"]:hover {
                background: #e68900;
            }

            .login-link {
                text-align: center;
                margin-top: 1rem;
            }

            .login-link a {
                color: blue;
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
            <h2>Download File</h2>
            <form action="downloadFileServlet" method="get">
                <label for="filename">Filename:</label>
                <input type="text" id="filename" name="filename" required><br>

                <label for="secretkey">Secret Key:</label>
                <input type="password" id="secretkey" name="secretkey" required><br>

                <input type="submit" value="Download File">

                <div class="login-link">
                    <p><a href="userLoginPage.jsp">User Login</a></p>
                </div>

            </form>
        </div>
    </body>
</html>
