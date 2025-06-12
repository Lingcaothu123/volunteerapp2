
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ include file="navbar.jsp" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách hoạt động</title>
</head>
<body onload="loadhistory()">
    <div class="main-content">
        <!-- Dữ liệu sẽ được hiển thị ở đây -->
        <div id="booksContainer">Đang tải dữ liệu...</div>
    </div>

    <script>
        function loadhistory() {
            fetch('personalhistory')
                .then(response => response.text())
                .then(data => {
                    document.getElementById('booksContainer').innerHTML = data;
                });
        }
    </script>
</body>
</html>
