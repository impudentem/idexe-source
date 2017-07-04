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
</footer>

<script type="text/javascript" src="catalog/view/theme/idexe/js/jquery.formstyler.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/idexe/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/idexe/js/custom.js"></script>

</body></html>