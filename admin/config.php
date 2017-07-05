<?php
$server_host=getenv("SERVER_NAME");
if ($server_host == "localhost") {
  define('HTTP_SERVER', 'http://' . $server_host . '/idexe-source/admin/');
  define('HTTP_CATALOG', 'http://' . $server_host . '/idexe-source/');
  define('HTTP_IMAGE', 'http://' . $server_host . '/idexe-source/image/');
  // HTTPS
  define('HTTPS_SERVER', 'http://' . $server_host . '/idexe-source/admin/');
  define('HTTPS_CATALOG', 'http://' . $server_host . '/idexe-source/');
  define('HTTPS_IMAGE', 'http://' . $server_host . '/idexe-source/image/');

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
} else {
  // HTTP
  define('HTTP_SERVER', 'http://idexe-online.com.ua/admin/');
  define('HTTP_CATALOG', 'http://idexe-online.com.ua/');
  define('HTTP_IMAGE', 'http://idexe-online.com.ua/image/');

  // HTTPS
  define('HTTPS_SERVER', 'http://idexe-online.com.ua/admin/');
  define('HTTPS_CATALOG', 'http://idexe-online.com.ua/');
  define('HTTPS_IMAGE', 'http://idexe-online.com.ua/image/');

  // DIR
  define('DIR_APPLICATION', '/home/idexeonl/idexe-online.com.ua/www/admin/');
  define('DIR_SYSTEM', '/home/idexeonl/idexe-online.com.ua/www/system/');
  define('DIR_DATABASE', '/home/idexeonl/idexe-online.com.ua/www/system/database/');
  define('DIR_IMAGE', '/home/idexeonl/idexe-online.com.ua/www/image/');
  define('DIR_LANGUAGE', '/home/idexeonl/idexe-online.com.ua/www/admin/language/');
  define('DIR_TEMPLATE', '/home/idexeonl/idexe-online.com.ua/www/admin/view/template/');
  define('DIR_CONFIG', '/home/idexeonl/idexe-online.com.ua/www/system/config/');
  define('DIR_CACHE', '/home/idexeonl/idexe-online.com.ua/www/system/storage/cache/');
  define('DIR_DOWNLOAD', '/home/idexeonl/idexe-online.com.ua/www/system/storage/download/');
  define('DIR_LOGS', '/home/idexeonl/idexe-online.com.ua/www/system/storage/logs/');
  define('DIR_MODIFICATION', '/home/idexeonl/idexe-online.com.ua/www/system/storage/modification/');
  define('DIR_UPLOAD', '/home/idexeonl/idexe-online.com.ua/www/system/storage/upload/');
  define('DIR_CATALOG', '/home/idexeonl/idexe-online.com.ua/www/catalog/');
}

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'idexeonl.mysql.ukraine.com.ua');
define('DB_USERNAME', 'idexeonl_db');
define('DB_PASSWORD', 'xTndFLNW');
define('DB_DATABASE', 'idexeonl_db');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');
