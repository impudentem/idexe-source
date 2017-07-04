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
  <div class="category-section">
    <div class="container">
      <h1 class="item-title"><?php echo $heading_title; ?></h1>
      <div class="row clearfix">

        <?php echo $column_left; ?>
        <div class="col-sm-12 col-xs-12">
          <div class="category-row">
          <?php if ($products) { ?>
            <div class="sorting-block clearfix">
              <div class="left-pos">
                <label for="displayas" class="sorting-label"><?php echo $text_limit; ?></label>
                <select name="displayas" id="displayas" class="sortingby" onchange="location = this.value;">
                  <?php foreach ($limits as $limits) { ?>
                    <?php if ($limits['value'] == $limit) { ?>
                      <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                    <?php } else { ?>
                      <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                    <?php } ?>
                  <?php } ?>
                </select>
              </div>
              <div class="right-pos">
                <label for="sortingby" class="sorting-label"><?php echo $text_sort; ?></label>
                <select name="sortingby" id="sortingby" class="sortingby" onchange="location = this.value;">
                  <?php foreach ($sorts as $sorts) { ?>
                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                      <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                    <?php } else { ?>
                      <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                    <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="row clearfix cat-item-row">
              <?php foreach ($products as $product) { ?>
                <div class="col-sm-3 col-xs-6 category-item">
                  <a href="<?php echo $product['href']; ?>">
                    <span class="cat-img-wrap">
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                    </span>
                  </a>
                  <h4 class="product-title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                  <div class="product-price">
                    <?php if (!$product['special']) { ?>
                      <div class="default-price"><?php echo $product['price']; ?></div>
                    <?php } else { ?>
                      <div class="old-price"><?php echo $product['price']; ?></div>
                      <div class="new-price"><?php echo $product['special']; ?></div>
                    <?php } ?>
                  </div>

                  <?php if ($product['special']) { ?>
                    <div class="action-label"><span>акция</span></div>
                  <?php } ?>
                </div>
              <?php } ?>
            </div>

            <?php if($pagination){ ?>
              <div class="pagination-wrap">
                <nav>
                  <?php echo $pagination; ?>
                </nav>
              </div>
            <?php } ?>
          <?php } ?>
          <?php if (!$products) { ?>
            <p><?php echo $text_empty; ?></p>

            <div class="buttons">
              <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
          <?php } ?>
          </div>
          <?php echo $content_bottom; ?>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
