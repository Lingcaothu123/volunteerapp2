package com.yourname.volunteer.adminma;

import com.example.dbconnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Attend")
public class Showattend extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Activity> activityList = new ArrayList<>();
        com.example.dbconnect db = new com.example.dbconnect();
        try (Connection conn = db.getConnection()) {
            String sql = "SELECT * FROM activities";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Activity act = new Activity();
                act.setId(rs.getInt("id"));
                act.setTitle(rs.getString("title"));
                act.setDescription(rs.getString("description"));
                act.setStartTime(rs.getString("start_time"));
                act.setEndTime(rs.getString("end_time"));
                act.setLocation(rs.getString("location"));
                act.setRoles(rs.getString("roles"));
                act.setCapacity(rs.getInt("capacity"));

                double latitude = rs.getDouble("latitude");
                double longitude = rs.getDouble("longitude");
                act.setLatitude(latitude);
                act.setLongitude(longitude);

                String mapsLink;
                if (latitude != 0 && longitude != 0) {
                    mapsLink = "https://www.google.com/maps?q=" + latitude + "," + longitude;
                } else {
                    String locationEncoded = URLEncoder.encode(rs.getString("location"), "UTF-8");
                    mapsLink = "https://www.google.com/maps/search/?api=1&query=" + locationEncoded;
                }
                act.setMapsLink(mapsLink);

                act.setOrganization(rs.getString("organization"));
                act.setContact(rs.getString("contact"));
                act.setStatus(rs.getString("status"));

                activityList.add(act);
            }

            request.setAttribute("activities", activityList);
            request.getRequestDispatcher("/AdminPage/showattend.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error loading activities", e);
        }
    }
}
