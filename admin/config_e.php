<?php
// HTTP
$server_host=getenv("SERVER_NAME");
define('HTTP_SERVER', 'http://' . $server_host . '/admin/');
define('HTTP_CATALOG', 'http://' . $server_host . '/');
define('HTTP_IMAGE', 'http://' . $server_host . '/image/');
// define('HTTP_SERVER', 'http://hidden-savannah-8211.herokuapp.com/opencartadmin/');
// define('HTTP_CATALOG', 'http://hidden-savannah-8211.herokuapp.com/opencart');
// define('HTTP_IMAGE', 'http://hidden-savannah-8211.herokuapp.com/opencartimage/');
// HTTPS
define('HTTPS_SERVER', 'http://' . $server_host . '/admin/');
define('HTTPS_CATALOG', 'http://' . $server_host . '/');
define('HTTPS_IMAGE', 'http://' . $server_host . '/image/');
// define('HTTPS_SERVER', 'http://hidden-savannah-8211.herokuapp.com/opencartadmin/');
// define('HTTPS_CATALOG', 'http://hidden-savannah-8211.herokuapp.com/opencart');
// define('HTTPS_IMAGE', 'http://hidden-savannah-8211.herokuapp.com/opencartimage/');

$dir = str_replace('\\', '/', realpath(dirname(dirname(__FILE__)))) . '/';
// DIR
define('DIR_APPLICATION', $dir . 'admin/');
define('DIR_SYSTEM', $dir . 'system/');
define('DIR_DATABASE', $dir . 'system/database/');
define('DIR_LANGUAGE', $dir . 'admin/language/');
define('DIR_TEMPLATE', $dir . 'admin/view/template/');
define('DIR_CONFIG', $dir . 'system/config/');
define('DIR_IMAGE', $dir . 'image/');
define('DIR_CACHE', $dir . 'system/storage/cache/');
define('DIR_DOWNLOAD', $dir . 'system/storage/download/');
define('DIR_LOGS', $dir . 'system/storage/logs/');
define('DIR_MODIFICATION', $dir . 'system/storage/modification/');
define('DIR_UPLOAD', $dir . 'system/storage/upload/');
define('DIR_CATALOG', $dir . 'catalog/');

// DB
$url=parse_url(getenv("CLEARDB_DATABASE_URL"));
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', $url['host']);
define('DB_USERNAME', $url['user']);
define('DB_PASSWORD', $url['pass']);
define('DB_PORT', '3306');
define('DB_DATABASE', substr($url["path"],1));
define('DB_PREFIX', 'oc_');
