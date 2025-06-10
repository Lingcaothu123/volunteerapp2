<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yourname.volunteer.adminma.Registrant" %>
<%@ include file="/hadmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách đăng ký hoạt động <%= request.getAttribute("activityId") %></title>
</head>
<body>
<h2>Danh sách người đăng ký cho hoạt động ID: <%= request.getAttribute("activityId") %></h2>

<a href="<%= request.getContextPath() %>/ActivityServlet">Back to Activities</a>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Fullname</th>
        <th>Phone</th>
        <th>Skills</th>
        <th>Email</th>
        <th>Trạng thái đăng ký</th>
        <th>Điểm danh</th>  <!-- Thêm cột điểm danh -->
    </tr>

    <%
        List<Registrant> registrants = (List<Registrant>) request.getAttribute("registrants");
        if (registrants != null && !registrants.isEmpty()) {
            for (Registrant r : registrants) {
    %>
    <tr>
        <td><%= r.getFullname() %></td>
        <td><%= r.getPhone() %></td>
        <td><%= r.getSkills() %></td>
        <td><%= r.getEmail() %></td>
        <td><%= r.getTrangthaidangky() %></td>
        <td><%= r.getDiemdanh() != null ? r.getDiemdanh() : "Không có dữ liệu" %></td> <!-- Hiển thị điểm danh -->
    </tr>
    <%
            }
        } else {
    %>
    <tr><td colspan="6">Không có người đăng ký nào.</td></tr>
    <%
        }
    %>
</table>
</body>
</html>
