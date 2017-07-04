<?php if($template) { ?>
    <?php foreach ($banners as $banner) { ?>
    <section class="action-section">
        <div class="img-wrap">
            <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
        </div>
        <div class="link-wrap">
            <div class="container">
                <a href="<?php echo $banner['link']; ?>" class="view-all-actions"><span><?php echo $banner['link_text']; ?></span><span><?php echo $banner['title']; ?></span></a>
            </div>
        </div>
    </section>
    <?php } ?>
<?php } else {  ?>
  <div id="banner<?php echo $module; ?>" class="owl-carousel">
    <?php foreach ($banners as $banner) { ?>
      <div class="item">
        <?php if ($banner['link']) { ?>
          <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
        <?php } else { ?>
          <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
        <?php } ?>
      </div>
    <?php } ?>
  </div>
  <script type="text/javascript"><!--
      $("#banner<?php echo $module; ?>").owlCarousel({
          loop:true,
          items: 1,
          nav : false,
      });
    --></script>

<?php } ?>


