<?php
include('../config.php');
session_start();

if(!isset($_SESSION['email'])) {
    header("Location: ../visitor/login.php");
    exit();
}

if(isset($_POST['product_id']) && isset($_POST['quantity'])) {
    $email = $_SESSION['email'];
    $product_id = $_POST['product_id'];
    $quantity = $_POST['quantity'];

    // Check if product exists and has enough stock
    $check_product = "SELECT quantity FROM product WHERE id = ?";
    $stmt = $conn->prepare($check_product);
    $stmt->bind_param("i", $product_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $product = $result->fetch_assoc();

    if($product && $product['quantity'] >= $quantity) {
        // Check if product already in cart
        $check_cart = "SELECT * FROM cart WHERE email = ? AND product_id = ?";
        $stmt = $conn->prepare($check_cart);
        $stmt->bind_param("si", $email, $product_id);
        $stmt->execute();
        $cart_result = $stmt->get_result();

        if($cart_result->num_rows > 0) {
            // Update existing cart item
            $sql = "UPDATE cart SET quantity = quantity + ? WHERE email = ? AND product_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("isi", $quantity, $email, $product_id);
        } else {
            // Add new cart item
            $sql = "INSERT INTO cart (email, product_id, quantity) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sii", $email, $product_id, $quantity);
        }

        if($stmt->execute()) {
            echo "<script>alert('Product added to cart successfully!');
                  window.location.href='cart.php';</script>";
        } else {
            echo "<script>alert('Error adding product to cart!');
                  window.history.back();</script>";
        }
    } else {
        echo "<script>alert('Product out of stock or invalid quantity!');
              window.history.back();</script>";
    }
} else {
    header("Location: buyerProduct.php");
}
?>
