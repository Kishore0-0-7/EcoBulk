<?php
include('../config.php');
session_start();

if(!isset($_SESSION['email'])) {
    header("Location: ../visitor/login.php");
    exit();
}

$email = $_SESSION['email'];

// Get seller details
$sql = "SELECT * FROM users WHERE email='$email'";
$result = $conn->query($sql);
$seller = $result->fetch_assoc();

// Get sales statistics
$stats_sql = "SELECT 
    COUNT(*) as total_orders,
    SUM(CASE WHEN order_status = 'Completed' THEN totalPrice ELSE 0 END) as total_revenue,
    COUNT(CASE WHEN order_status = 'Completed' THEN 1 END) as completed_orders
    FROM order_list WHERE selleremail='$email'";
$stats = $conn->query($stats_sql)->fetch_assoc();

// Handle profile updates
if(isset($_POST['update_profile'])) {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $new_password = isset($_POST['new_password']) ? $_POST['new_password'] : '';
    
    if(!empty($new_password)) {
        $hashed_password = md5($new_password);
        $update_sql = "UPDATE users SET username='$username', password='$hashed_password' WHERE email='$email'";
    } else {
        $update_sql = "UPDATE users SET username='$username' WHERE email='$email'";
    }
    
    if($conn->query($update_sql)) {
        $_SESSION['username'] = $username;
        echo "<script>alert('Profile updated successfully!');</script>";
    } else {
        echo "<script>alert('Error updating profile!');</script>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Seller Profile | EcoBulk</title>
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/profile.css">
    <link rel="icon" href="../images/logo/icon.png" type="image/png">
</head>
<body>
    <header class="header">
        <a href="#" class="logo"><img src="../images/logo/logo.png" height="50px" alt=""></a>
        <ul class="menu">
            <li><a href="sellerMain.php">Dashboard</a></li>
            <li><a href="sellerProduct.php">Products</a></li>
            <li><a href="sellerOrder.php">Orders</a></li>
            <li><a href="income.php">Income</a></li>
            <li><a href="../logout.php">Logout</a></li>
        </ul>
    </header>

    <div class="profile-container">
        <div class="profile-header">
            <h1>Seller Profile</h1>
            <p>Manage your seller account and view statistics</p>
        </div>

        <div class="profile-content">
            <div class="stats-section">
                <h2>Sales Statistics</h2>
                <div class="stats-grid">
                    <div class="stat-card">
                        <h3>Total Orders</h3>
                        <p><?php echo $stats['total_orders']; ?></p>
                    </div>
                    <div class="stat-card">
                        <h3>Completed Orders</h3>
                        <p><?php echo $stats['completed_orders']; ?></p>
                    </div>
                    <div class="stat-card">
                        <h3>Total Revenue</h3>
                        <p>RS <?php echo number_format($stats['total_revenue'], 2); ?></p>
                    </div>
                </div>
            </div>

            <div class="profile-section">
                <h2>Account Settings</h2>
                <form method="POST" action="">
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" name="username" value="<?php echo $seller['username']; ?>" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" value="<?php echo $seller['email']; ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label>New Password (leave blank to keep current)</label>
                        <input type="password" name="new_password">
                    </div>
                    <button type="submit" name="update_profile">Update Profile</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
