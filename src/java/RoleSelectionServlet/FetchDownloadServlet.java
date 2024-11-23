/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package RoleSelectionServlet;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author LuckyCharm
 */
public class FetchDownloadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
     private static final long serialVersionUID = 1L;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String filename = request.getParameter("filename");
        String secretKey = request.getParameter("secretKey");

        if (filename == null || secretKey == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Filename and secretKey are required.");
            return;
        }

        // Query to fetch file data
        String query = "SELECT filename, file_content FROM files WHERE filename=? AND secret_key=?";
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mabsk", "root", "");
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, filename);
            ps.setString(2, secretKey);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String fileNameFromDb = rs.getString("filename");
                    byte[] fileContent = rs.getBytes("file_content");

                    // Set response headers
                    response.setContentType("application/octet-stream");
                    response.setHeader("Content-Disposition", "attachment; filename=\"" + fileNameFromDb + "\"");
                    response.setContentLength(fileContent.length);

                    // Write file content to response output stream
                    try (OutputStream out = response.getOutputStream()) {
                        out.write(fileContent);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found.");
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
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
