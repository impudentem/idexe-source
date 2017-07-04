<?php echo $header; ?>
<?php echo $block_top; ?>
    <div class="content">
        <div class="breadcrumbs">
            <div class="container">
                <ul>
                    <?php foreach ($breadcrumbs as $id => $breadcrumb) { ?>
                        <?php if (count($breadcrumbs) > ($id + 1)) { ?>
                            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                        <?php } else { ?>
                            <li class="active"><?php echo $breadcrumb['text']; ?></li>
                        <?php } ?>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <div class="blog-section">
            <div class="container">
                <h1 class="item-title"><?php echo $heading_title; ?></h1>
                <?php if ($articles) { ?>
                    <?php foreach ($articles as $article) { ?>
                        <?php if($article['stick']) { ?>
                            <article class="clearfix">
                                <?php if($article['image_stick']){ ?>
                                <div class="img-box">
                                    <a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['image_stick']; ?>" alt="<?php echo $article['name']; ?>" /></a>
                                </div>
                                <?php } ?>
                                <?php if ($show['date'] && $article['date']) { ?>
                                    <div class="blog-date"><?php echo $article['date']; ?></div>
                                <?php } ?>
                                <h2> <a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h2>
                                <?php echo $article['intro_text']; ?>
                                <a href="<?php echo $article['href']; ?>" class="btn btn-readmore"><?php echo $text_readmore; ?></a>
                            </article>
                        <?php } ?>
                    <?php } ?>
                <?php } ?>



                <div class="row clearfix news-row">
                    <?php if ($articles) { ?>
                        <?php foreach ($articles as $article) { ?>
                            <?php if (!$article['stick']) { ?>
                                <div class="col-md-3 col-sm-6 news-item">
                                    <div class="img-wrap">
                                        <?php if($article['image_main']){ ?>
                                            <a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['image_main']; ?>" alt="<?php echo $article['name']; ?>" /></a>
                                        <?php } ?>
                                        <div class="news-item__description">
                                            <?php if ($show['date'] && $article['date']) { ?>
                                                <div class="news-date"><?php echo $article['date']; ?></div>
                                            <?php } ?>
                                            <h3 class="news-name"><a href="<?php echo $article['href']; ?>" class="news-heading"><?php echo $article['name']; ?></a></h3>
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
                <div class="pagination-wrap">
                    <nav>
                        <?php echo $pagination; ?>
                    </nav>
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>
