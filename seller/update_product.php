<?php
session_start();
include_once('../config.php');

if(isset($_POST['edit'])) {
    $id = $_POST['id'];
    $title = $_POST['title'];
    $category = $_POST['category'];
    $quantity = $_POST['quantity'];
    $price = $_POST['price'];
    $description = $_POST['description'];

    $sql = "UPDATE product SET 
            title = '$title',
            category = '$category',
            quantity = '$quantity',
            price = '$price',
            description = '$description'
            WHERE id = '$id'";

    if($conn->query($sql)) {
        $_SESSION['success'] = 'Product updated successfully';
    } else {
        $_SESSION['error'] = 'Error updating product: ' . $conn->error;
    }
} else {
    $_SESSION['error'] = 'Select product to edit first';
}

header('location: sellerProduct.php');
?> 