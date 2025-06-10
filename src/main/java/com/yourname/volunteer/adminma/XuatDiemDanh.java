package com.yourname.volunteer.adminma;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/xuatdiemdanh")
public class XuatDiemDanh extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Thiết lập header để xuất file CSV
        response.setContentType("text/csv");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=diemdanh.csv");

OutputStream outputStream = response.getOutputStream();
outputStream.write(0xEF);
outputStream.write(0xBB);
outputStream.write(0xBF);
PrintWriter out = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true);


        // Kết nối CSDL thông qua lớp dbconnect
        com.example.dbconnect db = new com.example.dbconnect();

        try (Connection conn = db.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM attend ORDER BY iduser")) {

            ResultSetMetaData meta = rs.getMetaData();
            int columnCount = meta.getColumnCount();

            // Ghi dòng tiêu đề
            for (int i = 1; i <= columnCount; i++) {
                out.print(meta.getColumnName(i));
                if (i < columnCount) out.print(",");
            }
            out.println();

            // Ghi dữ liệu
            while (rs.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    out.print(escapeCsv(rs.getString(i)));
                    if (i < columnCount) out.print(",");
                }
                out.println();
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Lỗi khi xuất dữ liệu.");
        }
    }

    // Hàm xử lý dữ liệu an toàn cho CSV
    private String escapeCsv(String input) {
        if (input == null) return "";
        input = input.replaceAll("\"", "\"\""); // escape dấu ngoặc kép
        if (input.contains(",") || input.contains("\"") || input.contains("\n")) {
            input = "\"" + input + "\"";
        }
        return input.trim();
    }
}
