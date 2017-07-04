

<?php if($template == 1) { ?>
<section class="<?php echo $class; ?>-section ">
    <div class="<?php echo $class; ?>-container">
        <?php if($heading_title) { ?>
            <div class="section-title text-uppercase"><?php echo $heading_title; ?></div>
        <?php } ?>

        <div class="<?php echo $class; ?>-text">
            <?php echo $html; ?>
        </div>
        <div class="advantages-wrap">
            <div class="advantages-item">
                <div class="img-adv">
                    <img src="catalog/view/theme/idexe/images/quality.png" alt="">
                </div>
                <h3><?php echo $text_quality; ?></h3>
            </div>
            <div class="advantages-item">
                <div class="img-adv">
                    <img src="catalog/view/theme/idexe/images/delivery.png" alt="">
                </div>
                <h3><?php echo $text_shipping; ?></h3>
            </div>
            <div class="advantages-item">
                <div class="img-adv">
                    <img src="catalog/view/theme/idexe/images/ukraine.png" alt="">
                </div>
                <h3><?php echo $text_work_all; ?></h3>
            </div>
        </div>
    </div>
</section>
<?php } else { ?>
    <div class="<?php echo $class; ?>">
        <?php if($heading_title) { ?>
            <h2><?php echo $heading_title; ?></h2>
        <?php } ?>
        <?php echo $html; ?>
    </div>
<?php } ?>