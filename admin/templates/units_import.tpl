{{include file='main_pieces/header.tpl'}}



<div id="listItems" class="pagePieces">
<div> <a href="?page=units">&laquo; back to units listing</a></div>

<h1>Update units</h1>
<div style="margin:5px 0px 5px 0px; padding:2px; border:1px solid #333">
Units found in upload: <strong>{{$found}}</strong> | Updates found in upload: <strong>{{$updates}}</strong>
</div>
{{if $updates>0}}
<form method="post">
<input type="hidden" name="action" value="update" />
<div align="right">
	<input type="submit" value="Update selected items" />
</div>
<table width="100%" cellpadding="5" cellspacing="1">
<tr bgcolor="#000000" style="color:#FFF">
	<th align="center"><input type="checkbox" checked="checked" onclick="$('.items_checkbox').attr('checked',$(this).prop('checked'))" /></th>
	<th align="left" nowrap="nowrap">Unit id</th>
	<th align="left" nowrap="nowrap">Variation id</th>
	<th align="left" width="50%">Unit name</th>
	<th align="left" width="50%">Variation Product code</th>
	<th align="left" nowrap="nowrap">Dealer price</th>
	<th align="left" nowrap="nowrap">Retail price percentage</th>
	<th align="left" nowrap="nowrap">Variation price deff</th>
</tr>
{{foreach $items as $n}}
{{if $n.update_found}}
<tr bgcolor="{{cycle values='#EEE,#CCC'}}">
	<td align="center"><input type="checkbox" checked="checked" class="items_checkbox" name="item_{{$n.0}}_{{$n.1}}" value="1" /></td>
	<td><strong>{{$n.0}}</strong></td>
	<td><strong>{{$n.1}}</strong></td>
	<td><strong>{{$n.2}}</strong></td>
	<td {{if $n.1 != 0 }} style="background:#BFB"{{/if}} ><strong>{{$n.3}}</strong>{{if $n.3!=$n.old_data.3}}<br /><small>{{$n.old_data.3}} <em>(old data)</em></small>{{/if}}</td>
	<td {{if $n.1 == 0 }} style="background:#BFB"{{/if}} nowrap="nowrap"><strong>{{$n.4}}</strong>{{if $n.4!=$n.old_data.4}}<br /><small>{{$n.old_data.4}} <em>(old data)</em></small>{{/if}}</td>
	<td {{if $n.1 == 0 }} style="background:#BFB"{{/if}} nowrap="nowrap"><strong>{{$n.5}}</strong>{{if $n.5!=$n.old_data.5}}<br /><small>{{$n.old_data.5}} <em>(old data)</em></small>{{/if}}</td>
	<td {{if $n.1 != 0 }} style="background:#BFB"{{/if}} nowrap="nowrap"><strong>{{$n.6}}</strong>{{if $n.6!=$n.old_data.6}}<br /><small>{{$n.old_data.6}} <em>(old data)</em></small>{{/if}}</td>
</tr>
{{/if}}
{{/foreach}}
</table>
<div align="right">
	<input type="submit" value="Update selected items" />
</div>
</form>
{{else}}
No update found!
{{/if}}


</div>

{{include file='main_pieces/footer.tpl'}}