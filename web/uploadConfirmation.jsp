<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Upload Confirmation</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .form-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 100%;
                max-width: 500px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            p {
                margin: 10px 0;
                color: #555;
                text-align: center;
            }
            .login-link {
                text-align: center;
                margin-top: 1rem;
            }

            .login-link a {
                color: #ff9800;
                text-decoration: none;
                font-weight: bold;
            }

            .login-link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1>Upload Confirmation</h1>
            <p>Your file has been processed.</p>

            <div class="login-link">
                <p><a href="ownerLoginPage.jsp">Data Owner Login</a></p>
            </div>

        </div>
    </body>
</html>
