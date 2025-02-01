<?php
session_start();
include_once('../config.php');

if(isset($_POST['edit'])){
    $id = $_POST['id'];
    $quantity = $_POST['quantity'];
    
    $sql = "UPDATE product SET quantity = '$quantity' WHERE id = '$id'";
    if($conn->query($sql)){
        $_SESSION['success'] = "Product quantity updated successfully";
    } else {
        $_SESSION['error'] = "Error updating product quantity";
    }
    header('location: sellerProduct.php');
    exit();
}
?>
