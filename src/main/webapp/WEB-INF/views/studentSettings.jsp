<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Settings</title>

    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      }

      /* ===== Layout ===== */
      body {
        display: flex;
        min-height: 100vh;
      }

      /* ===== Sidebar ===== */
      .sidebar {
        width: 230px;
        background: #1f7f82;
        color: white;
        padding: 20px;
      }

      .profile {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 25px;
      }

      .profile img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
      }

      .menu a {
        display: block;
        color: white;
        text-decoration: none;
        padding: 10px 0;
        font-size: 14px;
      }

      .menu a:hover {
        opacity: 0.8;
      }

      /* ===== Main Layout ===== */
      .main {
        flex: 1;
        background: #e6e6e6;

        display: flex;
        flex-direction: column;
      }

      /* CONTENT AREA */
      .content {
        flex: 1;
        padding: 40px;
      }

      .main h2 {
        margin-bottom: 25px;
      }

      /* ===== Setting Row ===== */
      .setting {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 300px;
        margin-bottom: 20px;
      }

      /* ===== Toggle Switch ===== */
      .switch {
        position: relative;
        width: 42px;
        height: 22px;
      }

      .switch input {
        display: none;
      }

      .slider {
        position: absolute;
        cursor: pointer;
        background: #ccc;
        border-radius: 20px;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        transition: 0.3s;
      }

      .slider:before {
        content: "";
        position: absolute;
        width: 18px;
        height: 18px;
        left: 2px;
        top: 2px;
        background: white;
        border-radius: 50%;
        transition: 0.3s;
      }

      input:checked + .slider {
        background: #5a57d6;
      }

      input:checked + .slider:before {
        transform: translateX(20px);
      }

      /* ===== Buttons ===== */
      .actions {
        margin-top: 20px;
      }

      .save {
        background: #4b39d4;
        color: white;
        border: none;
        padding: 10px 18px;
        border-radius: 8px;
        cursor: pointer;
        margin-right: 10px;
      }

      .logout {
        background: #c0392b;
        color: white;
        border: none;
        padding: 10px 18px;
        border-radius: 8px;
        cursor: pointer;
        margin-top: 10px;
      }

      /* ===== Footer ===== */
      .footer {
        width: 100%;
        background: #0f5e61;
        color: white;
        text-align: center;
        padding: 18px 0;
        margin-top: auto;
      }
    </style>
  </head>

  <body>
    <!-- ===== Sidebar ===== -->
    <div class="sidebar">
      <div class="profile">
        <img src="https://i.pravatar.cc/40" />
        <span>Sophi Carter</span>
      </div>

      <div class="menu">
        <a href="studentDashboard">Dashboard</a>
        <a href="studentProject">Projects</a>
        <a href="studentJobs">Work and Jobs</a>
        <a href="studentMessage">Message</a>
        <a href="studentPayments">Payments</a>
        <a href="studentSettings">Settings</a>
      </div>
    </div>

    <!-- ===== Main ===== -->
    <div class="main">
      <div class="content">
        <h2>Settings</h2>

        <!-- SETTINGS -->
        <form action="saveSettings" method="post">
          <div class="setting">
            <span>Dark Mode</span>
            <label class="switch">
              <input type="checkbox" name="darkMode" />
              <span class="slider"></span>
            </label>
          </div>

          <div class="setting">
            <span>Email Alerts</span>
            <label class="switch">
              <input type="checkbox" name="emailAlerts" />
              <span class="slider"></span>
            </label>
          </div>

          <div class="actions">
            <button type="submit" class="save">Save Changes</button>
          </div>
        </form>

        <!-- LOGOUT -->
        <form action="studentLogout" method="get">
          <button type="submit" class="logout">Logout</button>
        </form>
      </div>

      <!-- Footer -->
      <jsp:include page="footer.jsp" />
    </div>
  </body>
</html>
