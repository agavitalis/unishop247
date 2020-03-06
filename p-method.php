<?php
session_start();
error_reporting(0);
include 'includes/config.php';

// code for insert product in order table
if (isset($_POST['ordersubmit'])) {

    if (strlen($_SESSION['login']) == 0) {
        header('location:login.php');
    } else {

        // $quantity=$_POST['quantity'];
        // $pdd=$_SESSION['pid'];
        // $value=array_combine($pdd,$quantity);

        // //generate a unique order code
        // $characters = 'ABCDEFHJKLMNPQRSTUVWXYZ123456789';
        // $charactersLength = strlen($characters);
        // $randomString = '';
        // for ($i = 0; $i < 6; $i++) {
        //     $randomString .= $characters[rand(0, $charactersLength - 1)];
        // }
        // $orderCode=$randomString;

        // foreach($value as $qty=> $val34){

        //     mysqli_query($con,"insert into orders(userId,productId,quantity,orderCode) values('".$_SESSION['id']."','$qty','$val34','$orderCode')");

        // }
        header('location:payment-method.php');
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="MediaCenter, Template, eCommerce">
    <meta name="robots" content="all">

    <title>My Cart</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/green.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/owl.transitions.css">
    <!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
    <link href="assets/css/lightbox.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/rateit.css">
    <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

    <!-- Demo Purpose Only. Should be removed in production -->
    <link rel="stylesheet" href="assets/css/config.css">

    <link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
    <link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
    <link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
    <link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
    <link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
    <!-- Demo Purpose Only. Should be removed in production : END -->


    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
    <!--[if lt IE 9]>
			<script src="assets/js/html5shiv.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->

</head>

<body class="cnt-home">



    <!-- ============================================== HEADER ============================================== -->
    <header class="header-style-1">
        <?php include 'includes/top-header.php';?>
        <?php include 'includes/main-header.php';?>
        <?php include 'includes/menu-bar.php';?>
    </header>
    <!-- ============================================== HEADER : END ============================================== -->
    <div class="breadcrumb">
        <div class="container">
            <div class="breadcrumb-inner">
                <ul class="list-inline list-unstyled">
                    <li><a href="#">Home</a></li>
                    <li class='active'>Shopping Cart</li>
                </ul>
            </div><!-- /.breadcrumb-inner -->
        </div><!-- /.container -->
    </div><!-- /.breadcrumb -->

    <div class="body-content outer-top-xs">
        <div class="container">
            <div class="row inner-bottom-sm">
                <div class="shopping-cart">
                    
                    <div class="col-md-6 col-sm-6 shopping-cart-table ">
                        <div class="table-responsive">
                            
                                <?php
                                    if (!empty($_SESSION['cart'])) {
                                    ?>
                                        <table class="table table-bordered table-responsive">
                                            <thead>
                                                <tr>
                                                    
                                                    <th class="cart-description item">Image</th>
                                                    <th class="cart-product-name item">Product Name</th>

                                                    <th class="cart-qty item">Quantity</th>
                                                    <th class="cart-sub-total item">Price Per unit</th>
                                                    <th class="cart-total last-item">Grandtotal</th>
                                                </tr>
                                            </thead><!-- /thead -->
                                            
                                            <tbody>
                                                <?php
                                        $pdtid = array();
                                        $sql = "SELECT * FROM products WHERE id IN(";
                                        foreach ($_SESSION['cart'] as $id => $value) {
                                            $sql .= $id . ",";
                                        }
                                        $sql = substr($sql, 0, -1) . ") ORDER BY id ASC";
                                        $query = mysqli_query($con, $sql);
                                        $totalprice = 0;
                                        $totalqunty = 0;
                                        if (!empty($query)) {
                                            while ($row = mysqli_fetch_array($query)) {
                                                $quantity = $_SESSION['cart'][$row['id']]['quantity'];
                                                $subtotal = $_SESSION['cart'][$row['id']]['quantity'] * $row['productPrice'] + $row['shippingCharge'];
                                                $totalprice += $subtotal;
                                                $_SESSION['qnty'] = $totalqunty += $quantity;

                                                array_push($pdtid, $row['id']);
                                                //print_r($_SESSION['pid'])=$pdtid;exit;
                                                ?>

                                        <tr>
                                            
                                            <td class="cart-image">
                                                <a class="entry-thumbnail"
                                                    href="product-details.php?pid=<?php echo htmlentities($pd = $row['id']); ?>">
                                                    <img src="admin/productimages/<?php echo $row['id']; ?>/<?php echo $row['productImage1']; ?>"
                                                        alt="" width="114" height="114">
                                                </a>
                                            </td>
                                            <td class="cart-product-name-info">
                                                <h4 class='cart-product-description'><a
                                                        href="product-details.php?pid=<?php echo htmlentities($pd = $row['id']); ?>"><?php echo $row['productName'];

                                                $_SESSION['sid'] = $pd;
                                                ?></a></h4>
                                                                                

                                            </td>
                                            <td class="cart-product-quantity">
                                                <div class="quant-input">
                                                    
                                                    <input type="text" readonly
                                                        value="<?php echo $_SESSION['cart'][$row['id']]['quantity']; ?>"
                                                        name="quantity[<?php echo $row['id']; ?>]">

                                                </div>
                                            </td>
                                            <td class="cart-product-sub-total"><span
                                                    class="cart-sub-total-price"><?php echo "&#8358;" . " " . number_format($row['productPrice']); ?>.00</span>
                                            </td>
                                            

                                            <td class="cart-product-grand-total"><span
                                                    class="cart-grand-total-price"><?php echo "&#8358;" . number_format($_SESSION['cart'][$row['id']]['quantity'] * $row['productPrice'] + $row['shippingCharge']); ?>.00</span>
                                            </td>
                                        </tr>

                                        <?php }}
                                        $_SESSION['pid'] = $pdtid;
                                        ?>

                                    </tbody><!-- /tbody -->
                                </table><!-- /table -->

                        </div>
                    </div><!-- /.shopping-cart-table -->
                    <?php } ?>

                    
                   
           
                </div>
            </div>
           
            <?php echo include 'includes/brands-slider.php'; ?>
        </div>
    </div>
    <?php include 'includes/footer.php';?>

    <script src="assets/js/jquery-1.11.1.min.js"></script>

    <script src="assets/js/bootstrap.min.js"></script>

    <script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>

    <script src="assets/js/echo.min.js"></script>
    <script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/bootstrap-slider.min.js"></script>
    <script src="assets/js/jquery.rateit.min.js"></script>
    <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
    <script src="assets/js/scripts.js"></script>

    <!-- For demo purposes – can be removed on production -->

    <script src="switchstylesheet/switchstylesheet.js"></script>

    <script>
    $(document).ready(function() {
        $(".changecolor").switchstylesheet({
            seperator: "color"
        });
        $('.show-theme-options').click(function() {
            $(this).parent().toggleClass('open');
            return false;
        });
    });

    $(window).bind("load", function() {
        $('.show-theme-options').delay(2000).trigger('click');
    });
    </script>
    <!-- For demo purposes – can be removed on production : End -->
</body>

</html>