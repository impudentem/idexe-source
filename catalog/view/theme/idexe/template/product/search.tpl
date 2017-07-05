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
                <div class="row clearfix">

                    <?php echo $column_left; ?>
                    <div class="col-xs-12">
                        <h1 class="item-title"><?php echo $heading_title; ?></h1>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="input-box">
                                    <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" />
                                </div>

                                <label class="checkbox-inline">
                                    <?php if ($description) { ?>
                                        <input type="checkbox" name="description" value="1" id="description" checked="checked" />
                                    <?php } else { ?>
                                        <input type="checkbox" name="description" value="1" id="description" />
                                    <?php } ?>
                                    <?php echo $entry_description; ?>
                                </label>
                            </div>
                            <div class="col-sm-4">
                                <select name="category_id" style="width: 100%;">
                                    <option value="0"><?php echo $text_category; ?></option>
                                    <?php foreach ($categories as $category_1) { ?>
                                        <?php if ($category_1['category_id'] == $category_id) { ?>
                                            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                                        <?php } else { ?>
                                            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                                        <?php } ?>
                                        <?php foreach ($category_1['children'] as $category_2) { ?>
                                            <?php if ($category_2['category_id'] == $category_id) { ?>
                                                <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                                            <?php } ?>
                                            <?php foreach ($category_2['children'] as $category_3) { ?>
                                                <?php if ($category_3['category_id'] == $category_id) { ?>
                                                    <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                                                <?php } else { ?>
                                                    <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                                                <?php } ?>
                                            <?php } ?>
                                        <?php } ?>
                                    <?php } ?>
                                </select>
                                <label class="checkbox-inline">
                                    <?php if ($sub_category) { ?>
                                        <input type="checkbox" name="sub_category" value="1" checked="checked" />
                                    <?php } else { ?>
                                        <input type="checkbox" name="sub_category" value="1" />
                                    <?php } ?>
                                    <?php echo $text_sub_category; ?>
                                </label>
                            </div>
                            <div class="col-sm-2">
                                <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-block btn-primary" />
                            </div>
                        </div>




                        <h2 class="item-title"><?php echo $text_search; ?></h2>
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
                            <div class="row clearfix category-row">
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
                        <?php } else { ?>
                            <p><?php echo $text_empty; ?></p>
                        <?php } ?>
                        <?php echo $content_bottom; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php echo $footer; ?>

<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>