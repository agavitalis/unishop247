<footer id="footer" class="footer color-bg">
	  <div class="links-social">
        <div class="container">
            <div class="row">
            	<div class="col-xs-12 col-sm-6 col-md-4 ">
            		 <!-- ============================================================= CONTACT INFO ============================================================= -->
<div class="contact-information  centered">
	<div class="module-heading">
		<h4 class="module-title">shop by location</h4>
	</div><!-- /.module-heading -->

	<div class="module-body ">
        <ul class="toggle-footer" style="">
            <li class="media">
                <?php $sql=mysqli_query($con,"select id,categoryName  from category");
while($row=mysqli_fetch_array($sql))
{
    ?>
                <div class="media-body">
                    <span><a href="category.php?cid=<?php echo $row['id'];?>" class="dropdown-toggle">
                <?php echo $row['categoryName'];?></a><?php }?></span><br>
                    
                </div>
            </li>
              
            </ul>
    </div><!-- /.module-body -->
</div><!-- /.contact-info -->
<!-- ============================================================= CONTACT INFO : END ============================================================= -->            	</div><!-- /.col -->

            	<div class="col-xs-12 col-sm-6 col-md-4">
            		 <!-- ============================================================= CONTACT TIMING============================================================= -->
<div class="contact-info">
    <div class="footer-logo">
        <div class="logo">
            <a href="index.php">
                
                <img src="./img/logo2" alt="">
            </a>
        </div><!-- /.logo -->
    
    </div><!-- /.footer-logo -->

     <div class="module-body m-t-20">
        <p class="about-us">Unishop247 is an online mall diversed in it's choice of classic, trending and best quality fashion</p>
    
        <div class="social-icons">
            
        <a href="#"><i class="icon fa fa-facebook"></i></a>
        <a href="#"><i class="icon fa fa-instagram"></i></a>
        <a href="#"><i class="icon fa fa-twitter"></i></a>
        <a href="#"><i class="icon fa fa-google-plus"></i></a>

        </div><!-- /.social-icons -->
    </div><!-- /.module-body -->

</div><!-- /.contact-timing -->
<!-- ============================================================= CONTACT TIMING : END ============================================================= -->            	</div><!-- /.col -->

            	<div class="col-xs-12 col-sm-6 col-md-4">
            		 <!-- ============================================================= INFORMATION============================================================= -->
<div class="contact-information">
	<div class="module-heading">
		<h4 class="module-title">contact us</h4>
	</div><!-- /.module-heading -->

	<div class="module-body ">
        <ul class="toggle-footer" style="">
            <li class="media">
                <div class="media-body">
                    <span>Call us <a href="tel:08036761487">08036761487</a></span><br>
                    <span>Email us <a href="mailto:customercare@unishop247.com">customercare@unishop247.com</a></span><br>
                    
                </div>
            </li>
              
            </ul>
    </div><!-- /.module-body -->
</div><!-- /.contact-timing -->
<!-- ============================================================= INFORMATION : END ============================================================= -->            	</div><!-- /.col -->
            </div>
            <!-- /.row -->
        </div><!-- /.container -->
    </div><!-- /.links-social -->
<div class="row" style="background: #fff; color: #0b557c; text-align: center; padding: 8px 0 0 0;">
    <div class="container">
        <p>&copy; <?php echo date("Y");?><a href="index.php"><b style="color: #f50045;"> Unishop247</b></a> designed by <a target="_blank" href="https://www.instagram.com/92habit"><b style="color: #0b73b2;"> 92habit</b></a></p> 
    </div>
            </div>
    