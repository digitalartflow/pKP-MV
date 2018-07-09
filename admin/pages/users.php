<?php

	if( !empty( $_POST['action'] ) && $_POST['action'] == 'change' ){
		$user = new DbUser($_POST['Id']);
		$user['status'] = $_POST['status'];
		$user['DealerPricePercentage'] = $_POST['DealerPricePercentage'];
		$user->Update();
		
		Util::Redirect();
	}

	$list = new DbList('select * from countries order by Name ASC');
	$countries = array();
	foreach( $list as $l ){
		$countries[$l['Id']] = $l;
	}
	$smarty->assign('countries',$countries);

	$list = new DbList('select * from india_states_list order by state ASC');
	$states = array();
	foreach( $list as $l ){
		$states[$l['Id']] = $l;
	}
	$smarty->assign('states',$states);

	
	
	$where = 'where 1=1';
	if( !empty( $_GET['expression'] ) ) $where .= ' and ( Name like "%'.str_replace(' ','%',$_GET['expression']).'%" or Email like "%'.str_replace(' ','%',$_GET['expression']).'%" ) ';
	//echo 'select count(distinct id) from users '.$where;
	$list = new DbList('select count(distinct id) from users '.$where);
	$nr = $list[0][0];
	
	$curpag = !empty( $_GET['pg'] ) ? $_GET['pg'] : 1;
	$per_page = 10;
	$fl = ($curpag-1)*$per_page;
	$smarty->assign('pagini',ceil($nr/$per_page));
	$smarty->assign('curpag',$curpag);
	
	$list = new DbList('select * from users '.$where.' order by Id DESC limit '.$fl.','.$per_page);
	$items = array();
	foreach( $list as $l )
	{
		
		array_push($items,$l);
	}
	$smarty->assign('items',$items);
	$smarty->assign('linkwcp',Util::GetCurrentUrlWithoutKeys(array('pg')));
	
	$core['template'] = "users.tpl";
?>