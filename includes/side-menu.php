<div class="side-menu animate-dropdown outer-bottom-xs">
    <div class="head disp2"><a style="color: #fff;" data-toggle="collapse" href="#thisone" role="button" aria-expanded="false" aria-controls="thisone"><i class="icon fa fa-align-justify fa-fw"></i></a>Shop Locations</div>        
    <nav class="yamm megamenu-horizontal collapse disp2" role="navigation" id="thisone">
  
        <ul class="nav">
            <li class="dropdown menu-item">
              <?php $sql=mysqli_query($con,"select id,categoryName  from category");
while($row=mysqli_fetch_array($sql))
{
    ?>
                <a href="category.php?cid=<?php echo $row['id'];?>" class="dropdown-toggle"><i class="icon fa fa-map-marker fa-fw"></i>
                <?php echo $row['categoryName'];?></a>
                <?php }?>
                        
</li>
</ul>
    </nav>
    <div class="head disp"><a style="color: #fff;" data-toggle="collapse" href="#thistwo" role="button" aria-expanded="false" aria-controls="thistwo"><i class="icon fa fa-align-justify fa-fw"></i></a>Shop Locations</div>        
    <nav class="yamm megamenu-horizontal disp" role="navigation" id="thistwo">
  
        <ul class="nav">
            <li class="dropdown menu-item">
              <?php $sql=mysqli_query($con,"select id,categoryName  from category");
while($row=mysqli_fetch_array($sql))
{
    ?>
                <a href="category.php?cid=<?php echo $row['id'];?>" class="dropdown-toggle"><i class="icon fa fa-map-marker fa-fw"></i>
                <?php echo $row['categoryName'];?></a>
                <?php }?>
                        
</li>
</ul>
    </nav>
</div>