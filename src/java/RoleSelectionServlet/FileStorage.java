/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package RoleSelectionServlet;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author LuckyCharm
 */
public class FileStorage {
     private static final String DB_URL = "jdbc:mysql://localhost:3306/mabsk";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public void storeFileInDatabase(String requestId, String filename, InputStream fileContentStream) throws SQLException, IOException {
        byte[] fileContent = fileContentStream.readAllBytes();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO files (request_id, filename, file_content) VALUES (?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, requestId);
                pstmt.setString(2, filename);
                pstmt.setBytes(3, fileContent);
                pstmt.executeUpdate();
            }
        }
    }

    public void deleteFileFromDatabase(String requestId, String filename) throws SQLException {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "DELETE FROM files WHERE request_id = ? AND filename = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, requestId);
                pstmt.setString(2, filename);
                pstmt.executeUpdate();
            }
        }
    }
}
