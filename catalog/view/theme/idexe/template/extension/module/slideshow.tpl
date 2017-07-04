<section>
    <div id="top-carousel" class="banners-carousel owl-carousel owl-theme">
        <?php foreach ($banners as $id => $banner) { ?>
        <div class="item">
            <?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/></a>
            <?php } else { ?>
                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/>
            <?php } ?>
        </div>
        <?php } ?>
    </div>
</section>

<script type="text/javascript"><!--
    $("#top-carousel").owlCarousel({
        loop:true,
        margin:0,
        items: 1,
        nav : true,
        dots: false,
        autoplay: true
    });
--></script>