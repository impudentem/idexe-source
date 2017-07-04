<?php echo $header; ?>
<?php echo $block_top; ?>
<div class="content">
    <div class="breadcrumbs">
        <div class="container">
            <ul>
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <section class="item-section">
        <div class="container">
            <?php echo $content_top; ?>
            <h1 class="item-title"><?php echo $heading_title; ?></h1>
            <div class="row clearfix item-main">
                <div class="news-simple-head clearfix">
                    <?php if ($show['date'] && $date_modified) { ?>
                        <div class="news-article-date"> <?php echo $date_modified; ?></div>
                    <?php } ?>
                    <div class="news-simple-share">
                        <span class="share-label">Поделиться:</span>
                        <div class="item-socials">
                            <div class="addthis_inline_share_toolbox"></div>
                            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5888a6b6bb831ac2"></script>
                        </div>
                    </div>
                </div>
                <div class="news-simple-wrap">
                    <div class="news-content-text">
                        <?php echo $description; ?>
                        <?php if ($comment_status) { ?>
                            <div class="article-comments" id="comments"></div>
                            <div>
                                <form class="form-horizontal" id="form-comment">
                                    <div id="comment"></div>
                                    <h2><?php echo $text_write; ?></h2>
                                    <?php if ($comment_guest) { ?>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label"
                                                       for="input-name"><?php echo $entry_name; ?></label>
                                                <input type="text" name="name" value="<?php echo $author_name; ?>"
                                                       id="input-name"
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label"
                                                       for="input-comment"><?php echo $entry_comment; ?></label>
                                                <textarea name="text" rows="5" id="input-comment"
                                                          class="form-control"></textarea>

                                                <div class="help-block"><?php echo $text_note; ?></div>
                                            </div>
                                        </div>
                                        <?php if ($site_key) { ?>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <div class="g-recaptcha"
                                                         data-sitekey="<?php echo $site_key; ?>"></div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <div class="buttons clearfix">
                                            <div class="pull-right">
                                                <button type="button" id="button-comment"
                                                        data-loading-text="<?php echo $text_loading; ?>"
                                                        class="btn btn-primary"><?php echo $button_continue; ?></button>
                                            </div>
                                        </div>
                                    <?php } else { ?>
                                        <?php echo $text_login; ?>
                                    <?php } ?>
                                </form>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
    </section>
</div>

<?php echo $block_bottom; ?>
    </div><!-- end .topbox -->
<script type="text/javascript"><!--
    $('#comments').load('index.php?route=blog/article/comment&article_id=<?php echo $article_id; ?>');
    $('#button-comment').on('click', function () {
        $.ajax({
            url: 'index.php?route=blog/article/write&article_id=<?php echo $article_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-comment").serialize(),
            beforeSend: function () {
                $('#button-comment').button('loading');
            },
            complete: function () {
                $('#button-comment').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#comment').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#comment').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
                    $('#comments').empty();
                    $('#comments').load('index.php?route=blog/article/comment&article_id=<?php echo $article_id; ?>');
                    grecaptcha.reset();
                    $('textarea[name=\'text\']').val('');
                }
            }
        });
    });
    //--></script>
<?php echo $footer; ?>
