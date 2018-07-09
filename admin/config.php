<?php
    //db settings 
	$host     = "demopkp2.db.6010387.hostedresource.com";  // type your database host
    $user     = "demopkp2"; // type your database user
    $pass     = 'Orange1!';  // type your database password
    mysql_connect  ( $host, $user, $pass ) or die ( "Error: ".mysql_error() );
    mysql_select_db("demopkp2"); // type your database name
	mysql_query("SET NAMES utf8");
	
	############### SETEAZA EMAILUL ##########################
	$config_mail = array(
		'MailSMTPAuth'	=> false,
		'MailHost'		=> "localhost",
		'MailPort'		=> 25,
		'MailUsername'	=> "contact@digitalartflow.com",
		'MailPassword'	=> 'Winteroud',
		'MailFrom'		=> "contact@digitalartflow.com",
		'MailFromName'	=> "php Kitchen Planner powered by Digital Artflow"		
	);
	
	################# SETARI #########################
	$server = array(
		/*'server_path' => dirname(__FILE__).'/',	*/	
		'server_path' => '/home/content/87/6010387/html/demo2/'	// type server path example: /home/content/87/6010387/html/demo/
	);
	$config = array(
		'siteurl' => 'http://manufacture.3dkitchenplanners.com/',  // type url
		'site_url' => 'http://manufacture.3dkitchenplanners.com/',  // type URL with www
		'site_name' => 'php Kitchen Planner', // type your site name
		'secret_phrase' => 'WINTEROUD',
		'server_path' => '/home/content/87/6010387/html/demo2/', // type server path, example: /home/content/87/6010387/html/demo/
		'adminurl' => 'http://manufacture.3dkitchenplanners.com/admin/',  // type your admin url path, example: http://digitalartflow.com/demo/admin/
		'admin_url' => 'http://manufacture.3dkitchenplanners.com/admin/',  // // type your admin url path with wwww
		'static_admin' => array(
			'css' => 'http://manufacture.3dkitchenplanners.com/admin/static/css/', // URL
			'js' => 'http://manufacture.3dkitchenplanners.com/admin/static/js/',  // URL
			'img' => 'http://manufacture.3dkitchenplanners.com/admin/static/img/'  // URL
		),
	);
?>