<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Volunteer</title>
    <link rel="stylesheet" href="css/hstyle.css">
</head>
<body>
    <%
        // Kiểm tra session có tồn tại thông tin fullname hay không
        String fullname = (String) session.getAttribute("fullname");
        if (fullname == null) {
            // Nếu chưa đăng nhập, redirect về trang login
            response.sendRedirect(request.getContextPath() + "/login");
            return; // Kết thúc trang hiện tại để tránh tiếp tục render
        }
    %>
    <div class="header">
        Volunteer
        <div style="float:right; font-size:16px;">
            Welcome <%= fullname %> | <a href="<%=request.getContextPath()%>/logout" style="color:black;">Log out</a>
        </div>
    </div>
    <div class="container">
        <div class="sidebar">
            <a href="<%=request.getContextPath()%>/home.jsp">Home</a>
            <a href="<%=request.getContextPath()%>/showactive.jsp">Xem danh sách các hoạt động</a>
            <a href="<%=request.getContextPath()%>/updateinf.jsp">Sửa thông tin cá nhân</a>
            <a href="<%=request.getContextPath()%>/historyactive.jsp">Hoạt động của bạn</a>
            <a href="<%=request.getContextPath()%>/personalhistory.jsp">Lịch sử cá nhân</a>
            <a href="<%=request.getContextPath()%>/attend.jsp">Xem điểm danh</a>
        </div>
        <div class="main-content">
            <h1>Home</h1>
            <!-- Nội dung chính của trang home -->
        </div>
    </div>
</body>
</html>
