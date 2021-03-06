<div id="pageHolder">
{{$header}}
<style>
.unit{
	background:#FFFFFF; float:left; overflow:hidden; margin:5px 5px 0px 0px;
	width:180px; color:#333333; text-align:left; padding:5px;
	height:200px;
	position:relative
}
.right{
	float:left; width:200px; min-height:200px;
	background:#333333;
	padding:5px;
	margin-top:10px
}
.right_piece label{
	display:block;
}
.right_piece select{
	width:100%
}
.right_piece input[type=text]{
	width:97%
}
.tools{	
	background:#333333;
	padding:5px;
	margin:5px 0px 0px 0px;
	width:765px
}
</style>
<div style="width:1000px; margin:50px auto; overflow:hidden">
<h1>Full Catalog Listing</h1>
<div class="right">
	<form id="form_search" method="get" action="products-list.html">
    <input type="hidden" name="search" value="1" />
    <input type="hidden" name="ord" value="name-asc" />
    <div class="right_piece">
        <label>Category:</label>
        <select onchange="changeUnitsCat()" style="border:0px;" name="cat" id="unitCategs"> 
            <option value="0">Select category</option>   
            {{foreach from=$cats item=n}}    
            <option value="{{$n.Id}}"{{if $smarty.get.cat==$n.Id}} selected="selected"{{/if}}>{{$n.Name}}</option>    
            {{/foreach}}    
        </select>
    </div>
    <div class="right_piece">
        <label>Subcategory</label>
        <select name="scat" id="unitSCategs" style="border:0px;">
            <option value="0">Select category first!</option>
        </select>
    </div>
    <div class="right_piece">
        <label>Search</label>
        <input type="text" name="s" value="{{$smarty.get.s|default:''}}" />
    </div>
    <div align="center"><input type="submit" value="Search" /></div>
    </form>
<script>
var unitCats = [{{foreach from=$scats item=n name=uc}}[{{$n.IdParent}},{{$n.Id}},'{{$n.Name}}']{{if !$smarty.foreach.uc.last}},{{/if}}{{/foreach}}];
function changeUnitsCat() {
	$('#unitSCategs').html('');
	output = '';
	for (i = 0; i < unitCats.length; i++) {
		if (unitCats[i][0] == $('#unitCategs').val()) output += '<option value="' + unitCats[i][1] + '">' + unitCats[i][2] + '</option>';
	}
	if( output == '' ) output = '<option value="0">Select category first!</option>';
	else output = '<option value="0">Select subcategory</option>'+output;
	$('#unitSCategs').html(output);
}
$(document).ready(function(e) {
    changeUnitsCat()
});
</script>
</div>
<div style="float:left; width:780px; padding:5px">
<div class="tools">Order by: <select onchange="$('#form_search input[name=\'ord\']').val($(this).val());$('#form_search').submit(); ">
<option value="name-asc"{{if $smarty.get.ord=="name-asc"}} selected="selected"{{/if}}>Name Alphabetical</option>
<option value="price-asc"{{if $smarty.get.ord=="price-asc"}} selected="selected"{{/if}}>Price lower to higher</option>
<option value="price-desc"{{if $smarty.get.ord=="price-desc"}} selected="selected"{{/if}}>Price higher to lower</option>
</select></div>
{{if isset($items)}}
{{foreach from=$items item=n}}
	<div class="unit">
    <table width="100%">
    <tr>
    	<td valign="top"><div style="background:url({{$n.pic}}) no-repeat center; width:75px; height:75px; background-size:contain"></div></td>
    	<td width="100%" valign="top" style="height:105px"><strong style="font-size:14px">{{$n.UnitName}}</strong><br />
       <em>{{$n.Code}}</em>
        {{if $n.HasAppliance=="yes"}}
        <div style="background:#E2E2E2; padding:5px 5px 5px 0px"><strong>Appliance:</strong> {{$n.ApplianceName}}</div>
        {{/if}}<br />
    	{{if $n.UnitAttaching=="2"}}corner unit<br />{{/if}}
        {{*<a href="javascript: void(0)" onclick="showUnitInfo({{$n.Id}})" style="color:#990000">View description</a>*}}
    	</td>
    </tr>
    </table>
    <strong style="font-size:24px; display:block; color:#006600; position:absolute; bottom:5px; right:5px">INR {{$n.FinalPrice}}</strong>
    </div>
{{/foreach}}
{{else}}
<div style="padding:10px">Please select at least one option from the filter on left!</div>
{{/if}}
</div>
</div>
</div>
<div id="unitInfoDiv" title="Item Information"></div>
<script>
$("#unitInfoDiv").dialog({
	autoOpen: false,
	modal: true,
	height: 400,
	width: 500
});
function showUnitInfo(uid) {
	$.post('ajax/getUnitInfo.php', {
		u: uid
	}, function (data) {
		$('#unitInfoDiv').html(data);
		$('#unitInfoDiv').dialog('open');
	});
}
</script>