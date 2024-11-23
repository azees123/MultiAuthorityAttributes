/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package RoleSelectionServlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LuckyCharm
 */
public class uploadFileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final Logger LOGGER = Logger.getLogger(uploadFileServlet.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestId = request.getParameter("requestId");
        String filename = request.getParameter("filename");

        if (requestId == null || filename == null || requestId.isEmpty() || filename.isEmpty()) {
            response.sendRedirect("errorOwner.jsp?message=Invalid request parameters.");
            return;
        }

        if (!isRequestAccepted(requestId)) {
            response.sendRedirect("errorOwner.jsp?message=Request not accepted.");
            return;
        }

        Part filePart = request.getPart("file");

        try (InputStream fileContent = filePart.getInputStream()) {
            byte[] encryptedFileContent = encryptFile(fileContent);
            storeFileInDatabase(requestId, filename, encryptedFileContent);
            response.sendRedirect("uploadSuccessOwner.jsp");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "File upload failed", e);
            response.sendRedirect("errorOwner.jsp?message=File upload failed.");
        }
    }

    private boolean isRequestAccepted(String requestId) {
        // Implement logic to check if the request is accepted
        return true; // Placeholder; replace with actual implementation
    }

    private byte[] encryptFile(InputStream fileContent) throws IOException {
        // Implement file encryption logic here
        // For example, using a simple encryption algorithm
        return fileContent.readAllBytes(); // Placeholder; replace with actual encryption
    }

    private void storeFileInDatabase(String requestId, String filename, byte[] fileContent) throws SQLException {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mabsk", "root", "")) {
            String sql = "INSERT INTO files (request_id, filename, file_content) VALUES (?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, requestId);
                pstmt.setString(2, filename);
                pstmt.setBytes(3, fileContent);
                pstmt.executeUpdate();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
