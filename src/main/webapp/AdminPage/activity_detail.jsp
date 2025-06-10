<%-- 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yourname.volunteer.adminma.Activity" %>
<%@ include file="/hadmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Activity Detail</title>
</head>
<body>
<%
    Activity activity = (Activity) request.getAttribute("activity");
    if (activity == null) {
%>
    <h3>Activity not found.</h3>
<%
    } else {
%>
    <h2>Activity Details</h2>
    <table border="1">
        <tr><th>ID</th><td><%= activity.getId() %></td></tr>
        <tr><th>Title</th><td><%= activity.getTitle() %></td></tr>
        <tr><th>Description</th><td><%= activity.getDescription() %></td></tr>
        <tr><th>Start Time</th><td><%= activity.getStartTime() %></td></tr>
        <tr><th>End Time</th><td><%= activity.getEndTime() %></td></tr>
        <tr><th>Location</th><td><%= activity.getLocation() %></td></tr>
        <tr><th>Map</th>
            <td>
                <a href="<%= activity.getMapsLink() %>" target="_blank">View Map</a>
            </td>
        </tr>
        <tr><th>Roles</th><td><%= activity.getRoles() %></td></tr>
        <tr><th>Capacity</th><td><%= activity.getCapacity() %></td></tr>
        <tr><th>Organization</th><td><%= activity.getOrganization() %></td></tr>
        <tr><th>Contact</th><td><%= activity.getContact() %></td></tr>
        <tr><th>Status</th><td><%= activity.getStatus() %></td></tr>
    </table>
    <br>
    <a href="<%= request.getContextPath() %>/ActivityServlet">Back to Activity List</a>
<%
    }
%>
</body>
</html>
