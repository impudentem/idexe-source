<section class="collection-section">
    <div class="container clearfix">
        <div class="section-title text-uppercase"><?php echo $text_collections; ?></div>
        <?php if(isset($slider)){?>
        <?php  foreach ($slider as $slide) { ?>
        <div class="col-sm-4 col-xs-12">
            <a href="<?php echo $slide['href']; ?>">
                <div class="img-wrap">
                    <img src="<?php echo $slide['image']?>" alt="<?php echo $slide['name'];?>">
                </div>
                <div class="collection-name">
                    <?php echo $slide['name'];?>
                </div>
            </a>
        </div>
        <?php } ?>
        <?php } ?>
    </div>
</section>