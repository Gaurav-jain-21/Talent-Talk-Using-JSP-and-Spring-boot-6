<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="java.util.*" %> <%@ taglib prefix="c"
uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Admin Users</title>

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
      /* ===== YOUR ORIGINAL CSS (UNCHANGED) ===== */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", sans-serif;
      }

      body {
        background: #f6f7fb;
        display: flex;
        min-height: 100vh;
      }

      /* Sidebar */
      .sidebar {
        width: 240px;
        background: #ffffff;
        padding: 20px;
        border-right: 1px solid #e6e6e6;
      }

      .sidebar h2 {
        margin-bottom: 30px;
        font-size: 18px;
      }

      .menu a {
        display: flex;
        align-items: center;
        padding: 10px 12px;
        margin-bottom: 8px;
        text-decoration: none;
        color: #333;
        border-radius: 8px;
        font-size: 14px;
      }

      .menu a i {
        width: 20px;
        margin-right: 10px;
        color: #6c63ff;
      }

      .menu a.active,
      .menu a:hover {
        background: #f0f1f7;
      }

      /* Main Content */
      .main {
        flex: 1;
        padding: 30px;
      }

      .header {
        font-size: 24px;
        font-weight: 600;
        margin-bottom: 25px;
      }

      /* Toolbar */
      .toolbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
      }

      /* Search box */
      .search-box {
        display: flex;
        align-items: center;
        background: #f2f3f7;
        padding: 10px 14px;
        border-radius: 10px;
        width: 320px;
      }

      .search-box i {
        color: #888;
        margin-right: 8px;
      }

      .search-box input {
        border: none;
        outline: none;
        background: transparent;
        width: 100%;
        font-size: 14px;
      }

      /* Filter button */
      .filter-btn {
        background: #ffffff;
        border: 1px solid #ddd;
        padding: 10px 14px;
        border-radius: 10px;
        cursor: pointer;
        font-size: 14px;
      }

      .filter-btn i {
        margin-left: 6px;
      }

      /* user list */
      .container {
        background: #fff;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      }

      .user-table {
        width: 100%;
        border-collapse: collapse;
      }

      .user-table thead th {
        text-align: left;
        color: #888;
        font-weight: 600;
        padding: 12px 16px;
        border-bottom: 1px solid #eee;
      }

      .user-table tbody tr {
        border-bottom: 1px solid #f0f0f0;
        transition: background 0.2s;
      }

      .user-table tbody tr:hover {
        background: #fafafa;
      }

      .user-table td {
        padding: 14px 16px;
        vertical-align: middle;
      }

      /* User info */
      .user-info {
        display: flex;
        align-items: center;
        gap: 12px;
      }

      .user-info img {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        object-fit: cover;
      }

      /* Role badge */
      .role-badge {
        background: #f0eefc;
        color: #6b63ff;
        padding: 6px 14px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: 500;
      }

      /* Status */
      .status {
        font-weight: 600;
      }

      .status.active {
        color: #5a54ff;
      }

      .status.hold {
        color: #888;
      }

      /* Actions */
      .actions a {
        text-decoration: none;
        color: #5a54ff;
        font-weight: 500;
      }

      .actions a:hover {
        text-decoration: underline;
      }

      .action-btn {
        display: inline-block;
        margin-right: 10px;
        padding: 6px 12px;
        border-radius: 8px;
        font-size: 13px;
        text-decoration: none;
        font-weight: 600;
      }

      .message-btn {
        background: #eef2ff;
        color: #5a54ff;
      }

      .delete-btn {
        background: #feecec;
        color: #c23030;
      }
    </style>
  </head>

  <body>
    <!-- Sidebar -->
    <div class="sidebar">
      <h2>Admin Panel</h2>
      <div class="menu">
        <a href="adminDashboard"
          ><i class="fa-solid fa-chart-line"></i> Dashboard</a
        >
        <a href="adminUsers" class="active"
          ><i class="fa-solid fa-users"></i> Users</a
        >
        <a href="adminJobs"> <i class="fa-solid fa-briefcase"></i> Jobs </a>

        <a href="adminCompany">
          <i class="fa-solid fa-building"></i> Company Verification
        </a>

        <a href="adminInsights">
          <i class="fa-solid fa-chart-pie"></i> Insights
        </a>

        <a href="adminPayment">
          <i class="fa-solid fa-credit-card"></i> Payments
        </a>

        <a href="adminSettings"> <i class="fa-solid fa-gear"></i> Settings </a>
      </div>
    </div>

    <!-- Main -->
    <div>
      <div class="main">
        <div class="header">Student Management</div>

        <div class="toolbar" style="margin-bottom: 20px;">
          <div class="search-box">
            <i class="fa fa-search"></i>
            <input type="text" id="studentSearch" placeholder="Search by name or email...">
          </div>
        </div>

        <div class="container">
          <table class="user-table">
            <thead>
              <tr>
                <th>Name</th>
                <th class="student-row">
                  <td class="student-name">
                    <c:out value="${s.firstName}" /> <c:out value="${s.lastName}" />
                  </td>
                  <td class="student-email"
              <c:forEach var="s" items="${students}">
                <tr>
                  <td>
                    <c:out value="${s.firstName}" />
                    <c:out value="${s.lastName}" />
                  </td>
                  <td><c:out value="${s.email}" /></td>
                  <td>
                    <a class="action-btn message-btn" href="mailto:${s.email}"
                      >Message</a
                    >
                  </td>
                  <td>
                    <a
                      class="action-btn delete-btn"
                      href="${pageContext.request.contextPath}/deleteStudent?id=${s.id}"
                      onclick="return confirm('Delete this student?');"
                      >Delete</a
                    >
                  </td>
                </tr>
              </c:forEach>

              <c:if test="${empty students}">
                <tr>
                  <td
                    colspan="4"
                    style="text-align: center; padding: 50px; color: #999"
                  >
                    No students registered in the database yet.
                  </td>
                </tr>
              </c:if>
            </tbody>
          </table>
        </div>
      </div>
      <jsp:include page="footer.jsp" />
    </div>
  </body>
</html>

  <script>
  $(document).ready(function() {
    $('#studentSearch').on('keyup', function() {
      var searchTerm = $(this).val().toLowerCase();
      
      $('.student-row').each(function() {
        var studentName = $(this).find('.student-name').text().toLowerCase();
        var studentEmail = $(this).find('.student-email').text().toLowerCase();
        
        if (studentName.includes(searchTerm) || studentEmail.includes(searchTerm)) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });
    });
  });
  </script>