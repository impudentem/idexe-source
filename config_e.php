<?php
// HTTP
$server_host=getenv("SERVER_NAME");
define('HTTP_SERVER', 'http://' . $server_host . '/');
define('HTTP_IMAGE', 'http://' . $server_host . '/image/');
define('HTTP_ADMIN', 'http://' . $server_host . '/admin/');
// define('HTTP_SERVER', 'http://hidden-savannah-8211.herokuapp.com/opencart');
// define('HTTP_IMAGE', 'http://hidden-savannah-8211.herokuapp.com/opencartimage/');
// define('HTTP_ADMIN', 'http://hidden-savannah-8211.herokuapp.com/opencartadmin/');

// HTTPS
define('HTTPS_SERVER', 'http://'. $server_host . '/');
define('HTTPS_IMAGE', 'http://'. $server_host . '/image/');
// define('HTTPS_SERVER', 'http://hidden-savannah-8211.herokuapp.com/opencart');
// define('HTTPS_IMAGE', 'http://hidden-savannah-8211.herokuapp.com/opencartimage/');
// DIR
define('DIR_APPLICATION', __DIR__ . '/catalog/');
define('DIR_SYSTEM', __DIR__ . '/system/');
define('DIR_DATABASE', __DIR__ . '/system/database/');
define('DIR_LANGUAGE', __DIR__ . '/catalog/language/');
define('DIR_TEMPLATE', __DIR__ . '/catalog/view/theme/');
define('DIR_CONFIG', __DIR__ . '/system/config/');
define('DIR_IMAGE', __DIR__ . '/image/');
define('DIR_CACHE', __DIR__ . '/system/storage/cache/');
define('DIR_DOWNLOAD', __DIR__ . '/system/storage/download/');
define('DIR_LOGS', __DIR__ . '/system/storage/logs/');
define('DIR_MODIFICATION', __DIR__ . '/system/storage/modification/');
define('DIR_UPLOAD', __DIR__ . '/system/storage/upload/');

// DB
$url=parse_url(getenv("CLEARDB_DATABASE_URL"));
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', $url['host']);
define('DB_USERNAME', $url['user']);
define('DB_PASSWORD', $url['pass']);
define('DB_PORT', '3306');
define('DB_DATABASE', substr($url["path"],1));
define('DB_PREFIX', 'oc_');
