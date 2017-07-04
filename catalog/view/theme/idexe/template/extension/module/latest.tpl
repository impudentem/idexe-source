<section class="top-goods-section">
    <div class="container">
        <div class="section-title text-uppercase"><?php echo $heading_title; ?></div>

        <div class="top-carousel owl-carousel owl-theme">
            <?php foreach ($products as $product) { ?>
                <div class="item">
                    <a href="<?php echo $product['href']; ?>">
                    <span class="goods-img-wrap">
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                    </span>
                    </a>
                    <h4 class="product-title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                    <?php if ($product['price']) { ?>
                        <div class="product-price">
                            <?php if (!$product['special']) { ?>
                                <div class="default-price"><?php echo $product['price']; ?></div>
                            <?php } else { ?>
                                <div class="old-price"><?php echo $product['price']; ?></div>
                                <div class="new-price"><?php echo $product['special']; ?></div>
                            <?php } ?>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>
        </div>
    </div>
</section>