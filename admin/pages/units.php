<?php
	$core['template'] = "units.tpl";

	if( !empty( $_POST['action'] ) && $_POST['action'] == 'delete' )

	{

		$item = new DbUnit($_POST['Id']);

		$item->Delete();

		Util::Redirect($config['admin_url'].'?page='.$_GET['page']);

	}
	
	if( isset( $_GET['export'] ) ){
		$units = new DbList('select * from units order by `Name` ASC');
		$now = gmdate("D, d M Y H:i:s");
		$filename = "units_export_" . date("Y-m-d") . ".csv";
		header("Expires: Tue, 03 Jul 2001 06:00:00 GMT");
		header("Cache-Control: max-age=0, no-cache, must-revalidate, proxy-revalidate");
		header("Last-Modified: {$now} GMT");
	
		// force download  
		header("Content-Type: application/force-download");
		header("Content-Type: application/octet-stream");
		header("Content-Type: application/download");
	
		// disposition / encoding on response body
		header("Content-Disposition: attachment;filename={$filename}");
		header("Content-Transfer-Encoding: binary");
		echo '"Unit id","Variation id","Unit name","Variation Product code","Dealer price","Retail price percentage","Variation price deff"'."\r\n";
		foreach( $units as $unit ){
			echo '"'.$unit['Id'].'","0","'.$unit['Name'].'","-","'.$unit['Price'].'","'.$unit['RetailPricePercentage'].'","0"'."\r\n";	
			$variations = new DbList('select * from unit_variations where IdUnit="'.$unit['Id'].'" order by Code ASC');
			foreach( $variations as $variation ){
				echo '"'.$unit['Id'].'","'.$variation['Id'].'","'.$unit['Name'].'","'.$variation['Code'].'","'.$unit['Price'].'","'.$unit['RetailPricePercentage'].'","'.$variation['PriceDiff'].'"'."\r\n";			
			}
		}
		die();
	}
	
	if( isset( $_GET['import'] ) ){
		$units = new DbList('select * from units order by `Name` ASC');
		$db_items = array();	
		foreach( $units as $unit ){
			$variations = new DbList('select * from unit_variations where IdUnit="'.$unit['Id'].'" order by Code ASC');
			$db_items[] = array($unit['Id'],0,$unit['Name'],'-',$unit['Price'],$unit['RetailPricePercentage'],0);			
			foreach( $variations as $variation ){
				$db_items[] = array($unit['Id'],$variation['Id'],$unit['Name'],$variation['Code'],$unit['Price'],$unit['RetailPricePercentage'],$variation['PriceDiff']);			
			}
		}
		//echo "<pre>";		
		if( !empty( $_POST['action'] ) && $_POST['action'] == 'import' ){
			move_uploaded_file( $_FILES['file']['tmp_name'], $config['server_path'].'admin/tmp/units_import.csv');
		}
		$h = fopen($config['server_path'].'admin/tmp/units_import.csv','r');
		$import_data = array();
		while (($data = fgetcsv($h)) !== FALSE) {
			$import_data[] = $data;
		}
		$found = 0;
		$updates = 0;
		foreach( $import_data as &$data ){
			$data['correct'] = true;
			$data['found'] = false;
			$data['update_found'] = false;
			if( !is_numeric($data[0]) || !is_numeric($data[1]) || !is_numeric($data[4]) || !is_numeric($data[5]) || !is_numeric($data[6]) ){
				$data['correct'] = false;
			}
			if( $data['correct'] ){
				foreach( $db_items as $db_item ){
					if( $data[0] == $db_item[0] && $data[1] == $db_item[1] ){
						$data['found'] = true;
						if( 
							($db_item[1] == 0 && ( $data[4] != $db_item[4] || $data[5] != $db_item[5])) ||
							($db_item[1] != 0 && ( $data[3] != $db_item[3] || $data[6] != $db_item[6]))
							 ){
							$data['update_found'] = true;
							$data['old_data'] = $db_item;
						}
						break;
					}
				}
			}
			$found += (int) $data['found'];
			$updates += (int) $data['update_found'];
		}
		function sortItems( $a, $b ){
			if( $a['update_found'] == $b['update_found'] ) return 0;
			return ($a['update_found'] < $b['update_found']) ? 1 : -1;
		}
		uasort($import_data,'sortItems');
		//print_r($found);
		//print_r($updates);
		//print_r($import_data);
		$smarty->assign('found',$found);
		$smarty->assign('updates',$updates);
		$smarty->assign('items',$import_data);
		
		if( !empty( $_POST['action'] ) && $_POST['action'] == 'update' ){
			foreach( $_POST as $k => $v ){
				if( substr($k,0,5) == 'item_'  ){
					$pdata = explode('_',$k);
					foreach( $import_data as $data ){
						if( $data[0] == $pdata[1] && $data[1] == $pdata[2] ){
							if( $pdata[2] != 0 ){
								$item = new DbUnitVariation($pdata[2]);
								$item['Code'] = $data[3];
								$item['PriceDiff'] = $data[6];
								$item->Update();
							}else{
								$item = new DbUnit($pdata[1]);
								$item['Price'] = $data[4];
								$item['RetailPricePercentage'] = $data[5];
								$item->Update();
							}
						}
					}
				}				
			}
			Util::Redirect($config['admin_url'].'?page=units&import');
		}
		
		$core['template'] = "units_import.tpl";
	}else{

	
	
		
	
		$where = 'where 1=1';
	
		if( !empty( $_GET['expression'] ) ) $where .= ' and Name like "%'.str_replace(' ','%',$_GET['expression']).'%" ';
	
		
	
		
	
		$list = new DbList('select count(distinct id) from units '.$where);
	
		$nr = $list[0][0];
	
		
	
		$curpag = !empty( $_GET['pg'] ) ? $_GET['pg'] : 1;
	
		$per_page = 20;
	
		$fl = ($curpag-1)*$per_page;
	
		$smarty->assign('pagini',ceil($nr/$per_page));
	
		$smarty->assign('curpag',$curpag);
	
		
	
		$list = new DbList('select * from units '.$where.' order by `Name` ASC limit '.$fl.','.$per_page);
	
		$items = $list;
	
		$smarty->assign('items',$items);
	
		$smarty->assign('linkwcp',Util::GetCurrentUrlWithoutKeys(array('pg')));

	}


?>