<?php
$server_host=getenv("SERVER_NAME");
if ($server_host == "localhost") {
  define('HTTP_SERVER', 'http://' . $server_host . '/idexe-source/');
  define('HTTP_IMAGE', 'http://' . $server_host . '/idexe-source/image/');
  define('HTTP_ADMIN', 'http://' . $server_host . '/idexe-source/admin/');
  // HTTPS
  define('HTTPS_SERVER', 'http://'. $server_host . '/idexe-source/');
  define('HTTPS_IMAGE', 'http://'. $server_host . '/idexe-source/image/');
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
} else {
  // HTTP
  define('HTTP_SERVER', 'http://idexe-online.com.ua/');

  // HTTPS
  define('HTTPS_SERVER', 'http://idexe-online.com.ua/');

  // DIR
  define('DIR_APPLICATION', '/home/idexeonl/idexe-online.com.ua/www/catalog/');
  define('DIR_SYSTEM', '/home/idexeonl/idexe-online.com.ua/www/system/');
  define('DIR_IMAGE', '/home/idexeonl/idexe-online.com.ua/www/image/');
  define('DIR_LANGUAGE', '/home/idexeonl/idexe-online.com.ua/www/catalog/language/');
  define('DIR_TEMPLATE', '/home/idexeonl/idexe-online.com.ua/www/catalog/view/theme/');
  define('DIR_CONFIG', '/home/idexeonl/idexe-online.com.ua/www/system/config/');
  define('DIR_CACHE', '/home/idexeonl/idexe-online.com.ua/www/system/storage/cache/');
  define('DIR_DOWNLOAD', '/home/idexeonl/idexe-online.com.ua/www/system/storage/download/');
  define('DIR_LOGS', '/home/idexeonl/idexe-online.com.ua/www/system/storage/logs/');
  define('DIR_MODIFICATION', '/home/idexeonl/idexe-online.com.ua/www/system/storage/modification/');
  define('DIR_UPLOAD', '/home/idexeonl/idexe-online.com.ua/www/system/storage/upload/');
}


// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'idexeonl.mysql.ukraine.com.ua');
define('DB_USERNAME', 'idexeonl_db');
define('DB_PASSWORD', 'xTndFLNW');
define('DB_DATABASE', 'idexeonl_db');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');
