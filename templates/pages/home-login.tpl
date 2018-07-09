<img id="loading" style="position:absolute" src="images/loading.gif" />

<div id="pageHolder" style="display:none">

<div align="center" style="width:500px; height:250px; position:fixed;" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable" id="innerData">

<h1 class="ui-dialog-titlebar ui-widget-header ui-corner-all title" style="background:#FFF; color:#333">

<img src="images/logo.png" /></h1>

<a href="javascript: void(0)" onclick="showAccount('login')" class="large_red_btn w300"><span><strong>Login</strong></span></a>

<br /><br /><a href="javascript: void(0)" onclick="showAccount('create_account')" class="large_red_btn w300"><span><strong>Create account</strong></span></a>

</div>

</div>

<div id="accountDataDiv" title=""></div>

<script>

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

		top:($(window).height()-250)/2,

		opacity: 1

		},500);

});

</script>



<script>

var has_spc = true;

$('#spc_dialog').dialog({

	autoOpen: false,

	height: 250,

	minHeight:250,

	minWidth:400,

	width: 400,

	modal: true,

	draggable: false,

	resizable: false,

	buttons: {

		"Save": function() {

		  $.post('ajax/doAction.php',{a:'save_spc','State':$('#spc_State').val(),'PostalCode':$('#spc_postal_code').val()},function(data){

			  if( data.error == false ){

				  has_spc = true;

				  window.location=window.location;

			  }else{

				  alert(data.error);

			  }

		  },'json');

		}

	},

	beforeclose : function() { return has_spc; },

	closeOnEscape: false,

});

var cpg = '{{$smarty.get.page|default:""}}';

$('#helpDiv>a').fancybox();

$('#header').width($(window).width());

$( "#accountDataDiv" ).dialog({

	autoOpen: false,

	modal:true,

	height: 400,

	width: 800

});

function showAccount( pg )

{

	$('#accountDataDiv').html('loading...');

	$('#accountDataDiv').dialog('open');

	$.get('ajax/account/'+pg+'.php',function(data){

		$('#accountDataDiv').html(data);

	});

}

function refreshLogIn()

{

	window.location = window.location;

}

function logout()

{

	$.post('ajax/account/doLogOut.php',function(data){

		if( cpg == 'checkout' ){

			window.location = window.location;

		}else{

			refreshLogIn();

		}

	});

}

</script>