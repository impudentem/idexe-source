<?php if (count($languages) > 0) { ?>
<div class="top-wrap__lang">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
        <select class="language-select" name="code">
            <?php foreach ($languages as $language) { ?>
            <option value="<?php echo $language['code']; ?>" <?php if ($language['code'] == $code) { ?>selected<?php } ?>><?php echo $language['name']; ?></option>
            <?php } ?>
        </select>
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </form>
</div>
<?php } ?>
