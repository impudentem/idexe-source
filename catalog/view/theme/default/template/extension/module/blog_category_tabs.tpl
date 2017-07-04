<div class="box articles-box">
    <div class="container">
        <div class="tabs articles-tabs">
            <ul class="nav nav-tabs articles-tabs-list">
                <?php foreach($blog_categories as $id => $category){ ?>
                <li <?php if($id == 0) echo "class='active'"; ?>><a data-toggle="tab" href="#tabs-<?php echo $id; ?>" ><?php echo $category['name']; ?></a></li>
                <?php } ?>
            </ul>
            <div class="tab-content">
                <?php foreach($blog_categories as $id => $category){ ?>
                <div class="tab-pane <?php if($id == 0) echo "active"; ?>"  id="tabs-<?php echo $id; ?>">
                    <div class="articles-list row">
                        <?php foreach ($articles as $article) { ?>
                            <?php if($article['blog_category_id'] == $category['blog_category_id']) { ?>
                                <div class="col-sm-4">
                                    <?php if($article['image_main']){ ?>
                                        <a href="<?php echo $article['href']; ?>" class="img-box">
                                            <span><img src="<?php echo $article['image_main']; ?>" alt="<?php echo $article['name']; ?>" /></span>
                                        </a>
                                    <?php } ?>
                                    <h3><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h3>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>
                </div>
                <?php } ?>
            </div>
            <div class="more-articles"><a href="<?php echo $view_all; ?>" class="btn"><?php echo $button_view_all; ?></a></div>
        </div>
    </div>
</div>
