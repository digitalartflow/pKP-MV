<?
	$smarty = $_SESSION["smarty"];
	
	$list = new DbList('select * from countries order by Name ASC');
	$smarty->assign('countries',$list->GetCollection());
	
	$list = new DbList('select * from india_states_list order by state ASC');
	$smarty->assign('india_states_list',$list->GetCollection());
	
	$list = new DbList('select * from html_pages where Zone="help" order by `Order` ASC');
	$smarty->assign('pages',$list->GetCollection());
	
	if( !empty( $_POST['action'] ) && $_POST['action'] =='save' ){
		$tc = array('name','address','city','pincode','phone','email');
		$errors = '';
		foreach( $tc as $t ){
			if( empty( $_POST[$t] ) ){
				$errors .= 'All fields are required!'.'\n';
			}
		}
		//check if customer exists
		if( $errors == '' ){
			$client = new DbList('select * from clients where pincode="'.$_POST['pincode'].'" and phone="'.$_POST['phone'].'"');
			$client = $client->GetCollection();
			if( count( $client ) > 0 ){
				if( $client[0]['user_id'] != $_SESSION['logged']['Id'] ){
					$errors .= 'Client exists in the database!'.'\n';
				}
			}
		}
		//check if postal code is in state
		if( $errors != '' ){
			$smarty->assign('errors',$errors);
		}else{
			$client = new DbList('select * from clients where pincode="'.$_POST['pincode'].'" and phone="'.$_POST['phone'].'"');
			if( $client->Size()  == 0){
				$client = new DbClient();
				$client_id = $client->getNextId();
				$client->setFromArray($_POST);
				$client->set('user_id', $_SESSION['logged']['Id']);
				$client->set('added', date('Y-m-d H:i:s'));
				$client->CreateNew();
				
				$client = new DbList('select * from clients where id="'.$client_id.'"');
				$client = $client->Get(0);
			}else{
				$client = $client->Get(0);	
							
				$dbclient = new DbClient();
				$dbclient->set('Id',$client['Id']);
				$dbclient->set('user_id', $_SESSION['logged']['Id']);
				$dbclient->setFromArray($_POST);
				$dbclient->Update();
			}
			$client = new DbList('select * from clients where pincode="'.$_POST['pincode'].'" and phone="'.$_POST['phone'].'"');
			$client = $client->Get(0);
			$_SESSION['client'] = $client;
			Util::Redirect('product-type.html');
		}
	}
	
	//afiseaza totul
	$thePage = $smarty->fetch( "pages/customer-info.tpl" );
	$smarty->assign('thePage',$thePage);
?>