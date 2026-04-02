<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Post a New Job</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(90deg, #1f7a82, #2a9aa3);
      }

      /* Navbar */
      .navbar {
        background-color: #1b6f75;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 30px;
        color: #fff;
      }

      .nav-left {
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .profile-img {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        background-color: #fff;
      }

      .nav-links {
        display: flex;
        gap: 25px;
      }

      .nav-links a {
        text-decoration: none;
        color: #fff;
        font-size: 14px;
      }

      .nav-links a:hover {
        text-decoration: underline;
      }

      /* Main Layout */
      .main-wrapper {
        display: flex;
        justify-content: center;
        padding: 40px 0;
      }

      .container {
        width: 700px;
        background: rgba(255, 255, 255, 0.05);
        padding: 30px 40px 40px;
        border-radius: 12px;
        color: #000;
      }

      h1 {
        text-align: center;
        margin-bottom: 25px;
      }

      .header-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
      }

      .save-draft {
        display: flex;
        align-items: center;
        gap: 6px;
        font-size: 14px;
        cursor: pointer;
      }

      .section-title {
        font-weight: bold;
        margin: 20px 0 10px;
      }

      label {
        font-size: 14px;
        display: block;
        margin-bottom: 6px;
      }

      input,
      textarea,
      select {
        width: 100%;
        padding: 12px;
        border-radius: 8px;
        border: none;
        background: #d9d9d9;
        font-size: 14px;
      }

      .row {
        display: flex;
        gap: 15px;
        margin-top: 10px;
      }

      .row > div {
        flex: 1;
      }

      textarea {
        height: 120px;
        resize: none;
      }

      .post-btn {
        margin-top: 25px;
        width: 180px;
        padding: 12px;
        border: none;
        border-radius: 20px;
        background: linear-gradient(90deg, #2a2aff, #5f2bff);
        color: #fff;
        font-size: 20px;
        cursor: pointer;
        float: right;
      }

      .post-btn:hover {
        opacity: 0.9;
      }

      /* Form Validation Styles */
      .input-error {
        border: 2px solid #e74c3c !important;
        background: #fadbd8 !important;
      }

      .error-message {
        color: #e74c3c;
        font-size: 12px;
        margin-top: 4px;
        display: none;
      }

      .error-message.show {
        display: block;
      }

      .input-success {
        border: 2px solid #28a745 !important;
        background: #d4edda !important;
      }
    </style>
  </head>
  <body>
    <!-- Navbar -->
    <div class="navbar">
      <div class="nav-left">
        <div class="profile-img"></div>
      </div>
      <div class="nav-links">
        <a href="companyDashboard">Dashboard</a>
        <a href="companyClient">Clients</a>
        <a href="companyJobs">Post Jobs</a>
        <a href="companyManageJobs">Manage Jobs</a>
        <a href="companyApplication">Application</a>
        <a href="companyMessage">Messages</a>
        <a href="companyPayment">Payments</a>
        <a href="companySettings">Settings</a>
      </div>
    </div>

    <div class="main-wrapper">
      <div class="container">
        <h1>Post a New Jobs</h1>

        <div class="header-row">
          <div class="section-title">Project Details</div>
          <div class="save-draft">💾 Save Draft</div>
        </div>

        <label>Job Title</label>
        <form id="jobPostingForm" method="post" action="addCompanyJob">
          <input
            type="text"
            id="jobTitle"
            name="jobtitle"
            placeholder="Enter job title"
            required
          />
          <div class="error-message" id="jobTitleError">
            Job title is required and must be 5+ characters
          </div>

          <label style="margin-top: 15px">Project Category</label>
          <select id="projectType" name="projecttype" required>
            <option value="">Select category</option>
            <option value="Web Development">Web Development</option>
            <option value="Mobile App">Mobile App</option>
            <option value="Design">Design</option>
          </select>
          <div class="error-message" id="projectTypeError">
            Please select a project category
          </div>

          <div class="row">
            <div>
              <label>Payment</label>
              <input
                type="text"
                id="payment"
                name="payment"
                placeholder="$"
                required
              />
              <div class="error-message" id="paymentError">
                Please enter a valid payment amount (numbers only)
              </div>
            </div>
            <div>
              <label>Time Line</label>
              <input id="timeline" name="timeline" type="date" required />
              <div class="error-message" id="timelineError">
                Please select a timeline date in the future
              </div>
            </div>
          </div>

          <label style="margin-top: 15px">Job Description</label>
          <textarea
            id="projectDescription"
            name="projectdescription"
            placeholder="Write job details..."
            required
          ></textarea>
          <div class="error-message" id="projectDescriptionError">
            Job description is required and must be 20+ characters
          </div>

          <button type="submit" class="post-btn">Post</button>
        </form>
      </div>
    </div>
    <jsp:include page="footer.jsp" />

    <script>
      $(document).ready(function () {
        // Real-time validation
        $("#jobTitle").on("blur", function () {
          var value = $(this).val().trim();
          if (value.length < 5) {
            $(this).addClass("input-error");
            $("#jobTitleError").addClass("show");
          } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#jobTitleError").removeClass("show");
          }
        });

        $("#projectType").on("change", function () {
          if ($(this).val() === "") {
            $(this).addClass("input-error");
            $("#projectTypeError").addClass("show");
          } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#projectTypeError").removeClass("show");
          }
        });

        $("#payment").on("blur", function () {
          var value = $(this).val().trim();
          var numberRegex = /^[0-9]+(\.?[0-9]{1,2})?$/;
          if (!numberRegex.test(value) || value === "") {
            $(this).addClass("input-error");
            $("#paymentError").addClass("show");
          } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#paymentError").removeClass("show");
          }
        });

        $("#timeline").on("change", function () {
          var selectedDate = new Date($(this).val());
          var today = new Date();
          today.setHours(0, 0, 0, 0);

          if ($(this).val() === "" || selectedDate < today) {
            $(this).addClass("input-error");
            $("#timelineError").addClass("show");
          } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#timelineError").removeClass("show");
          }
        });

        $("#projectDescription").on("blur", function () {
          var value = $(this).val().trim();
          if (value.length < 20) {
            $(this).addClass("input-error");
            $("#projectDescriptionError").addClass("show");
          } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#projectDescriptionError").removeClass("show");
          }
        });

        // Form submission validation
        $("#jobPostingForm").on("submit", function (e) {
          var isValid = true;

          // Validate Job Title
          if ($("#jobTitle").val().trim().length < 5) {
            $("#jobTitle").addClass("input-error");
            $("#jobTitleError").addClass("show");
            isValid = false;
          }

          // Validate Project Type
          if ($("#projectType").val() === "") {
            $("#projectType").addClass("input-error");
            $("#projectTypeError").addClass("show");
            isValid = false;
          }

          // Validate Payment
          var payment = $("#payment").val().trim();
          var numberRegex = /^[0-9]+(\.?[0-9]{1,2})?$/;
          if (!numberRegex.test(payment) || payment === "") {
            $("#payment").addClass("input-error");
            $("#paymentError").addClass("show");
            isValid = false;
          }

          // Validate Timeline
          var selectedDate = new Date($("#timeline").val());
          var today = new Date();
          today.setHours(0, 0, 0, 0);
          if ($("#timeline").val() === "" || selectedDate < today) {
            $("#timeline").addClass("input-error");
            $("#timelineError").addClass("show");
            isValid = false;
          }

          // Validate Project Description
          if ($("#projectDescription").val().trim().length < 20) {
            $("#projectDescription").addClass("input-error");
            $("#projectDescriptionError").addClass("show");
            isValid = false;
          }

          if (!isValid) {
            e.preventDefault();
            alert("Please fill all fields correctly before posting the job.");
          }
        });
      });
    </script>
  </body>
</html>
