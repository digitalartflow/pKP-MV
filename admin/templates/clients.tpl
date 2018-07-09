{{include file='main_pieces/header.tpl'}}
<div id="listItems" class="pagePieces">
	<h1>Clients</h1>
	<fieldset style="margin-bottom:5px">
		<legend><strong>Search:</strong></legend>
		<form method="get">
			<input type="hidden" name="page" value="{{$smarty.get.page}}" />
			<table width="100%" cellpadding="5" cellspacing="1">
				<tr>
					<td><strong>Expression:</strong></td>
					<td><input type="text" name="expression" value="{{$smarty.get.expression|default:''}}" /></td>
				</tr>
				<tr>
					<td align="center" colspan="4"><input type="submit" value="Search" /> <input type="button" value="Reset" onclick="window.location='?page={{$smarty.get.page}}'" /></td>
				</tr>
			</table>
		</form>
	</fieldset>
	<div class="paginare">
		Pages: {{section loop=$pagini name=pagini}} <a href="{{$linkwcp}}&pg={{$smarty.section.pagini.iteration}}"{{if $curpag==$smarty.section.pagini.iteration}} class="on"{{/if}}>{{$smarty.section.pagini.iteration}}</a>{{/section}}
	</div>
	<table width="100%" cellpadding="5" cellspacing="1">
		<tr bgcolor="#000000" style="color:#FFF">
			<th align="center">#</th>
			<th align="left" width="100%">Name</th>
			<th align="left">Account</th>
			<th align="left">Address</th>
			<th align="center">Contact</th>
			<th align="center">Actions</th>
		</tr>
		{{foreach $items as $n}}
		<tr bgcolor="{{cycle values='#EEE,#CCC'}}">
			<td>{{$n.Id}}</td>
			<td nowrap="nowrap"><strong>{{$n.name}}</strong></td>
			<td nowrap="nowrap">{{$n.account}} (#{{$n.user_id}})</td>
			<td nowrap="nowrap">{{$n.address}}<br />{{$n.city}}, {{$n.pincode}}<br />{{*foreach from=$countries item=c}}
				{{if $n.Country==$c.Id}}
				{{$c.Name}}
				{{if $n.Country==56}}
				{{foreach from=$states item=s}}{{if $n.State==$s.Id}}, {{$s.state}}{{/if}}{{/foreach}}
				{{/if}}
				{{/if}}
				{{/foreach*}}
			</td>
			<td nowrap="nowrap">{{$n.email}}<br />{{$n.phone}}</td>
			<td align="center" nowrap="nowrap"><input type="button" value="Edit" onclick="modifyItem({{$n.Id}})" /></td>
		</tr>
		{{/foreach}}
	</table>
	<div class="paginare">
		Pages: {{section loop=$pagini name=pagini}} <a href="{{$linkwcp}}&pg={{$smarty.section.pagini.iteration}}"{{if $curpag==$smarty.section.pagini.iteration}} class="on"{{/if}}>{{$smarty.section.pagini.iteration}}</a>{{/section}}
	</div>
</div>
{{foreach $items as $n}}
<div id="modifyItem{{$n.Id}}" class="pagePieces" style="display:none">
	{{*
	<pre>{{$n|@print_r}}</pre>
	*}}
	<h1>Edit <input type="button" value="Cancel" onclick="showItemListing()" /></h1>
	<fieldset style="margin-bottom:5px">
		<legend><strong>Form:</strong></legend>
		<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="action" value="modify" />
			<input type="hidden" name="Id" value="{{$n.Id}}" />
			<input type="hidden" name="user_id" value="{{$n.user_id}}" />
			<table width="100%" cellpadding="5" cellspacing="1">
				
<tr>

    <td width="25%">Name:</td>

    <td width="75%"><input type="text" name="name" value="{{$n.name}}" style="width:95%" /></td>

</tr>

<tr>

    <td valign="top">Address:</td>

    <td><textarea name="address" cols="5" style="width:95%">{{$n.address}}</textarea></td>

</tr>

<tr>

    <td valign="top">City:</td>

    <td><input type="text" name="city" value="{{$n.city}}" style="width:95%" /></td>

</tr>

<tr>

    <td valign="top">Pincode:</td>

    <td><input type="text" name="pincode" value="{{$n.pincode}}" style="width:75px" /></td>

</tr>

<tr>

    <td valign="top">Mobile Phone Number:</td>

    <td><input type="text" name="phone" value="{{$n.phone}}" style="width:95%" /></td>

</tr>

<tr>

    <td valign="top">Email:</td>

    <td><input type="text" name="email" value="{{$n.email}}" style="width:95%" /></td>

</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit" value="Save" /> <input type="button" value="Cancel" onclick="showItemListing()" /></td>
				</tr>
			</table>
		</form>
	</fieldset>
</div>
{{/foreach}}
<script>
	function showItemListing()
	{
		$('.pagePieces:visible').slideUp();
		$('#listItems').slideDown();
	}
	function modifyItem( iId )
	{
		$('#listItems').slideUp();
		$('#modifyItem'+iId).slideDown();
	}
</script>
{{include file='main_pieces/footer.tpl'}}