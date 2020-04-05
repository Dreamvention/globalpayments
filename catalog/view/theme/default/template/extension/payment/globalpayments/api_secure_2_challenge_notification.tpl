<script type="text/javascript" src="catalog/view/javascript/globalpayments/globalpayments-3ds.js"></script>
<script type="text/javascript">
	GlobalPayments.ThreeDSecure.handleChallengeNotification({'threeDSServerTransID' : '<?php echo $threeDSServerTransID; ?>', 'transStatus' : '<?php echo $transStatus; ?>'});
</script>