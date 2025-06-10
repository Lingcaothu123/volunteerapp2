///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.yourname.volunteer.adminma;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.*;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/ViewRegistrants")
//public class ViewRegistrantsServlet extends HttpServlet {
//
//    private RegistrantDAO registrantDAO = new RegistrantDAO();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String idactive = request.getParameter("idactive");
//        if (idactive == null || idactive.trim().isEmpty()) {
//            idactive = "4";  // mặc định hoặc báo lỗi tùy bạn
//        }
//
//        List<Registrant> registrants = registrantDAO.getRegistrantsByActivityId(idactive);
//        request.setAttribute("registrants", registrants);
//        request.setAttribute("idactive", idactive);
//
//        request.getRequestDispatcher("/viewRegistrants.jsp").forward(request, response);
//    }
//}
