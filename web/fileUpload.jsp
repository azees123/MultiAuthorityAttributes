<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>File Upload</title>
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

            label {
                display: block;
                margin: 10px 0 5px;
                color: #555;
            }

            input[type="text"], input[type="file"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type="file"] {
                padding: 3px;
                border: none;
                background-color: #f9f9f9;
            }

            button {
                display: block;
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button:hover {
                background-color: #0056b3;
            }

            .button-container {
                display: flex;
                flex-direction: column;
                gap: 15px; /* Adds space between the buttons */
            }

            .button-container button {
                width: 100%;
                padding: 10px;
                background-color: orange;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .button-container button:hover {
                background: #e68900;
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

            p {
                margin: 10px 0;
                color: #555;
                text-align: center;
            }
        </style>

        <script>
            function generateKey() {
                // Generate a random key
                const key = Math.random().toString(36).substr(2, 8); // Example key: 8 alphanumeric characters

                // Set the key value to the input field
                document.getElementById('secretKey').value = key;
            }

            function generateReqId() {
                // Generate a random integer between 1 and 100
                const reqId = Math.floor(Math.random() * 100) + 1;

                // Set the integer value to the input field
                document.getElementById('requestId').value = reqId;
            }
        </script>

    </head>
    <body>
        <div class="form-container">
            <h1>Upload File</h1>
            <form action="FileRequestServlet" method="post" enctype="multipart/form-data">
                <label for="requestId">Request ID:</label>
                <input type="text" id="requestId" name="requestId" readonly>

                <div class="button-container">
                    <button type="button" onclick="generateReqId()">Generate Request Id</button>
                </div>

                <label for="file">Choose file:</label>
                <input type="file" id="file" name="file" required>

                <label for="filename">Filename:</label>
                <input type="text" id="filename" name="filename" placeholder="Filename" required>

                <label for="secretKey">Secret Key:</label>
                <input type="text" id="secretKey" name="secretKey" readonly>

                <div class="button-container">
                    <button type="button" onclick="generateKey()">Generate Secret Key</button>
                    <button type="submit">Submit</button>
                </div>

                <div class="login-link">
                    <p><a href="ownerLoginPage.jsp">Data Owner Login</a></p>
                </div>
            </form>
        </div>
    </body>
</html>
