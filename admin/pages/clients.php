<?php
		
	if( !empty( $_POST['action'] ) && $_POST['action'] == 'modify' ){
		$user = new DbClient($_POST['Id']);
		$user->fromArray($_POST,array('Id'));
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
	if( !empty( $_GET['expression'] ) ) $where .= ' and ( name like "%'.str_replace(' ','%',$_GET['expression']).'%" or email like "%'.str_replace(' ','%',$_GET['expression']).'%" ) ';
	//echo 'select count(distinct id) from users '.$where;
	$list = new DbList('select count(distinct Id) from clients '.$where);
	$nr = $list[0][0];
	
	$curpag = !empty( $_GET['pg'] ) ? $_GET['pg'] : 1;
	$per_page = 20;
	$fl = ($curpag-1)*$per_page;
	$smarty->assign('pagini',ceil($nr/$per_page));
	$smarty->assign('curpag',$curpag);
	
	$list = new DbList('select *, (select Name from users where Id=clients.user_id) as account from clients '.$where.' order by Id DESC limit '.$fl.','.$per_page);
	$items = array();
	foreach( $list as $l )
	{
		
		array_push($items,$l);
	}
	$smarty->assign('items',$items);
	$smarty->assign('linkwcp',Util::GetCurrentUrlWithoutKeys(array('pg')));
	
	$core['template'] = "clients.tpl";
?>