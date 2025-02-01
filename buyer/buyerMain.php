<?php
include('../config.php');

session_start();
$email = $_SESSION['email'];

$sql="select * from product where shelf='on' ORDER BY price;";
$result=$conn->query($sql);

$sqli = "SELECT COUNT(*) AS countquantity FROM cart WHERE email='$email'";
$duration = $conn->query($sqli);
$record = $duration->fetch_array();
$totalquantity = $record['countquantity'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="EcoBulk - Your eco-friendly shopping platform">
    <meta name="keywords" content="EcoBulk, eco-friendly, shopping, sustainable">
    <meta name="author" content="EcoBulk Team">
    
    <title>EcoBulk | Welcome!</title>
    
    <!-- Favicon -->
    <link rel="icon" href="../images/logo/icon.png" type="image/png" sizes="32x32">
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Styles -->
    <link rel="stylesheet" href="../css/modern-theme.css">
    <link rel="stylesheet" href="../css/product_slider.css">
    
    <style>
        .header .menu li .cart-icon {
            position: relative;
            display: inline-flex;
            align-items: center;
            padding: 0.5rem;
            border-radius: var(--border-radius);
            transition: var(--transition);
        }
        
        .header .menu li .cart-icon:hover {
            background: rgba(255, 255, 255, 0.1);
        }
        
        #lblCartCount {
            position: absolute;
            top: -8px;
            right: -8px;
            font-size: 12px;
            background: var(--secondary-color);
            color: white;
            padding: 2px 6px;
            border-radius: 50%;
            font-weight: 600;
        }
        
        .menu li .action-icon {
            font-size: 1.2rem;
            padding: 0.5rem;
            border-radius: var(--border-radius);
            transition: var(--transition);
        }
        
        .menu li .action-icon:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
        }
        
        .seller-link {
            background: var(--secondary-color) !important;
            color: white !important;
            padding: 0.5rem 1rem !important;
            border-radius: var(--border-radius) !important;
            font-weight: 600 !important;
            transition: var(--transition) !important;
        }
        
        .seller-link:hover {
            background: #e69516 !important;
            transform: translateY(-2px) !important;
        }
    </style>
</head>

<body>
    <header class="header">
        <a href="#" class="logo" aria-label="EcoBulk Logo">
            <img src="../images/logo/logo.png" alt="EcoBulk Logo">
        </a>
        <input class="menu-btn" type="checkbox" id="menu-btn" />
        <label class="menu-icon" for="menu-btn"><span class="nav-icon"></span></label>
        <ul class="menu">
            <li><a href="../seller/sellerMain.php" class="seller-link">Seller Centre</a></li>
            <li><a href="buyerMain.php">Home</a></li>
            <li><a href="buyerProduct.php">Product</a></li>
            <li><a href="order.php">Order</a></li>
            <li><a href="buyerProfile.php">Profile</a></li>
            <li><a href="about_us.php">About</a></li>
            <li><a href="chat.php" class="action-icon" aria-label="Chat"><i class="fa fa-comment"></i></a></li>
            <li>
                <a href="cart.php" class="cart-icon" aria-label="Shopping Cart">
                    <i class="fa fa-shopping-cart"></i>
                    <span id='lblCartCount'><?php echo $totalquantity; ?></span>
                </a>
            </li>
            <li><a href="../logout.php">Logout</a></li>
        </ul>
    </header>

    <div class="slideshow-container">
        <div class="mySlides fade">
            <img src="../images/logo/second1.jpg" alt="Eco-friendly products showcase">
        </div>
        
        <div class="mySlides fade">
            <img src="../images/logo/second2.jpg" alt="Sustainable living products">
        </div>
        
        <div class="mySlides fade">
            <img src="../images/logo/second3.jpg" alt="EcoBulk product range">
        </div>
        
        <div class="dots">
            <span class="dot" aria-label="Slide 1"></span> 
            <span class="dot" aria-label="Slide 2"></span> 
            <span class="dot" aria-label="Slide 3"></span> 
        </div>
    </div>

    <main class="container">
        <div class="slide-container">
            <img id="slide-left" class="arrow" src="../images/logo/arrow-left.png" alt="Previous" aria-label="Previous Slide">
            <section class="product-grid" id="slider">
                <?php
                if ($result->num_rows > 0) {    
                    while($row = $result->fetch_assoc()) {
                        $id = $row['id'];
                        $title = $row['title'];
                        $description = $row['description'];
                        $quantity = $row['quantity'];
                        $price = $row['price'];
                        $image = $row['image'];
                ?>
                <div class="thumbnail" tabindex="0">
                    <img src="../images/<?php echo $image;?>" alt="<?php echo $title;?>">
                    <div class="product-details">
                        <h2><?php echo $title;?></h2>
                        <p>RS <?php echo $price;?></p>
                        <a href='product_detail.php?pid=<?php echo $id;?>'>Check Details</a>
                    </div>
                </div>
                <?php
                    }
                }
                ?>
            </section>
            <img id="slide-right" class="arrow" src="../images/logo/arrow-right.png" alt="Next" aria-label="Next Slide">
        </div>
    </main>

    <footer>
        <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> EcoBulk Shopping Platform</p>
    </footer>

    <script>
        // Slideshow
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            const slides = document.getElementsByClassName("mySlides");
            const dots = document.getElementsByClassName("dot");
            
            // Hide all slides
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
                dots[i].className = dots[i].className.replace(" active", "");
            }
            
            // Show next slide
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}
            
            slides[slideIndex-1].style.display = "block";
            dots[slideIndex-1].className += " active";
            
            setTimeout(showSlides, 3000); // Change image every 3 seconds
        }
    </script>
    <script src="../javascript/product_slider.js"></script>
</body>
</html>