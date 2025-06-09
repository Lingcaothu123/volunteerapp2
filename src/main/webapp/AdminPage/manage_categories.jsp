<%-- 
    Document   : manage_categories
    Created on : 2 thg 6, 2025, 20:26:55
    Author     : leduyduong
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yourname.volunteer.adminma.Category" %>
<%@ include file="/hadmin.jsp" %>
<!DOCTYPE html>
<html>
<head><title>Manage Categories</title></head>
<body>
<h2>Activity Categories</h2>

<!-- Form thêm danh mục -->
<form method="post" action="CategoryServlet">
    Add Category: <input type="text" name="category">
    <input type="hidden" name="action" value="add">
    <input type="submit" value="Add">
</form>

<!-- Bảng hiển thị danh mục -->
<table border="1">
<tr><th>Category</th><th>Actions</th></tr>

<%
    List<Category> categories = (List<Category>) request.getAttribute("categories");
    if (categories != null) {
        for (Category cat : categories) {
%>
<tr>
    <td><%= cat.getName() %></td>
    <td>
        <!-- Form Edit -->
        <form method="post" action="CategoryServlet" style="display:inline;">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="<%= cat.getId() %>">
            <input type="text" name="category" value="<%= cat.getName() %>" required>
            <input type="submit" value="Save">
        </form>

        <!-- Form Delete -->
        <form method="post" action="CategoryServlet" style="display:inline;" onsubmit="return confirm('Bạn có chắc muốn xóa?');">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="id" value="<%= cat.getId() %>">
            <input type="submit" value="Delete">
        </form>
    </td>
</tr>

<%
        }
    }
%>

</table>
</body>
</html>
