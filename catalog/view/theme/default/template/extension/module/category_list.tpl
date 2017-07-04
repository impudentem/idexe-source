<div class="container">
<div class="category-block">
  <div>
    <?php if(isset($slider)){?> 
    <?php  foreach ($slider as $slide) { ?>   
    <div class="cat-block"><a class="cat-hover" href="<?php echo $slide['href']; ?>"><img src="<?php echo $slide['image']?>" alt="<?php echo $slide['name'];?>"></a></div>
    <?php } ?>
    <?php } ?>
  </div>
</div>
</div>