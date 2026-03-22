<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payout Portal</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* ===== Navbar ===== */
.navbar{
    width:100%;
    background:#1f7f82;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:12px 30px;
    position:fixed;
    top:0;
    left:0;
}

.nav-left{
    display:flex;
    align-items:center;
    gap:10px;
    color:white;
    font-weight:600;
}

.nav-left img{
    width:36px;
    height:36px;
    border-radius:50%;
}

.nav-links a{
    margin-left:22px;
    text-decoration:none;
    color:white;
    font-size:14px;
}

/* ===== Body ===== */
body{
    background:#1f7f82;
    padding:90px 25px 30px;
}

.container{
    max-width:1100px;
    margin:auto;
}

/* ===== Header ===== */
.header h1{
    margin-bottom:6px;
}

.header p{
    color:#d9e6e6;
    margin-bottom:20px;
}

/* ===== Cards ===== */
.stats{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:18px;
    margin-bottom:20px;
}

.card{
    padding:20px;
    border-radius:14px;
    color:black;
    font-weight:600;
}

.card small{
    display:block;
    margin-bottom:10px;
    opacity:.7;
}

.available{ background:#63b6cc; }
.processing{ background:#4a8ed1; }
.lifetime{ background:#d88a2f; }

/* ===== Grid Layout ===== */
.grid{
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:18px;
}

/* ===== Panels ===== */
.panel{
    background:#e6e6e6;
    border-radius:14px;
    padding:18px;
}

/* Chart placeholder */
.chart{
    height:220px;
    background:linear-gradient(to top, #dcd3f5, #ffffff);
    border-radius:10px;
    margin-top:15px;
}

/* Withdraw panel */
.withdraw input,
.withdraw select{
    width:100%;
    padding:10px;
    margin:8px 0;
    border-radius:8px;
    border:none;
}

.method{
    background:#f3f3f3;
    padding:10px;
    border-radius:10px;
    margin-top:10px;
}

.withdraw-btn{
    width:100%;
    margin-top:15px;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#5a57d6;
    color:white;
    font-size:16px;
    cursor:pointer;
}

/* Recent payouts */
.payout{
    display:flex;
    justify-content:space-between;
    margin-top:12px;
}

/* Add account */
.add-account{
    margin-top:18px;
    background:#e6e6e6;
    padding:14px;
    border-radius:12px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.add-account button{
    background:#4a8ed1;
    border:none;
    color:white;
    padding:6px 14px;
    border-radius:8px;
    cursor:pointer;
}
</style>
</head>

<body>

<!-- ===== Navbar ===== -->
<div class="navbar">
    <div class="nav-left">
        <img src="https://i.pravatar.cc/40">
        <span>Student</span>
    </div>

    <div class="nav-links">
        <a href="studentDashboard">Dashboard</a>
        <a href="studentProject">Projects</a>
        <a href="studentJobs">Find Jobs</a>
        <a href="studentMessage">Message</a>
        <a href="studentPayments">Payments</a>
        <a href="studentSettings">Settings</a>
    </div>
</div>

<!-- ===== Main ===== -->
<div class="container">

    <div class="header">
        <h1>Payout Portal</h1>
        <p>Monitor your revenue and manage instant withdrawals.</p>
    </div>

    <!-- Stats -->
    <div class="stats">
        <div class="card available">
            <small>AVAILABLE NOW</small>
            Available for Withdrawal<br>
            <h2>$12,450.00</h2>
        </div>

        <div class="card processing">
            <small>PROCESSING</small>
            Pending Clearance<br>
            <h2>$3,200.00</h2>
        </div>

        <div class="card lifetime">
            <small>LIFETIME</small>
            Total Earned<br>
            <h2>$84,500.00</h2>
        </div>
    </div>

    <!-- Grid -->
    <div class="grid">

        <!-- Left -->
        <div>
            <div class="panel">
                <h3>Monthly Income Trends</h3>
                <h2 style="color:#6a4df5">$8,240</h2>
                <div class="chart"></div>
            </div>

            <div class="panel" style="margin-top:18px;">
                <h3>Recent Payouts</h3>

                <div class="payout">
                    <span>Chase Bank Withdrawal</span>
                    <strong>- $2,400</strong>
                </div>

                <div class="payout">
                    <span>Project: UX Revamp</span>
                    <strong>+ $4,500</strong>
                </div>

                <div class="payout">
                    <span>Paypal Transfer</span>
                    <strong>- $1,200</strong>
                </div>
            </div>
        </div>

        <!-- Right -->
        <div>
            <div class="panel withdraw">
                <h3>Withdraw Funds</h3>

                <label>Amount</label>
                <input type="number" placeholder="5000">

                <label>Currency</label>
                <select>
                    <option>USD</option>
                    <option>EUR</option>
                </select>

                <h4 style="margin-top:10px;">Payout Method</h4>

                <div class="method">Chase Bank Business</div>
                <div class="method">PayPal Wallet</div>

                <button class="withdraw-btn">Withdraw $5,000</button>
            </div>

            <div class="add-account">
                <span>Add Account</span>
                <button>Click</button>
            </div>
        </div>

    </div>
</div>

</body>
</html>
