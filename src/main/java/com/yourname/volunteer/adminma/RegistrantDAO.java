///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.yourname.volunteer.adminma;
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//public class RegistrantDAO {
//
//    private Connection getConnection() throws SQLException {
//        // Cấu hình kết nối DB của bạn, ví dụ:
//        String url = "jdbc:mysql://localhost:3306/yourdb";
//        String user = "youruser";
//        String password = "yourpassword";
//        return DriverManager.getConnection(url, user, password);
//    }
//
//    public List<Registrant> getRegistrantsByActivityId(String idactive) {
//        List<Registrant> registrants = new ArrayList<>();
//        String sql = "SELECT login1.fullname, login1.phone, login1.skills, login1.email, " +
//                     "trangthai.trangthaidangky, diemdanh.diemdanh, diemdanh.iduser, diemdanh.idactive " +
//                     "FROM login1 " +
//                     "JOIN trangthai ON trangthai.iduser = login1.iduser " +
//                     "LEFT JOIN diemdanh ON diemdanh.iduser = login1.iduser AND diemdanh.idactive = ? " +
//                     "WHERE trangthai.idactive = ?";
//
//        try (Connection conn = getConnection();
//             PreparedStatement ps = conn.prepareStatement(sql)) {
//
//            ps.setString(1, idactive);
//            ps.setString(2, idactive);
//
//            try (ResultSet rs = ps.executeQuery()) {
//                while (rs.next()) {
//                    String fullname = rs.getString("fullname");
//                    String phone = rs.getString("phone");
//                    String skills = rs.getString("skills");
//                    String email = rs.getString("email");
//                    String trangthaidangky = rs.getString("trangthaidangky");
//                    String diemdanh = rs.getString("diemdanh");
//                    String iduser = rs.getString("iduser");
//                    String idactiveRs = rs.getString("idactive");
//
//                    Registrant r = new Registrant(fullname, phone, skills, email, trangthaidangky,
//                                                  diemdanh, iduser, idactiveRs);
//                    registrants.add(r);
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return registrants;
//    }
//}
