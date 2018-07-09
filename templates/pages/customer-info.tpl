<img id="loading" style="position:absolute" src="images/loading.gif" />

<div id="pageHolder" style="display:none">

{{$header}}

<div align="center" style="width:500px; height:440px; position:fixed;" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable" id="innerData">

<h1 class="ui-dialog-titlebar ui-widget-header ui-corner-all title" style="font-size:16px; margin-bottom:10px">Customer Information</h1>

<form method="post" id="formCustomerInfo">

<input type="hidden" name="action" value="save" />

<table width="100%" cellpadding="2" cellspacing="10" style="font-size:14px">

<tr>

    <td width="25%">Name:</td>

    <td width="75%"><input type="text" name="name" value="" style="width:95%" /></td>

</tr>

<tr>

    <td valign="top">Address:</td>

    <td><textarea name="address" cols="5" style="width:95%"></textarea></td>

</tr>

<tr>

	<td><strong>Country:</strong></td>

	<td><select name="country" id="country" onchange="toggleState()">

    <option value="-">--Please Select</option>

    {{foreach from=$countries item=n}}

    	<option value="{{$n.Id}}">{{$n.Name}}</option>

    {{/foreach}}

    </select></td>

</tr>

<tr id="statesHolder" style="display:none">

	<td><strong>State:</strong></td>

	<td><select name="state">

    <option value="-">--Please Select</option>

        	{{foreach from=$india_states_list item=s}}

    		<option value="{{$s.Id}}">{{$s.state}}</option>

            {{/foreach}}

    </select></td>

</tr>

<tr>

    <td valign="top">City:</td>

    <td><input type="text" name="city" value="" style="width:95%" /></td>

</tr>

<tr>

    <td valign="top">Pincode:</td>

    <td><input type="text" name="pincode" value="" style="width:75px" /></td>

</tr>

<tr>

    <td valign="top">Mobile Phone Number:</td>

    <td><input type="text" name="phone" value="" style="width:95%" /></td>

</tr>

<tr>

    <td valign="top">Email:</td>

    <td><input type="text" name="email" value="" style="width:95%" /></td>

</tr>

<tr>

	<td align="center" colspan="2">

<a href="javascript: void(0)" onclick="$('#formCustomerInfo').submit()" class="large_red_btn w300"><span><strong>Continue</strong></span></a></td>

</tr>

</table>

</form>

</div>

</div>

<script>

function toggleState(){

	$('#statesHolder').hide();

	if( $('#country').val() == 56 ){

		$('#statesHolder').show();

	}

}

{{if $errors}}

alert("{{$errors}}");

{{/if}}

t = ($(window).height()-$('#loading').height())/2;

l = ($(window).width()-$('#loading').width())/2;

$('#loading').css('top',t);

$('#loading').css('left',l);

$(document).ready(function(){

	$('#loading').hide();

	$('#pageHolder').show();

	$('#pageHolder').height($(window).height());

	$('.fullWidth').width($(window).width());

	$('#innerData').css('top',($(window).height()-500)/2);

	$('#innerData').css('opacity',0);

	$('#innerData').css('left',($(window).width()-500)/2);

	$('#innerData').animate({

		top:($(window).height()-370)/2,

		opacity: 1

		},500);

});

</script>