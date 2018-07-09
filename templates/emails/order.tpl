<div style="width:700px; margin:auto; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#333; padding:0px 0px 10px 0px">

<div align="left">

<img src="{{$smarty.const.WEBSITE_URL}}images/pkp_logo_large.jpg" />

</div>



<h1>Dealer Information</h1>

<table width="100%" cellpadding="4" cellspacing="1" bgcolor="#CCC">

<tr>

    <td width="25%" bgcolor="#F4F4F4">Name:</td>

    <td width="75%" bgcolor="#FFFFFF">{{$smarty.session.logged.Name}}</td>

</tr>

<tr>

    <td valign="top" bgcolor="#F4F4F4">Company:</td>

    <td bgcolor="#FFFFFF">{{$smarty.session.logged.Company}}</td>

</tr>

<tr>

    <td valign="top" bgcolor="#F4F4F4">Telephone:</td>

    <td bgcolor="#FFFFFF">{{$smarty.session.logged.phone}}</td>

</tr>

<tr>

    <td valign="top" bgcolor="#F4F4F4">Country:</td>

    <td bgcolor="#FFFFFF">{{foreach from=$countries item=n}}

    	{{if $smarty.session.logged.Country==$n.Id}}{{$n.Name}}{{/if}}

    {{/foreach}}</td>

</tr>

{{if $smarty.session.logged.Country==56}}

<tr>

    <td valign="top" bgcolor="#F4F4F4">State:</td>

    <td bgcolor="#FFFFFF">{{foreach from=$india_states_list item=s}}

    {{if $smarty.session.logged.State==$s.Id}}{{$s.state}}{{/if}}

    {{/foreach}}</td>

</tr>

{{/if}}

<tr>

    <td valign="top" bgcolor="#F4F4F4">Postal code:</td>

    <td bgcolor="#FFFFFF">{{$smarty.session.logged.PostalCode}}</td>

</tr>

<tr>

    <td valign="top" bgcolor="#F4F4F4">Email:</td>

    <td bgcolor="#FFFFFF">{{$smarty.session.logged.Email}}</td>

</tr>

</table>



<h1>Customer Information</h1>

<table width="100%" cellpadding="4" cellspacing="1" bgcolor="#CCC">

<tr>

    <td width="25%" bgcolor="#F4F4F4">Name:</td>

    <td width="75%" bgcolor="#FFFFFF">{{$smarty.session.client.name}}</td>

</tr>

<tr>

    <td valign="top" bgcolor="#F4F4F4">Address:</td>

    <td bgcolor="#FFFFFF">{{$smarty.session.client.address}}</td>

</tr>

<tr>

    <td valign="top" bgcolor="#F4F4F4">Country:</td>

    <td bgcolor="#FFFFFF">{{foreach from=$countries item=n}}

    	{{if $smarty.session.client.country==$n.Id}}{{$n.Name}}{{/if}}

    {{/foreach}}</td>

</tr>

{{if $smarty.session.client.country==56}}

<tr>

    <td valign="top" bgcolor="#F4F4F4">State:</td>

    <td bgcolor="#FFFFFF">{{foreach from=$india_states_list item=s}}

    {{if $smarty.session.client.state==$s.Id}}{{$s.state}}{{/if}}

    {{/foreach}}</td>

</tr>

{{/if}}

<tr>

    <td valign="top" bgcolor="#F4F4F4">City:</td>

    <td bgcolor="#FFFFFF">{{$smarty.session.client.city}}</td>

</tr>

<tr>

    <td valign="top" bgcolor="#F4F4F4">Pincode:</td>

    <td bgcolor="#FFFFFF">{{$smarty.session.client.pincode}}</td>

</tr>

<tr>

    <td valign="top" bgcolor="#F4F4F4">Mobile Phone Number:</td>

    <td bgcolor="#FFFFFF">{{$smarty.session.client.phone}}</td>

</tr>

<tr>

    <td valign="top" bgcolor="#F4F4F4">Email:</td>

    <td bgcolor="#FFFFFF">{{$smarty.session.client.email}}</td>

</tr>

</table>



<h1>Details</h1>

<div style="padding:5px;">

{{$smarty.post.ExtraInfo}}

</div>

<h1>Shopping Cart</h1>

{{if $items|@count > 0}}

<table width="100%" cellpadding="4" cellspacing="1" bgcolor="#CCC">

<tr bgcolor="#CCC" style="font-weight:bold">

	<td align="center">Image</td>

    <td width="100%%">Name</td>

    <td align="center">Qty</td>

    <td align="center">Price</td>

    <td align="center">Total</td>

</tr>

{{foreach from=$items item=n}}

<tr bgcolor="{{cycle values='#F4F4F4,#FFFFFF'}}">

	<td valign="top" align="center"><img src="{{$smarty.const.WEBSITE_URL}}uploads/unit_u{{$n.Id}}_h{{$smarty.session.shoppingCart.sd.h}}_t{{$smarty.session.shoppingCart.sd.to}}_a0.png" height="50" /></td>

    <td valign="middle"><strong>{{$n.Name}}</strong><br />

                <em>{{$n.Code}}</em><br />

    {{foreach from=$n.Numbers item=nr name=numbers}}

    <span style="display:block;	float:left;	background:#666; margin:1px; color:#FFF; font-weight:bold;	padding:5px 10px 5px 10px; border-radius:50px;">{{$nr}}</span>

    {{/foreach}}</td>

    <td align="center">{{$n.Nr}}</td>

    <td align="right" nowrap="nowrap">INR {{$n.Price}}</td>

    <td align="right" nowrap="nowrap">INR {{$n.TotalPrice}}</td>

</tr>

{{/foreach}}

<tr>

    <td align="right" bgcolor="#FFD5D5" colspan="4"><strong>Installation charge will be 10% of total cost</strong></td>

    <td align="center" bgcolor="#FFD5D5" nowrap="nowrap"><strong>INR {{$total*0.1}}</strong></td>

</tr>

<tr>

    <td align="right" colspan="4"><strong>Total</strong></td>

    <td align="center" nowrap="nowrap"><strong>INR {{$total*1.1}}</strong></td>

</tr>

</table>

<h1>2D renderings</h1>

<div style="float:left; width:350px">

<strong>2D rendering of floor units</strong>

<a href="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.4_base}}" target="_blank"><img src="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.4_base}}" width="350" height="300" /></a>

</div>

<div style="float:left; width:350px">

<strong>2D rendering of floating units</strong>

<a href="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.4_floating}}" target="_blank"><img src="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.4_floating}}" width="350" height="300" /></a>

</div>

<br clear="all" />

<h1 style="margin-top:10px">3D Render Plans (click on image to view larger)</h1>

{{if isset($flashRenders.pics.0)}}

<div style="float:left; margin:5px; width:340px; height:350px; overflow:hidden">

    <h2>0&deg; angle</h2>

    <a href="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.0}}" target="_blank"><img src="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.0}}" width="340" height="300" /></a>

</div>

{{/if}}

{{if isset($flashRenders.pics.1)}}

<div style="float:left; margin:5px; width:340px; height:350px; overflow:hidden">

    <h2>90&deg; angle</h2>

    <a href="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.1}}" target="_blank"><img src="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.1}}" width="340" height="300" /></a>

</div>

{{/if}}

{{if isset($flashRenders.pics.2)}}

<div style="float:left; margin:5px; width:340px; height:350px; overflow:hidden">

    <h2>180&deg; angle</h2>

    <a href="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.2}}" target="_blank"><img src="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.2}}" width="340" height="300" /></a>

</div>

{{/if}}

{{if isset($flashRenders.pics.3)}}

<div style="float:left; margin:5px; width:340px; height:350px; overflow:hidden">

    <h2>270&deg; angle</h2>

    <a href="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.3}}" target="_blank"><img src="{{$smarty.const.WEBSITE_URL}}uploads/flash_renders/{{$flashRenders.pics.3}}" width="340" height="300" /></a>

</div>

{{/if}}

<br clear="all" />

{{else}}

No items in the shopping cart!

{{/if}}

{{include file="../html_pages/email_footer.tpl"}}
</br>
</br>
<Strong>This email is for: {{$smarty.session.logged.Name}} sent to: {{$smarty.session.logged.Email}}.</Strong>

</div>