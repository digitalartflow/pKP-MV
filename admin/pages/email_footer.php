<?php
	if( !empty( $_POST['action'] ) && $_POST['action'] == 'modify' )
	{
		file_put_contents($config['server_path'].'html_pages/email_footer.tpl',$_POST['Content']);
		Util::Redirect($config['admin_url'].'?page='.$_GET['page']);
	}
	$core['template'] = "email_footer.tpl";

?>