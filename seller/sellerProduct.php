<?php
	session_start();
	$email = $_SESSION['email'];

    // Add pagination variables at the top after session_start()
    if(isset($_GET['page'])) {
        $page = $_GET['page'];
    } else {
        $page = 1;
    }

    $num_per_page = 6;
    $start_from = ($page-1)*$num_per_page;
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Product List | Seller</title>
    <link rel="icon" href="../images/logo/icon.png" sizes="32x32" type="image/png" sizes="50x50">
    <link rel="stylesheet" href="../css/menu.css">
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css/dataTable.bootstrap.min.css">
	<style>

    a{
      color:black;
      font-size: 15px;
	  padding-left: 10px;
    }
		
    a:hover{
      color:#f5a623;
    }

    /*button*/
    .center {
    margin: auto;
    width: 47%;
    }

    .btn-group button {
    background-color: #f5a623; /* Green background */
    border: 1px solid #c4851c; /* Green border */
    color: white; /* White text */
    margin:10px 0px 10px -5px;
    cursor: pointer; /* Pointer/hand icon */
    width:150px;
    height:50px;
    }

    #lblCartCount {
    font-size: 12px;
    background: #ff0000;
    color: #fff;
    padding: 0 5px;
    vertical-align: top;
    margin-left: -8px;
    }
    .badge {
      padding-left: 9px;
      padding-right: 9px;
      -webkit-border-radius: 9px;
      -moz-border-radius: 9px;
      border-radius: 9px;
    }

    .label-warning[href],
    .badge-warning[href] {
      background-color: #c67605;
    }

    input[type="submit"]{
  width: 100%;
  height: 50px;
  border: 1px solid;
  background: #435c70;
  border-radius: 25px;
  font-size: 18px;
  color:rgb(131, 207, 255);
  font-weight: 700;
  cursor: pointer;
  outline: none;
}
input[type="submit"]:hover{
  border-color: #f5a623;
  transition: .5s;
}
	</style>
</head>
<body>
<body style="background:#edf0f2;">
        <header class="header">
            <a href="#" class="logo" style="margin-top:-10px;"><img src="../images/logo/logo.png" height="50px" alt=""></a>
            <input class="menu-btn" type="checkbox" id="menu-btn" />
            <label class="menu-icon" for="menu-btn"><span class="nav-icon"></span></label>
	    <ul class="menu">
            <li><a href="../buyer/buyerMain.php" style="color:#f5a623;font-weight:bold;">Buyer Centre</a></li>
            <li><a href="sellerMain.php">Home</a></li>
            <li><a href="sellerProduct.php">My Product</a></li>
    		<li><a href="sellerOrder.php">My Order</a></li>
    		<li><a href="income.php">My Income</a></li>
    		<li><a href="../logout.php">Logout</a></li>
        </ul>
        </header>

        <div class="center">
  <div class="btn-group">
    <button onclick="location.href='sellerProduct.php'">All Product</button>
    <button onclick="location.href='addProduct.php'">Add New Product</button>
    <button onclick="location.href='pendingList.php'">Pending List</button>
    <button onclick="location.href='declineList.php'">Decline List</button>
  </div>
</div>

		<div style="margin:0px 80px 80px 80px;">
			<div class="row">
			<?php
				if(isset($_SESSION['error'])){
					echo
					"
					<div class='alert alert-danger text-center'>
						<button class='close'>&times;</button>
						".$_SESSION['error']."
					</div>
					";
					unset($_SESSION['error']);
				}
				if(isset($_SESSION['success'])){
					echo
					"
					<div class='alert alert-success text-center'>
						<button class='close'>&times;</button>
						".$_SESSION['success']."
					</div>
					";
					unset($_SESSION['success']);
				}
			?>
			</div>
			<div class="height10">
			</div>
			<div class="row">
				<table id="myTable" class="table table-bordered table-striped">
					<thead>
						<th>Image</th>
						<th>ID</th>
						<th>Title</th>
						<th>Category</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Description</th>
						<th>Shelf</th>
						<th width="14%">Action</th>
					</thead>
					<tbody>
						<?php
							include_once('../config.php');
							// Modify the main SQL query to include pagination
							$sql = "SELECT * FROM product WHERE seller_id='$email' and status='Approve' LIMIT $start_from,$num_per_page";

							$query = $conn->query($sql);
							while($row = $query->fetch_assoc()){
								?>
								<tr> 
									<td><img src="../images/<?php echo $row['image']; ?>" width="40px"></td>
									<td><?php echo $row['id']; ?></td>
									<td><?php echo $row['title']; ?></td>
									<td><?php echo $row['category']; ?></td>
									<td><?php echo $row['quantity']; ?></td>
									<td><?php echo $row['price']; ?></td>
									<td><?php echo $row['description']; ?></td>
									<td><?php echo $row['shelf']; ?></td>
									<td>
										<a href="#edit_<?php echo $row['id']; ?>" class="btn btn-success btn-sm" data-toggle="modal">
											Edit
										</a>
										<a href="#delete_<?php echo $row['id']; ?>" class="btn btn-warning btn-sm" data-toggle="modal">
											<?php echo ($row['shelf'] == 'on') ? 'Off' : 'On'; ?>
										</a>
									</td>
								</tr>
								<?php 
								include('editquantity_onoffshelf_modal.php');
							}
						?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<?php
    // Add this before the closing body tag to display pagination
    $pr_query = "SELECT * FROM product WHERE seller_id='$email' and status='Approve'";
    $pr_result = $conn->query($pr_query);
    $total_record = mysqli_num_rows($pr_result);
    $total_pages = ceil($total_record/$num_per_page);

    echo "<div class='pagination' style='margin-top: 20px; text-align: center;'>";
    if($page > 1) {
        echo "<a href='sellerProduct.php?page=".($page-1)."' class='btn btn-danger'>Previous</a>";
    }

    for($i=1; $i<=$total_pages; $i++) {
        $active = ($i == $page) ? 'active' : '';
        echo "<a href='sellerProduct.php?page=".$i."' class='btn btn-primary ".$active."' style='margin: 0 5px;'>$i</a>";
    }

    if($page < $total_pages) {
        echo "<a href='sellerProduct.php?page=".($page+1)."' class='btn btn-danger'>Next</a>";
    }
    echo "</div>";
?>

<script src="../javascript/jquery.min.js"></script>
<script src="../javascript/bootstrap.min.js"></script>
<script src="../javascript/jquery.dataTables.min.js"></script>
<script src="../javascript/dataTable.bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	//inialize datatable
    $('#myTable').DataTable();

    //hide alert
    $(document).on('click', '.close', function(){
    	$('.alert').hide();
    })

    // Initialize modals
    $('.modal').on('shown.bs.modal', function () {
        $(this).find('[autofocus]').focus();
    });
    
    // Form submission handling
    $('.edit-form').on('submit', function(e){
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function(response){
                location.reload();
            }
        });
    });
});
</script>
</body>
</html>