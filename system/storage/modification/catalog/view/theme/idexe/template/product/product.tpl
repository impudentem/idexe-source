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
            <h1 class="item-title"><?php echo $heading_title; ?></h1>
            <div class="row clearfix item-main">
                <div class="col-sm-6 col-xs-12 item-gallery clearfix">
                    <?php if ($images) { ?>
                    <div id="bx-pager">
                        <a data-slide-index="0"><img src="<?php echo $additional; ?>" /></a>
                        <?php foreach ($images as $count => $image) { ?>
                        <a data-slide-index="<?php echo $count+1; ?>"><img src="<?php echo $image['thumb']; ?>" /></a>
                        <?php } ?>
                    </div>
                    <ul class="bxslider thumbnails">
                        <li><a href="<?php echo $popup; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                        <?php foreach ($images as $image) { ?>
                        <li><a href="<?php echo $image['popup']; ?>"><img src="<?php echo $image['main']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                        <?php } ?>
                    </ul>
                </div>
                <?php } ?>


                <div id="product" class="col-sm-6 col-xs-12 item-characteristics">
                    <div class="item-availability clearfix">
                        <div>
                            <ul class="availability-list">
                                <li><span>артикул</span><span>#<?php echo $sku ? $sku : $model;  ?></span></li>
                                <li><span>наличие</span><span class="sklad"><?php echo $stock; ?></span></li>
                            </ul>
                        </div>
                        <div>
                            <span class="share-text">поделиться ссылкой</span>
                            <div class="socials-list">
                                <div class="addthis_inline_share_toolbox"></div>
                                <!-- Go to www.addthis.com/dashboard to customize your tools -->
                                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-58e3acab6648b4bb"></script>
                            </div>
                        </div>
                    </div>
                    <div class="item-models">
                    <?php if ($options) { ?>
                        <?php foreach ($options as $option) { ?>
                            <?php if ($option['type'] == 'radio' && $option['option_id'] == 13) { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                    <h4><?php echo $option['name']; ?></h4>
                                    <div id="input-option<?php echo $option['product_option_id']; ?>">

                                        <?php foreach ($option['product_option_value'] as $id => $option_value) { ?>
                                        <div class="radio">
                                            <label <?php if ($option_value['price']) { ?>data-price="<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>"<?php } ?>>
                                                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                                <?php if ($option_value['image']) { ?>
                                                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                                                <?php } ?>
                                                <?php echo $option_value['name']; ?>
                                            </label>
                                        </div>
                                        <?php } ?>

                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'radio' && $option['option_id'] == 11) { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                    <h4><?php echo $option['name']; ?></h4>
                                    <ul class="size-table">
                                        <li>высота</li>
                                        <li>грудь</li>
                                        <li>длина рукава</li>
                                    </ul>
                                    <div class="size-list" id="input-option<?php echo $option['product_option_id']; ?>">
                                        <?php foreach ($option['product_option_value'] as $id => $option_value) { ?>
                                        <div class="radio">
                                            <label <?php if ($option_value['price']) { ?>data-price="<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>"<?php } ?>>
                                                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                                <?php if ($option_value['image']) { ?>
                                                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                                                <?php } ?>
                                                <?php $sizes = explode('x', $option_value['name']); ?>
                                                <?php foreach($sizes as $size) { ?>
                                                    <span><?php echo $size; ?></span>
                                                <?php } ?>
                                            </label>
                                        </div>
                                        <?php } ?>

                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'radio' && $option['option_id'] == 1) { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                    <h4><?php echo $option['name']; ?></h4>
                                    <div class="сolors-choosing" id="input-option<?php echo $option['product_option_id']; ?>">
                                        <?php foreach ($option['product_option_value'] as $id => $option_value) { ?>
                                            <div class="radio">
                                                <label data-name="<?php echo $option_value['name']; ?>" <?php if ($option_value['price']) { ?>data-price="<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>"<?php } ?>>
                                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                                </label>
                                            </div>
                                        <?php } ?>

                                    </div>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    <?php } ?>
                    </div>

                    <?php if ($price) { ?>
                        <div class="price-row">
                            <?php if (!$special) { ?>
                                <div class="price-real">
                                    <span class="price-text">Цена: </span>
                                    <?php echo $price; ?>
                                </div>

                            <?php } else { ?>
                                <div class="price-real">
                                    <span class="price-text">Цена: </span>
                                    <?php echo $special; ?>
                                </div>
                                <div class="price-old"><span><?php echo $price; ?></span>
                                    (<?php
                                    $num[0]=$price2;
                                    $num[1]=$special2;
                                    $procent=$num[0]/100;
                                    $result=100-($num[1]/$procent);
                                    echo '-'.round ($result); ?>%)
                                </div>
                            <?php } ?>
                        </div>

                    <?php } ?>

                    <?php if ($discounts) { ?>
                        <ul>
                            <li>
                                <hr>
                            </li>
                            <?php foreach ($discounts as $discount) { ?>
                                <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                            <?php } ?>
                        </ul><br />
                    <?php } ?>


                    <div class="add-to-cart">
                        <div>
                            <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                            <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"><span class="cart-icon"></span><?php echo $button_cart; ?></button>
                        </div>

                        <div>
                            <a href="javascript: void(0);" data-toggle="modal" data-target="#fastorder" class="buy-by-click"><?php echo $entry_fo_button; ?></a>
                        </div>

                    </div>
                    <?php if ($minimum > 1) { ?>
                        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                    <?php } ?>


                    <div class="delivery-buy-wrap">
                        <div class="delivery-block">
                            <span class="reg-font">доставка</span><br>
                            <span>по всей украине</span>
                        </div>
                        <div class="buy-block">
                            <span class="reg-font">оплата</span><br>
                            <span>наличные или карта</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix item-add-info">
                <div class="col-sm-6 col-xs-12 item-description">
                    <div class="item-description__wrap">
                        <h3>описание</h3>
                        <div class="item-description__text">
                            <?php echo $description; ?>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-12 item-characteristics">
                    <div class="item-characteristics__wrap">
                        <h3>характеристики</h3>
                        <div class="item-characteristics__table">
                            <?php if ($attribute_groups) { ?>
                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                        <div class="item-table-row">
                                            <div class="item-table-cell">
                                                <?php echo $attribute['name']; ?>
                                            </div>
                                            <div class="item-table-cell">
                                                <?php echo $attribute['text']; ?>
                                            </div>
                                        </div>
                                    <?php } ?>
                                <?php } ?>
                            <?php } ?>
                        </div>
                        <div class="item-characteristics__images">
                            <ul>
                                <li><img src="catalog/view/theme/idexe/images/temperature.png" alt=""></li>
                                <li><img src="catalog/view/theme/idexe/images/praska.png" alt=""></li>
                                <li><img src="catalog/view/theme/idexe/images/tazik.png" alt=""></li>
                                <li><img src="catalog/view/theme/idexe/images/triangle-danger.png" alt=""></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php if ($products) { ?>
    <section class="top-goods-section">
        <div class="container">
            <div class="section-title text-uppercase"><?php echo $text_related; ?></div>
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
    <?php } ?>
</div>



                <!-- Modal -->
								<div class="modal fade" id="fastorder" tabindex="-1" role="dialog" aria-labelledby="fastorderLabel">
								  <div class="modal-dialog modal-md" role="document">

									<!-- StartModalContent -->
									<div class="modal-content">

									  <!-- ModalHeadStart -->
									  <div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title text-overflow" id="fastorderLabel"><?php echo $entry_fo_button; ?> - <?php echo $heading_title; ?></h4>
									  </div>
									  <!-- ModalHeadEnd -->

								<!-- StartModalBody -->
								<div class="modal-body">

								<!-- FormStart -->
								<form name="sentMessage" id="contactForm" novalidate>
								<div class="container-fluid">
								  <div class="row">
									<div class="col-md-12">

													  <div class="control-group">
														<div class="controls">
														  <input type="hidden" class="form-control" value="<?php echo $heading_title; ?>" id="foproduct" />
														</div>
													  </div>

													  <div class="control-group">
														<div class="controls">
														  <input type="hidden" class="form-control" value="<?php if (!$special) { ?><?php echo $base_price; ?><?php } else { ?><?php echo $base_special; ?><?php } ?>" id="foprice" />
														</div>
													  </div>

													  <div class="control-group">
														<div class="controls">
														  <input type="hidden" class="form-control" value="<?php echo $text_model; ?> <?php echo $model; ?>" id="fomodel" />
														</div>
													  </div>

													  <div class="control-group">
														<div class="controls">
														  <input type="hidden" class="form-control" value="<?php echo $text_stock; ?> <?php echo $stock; ?>" id="fostock" />
														</div>
													  </div>

													  <div class="control-group">
														<div class="controls">
														  <div class="input-group">
														  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
														  <input type="text" class="form-control" placeholder="<?php echo $entry_fo_name;?>" id="name" required data-validation-required-message="<?php echo $entry_fo_name_error;?>" />
														  </div>
														</div>
													  </div>
								 
													  <div class="control-group">
														<div class="controls">
														  <div class="input-group">
														  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
														  <input type="email" class="form-control" placeholder="Email" id="email"  />
														  </div>
														</div>
													  </div>

													  <div class="control-group">
														<div class="controls">
														  <div class="input-group">
														  <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
														  <input type="phone" class="form-control" placeholder="<?php echo $entry_fo_phone; ?>" id="phone" required data-validation-required-message="<?php echo $entry_fo_phone_error; ?>" />
														  </div>
														</div>
													  </div>

													  <div class="control-group">
														<div class="controls">
														  <textarea rows="10" cols="100" class="form-control" placeholder="<?php echo $entry_fo_message; ?>" id="message"  maxlength="999" style="resize:none"></textarea>
														</div>
													  </div>

									</div>
								  </div>
								</div>
														<!-- StartModalFooter -->
														<div class="modal-footer">
														<div id="success"> </div>
														  <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $entry_fo_close; ?></button>
														  <button type="submit" class="btn btn-primary pull-right"><?php echo $entry_fo_send; ?></button>
														</div>
														<!-- EndModalFooter -->
								</form>
								<!-- FormEnd -->

								</div>
								<!-- EndModalBody -->

									</div>
									<!-- EndModalContent -->

								  </div>
								</div>
								<!-- Modal -->
                
<?php echo $content_bottom; ?>
<?php echo $block_bottom; ?>

<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<span id="cart-total">' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('fast');

    $('#review').load(this.href);

    $('#review').fadeIn('fast');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails li').not('.bx-clone').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>

                <style type="text/css">
				  .fast-order-thumb {text-align: center;}
				  .fast-order-ul {text-align: center;}
				  .text-overflow {overflow: hidden; white-space: nowrap; word-wrap: normal; text-overflow: ellipsis;}
				</style>

				<script type="text/javascript">
				$(function($){
				   $("#phone").mask("+38(999)999-99-99");
				});
				</script>
				
				<script type="text/javascript"><!--
	$(function() {
		$("#fastorder input, #fastorder textarea").jqBootstrapValidation({
			preventSubmit: true,
			submitError: function($form, event, errors) {},
			submitSuccess: function($form, event) {
				event.preventDefault(); 
				
				var foproduct = $("input#foproduct").val(),  
					foprice = $("input#foprice").val(),  
					fomodel = $("input#fomodel").val(),
					fostock = $("input#fostock").val(),
					name = $("input#name").val(),  
					mail = $("input#email").val(),
					phone = $("input#phone").val(),
					message = $("textarea#message").val(),
					firstName = name; 

				if (firstName.indexOf(' ') >= 0) {
					firstName = name.split(' ').slice(0, -1).join(' ');
				}
				
				$.ajax({
					url: "index.php?route=product/product/fastorder",
					type: "POST",
					data: {foproduct: foproduct, foprice: foprice, fomodel: fomodel, fostock: fostock, name: name, mail: mail, phone: phone, message: message},
					cache: false,
					success: function() {
						$('#contactForm #success').html("<div class='alert alert-success'>");
						$('#contactForm #success > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;").append( "</button>");
						$('#contactForm #success > .alert-success').append("<?php echo $entry_fo_send_success; ?>");
						$('#contactForm #success > .alert-success').append('</div>');
						$('#contactForm #contactForm').trigger("reset");
					},
					error: function() { 
						$('#contactForm #success').html("<div class='alert alert-danger'>");
						$('#contactForm #success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;").append( "</button>");
						$('#contactForm #success > .alert-danger').append("<?php echo $entry_fo_send_error; ?>");
						$('#contactForm #success > .alert-danger').append('</div>');
						$('#contactForm').trigger("reset");
					},
				});
			},
			filter: function() {
				return $(this).is(":visible");
			},
		});
	});

	$('#name').focus(function() {
		$('#success').html('');
	});
--></script>
                
<?php echo $footer; ?>
