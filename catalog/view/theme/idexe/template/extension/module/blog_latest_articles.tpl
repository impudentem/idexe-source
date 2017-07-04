<?php if($design == 0) { ?>
    <section class="news-section">
        <div class="container clearfix">
            <div class="section-title text-uppercase"><?php echo $heading_title; ?></div>
            <div class="row">
                <?php foreach ($articles as $article) { ?>
                <div class="col-md-3 col-sm-6 news-item">
                    <div class="img-wrap">
                        <?php if($article['image_main']){ ?>
                        <a href="<?php echo $article['href']; ?>">
                            <img src="<?php echo $article['image_main']; ?>" alt="<?php echo $article['name']; ?>" />
                        </a>
                        <?php } ?>
                        <div class="news-item__description">
                            <?php if ($show['date'] && $article['date']) { ?>
                            <div class="news-date"><?php echo $article['date']; ?></div>
                            <?php } ?>
                            <h3 class="news-name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h3>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
            <div class="all-news-block clearfix">
                <a href="<?php echo $href_all_news; ?>"><?php echo $view_all_news; ?></a>
            </div>
        </div>
    </section>



<?php } elseif($design == 1) { ?>
    <div class="side side-articles">
        <div class="title title-left"><h3><?php echo $heading_title; ?></h3></div>
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