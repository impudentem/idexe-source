<?php
// define('DIR_APPLICATION', str_replace('\\', '/', realpath(dirname(__FILE__))) . '/');
$dir = str_replace('\\', '/', realpath(dirname(__FILE__))) . '/';
$server_host=getenv("SERVER_NAME");
echo $server_host;

phpinfo();
?>
