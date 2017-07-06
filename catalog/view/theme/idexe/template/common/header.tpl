<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo $title; ?></title>
  <base href="<?php echo $base; ?>" />
  <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
    <meta name="keywords" content= "<?php echo $keywords; ?>" />
  <?php } ?>
  <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
  <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />


  <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>

  <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
  <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
  <?php } ?>
  <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
  <?php } ?>

  <link href="catalog/view/javascript/jquery/owl-carousel/owl.theme.default.min.css" rel="stylesheet">
  <link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.css" rel="stylesheet">
  <link href="catalog/view/theme/idexe/css/jquery.formstyler.css" rel="stylesheet">
  <link href="catalog/view/theme/idexe/css/jquery.formstyler.theme.css" rel="stylesheet">
  <link href="catalog/view/theme/idexe/css/jquery.bxslider.min.css" rel="stylesheet">
  <link href="catalog/view/theme/idexe/css/font.css" rel="stylesheet">
  <link href="catalog/view/theme/idexe/css/style.css" rel="stylesheet">
  <link href="catalog/view/theme/idexe/css/media.css" rel="stylesheet">
  <script type="text/javascript" src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js"></script>
</head>
<body class="<?php echo $class; ?>">
<header>
    <div id="top"></div>
  <div class="top-wrap">
    <div class="container clearfix">
        <?php echo $language; ?>

      <div class="dropdown hidden-md hidden-lg">
        <button type="button" class="btn btn-menu dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
          <i class="fa fa-info" aria-hidden="true"></i>
        </button>


        <ul class="dropdown-menu">
          <li><a href="<?php echo $about; ?>"><?php echo $text_about; ?></a></li>
          <li><a href="<?php echo $shops; ?>"><?php echo $text_shops; ?></a></li>
          <li><a href="<?php echo $delivery; ?>"><?php echo $text_delivery; ?></a></li>
          <li><a href="<?php echo $blog; ?>"><?php echo $text_blog; ?></a></li>
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contacts; ?></a></li>
        </ul>
      </div>

      <div class="dropdown hidden-md hidden-lg">
        <button type="button" class="btn btn-menu dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
          <i class="fa fa-phone" aria-hidden="true"></i>
        </button>
        <ul class="dropdown-menu">
          <li><a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a></li>
          <li><a href="tel:<?php echo $telephone2; ?>"><?php echo $telephone2; ?></a></li>
          <li><a href="tel:<?php echo $telephone3; ?>"><?php echo $telephone3; ?></a></li>
        </ul>
      </div>

      <div class="top-wrap__menu hidden-sm hidden-xs">
        <nav>
          <ul>
            <li><a href="<?php echo $about; ?>"><?php echo $text_about; ?></a></li>
              <li><a href="<?php echo $shops; ?>"><?php echo $text_shops; ?></a></li>
              <li><a href="<?php echo $delivery; ?>"><?php echo $text_delivery; ?></a></li>
              <li><a href="<?php echo $blog; ?>"><?php echo $text_blog; ?></a></li>
              <li><a href="<?php echo $contact; ?>"><?php echo $text_contacts; ?></a></li>
          </ul>
        </nav>
      </div>

      <div class="top-wrap__entrance">
          <?php if ($logged) { ?>
            <div class="dropdown">
                <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $text_account; ?> <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                </ul>
            </div>
          <?php } else { ?>
              <div class="hidden-md hidden-sm hidden-xs">
                <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
                <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
              </div>
              <div class="visible-md visible-sm visible-xs">
                <div class="dropdown">
                  <a href="<?php echo $login; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i></a>
                  <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                    <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                  </ul>
                </div>
              </div>
          <?php } ?>
      </div>
      <div class="top-wrap__socials">
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
      </div>
    </div>
  </div>
  <div class="top-main-wrap">
    <div class="container clearfix">
      <div class="col-sm-4 col-xs-12 top-main-wrap__contacts">
        <ul>
            <li><a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a></li>
            <li><a href="tel:<?php echo $telephone2; ?>"><?php echo $telephone2; ?></a></li>
            <li><a href="tel:<?php echo $telephone3; ?>"><?php echo $telephone3; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-4 col-xs-12 top-main-wrap__logo">
        <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>">
            <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
          </a>
        <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
        <?php } ?>
      </div>
      <div class="col-md-4 col-sm-8 col-xs-12 top-main-wrap__cart">
          <?php echo $cart; ?>
          <?php echo $search; ?>
      </div>
    </div>
  </div>
  <div class="main-navigation">
    <div class="container">
      <div class="main-menu-container">
        <button type="button" class="navbar-toggle btn-navbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <nav class="main-menu">
          <ul>
            <li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
            <?php if ($categories) { ?>
              <?php foreach ($categories as $category) { ?>
                <li <?php if ($category['children']) { ?>class="menu-item-has-children"<?php } ?>>
                  <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>

                  <?php if ($category['children']) { ?>
                    <ul class="sub-menu">
                      <?php foreach ($category['children'] as $child) { ?>
                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                      <?php } ?>
                    </ul>
                  <?php } ?>
                </li>
              <?php } ?>
            <?php } ?>
            <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            <li><a href="<?php echo $franchise; ?>"><?php echo $text_franchise; ?></a></li>
            <li><a href="<?php echo $actions; ?>"><?php echo $text_actions; ?></a></li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</header>
<div class="delivery">
  <div class="container">
    <?php echo $slogan[$config_language_id]; ?>
  </div>
</div>
