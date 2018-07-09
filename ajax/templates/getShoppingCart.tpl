{{if $items|@count > 0}}

<table width="100%" id="shoppingCartTable" cellpadding="4" cellspacing="2">

<tr bgcolor="#000000" style="font-weight:bold">

	<td valign="top" align="center">#</td>

    <td>Name</td>

    <td align="center">Items</td>

    <td align="center">Price/Item</td>

    <td align="center">Total price</td>

</tr>

{{foreach from=$items item=n}}

<tr bgcolor="{{cycle values='#333333,#666666'}}">

	<td valign="top" align="center"><img src="{{$smarty.const.WEBSITE_URL}}uploads/unit_u{{$n.Id}}_h{{$smarty.post.sd.h}}_t{{$n.IdTop}}_a0.png" height="50" /></td>

    <td valign="middle">{{$n.Name}}<br /><em>{{$n.Code}}</em></td>

    <td align="center">{{$n.Nr}}</td>

    <td align="center">INR {{$n.Price}}</td>

    <td align="center">INR {{$n.TotalPrice}}</td>

</tr>

{{/foreach}}

<tr bgcolor="#000000">

    <td align="right" colspan="4"><strong>Total</strong></td>

    <td align="center">INR {{$total}}</td>

</tr>

<tr bgcolor="#990000">

    <td align="center" colspan="5" style="color:#FFF"><strong>PLEASE SAVE ROOM DESIGN <br />BEFORE PLACING YOUR ORDER!</strong></td>

</tr>

<tr bgcolor="#006600">

    <td align="center" colspan="5" style="color:#FFF"><strong>Choose 3D views to render</strong><br />

    <input type="checkbox" id="view_0" title="0&deg render" />0&deg; <input type="checkbox" id="view_1" title="90&deg render" />90&deg; <input type="checkbox" id="view_2" title="180&deg render" />180&deg; <input type="checkbox" id="view_3" title="270&deg render" />270&deg;</td>

</tr>

<tr bgcolor="#000000">

    <td align="right" colspan="5"><div id="shoppingCardSubmitButtons">{{*<input type="button" value="ORDER HD RENDERS" style="font-weight:bold" onclick="doCheckoutRenders()" />*}} <input type="button" value="ORDER ITEMS" onclick="doCheckout()" /></div><div id="shoppingCardSubmitLoading" style="display:none">Loading! Please wait...</div>

    <div id="rendersLoading" style="overflow:hidden; width:350px; float:right">

    </div>

    </td>

</tr>

</table>

{{else}}

No items in the shopping cart!

{{/if}}

<script>

function doCheckoutRenders()

{

	//go to checkout

	window.location = "checkout-renders.html";

}

var renders = [[4,{'identify':true,'floating':0},'4_base','Generating 2D base units render'],[4,{'identify':true,'floating':1},'4_floating','Generating 2D floating units render']];

function retrieveRender(rid, first){

	tpl = '<div id="render'+rid+'" style="clear:both"><div style="float:left">'+renders[rid][3]+'</div><div style="float:right"><img class="loading" src="{{$smarty.const.WEBSITE_URL}}images/rendering_loader.gif" style="width:50px; margin-top:5px" /><img src="{{$smarty.const.WEBSITE_URL}}images/ok.png" style="display:none" class="ok" /></div></div>';

	$('#rendersLoading').append(tpl);

	$.post('ajax/saveFlashRenders.php',{'pic':flashMovie('room_planner').save3DRenderToImage(renders[rid][0],'png',renders[rid][1]),'a':renders[rid][2],'resetSession':first},function(data){

		first = 0;

		$('#render'+rid+' .ok').show();

		$('#render'+rid+' .loading').hide();

		rid++;

		if( rid == renders.length ){

			window.location = "checkout.html";

			//alert('rdy');

		} else retrieveRender(rid, first);

	});

	return false;

}

function doCheckout()

{

	$('#shoppingCardSubmitLoading').show();

	$('#shoppingCardSubmitButtons').hide();

	//save room design

	//console.log(flashMovie('room_planner').getUnitsCount(true));

	for( i = 0; i<= 3;i++){

		if( $('#view_'+i+':checked').length > 0 ) renders.push([i,{},i,'Generating 3D '+$('#view_'+i).attr('title')]);

	}

	$.post('ajax/updateShoppingCart.php',{'unitsCountData':flashMovie('room_planner').getUnitsCount(true)},function(data){

		retrieveRender(0,1);

	});

	/*$.post('ajax/updateShoppingCart.php',{'unitsCountData':flashMovie('room_planner').getUnitsCount(true)},function(data){

		$.post('ajax/saveFlashRenders.php',{'pic':flashMovie('room_planner').save3DRenderToImage(4,'png',{'identify':true,'floating':0}),'a':'4_base','resetSession':1},function(data){

			$.post('ajax/saveFlashRenders.php',{'pic':flashMovie('room_planner').save3DRenderToImage(4,'png',{'identify':true,'floating':1}),'a':'4_floating'},function(data){

				//go to checkout

				window.location = "checkout.html";

			},'json');

		},'json');

	});*/

	

	//save room design

	/*$.post('ajax/saveFlashRenders.php',{'pic':flashMovie('room_planner').save3DRenderToImage(0),'a':0,'resetSession':1},function(data){		

		$.post('ajax/saveFlashRenders.php',{'pic':flashMovie('room_planner').save3DRenderToImage(1),'a':1},function(data){

			$.post('ajax/saveFlashRenders.php',{'pic':flashMovie('room_planner').save3DRenderToImage(2),'a':2},function(data){

				$.post('ajax/saveFlashRenders.php',{'pic':flashMovie('room_planner').save3DRenderToImage(3),'a':3},function(data){

					$.post('ajax/saveFlashRenders.php',{'pic':flashMovie('room_planner').save3DRenderToImage(4),'a':4},function(data){

						//go to checkout

						window.location = "checkout.html";

					},'json');

				},'json');

			},'json');

		},'json');

	},'json');*/

}

$(function() {

	$( "input[type='button']" ).button();

});

</script>