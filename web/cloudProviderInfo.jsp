<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review File Upload</title>
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
            margin-bottom: 20px;
        }
        p {
            margin: 10px 0;
            color: #555;
        }
        .button-container {
            display: flex;
            justify-content: space-between; /* Space buttons evenly */
            margin-top: 20px;
        }
        button {
            flex: 1; /* Allow buttons to grow and fill the container */
            padding: 10px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            color: #fff;
            margin: 0 5px; /* Margin for spacing between buttons */
        }
        button.accept {
            background-color: #28a745; /* Green color for accept button */
        }
        button.accept:hover {
            background-color: #218838; /* Darker green on hover */
        }
        button.reject {
            background-color: #dc3545; /* Red color for reject button */
        }
        button.reject:hover {
            background-color: #c82333; /* Darker red on hover */
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Review File Upload</h1>
        <form action="FinalizeUploadServlet" method="post">
            <input type="hidden" name="requestId" value="<%= request.getParameter("requestId") %>">
            <input type="hidden" name="filename" value="<%= request.getParameter("filename") %>">
            <input type="hidden" name="secretKey" value="<%= request.getParameter("secretKey") %>">
            
            <p><strong>Filename:</strong> <%= request.getParameter("filename") %></p>
            <p><strong>Request ID:</strong> <%= request.getParameter("requestId") %></p>
            <p><strong>Secret Key:</strong> <%= request.getParameter("secretKey") %></p>

            <div class="button-container">
                <button type="submit" name="action" value="accept" class="accept">Accept</button>
                <button type="submit" name="action" value="reject" class="reject">Reject</button>
            </div>
        </form>
    </div>
</body>
</html>
