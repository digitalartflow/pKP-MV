{{$header}}

<style>

h1, h2{

	padding:0px;

	margin:5px

}

a{

	color:#F90

}

#shoppingCart{

	width:700px;

	position:absolute;

	top:50px;

	color:#333;

	padding:10px;

	background:#FFF

}

#shoppingCart .price{

	padding:10px 0px 10px 0px

}

#shoppingCart .price sup{

	font-size:12px;

	color:#FF9900

}

#shoppingCart .price strong{

	font-size:22px;

	color:#FFCC00

}

</style>

<img id="loading" style="position:absolute" src="images/loading.gif" />

<div id="pageHolder" style="display:none">

<div id="shoppingCart">

<h1>Thank you. The quote has been sent to your email: {{$smarty.session.logged.Email}}</h1>

<h2><a href="{{$smarty.const.WEBSITE_URL}}customer-info.html">Start a new design?</a></h2>

</div>

</div>


<script>

t = ($(window).height()-$('#loading').height())/2;

l = ($(window).width()-$('#loading').width())/2;

$('#loading').css('top',t);

$('#loading').css('left',l);

$(document).ready(function(){

	$( "input[type=button],input[type=submit]" ).button();

	$('#loading').hide();

	$('#pageHolder').show();

	$('#pageHolder').height($(window).height());

	$('.fullWidth').width($(window).width());

	$('#shoppingCart').css('left',($(window).width()-600)/2);

});

</script>