<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-exclamation-triangle"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <?php foreach ($cache_dirs as $cache_dir) { ?>
        <div class="table table-striped table-bordered table-hover">
          <div class="panel-body">
            <div class="pull-right">
              <a onclick="confirm('<?php echo $text_confirm; ?>') ? location.href='<?php echo $cache_dir['clear']; ?>' : false;" data-toggle="tooltip" title="<?php echo $button_clear; ?>" class="btn btn-warning"><i class="fa fa-eraser"></i></a>
            </div>
            <h4><a onclick="$('#<?php echo $cache_dir['div_id']; ?>').slideToggle();" style="cursor: pointer;"><?php echo $cache_dir['name']; ?></a></h4>
            <div class="panel-body" style="display: none;" id="<?php echo $cache_dir['div_id']; ?>">
              <?php foreach ($cache_dir['files'] as $file) { ?>
              <?php echo $file; ?><br />
              <?php } ?>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>