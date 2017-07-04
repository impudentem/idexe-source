<?php echo $header; ?>
<?php echo $block_top; ?>
<section class="basic-head">
    <div class="main-container">
        <div class="breadcrumbs-section">
            <ol class="breadcrumb">
                <?php foreach ($breadcrumbs as $id => $breadcrumb) { ?>
                    <?php if (count($breadcrumbs) > ($id + 1)) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } else { ?>
                        <li class="active"><?php echo $breadcrumb['text']; ?></li>
                    <?php } ?>
                <?php } ?>
            </ol>
        </div>
        <div class="item-name">
            <h1 class="item-heading"><?php echo $heading_title; ?></h1>
        </div>
    </div>
</section>
    <?php if ($articles) { ?>
    <?php foreach ($articles as $article) { ?>
        <?php if($article['stick']) { ?>
        <section class="news-article">
            <div class="main-container clearfix">
                <?php if($article['image_stick']){ ?>
                <div class="image-news-wrap">
                    <a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['image_stick']; ?>" alt="<?php echo $article['name']; ?>" /></a>
                </div>
                <?php } ?>
                <div class="news-article-info">
                    <?php if ($show['date'] && $article['date']) { ?>
                        <div class="news-article-date"><?php echo $article['date']; ?></div>
                    <?php } ?>
                    <h2 class="news-article-heading"><?php echo $article['name']; ?></h2>
                    <div class="news-article-text"><?php echo $article['intro_text']; ?></div>
                    <a href="<?php echo $article['href']; ?>" class="read-full-news">
                        <img src="catalog/view/theme/crocodile/images/strelka.png" alt="strelka">
                    </a>
                </div>
            </div>
        </section>
         <?php } ?>
    <?php } ?>
<?php } ?>
    <section class="news-main-section">
        <div class="main-container">
            <?php echo $content_top; ?>
            <div class="row news-row">
                <?php if ($articles) { ?>
                    <?php foreach ($articles as $article) { ?>
                    <?php if (!$article['stick']) { ?>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 news-item">
                        <div class="news-image-wrap">
                            <?php if($article['image_main']){ ?>
                            <a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['image_main']; ?>" alt="<?php echo $article['name']; ?>" /></a>
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
                    <?php } ?>
                <?php } ?>
                <?php if (!$articles) { ?>
                    <p><?php echo $text_empty; ?></p>
                    <div class="buttons">
                        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                    </div>
                <?php } ?>
            </div>
            <?php if($pagination) { ?>
                <div class="catalog-pagination-wrap">
                    <nav aria-label="Page navigation">
                        <?php echo $pagination; ?>
                    </nav>
                </div>
            <?php } ?>
            <?php echo $content_bottom; ?>
        </div>
    </section>
<?php echo $block_bottom; ?>

<?php echo $footer; ?>