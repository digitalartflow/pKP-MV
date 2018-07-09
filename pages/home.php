<?
	$smarty = $_SESSION["smarty"];
	
	
	if( !empty( $_SESSION['logged'] ) &&  $_SESSION['logged'] == true ){
		header('Location: '.WEBSITE_URL.'where-to.html');
		die();
	}
	
	//afiseaza totul
	$thePage = $smarty->fetch( "pages/home-login.tpl" );
	$smarty->assign('thePage',$thePage);
?>