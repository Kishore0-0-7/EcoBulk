# README.md

# EcoBulk Shop

## Overview

The EcoBulk Shop is an online platform that allows buyers to browse, purchase, and interact with sellers of EcoBulk goods. The application provides a user-friendly interface for both buyers and sellers, facilitating transactions and communication.

## Features

- **Buyer Center**: A dedicated space for buyers to view products, manage their profiles, and track their orders.
- **Product Listings**: Buyers can browse through a variety of EcoBulk products, complete with images and descriptions.
- **Shopping Cart**: A feature that allows buyers to add products to their cart and view the total price.
- **Order History**: Buyers can view their past orders and track their status.
- **Chat Functionality**: A chat interface for buyers to communicate with sellers or support.

## Project Structure

```
EcoBulk-shop
├── admin
│   └── aUserList.php
├── buyer
│   ├── about_us.php
│   ├── buyerMain.php
│   ├── buyerProduct.php
│   ├── buyerProfile.php
│   ├── cart.php
│   ├── chat.php
│   ├── order.php
│   └── product_detail.php
├── config
│   └── config.php
├── css
│   ├── login-styles.css
│   ├── login.css
│   ├── menu.css
│   ├── product_slider.css
│   ├── slideshow.css
│   └── toastr.min.css
├── images
│   └── logo
├── javascript
│   ├── jquery-3.3.1.min.js
│   ├── product_slider.js
│   └── toastr.min.js
├── owner
│   └── ownerHome.php
├── seller
│   ├── income.php
│   ├── sellerMain.php
│   ├── sellerOrder.completed.php
│   ├── sellerOrder.php
│   ├── sellerOrder_cancelled.php
│   ├── sellerOrder_pending.php
│   ├── sellerOrder_to_received.php
│   └── sellerProduct.php
├── visitor
│   ├── about_us.php
│   ├── login.php
│   ├── register.php
│   └── vProduct.php
├── index.php
├── logout.php
└── README.md
```

## Setup Instructions

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Configure the database settings in `config/config.php`.
4. Import the SQL database schema provided in the project.
5. Open `index.php` in your web browser to access the application.

## Technologies Used

- PHP
- MySQL
- HTML/CSS
- JavaScript (jQuery)
- Bootstrap (for styling)
