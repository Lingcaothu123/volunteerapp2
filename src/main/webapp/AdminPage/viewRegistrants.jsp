<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yourname.volunteer.adminma.Registrant" %>
<html>
<head>
    <title>View Registrants</title>
</head>
<body>
<h2>Danh sách người đăng ký hoạt động ID = <%= request.getAttribute("idactive") %></h2>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Fullname</th>
        <th>Phone</th>
        <th>Skills</th>
        <th>Email</th>
        <th>Trạng thái đăng ký</th>
        <th>Điểm danh</th>
    </tr>

<%
    List<Registrant> registrants = (List<Registrant>) request.getAttribute("registrants");
    if (registrants != null && !registrants.isEmpty()) {
        for (Registrant r : registrants) {
            String iduser = r.getIduser();
            String idactive = r.getIdactive();
            String diemdanh = r.getDiemdanh();

            String diemDanhDisplay = "Không có dữ liệu";
            if (iduser != null && !iduser.trim().isEmpty() &&
                idactive != null && !idactive.trim().isEmpty()) {
                diemDanhDisplay = (diemdanh != null && !diemdanh.trim().isEmpty()) ? diemdanh : "Không có dữ liệu";
            }
%>
    <tr>
        <td><%= r.getFullname() %></td>
        <td><%= r.getPhone() %></td>
        <td><%= r.getSkills() %></td>
        <td><%= r.getEmail() %></td>
        <td><%= r.getTrangthaidangky() %></td>
        <td><%= diemDanhDisplay %></td>
    </tr>
<%
        }
    } else {
%>
    <tr><td colspan="6">Không có người đăng ký cho hoạt động này.</td></tr>
<%
    }
%>
</table>

<br>
<a href="ActivityServlet">Quay lại danh sách hoạt động</a>
</body>
</html>
