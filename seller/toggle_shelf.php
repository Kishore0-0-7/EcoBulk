<?php
session_start();
include_once('../config.php');

if(isset($_GET['id'])) {
    $id = $_GET['id'];
    
    // First get current shelf status
    $query = "SELECT shelf FROM product WHERE id = '$id'";
    $result = $conn->query($query);
    
    if($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $new_status = ($row['shelf'] == 'on') ? 'off' : 'on';
        
        // Update the shelf status
        $sql = "UPDATE product SET shelf = '$new_status' WHERE id = '$id'";
        
        if($conn->query($sql)) {
            $_SESSION['success'] = 'Product shelf status changed successfully';
        } else {
            $_SESSION['error'] = 'Error changing shelf status: ' . $conn->error;
        }
    } else {
        $_SESSION['error'] = 'Product not found';
    }
} else {
    $_SESSION['error'] = 'Select product to toggle first';
}

header('location: sellerProduct.php');
?>
