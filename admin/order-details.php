<?php
  session_start();
  include 'include/config.php';
  if (strlen($_SESSION['alogin']) == 0) {
      header('location:index.php');
  }

  if(isset($_GET['ocode'])){
    $orderCode = $_GET['ocode'];
  }else{
    $orderCode = 0;
  }

  if(isset($_GET['userId'])){
    $userId = $_GET['userId'];
  }else{
    $userId = 0;
  }

 
  if (isset($_POST['change_status'])) {

      $status = $_POST['status'];
      $orderCode = $_POST['orderCode'];
      $remark = $_POST['remark'];
      $totalAmontRef = $_POST['totalAmontRef'];
      $user = $_POST['userId'];
     

      //calculate the guys bonus here
      if($status == "Delivered"){
          //check if this referal bonus have been credited
          $query = mysqli_query($con, "Select * from orders where orderCode = '$orderCode' and referralCalculation = 0");
          $query_count = mysqli_num_rows($query);
          
          //calculate for bonus
        if($query_count >= 1){

          //get the current rate
          $rate_query = mysqli_query($con, "Select * from bonus where active = 1");
          $row = mysqli_fetch_assoc($rate_query);
          $referal_percent = $row['percent'];

          $referal_bonus = ($referal_percent/100) * $totalAmontRef;

          //update the ref cal or orders cable
          mysqli_query($con, "update orders set referralCalculation=1 where orderCode='$orderCode'");
          
          //credit the referral
          $user_query = mysqli_query($con, "Select * from users where id = '$user'");
          // if (!$user_query) {
          //   die("Error description: " . mysqli_error($con));
          // }
          $user_row = mysqli_fetch_assoc($user_query);
          $referral = $user_row['referral'];
          
         

          if($referral != Null){
            //credit the referral guy and give him a coupon
            //generate a unique order code
            $characters = 'ABCDEFHJKLMNPQRSTUVWXYZ123456789';
            $charactersLength = strlen($characters);
            $randomString = '';
            for ($i = 0; $i < 10; $i++) {
                $randomString .= $characters[rand(0, $charactersLength - 1)];
            }
            $couponCode=$randomString; 
            
            $xx = mysqli_query($con, "update users set referralBonus = referralBonus + '$referal_bonus', referralCoupon= '$couponCode'  where email = '$referral' ");
            if (!$xx) {
            die("Error description: " . mysqli_error($con));
          }
          }
         
            
        }
       
      }
      

      //then update this order
      $query = mysqli_query($con, "insert into ordertrackhistory(orderCode,status,remark) values('$orderCode','$status','$remark')");
      $sql = mysqli_query($con, "update orders set orderStatus='$status' where orderCode='$orderCode'");
      echo "<script>alert('Order Status sucessfully Changed...');</script>";

  }
 
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Today's Orders</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</script>
</head>
<body>
<?php include 'include/header.php';?>

	<div class="wrapper">
		<div class="container">
			<div class="row">
        <?php include 'include/sidebar.php';?>
		 	 <div class="span9">
					<div class="content">
          	<div class="module">
							<div class="module-head">
								<h3>Details of Order #<?php echo $orderCode; ?></h3>
							</div>
							<div class="module-body table">
								<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display" >
									<thead>
									<tr>
                    <th class="cart-romove item">#</th>
                    <th class="cart-description item">Image</th>
                    <th class="cart-product-name item">Product Name</th>
                
                    <th class="cart-qty item">Quantity</th>
                    <th class="cart-sub-total item">Price Per unit</th>
                    <th class="cart-sub-total item">Delivery Charge</th>
                    <th class="cart-total item">Grandtotal</th>
                    <th class="cart-total item">Payment Method</th>
                    <th class="cart-description item">Order Date</th>
                  </tr>
									</thead>

                    <tbody>
                      <?php 
                      $grandTT =$grandPP = 0;
                      $query=mysqli_query($con,"select products.productImage1 as 
                      pimg1,products.productName as pname,products.id as proid,orders.productId 
                      as opid,orders.quantity as qty,products.productPrice as
                      pprice,products.shippingCharge as shippingcharge,orders.paymentMethod as
                        paym,orders.orderDate as odate,orders.id as orderid from orders join products
                        on orders.productId=products.id where orders.orderCode='$orderCode'");
                      $cnt=1;
                      while($row=mysqli_fetch_array($query))
                      {
                      ?>
                      <tr>
                        <td><?php echo $cnt;?></td>
                        <td class="cart-image">
                          <a class="entry-thumbnail" href="product-details.php?pid=<?php echo $row['opid'];?>">
                              <img src="productimages/<?php echo $row['proid'];?>/<?php echo $row['pimg1'];?>" alt="" width="84" height="84">
                          </a>
                        </td>
                        <td class="cart-product-name-info">
                          <h4 class='cart-product-description'><a href="product-details.php?id=<?php echo $row['opid'];?>">
                          <?php echo $row['pname'];?></a></h4>
                          
                          
                        </td>
                        <td class="cart-product-quantity"><?php echo $qty=$row['qty']; ?>  </td>                      
                        <td class="cart-product-sub-total"><?php echo "&#8358;".number_format( $price=$row['pprice']); ?>  </td>
                        <td class="cart-product-sub-total"><?php echo "&#8358;". number_format($shippcharge=$row['shippingcharge']) ; ?>  </td>
                        <td class="cart-product-grand-total"><?php echo "&#8358;". number_format(($qty*$price)+$shippcharge);?></td>
                        <?php
                              //to be used in referall bonus calculation
                              $grandT = $qty*$price;
                              $grandTT =  $grandTT + $grandT;

                              //total amonunt to be paid
                              $grandP = ($qty*$price)+$shippcharge;
                              $grandPP =  $grandPP + $grandP;
                        ?>
                        <td class="cart-product-sub-total"><?php echo $row['paym']; ?>  </td>
                        <td class="cart-product-sub-total"><?php echo $row['odate']; ?>  </td>
                        
                        
                      </tr>
                      <?php $cnt=$cnt+1;} ?>
                     
                    </tbody>
                    <tfoot>
                      <tr>
                          <th colspan="6">Price Total </th>
                          <th colspan="3"><?php echo "&#8358;".$grandPP; ?></th>
                          
                      </tr>
                  </tfoot>
								</table>
							</div>
             
						</div>
          </div><!--/.content-->
         
            <div class="row">
            
              <div class="span6">Level 2</div>
              <div class="span3">
                <h5>Change Status</h5>
                <form action="" method="post">
                  <select name="status" class="fontkink" required="required" >
                    <option value="">Select Status</option>
                    <option value="In Process">In Process</option>
                    <option value="On Hold">On Hold</option>
                    <option value="Delivered">Delivered</option>
                    <option value="Archived">Archived</option>
                
                  </select>
                  <textarea name="remark" ></textarea>
                  <input type="hidden" name="orderCode" value="<?php echo $orderCode; ?>">
                  <input type="hidden" name="totalAmontRef" value="<?php echo $grandTT; ?>">
                  <input type="hidden" name="userId" value="<?php echo $userId; ?>">
                  <button type="submit" name="change_status" class="btn btn-danger">Submit</button>
                </form>
              </div>
            </div>
         
        </div><!--/.span9-->
        
      </div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

<?php include 'include/footer.php';?>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>
