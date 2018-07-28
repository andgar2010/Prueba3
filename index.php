<?php 

require_once 'core/Core.php';

$c = isset($_GET['c']) ? $_GET['c'] : 'inicio';
$m = isset($_GET['m']) ? $_GET['m'] : 'index';
$p[] = isset($_GET['p']) ? $_GET['p'] : '';

if (!file_exists('controllers/'.ucwords($c).'Controller.php')) {
	$c = 'inicio';
}

$c = ucwords($c).'Controller';
require_once 'controllers/'.$c.'.php';
$c = new $c;

if (!method_exists($c, $m)) {
	$m = 'index';
}

call_user_func_array([$c,$m],$p);