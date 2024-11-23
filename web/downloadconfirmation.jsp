<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Confirm Download</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                background: white;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 100%;
                max-width: 500px;
                text-align: center;
            }

            h2 {
                color: #333;
                margin-bottom: 20px;
            }

            p {
                font-size: 18px;
                color: #666;
                margin-bottom: 20px;
            }

            form {
                margin-top: 20px;
            }

            input[type="submit"], input[type="button"] {
                padding: 12px 25px;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                color: white;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            input[type="submit"] {
                background-color: #28a745;
            }

            input[type="submit"]:hover {
                background-color: #218838;
            }

            input[type="button"] {
                background-color: #dc3545; /* Red color for reject button */
                margin-left: 10px;
            }

            input[type="button"]:hover {
                background-color: #c82333; /* Darker red for hover effect */
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
            <h2>Confirm Download</h2>
            <p>Filename: <%= request.getAttribute("filename")%></p>
            <p>Secret Key: <%= request.getAttribute("secretKey")%></p>
            <form action="AcceptDownloadServlet" method="post">
                <input type="hidden" name="filename" value="<%= request.getAttribute("filename")%>">
                <input type="hidden" name="secretKey" value="<%= request.getAttribute("secretKey")%>">
                <input type="submit" name="action" value="Accept">
                <input type="button" value="Reject" onclick="window.location.href = 'userLoginPage.jsp';">
            </form>

            <div class="login-link">
                <p><a href="userLoginPage.jsp">User Login</a></p>
            </div>
        </div>
    </body>
</html>
