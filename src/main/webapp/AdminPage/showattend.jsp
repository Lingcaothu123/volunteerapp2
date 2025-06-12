<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yourname.volunteer.adminma.Activity" %>
<%@ include file="/hadmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Activities</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function generateQRCode(idactive) {
        const qrDiv = $('#qrCode_' + idactive);
        const btn = $('#qrBtn_' + idactive);

        // Nếu QR đang hiển thị, thì ẩn nó
        if (qrDiv.is(':visible') && qrDiv.html().trim() !== '') {
            qrDiv.hide();
            btn.text('Tạo mã QR');
        } else {
            // Nếu chưa có mã QR, gọi server để tạo
            if (qrDiv.html().trim() === '') {
                $.ajax({
                    url: 'QRCodeGenerator',
                    method: 'GET',
                    data: { idactive: idactive },
                    success: function(response) {
                        qrDiv.html('<img src="data:image/png;base64,' + response + '" alt="QR Code" />');
                        qrDiv.show();
                        btn.text('Ẩn mã QR');
                    },
                    error: function() {
                        alert('Có lỗi xảy ra khi tạo mã QR!');
                    }
                });
            } else {
                // Đã có QR => chỉ cần hiển thị lại
                qrDiv.show();
                btn.text('Ẩn mã QR');
            }
        }
    }
</script>

</head>
<body>
<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
    <h2>Activity List</h2>
    <a href="xuatdiemdanh" style="text-decoration: none; font-size: 16px; background-color: 
       #4CAF50; color: white; padding: 8px 12px; border-radius: 4px;">Xuất điểm danh</a>
</div>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Start Time</th>
        <th>End Time</th>
        <th>Location</th>
        <th>Maps</th>
        <th>Roles</th>
        <th>Capacity</th>
        <th>Organization</th>
        <th>Contact</th>
        <th>Status</th>
        <th>Điểm danh</th>
    </tr>

    <%
        List<Activity> activities = (List<Activity>) request.getAttribute("activities");
        if (activities != null) {
            for (Activity a : activities) {
                // Kiểm tra nếu trạng thái là "Đang diễn ra"
                if ("Đang diễn ra".equals(a.getStatus())) {
                    String idactive = String.valueOf(a.getId());  // Lấy ID hoạt động để tạo URL
    %>
    <tr>
        <td><%= a.getId() %></td>
        <td><%= a.getTitle() %></td>
        <td><%= a.getDescription() %></td>
        <td><%= a.getStartTime() %></td>
        <td><%= a.getEndTime() %></td>
        <td><%= a.getLocation() %></td>
        <td>
            <a href="<%= a.getMapsLink() %>" target="_blank">View Map</a>
        </td>
        <td><%= a.getRoles() %></td>
        <td><%= a.getCapacity() %></td>
        <td><%= a.getOrganization() %></td>
        <td><%= a.getContact() %></td>
        <td><%= a.getStatus() %></td>
        <td>
    <button id="qrBtn_<%= idactive %>" onclick="generateQRCode(<%= idactive %>)">Tạo mã QR</button>
    <div id="qrCode_<%= idactive %>" style="margin-top: 5px; display: none;"></div>
</td>
    </tr>
    <%
                }
            }
        }
    %>
</table>
</body>
</html>
