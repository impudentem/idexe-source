<?php echo $header; ?>
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
            <div class="clearfix item-main">
                <?php echo $description; ?>
            </div>
            <?php echo $content_bottom; ?>
        </div>
    </section>
</div>
<?php echo $footer; ?>