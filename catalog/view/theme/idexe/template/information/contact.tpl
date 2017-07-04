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
  <div class="contacts-section">
    <div class="container">
      <h1 class="item-title"><?php echo $heading_title; ?></h1>
      <div class="contacts-container">
        <div class="row">
          <div class="col-sm-6 col-xs-12 contact-info">
            <div class="contact-info__phones">
              <ul>
                <li><a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a></li>
                <li><a href="tel:<?php echo $telephone2; ?>"><?php echo $telephone2; ?></a></li>
                <li><a href="tel:<?php echo $telephone3; ?>"><?php echo $telephone3; ?></a></li>
              </ul>
            </div>
            <div class="contact-info__address">
              <?php echo $address; ?>
            </div>
            <div class="contact-info__email">
              <a href="mailto: <?php echo $config_email; ?>"><?php echo $config_email; ?></a>
            </div>
          </div>
          <div class="col-sm-6 col-xs-12 contact-form">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
              <fieldset>
                <div class="form-group required">

                  <div class="col-sm-12">
                    <input type="text" name="name" placeholder="<?php echo $entry_name; ?>" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                    <?php if ($error_name) { ?>
                      <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">

                  <div class="col-sm-12">
                    <input type="text" name="email" placeholder="<?php echo $entry_email; ?>" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                    <?php if ($error_email) { ?>
                      <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <textarea name="enquiry" rows="10" placeholder="<?php echo $entry_enquiry; ?>" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
                    <?php if ($error_enquiry) { ?>
                      <div class="text-danger"><?php echo $error_enquiry; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php echo $captcha; ?>
              </fieldset>
              <p><span><input class="submit-button" type="submit" value="<?php echo $button_submit; ?>" /></span></p>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
