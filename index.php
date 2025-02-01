<?php
include('config.php');
$sql="select * from product where shelf='on' and quantity>0 ORDER BY price;";
$result=$conn->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="EcoBulk - Your one-stop shop for eco-friendly products">
    <meta name="keywords" content="EcoBulk, eco-friendly, products, sustainable">
    <meta name="author" content="EcoBulk Team">
    <title>EcoBulk | Main Page</title>
    
    <!-- Favicon -->
    <link rel="icon" href="images/logo/icon.png" type="image/png" sizes="32x32">
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Styles -->
    <link rel="stylesheet" href="css/modern-theme.css">
    <link rel="stylesheet" href="css/product_slider.css">
    
    <!-- Icons -->
    <script src="https://kit.fontawesome.com/1935d064dd.js" crossorigin="anonymous"></script>
</head>

<body>    
    <header class="header">
        <a href="#" class="logo" aria-label="EcoBulk Logo">
            <img src="images/logo/logo.png" alt="EcoBulk Logo">
        </a>
        <label class="menu-icon" for="menu-btn"><span class="nav-icon"></span></label>
        <ul class="menu">
            <li><a href="visitor/register.php">Register Now!</a></li>
            <li><a href="index.php">Home</a></li>
            <li><a href="visitor/vProduct.php">Product</a></li>
            <li><a href="visitor/about_us.php">About</a></li>
            <li><a href="visitor/login.php">Login</a></li>
        </ul>
    </header>

    <div class="slideshow-container">
        <div class="mySlides fade">
            <img src="images/logo/second1.jpg" alt="Eco-friendly products showcase">
        </div>
        
        <div class="mySlides fade">
            <img src="images/logo/second2.jpg" alt="Sustainable living products">
        </div>
        
        <div class="mySlides fade">
            <img src="images/logo/second3.jpg" alt="EcoBulk product range">
        </div>
        
        <div class="dots">
            <span class="dot" aria-label="Slide 1"></span> 
            <span class="dot" aria-label="Slide 2"></span> 
            <span class="dot" aria-label="Slide 3"></span> 
        </div>
    </div>

    <main class="container">
        <div class="slide-container">
            <img id="slide-left" class="arrow" src="images/logo/arrow-left.png" alt="Previous" aria-label="Previous Slide">
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
                    <img src="images/<?php echo $image;?>" alt="<?php echo $title;?>">
                    <div class="product-details">
                        <h2><?php echo $title;?></h2>
                        <p>RS <?php echo $price;?></p>
                        <a href='visitor/product_detail.php?pid=<?php echo $id;?>'>Check Details</a>
                    </div>
                </div>
                <?php
                    }
                }
                ?>
            </section>
            <img id="slide-right" class="arrow" src="images/logo/arrow-right.png" alt="Next" aria-label="Next Slide">
        </div>
    </main>

    <footer>
        <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> EcoBulk</p>
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
    <script src="javascript/product_slider.js"></script>
</body>
</html>