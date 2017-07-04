<section class="visit-section">
  <div class="visit-container">
    <?php if ($image) { ?>
    <div class="img-wrap">
      <img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" />
    </div>
    <?php } ?>
    <div class="visit-title text-uppercase"><?php echo $text_visit_our_store; ?></div>
    <div class="visit-address"><?php echo $address; ?></div>
    <div class="visit-question text-uppercase"><?php echo $text_have_questions; ?></div>
    <a href="javascript: void(0);" class="question-link" data-toggle="modal" data-target="#feedback"><?php echo $text_write_to_us; ?></a>
  </div>
</section>
<footer>
  <div class="footer-wrap">
    <div class="container clearfix">
      <div class="footer-wrap__company">
        <h4><?php echo $text_about; ?></h4>
        <nav>
          <ul>
            <li><a href="<?php echo $about; ?>"><?php echo $text_about; ?></a></li>
            <li><a href="<?php echo $career; ?>"><?php echo $text_career; ?></a></li>
            <li><a href="javascript: void(0);"><?php echo $text_corporate_website; ?></a></li>
            <li><a href="<?php echo $shops; ?>"><?php echo $text_shops; ?></a></li>
            <li><a href="<?php echo $franchise; ?>"><?php echo $text_franchise; ?></a></li>
            <li><a href="<?php echo $contact; ?>"><?php echo $text_contacts; ?></a></li>
          </ul>
        </nav>
      </div>
      <div class="footer-wrap__catalog">
        <h4><?php echo $text_catalog; ?></h4>
        <nav>
          <ul>
            <li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
            <?php if ($categories) { ?>
              <?php foreach ($categories as $category) { ?>
                <li>
                  <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                </li>
              <?php } ?>
            <?php } ?>
            <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            <li><a href="<?php echo $action; ?>"><?php echo $text_actions; ?></a></li>
            <li><a href="javascript: void(0);"><?php echo $text_catalog; ?>(pdf)</a></li>
          </ul>
        </nav>
      </div>
      <div class="footer-wrap__support">
        <h4><?php echo $text_support; ?></h4>
        <nav>
          <ul>
            <li><a href="javascript: void(0);"><?php echo $text_customer_service; ?></a></li>
            <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
            <li><a href="<?php echo $sizes; ?>"><?php echo $text_sizes; ?></a></li>
            <li><a href="<?php echo $delivery; ?>"><?php echo $text_delivery; ?></a></li>
            <li><a href="<?php echo $blog; ?>"><?php echo $text_blog; ?></a></li>
          </ul>
        </nav>
      </div>
      <div class="footer-wrap__links">
        <h4><?php echo $text_legal_references; ?></h4>
        <nav>
          <ul>
            <li><a href="<?php echo $terms; ?>"><?php echo $text_terms; ?></a></li>
            <li><a href="<?php echo $privacy_policy; ?>"><?php echo $text_privacy_policy; ?></a></li>
            <li><a href="<?php echo $terms_files; ?>"><?php echo $text_terms_files; ?></a></li>
          </ul>
        </nav>
      </div>
      <div class="footer-wrap__socials">
        <h4><?php echo $text_follow_us; ?></h4>
        <ul class="socials-list">
          <li>
            <a href="//www.facebook.com/">
              <i class="fa fa-facebook" aria-hidden="true"></i>
            </a>
          </li>
          <li>
            <a href="//instagram.com/">
              <i class="fa fa-instagram" aria-hidden="true"></i>
            </a>
          </li>
        </ul>
        <div class="cards">
          <img src="catalog/view/theme/idexe/images/cards.png" alt="">
        </div>
      </div>
    </div>
  </div>
  <div class="copyright">
    <?php echo $powered; ?>
  </div>

					<script type="text/javascript"><!--
						$("#callphone").mask("+38(999)999-99-99");
						$("#feedphone").mask("+38(999)999-99-99");
					--></script>
				
</footer>

            <?php if ($live_search_ajax_status):?>
	            <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/live_search.css" />
				<script type="text/javascript"><!--
					var live_search = {
						selector: '#search input[name=\'search\']',
						text_no_matches: '<?php echo $text_empty; ?>',
						height: '50px'
					}

					$(document).ready(function() {
						var html = '';
						html += '<div class="live-search">';
						html += '	<ul>';
						html += '	</ul>';
						html += '<div class="result-text"></div>';
						html += '</div>';

						//$(live_search.selector).parent().closest('div').after(html);
						$(live_search.selector).after(html);

						$(live_search.selector).autocomplete({
							'source': function(request, response) {
								var filter_name = $(live_search.selector).val();
								var live_search_min_length = '<?php echo (int)$live_search_min_length; ?>';
								if (filter_name.length < live_search_min_length) {
									$('.live-search').css('display','none');
								}
								else{
									var html = '';
									html += '<li style="text-align: center;height:10px;">';
									html +=	'<img class="loading" src="catalog/view/theme/default/image/loading.gif" />';
									html +=	'</li>';
									$('.live-search ul').html(html);
									$('.live-search').css('display','block');

									$.ajax({
										url: 'index.php?route=product/live_search&filter_name=' +  encodeURIComponent(filter_name),
										dataType: 'json',
										success: function(result) {
											var products = result.products;
											$('.live-search ul li').remove();
											$('.result-text').html('');
											if (!$.isEmptyObject(products)) {
												var show_image = <?php echo $live_search_show_image;?>;
												var show_price = <?php echo $live_search_show_price;?>;
												var show_description = <?php echo $live_search_show_description;?>;
												$('.result-text').html('<a href="<?php echo $live_search_href;?>'+filter_name+'" class="view-all-results"><?php echo $text_view_all_results;?> ('+result.total+')</a>');

												$.each(products, function(index,product) {
													var html = '';
													
													html += '<li>';
													html += '<a href="' + product.url + '" title="' + product.name + '">';
													if(product.image && show_image){
														html += '	<div class="product-image"><img alt="' + product.name + '" src="' + product.image + '"></div>';
													}
													html += '	<div class="product-name">' + product.name ;
													if(show_description){
														html += '<p>' + product.extra_info + '</p>';
													}
													html += '</div>';
													if(show_price){
														if (product.special) {
															html += '	<div class="product-price"><span class="special">' + product.price + '</span><span class="price">' + product.special + '</span></div>';
														} else {
															html += '	<div class="product-price"><span class="price">' + product.price + '</span></div>';
														}
													}
													html += '<span style="clear:both"></span>';
													html += '</a>';
													html += '</li>';
													$('.live-search ul').append(html);
												});
											} else {
												var html = '';
												html += '<li style="text-align: center;height:10px;">';
												html +=	live_search.text_no_matches;
												html +=	'</li>';

												$('.live-search ul').html(html);
											}
											$('.live-search ul li').css('height',live_search.height);
											$('.live-search').css('display','block');
											return false;
										}
									});
								}
							},
							'select': function(product) {
								$(live_search.selector).val(product.name);
							}
						});

						$(document).bind( "mouseup touchend", function(e){
						  var container = $('.live-search');
						  if (!container.is(e.target) && container.has(e.target).length === 0)
						  {
						    container.hide();
						  }
						});
					});
				//--></script>
			<?php endif;?>
            

<script type="text/javascript" src="catalog/view/theme/idexe/js/jquery.formstyler.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/idexe/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/idexe/js/custom.js"></script>

</body></html>