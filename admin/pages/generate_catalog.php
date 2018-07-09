<?php
	
	//echo "<pre>";
	
	$list = new DbList('select * from units order by `Name` ASC');
	$units = $list;
	$found = 0;
	foreach( $units as $unit ){
	echo $unit['Id'];
		//$item_categories = Util::search($unit['Categories'],'{','}');
		
		$variations = new DbList('select * from unit_variations where IdUnit="'.$unit['Id'].'"');
		$handles = new DbList('select * from units_handles where IdUnit="'.$unit['Id'].'"');
		$tops = new DbList('select * from units_tops where IdUnit="'.$unit['Id'].'"');
		
		foreach( $variations as $variantion ){
			foreach( $handles as $handle ){
				foreach( $tops as $top) {
					$found++;
					echo '<img src="http://digitalartflow.com/production/beth/uploads/unit_u'.$variantion['Id'].'_h'.$handle['IdHandle'].'_t'.$top['Id'].'_a0.png'.'" /><br />';
				}
			}
		}
		echo "<hr>";
	}
	echo $found;
	
	
	
	//echo "</pre>";
	die();
	
?>