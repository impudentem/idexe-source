<?php if($design == 0) { ?>
    <section class="news-section">
        <div class="main-container">
            <h2 class="section-heading"><?php echo $name; ?></h2>
            <div class="row news-row">
                <?php foreach ($articles as $article) { ?>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 news-item">
                    <div class="news-image-wrap">
                        <?php if($article['image_main']){ ?>
                        <a href="<?php echo $article['href']; ?>" class="news-heading">
                            <img src="<?php echo $article['image_main']; ?>" alt="<?php echo $article['name']; ?>" />
                        </a>
                        <?php } ?>
                        <div class="news-overlay">
                            <?php if ($show['date'] && $article['date']) { ?>
                            <div class="news-date"><?php echo $article['date']; ?></div>
                            <?php } ?>
                            <a href="<?php echo $article['href']; ?>" class="news-heading"><?php echo $article['name']; ?></a>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
            <div class="all-news">
                <a href="/index.php?route=blog/blog_category&blog_path=6">смотреть все новости</a>
            </div>
        </div>
    </section>
<?php } elseif($design == 1) { ?>
    <div class="side side-articles">
        <div class="title title-left"><h3><?php echo $name; ?></h3></div>
        <div class="articles-list row">
            <?php foreach ($articles as $article) { ?>
                <div class="col-sm-12">
                    <a href="<?php echo $article['href']; ?>" class="img-box">
                        <span><img src="<?php echo $article['image_main']; ?>" alt="<?php echo $article['name']; ?>" /></span>
                    </a>
                    <h3><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h3>
                </div>
            <?php } ?>
        </div>
    </div>
<?php } ?>