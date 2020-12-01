<?php echo $header; ?>
<style type="text/css">

#payment_globalpayments .lds-spinner {
	display: inline-block;
	position: absolute;
	width: 64px;
	height: 64px;
	left: 50%;
	top: 50%;
	margin-left: -32px;
	margin-top: -32px;
}

#payment_globalpayments .lds-spinner div {
	transform-origin: 32px 32px;
	animation: lds-spinner 1.2s linear infinite;
}

#payment_globalpayments .lds-spinner div:after {
	content: " ";
	display: block;
	position: absolute;
	top: 3px;
	left: 29px;
	width: 5px;
	height: 14px;
	border-radius: 20%;
	background: #000;
}

#payment_globalpayments .lds-spinner div:nth-child(1) {
	transform: rotate(0deg);
	animation-delay: -1.1s;
}

#payment_globalpayments .lds-spinner div:nth-child(2) {
	transform: rotate(30deg);
	animation-delay: -1s;
}

#payment_globalpayments .lds-spinner div:nth-child(3) {
	transform: rotate(60deg);
	animation-delay: -0.9s;
}

#payment_globalpayments .lds-spinner div:nth-child(4) {
	transform: rotate(90deg);
	animation-delay: -0.8s;
}

#payment_globalpayments .lds-spinner div:nth-child(5) {
	transform: rotate(120deg);
	animation-delay: -0.7s;
}

#payment_globalpayments .lds-spinner div:nth-child(6) {
	transform: rotate(150deg);
	animation-delay: -0.6s;
}

#payment_globalpayments .lds-spinner div:nth-child(7) {
	transform: rotate(180deg);
	animation-delay: -0.5s;
}

#payment_globalpayments .lds-spinner div:nth-child(8) {
	transform: rotate(210deg);
	animation-delay: -0.4s;
}

#payment_globalpayments .lds-spinner div:nth-child(9) {
	transform: rotate(240deg);
	animation-delay: -0.3s;
}

#payment_globalpayments .lds-spinner div:nth-child(10) {
	transform: rotate(270deg);
	animation-delay: -0.2s;
}

#payment_globalpayments .lds-spinner div:nth-child(11) {
	transform: rotate(300deg);
	animation-delay: -0.1s;
}

#payment_globalpayments .lds-spinner div:nth-child(12) {
	transform: rotate(330deg);
	animation-delay: 0s;
}

#payment_globalpayments .hidden {
	display: none;
}

@keyframes lds-spinner {
	0% {
		opacity: 1;
	}
	100% {
		opacity: 0;
	}
}

</style>
<?php echo $header; ?>
<div id="payment_globalpayments" class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row"><?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<h1><?php echo $text_title; ?></h1>
			<?php echo $text_message; ?>
			<div class="lds-spinner"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
			<?php echo $content_bottom; ?>
		</div>
		<?php echo $column_right; ?>
	</div>
</div>
<script>

setTimeout(function() {
	location = '<?php echo $apm_check_order_status_url; ?>'
}, 10000);
		
</script>
<?php echo $footer; ?>