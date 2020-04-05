<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form_payment" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form_payment" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="nav-tab active"><a href="#tab_general" data-toggle="tab"><?php echo $text_general; ?></a></li>
						<li class="nav-tab"><a href="#tab_order_status" data-toggle="tab"><?php echo $text_order_status; ?></a></li>
						<li class="nav-tab"><a href="#tab_checkout_api" data-toggle="tab"><?php echo $text_checkout_api; ?></a></li>
					</ul>
		  
					<div class="tab-content">
						<div class="tab-pane active" id="tab_general">
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input_merchant_id"><?php echo $entry_merchant_id; ?></label>
								<div class="col-sm-10">
									<input type="text" name="globalpayments_merchant_id" value="<?php echo $merchant_id; ?>" placeholder="<?php echo $entry_merchant_id; ?>" id="input_merchant_id" class="form-control" />
									<?php if ($error_merchant_id) { ?>
									<div class="text-danger"><?php echo $error_merchant_id; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input_account_id"><?php echo $entry_account_id; ?></label>
								<div class="col-sm-10">
									<input type="text" name="globalpayments_account_id" value="<?php echo $account_id; ?>" placeholder="<?php echo $entry_account_id; ?>" id="input_account_id" class="form-control" />
									<?php if ($error_account_id) { ?>
									<div class="text-danger"><?php echo $error_account_id; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input_secret"><?php echo $entry_secret; ?></label>
								<div class="col-sm-10">
									<input type="password" name="globalpayments_secret" value="<?php echo $secret; ?>" placeholder="<?php echo $entry_secret; ?>" id="input_secret" class="form-control" />
									<?php if ($error_secret) { ?>
									<div class="text-danger"><?php echo $error_secret; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_checkout"><?php echo $entry_checkout; ?></label>
								<div class="col-sm-10">
									<select name="globalpayments_checkout" id="input_checkout" class="form-control">
										<option value="hpp" <?php if ($checkout == 'hpp') { ?>selected="selected"<?php } ?>><?php echo $text_checkout_hpp; ?></option>
										<option value="api" <?php if ($checkout == 'api') { ?>selected="selected"<?php } ?>><?php echo $text_checkout_api; ?></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_environment"><?php echo $entry_environment; ?></label>
								<div class="col-sm-10">
									<select name="globalpayments_environment" id="input_environment" class="form-control">
										<?php if ($environment == 'production') { ?>
										<option value="production" selected="selected"><?php echo $text_production; ?></option>
										<option value="sandbox"><?php echo $text_sandbox; ?></option>
										<?php } else { ?>
										<option value="production"><?php echo $text_production; ?></option>
										<option value="sandbox" selected="selected"><?php echo $text_sandbox; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_debug"><?php echo $entry_debug; ?></label>
								<div class="col-sm-10">
									<select name="globalpayments_debug" id="input_debug" class="form-control">
										<?php if ($debug) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_settlement_method"><?php echo $entry_settlement_method; ?></label>
								<div class="col-sm-10">
									<select name="globalpayments_settlement_method" id="input_settlement_method" class="form-control">
										<?php if ($settlement_method == 'auto') { ?>
										<option value="delay"><?php echo $text_delay; ?></option>
										<option value="auto" selected="selected"><?php echo $text_auto; ?></option>
										<option value="multi"><?php echo $text_multi; ?></option>
										<?php } elseif ($settlement_method == 'multi') { ?>
										<option value="delay"><?php echo $text_delay; ?></option>
										<option value="auto"><?php echo $text_auto; ?></option>
										<option value="multi" selected="selected"><?php echo $text_multi; ?></option>
										<?php } else { ?>
										<option value="delay" selected="selected"><?php echo $text_delay; ?></option>
										<option value="auto"><?php echo $text_auto; ?></option>
										<option value="multi"><?php echo $text_multi; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_total"><span data-toggle="tooltip" title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="globalpayments_total" value="<?php echo $total; ?>" placeholder="<?php echo $entry_total; ?>" id="input_total" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_geo_zone"><?php echo $entry_geo_zone; ?></label>
								<div class="col-sm-10">
									<select name="globalpayments_geo_zone_id" id="input_geo_zone" class="form-control">
										<option value="0"><?php echo $text_all_zones; ?></option>
										<?php foreach ($geo_zones as $geo_zone) { ?>
										<?php if ($geo_zone['geo_zone_id'] == $geo_zone_id) { ?>
										<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_status"><?php echo $entry_status; ?></label>
								<div class="col-sm-10">
									<select name="globalpayments_status" id="input_status" class="form-control">
										<?php if ($status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_sort_order"><?php echo $entry_sort_order; ?></label>
								<div class="col-sm-10">
									<input type="text" name="globalpayments_sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input_sort_order" class="form-control" />
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab_order_status">
							<?php foreach ($setting['order_status'] as $globalpayments_order_status) { ?>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_order_status_<?php echo $globalpayments_order_status['code']; ?>"><?php echo ${$globalpayments_order_status['name']}; ?></label>
								<div class="col-sm-10">
									<select name="globalpayments_setting[order_status][<?php echo $globalpayments_order_status['code']; ?>][id]" id="input_<?php echo $globalpayments_order_status['code']; ?>_status" class="form-control">
										<?php foreach ($order_statuses as $order_status) { ?>
										<?php if ($order_status['order_status_id'] == $globalpayments_order_status['id']) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<?php } ?>
						</div>
						<div class="tab-pane" id="tab_checkout_api">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_checkout_api_form_align"><?php echo $entry_form_align; ?></label>
								<div class="col-sm-10">
									<select name="globalpayments_setting[checkout][api][form_align]" id="input_checkout_api_form_align" class="form-control">
										<?php foreach ($setting['form_align'] as $form_align) { ?>
										<?php if ($form_align['code'] == $setting['checkout']['api']['form_align']) { ?>
										<option value="<?php echo $form_align['code']; ?>" selected="selected"><?php echo ${$form_align['name']}; ?></option>
										<?php } else { ?>
										<option value="<?php echo $form_align['code']; ?>"><?php echo ${$form_align['name']}; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_checkout_api_form_size"><?php echo $entry_form_size; ?></label>
								<div class="col-sm-10">
									<select name="globalpayments_setting[checkout][api][form_size]" id="input_checkout_api_form_size" class="form-control">
										<?php foreach ($setting['form_size'] as $form_size) { ?>
										<?php if ($form_size['code'] == $setting['checkout']['api']['form_size']) { ?>
										<option value="<?php echo $form_size['code']; ?>" selected="selected"><?php echo ${$form_size['name']}; ?></option>
										<?php } else { ?>
										<option value="<?php echo $form_size['code']; ?>"><?php echo ${$form_size['name']}; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_checkout_api_secure_status"><span data-toggle="tooltip" title="<?php echo $help_secure_status; ?>"><?php echo $entry_secure_status; ?></span></label>
								<div class="col-sm-10">
									<select name="globalpayments_setting[checkout][api][secure_status]" id="input_checkout_api_secure_status" class="form-control">
										<?php if ($setting['checkout']['api']['secure_status']) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_checkout_api_secure_2_scenario"><span data-toggle="tooltip" title="<?php echo $help_secure_2_scenario; ?>"><?php echo $entry_secure_2_scenario; ?></span></label>
								<div class="col-sm-10">
									<?php foreach ($setting['secure_2_scenario'] as $secure_scenario) { ?>
									<div class="row">
										<div class="col-sm-8">
											<label class="control-label" for="input_checkout_api_secure_2_scenario"><?php echo ${$secure_scenario['name']}; ?></label>
										</div>
										<div class="col-sm-4">										
											<select name="globalpayments_setting[checkout][api][secure_2_scenario][<?php echo $secure_scenario['code']; ?>]" class="form-control">
												<option value="1" <?php if ($setting['checkout']['api']['secure_2_scenario'][$secure_scenario['code']]) { ?>selected="selected"<?php } ?>><?php echo $text_accept; ?><?php if ($secure_scenario['recommended']) { ?> <?php echo $text_recommended; ?><?php } ?></option>
												<option value="0" <?php if (!$setting['checkout']['api']['secure_2_scenario'][$secure_scenario['code']]) { ?>selected="selected"<?php } ?>><?php echo $text_decline; ?><?php if (!$secure_scenario['recommended']) { ?> <?php echo $text_recommended; ?><?php } ?></option>
											</select>
										</div>
									</div>
									<br />
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input_checkout_api_secure_1_scenario"><span data-toggle="tooltip" title="<?php echo $help_secure_1_scenario; ?>"><?php echo $entry_secure_1_scenario; ?></span></label>
								<div class="col-sm-10">
									<?php foreach ($setting['secure_1_scenario'] as $secure_scenario) { ?>
									<div class="row">
										<div class="col-sm-8">
											<label class="control-label" for="input_checkout_api_secure_1_scenario"><?php echo ${$secure_scenario['name']}; ?></label>
										</div>
										<div class="col-sm-4">										
											<select name="globalpayments_setting[checkout][api][secure_1_scenario][<?php echo $secure_scenario['code']; ?>]" class="form-control">
												<option value="1" <?php if ($setting['checkout']['api']['secure_1_scenario'][$secure_scenario['code']]) { ?>selected="selected"<?php } ?>><?php echo $text_accept; ?><?php if ($secure_scenario['recommended']) { ?> <?php echo $text_recommended; ?><?php } ?></option>
												<option value="0" <?php if (!$setting['checkout']['api']['secure_1_scenario'][$secure_scenario['code']]) { ?>selected="selected"<?php } ?>><?php echo $text_decline; ?><?php if (!$secure_scenario['recommended']) { ?> <?php echo $text_recommended; ?><?php } ?></option>
											</select>
										</div>
									</div>
									<br />
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>