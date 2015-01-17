<?php

/* 生成验证码图片*/
/*
* Filename:authimg.php
*/
$width = 50;           /* 图片宽度 */
$height = 20;          /* 图片高度*/
$point_count = 50;    /* 杂点数量 */

header("Content-type:image/PNG");
session_start();


$im = imagecreate($width, $height);
srand((double)microtime()*1000000);
$auth_num_k = md5(rand(0,9999));
$_SESSION["auth_num"] = substr($auth_num_k, 17, 4);

$background_color = imagecolorallocate($im, 238, 243, 246);
$white = ImageColorAllocate($im, 225, 225, 225);
$front_color = imagecolorallocate($im, 0, 128, 192);
imagefill($im, $width, $height, $background_color);
imagestring($im, 5, 10, 3, $_SESSION["auth_num"], $front_color);

/* 添加杂点数 */
for($i = 0; $i < $point_count; $i++)
{
	$randcolor = imagecolorallocate($im, rand(0,255), rand(0,255), rand(0,255));
	imagesetpixel($im, rand(0, $width), rand(0, $height), $randcolor);
}
imagepng($im);
imagedestroy($im);
?>