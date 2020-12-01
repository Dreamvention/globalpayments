<?php
class ControllerPaymentGlobalPayments extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('payment/globalpayments');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('globalpayments', $this->request->post);
														
			$this->session->data['success'] = $this->language->get('success_save');

			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->load->model('payment/globalpayments');
		
		$this->model_payment_globalpayments->refreshOrders();
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['error_merchant_id'])) {
			$data['error_merchant_id'] = $this->error['error_merchant_id'];
		} else {
			$data['error_merchant_id'] = '';
		}
		
		if (isset($this->error['error_account_id'])) {
			$data['error_account_id'] = $this->error['error_account_id'];
		} else {
			$data['error_account_id'] = '';
		}

		if (isset($this->error['error_secret'])) {
			$data['error_secret'] = $this->error['error_secret'];
		} else {
			$data['error_secret'] = '';
		}
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_general'] = $this->language->get('text_general');
		$data['text_order_status'] = $this->language->get('text_order_status');
		$data['text_checkout_hpp'] = $this->language->get('text_checkout_hpp');
		$data['text_checkout_api'] = $this->language->get('text_checkout_api');
		$data['text_support'] = $this->language->get('text_support');
		$data['text_production'] = $this->language->get('text_production');
		$data['text_sandbox'] = $this->language->get('text_sandbox');
		$data['text_delay'] = $this->language->get('text_delay');
		$data['text_auto'] = $this->language->get('text_auto');
		$data['text_multi'] = $this->language->get('text_multi');
		$data['text_success_settled_status'] = $this->language->get('text_success_settled_status');
		$data['text_success_unsettled_status'] = $this->language->get('text_success_unsettled_status');
		$data['text_decline_status'] = $this->language->get('text_decline_status');
		$data['text_failed_status'] = $this->language->get('text_failed_status');
		$data['text_embedded'] = $this->language->get('text_embedded');
		$data['text_lightbox'] = $this->language->get('text_lightbox');
		$data['text_align_left'] = $this->language->get('text_align_left');
		$data['text_align_center'] = $this->language->get('text_align_center');
		$data['text_align_right'] = $this->language->get('text_align_right');
		$data['text_small'] = $this->language->get('text_small');
		$data['text_medium'] = $this->language->get('text_medium');
		$data['text_large'] = $this->language->get('text_large');
		$data['text_responsive'] = $this->language->get('text_responsive');
		$data['text_accept'] = $this->language->get('text_accept');
		$data['text_decline'] = $this->language->get('text_decline');
		$data['text_recommended'] = $this->language->get('text_recommended');
		$data['text_3ds2_authentication_could_not_be_performed'] = $this->language->get('text_3ds2_authentication_could_not_be_performed');
		$data['text_3ds2_authentication_failed'] = $this->language->get('text_3ds2_authentication_failed');
		$data['text_3ds2_authentication_issuer_rejected'] = $this->language->get('text_3ds2_authentication_issuer_rejected');
		$data['text_3ds2_authentication_attempted_but_not_successful'] = $this->language->get('text_3ds2_authentication_attempted_but_not_successful');
		$data['text_3ds1_cardholder_not_enrolled'] = $this->language->get('text_3ds1_cardholder_not_enrolled');
		$data['text_3ds1_unable_to_verify_enrolment'] = $this->language->get('text_3ds1_unable_to_verify_enrolment');
		$data['text_3ds1_invalid_response_from_enrolment_server'] = $this->language->get('text_3ds1_invalid_response_from_enrolment_server');
		$data['text_3ds1_enrolled_but_invalid_response_from_acs'] = $this->language->get('text_3ds1_enrolled_but_invalid_response_from_acs');
		$data['text_3ds1_authentication_attempt_acknowledge'] = $this->language->get('text_3ds1_authentication_attempt_acknowledge');
		$data['text_3ds1_incorrect_password_entered'] = $this->language->get('text_3ds1_incorrect_password_entered');
		$data['text_3ds1_authentication_unavailable'] = $this->language->get('text_3ds1_authentication_unavailable');
		$data['text_3ds1_invalid_response_from_acs'] = $this->language->get('text_3ds1_invalid_response_from_acs');

		$data['entry_merchant_id'] = $this->language->get('entry_merchant_id');
		$data['entry_account_id'] = $this->language->get('entry_account_id');
		$data['entry_secret'] = $this->language->get('entry_secret');
		$data['entry_checkout'] = $this->language->get('entry_checkout');
		$data['entry_environment'] = $this->language->get('entry_environment');
		$data['entry_debug'] = $this->language->get('entry_debug');
		$data['entry_settlement_method'] = $this->language->get('entry_settlement_method');
		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_form_align'] = $this->language->get('entry_form_align');
		$data['entry_form_size'] = $this->language->get('entry_form_size');
		$data['entry_secure_status'] = $this->language->get('entry_secure_status');
		$data['entry_secure_2_scenario'] = $this->language->get('entry_secure_2_scenario');
		$data['entry_secure_1_scenario'] = $this->language->get('entry_secure_1_scenario');
		
		$data['help_total'] = $this->language->get('help_total');
		$data['help_secure_status'] = $this->language->get('help_secure_status');
		$data['help_secure_2_scenario'] = $this->language->get('help_secure_2_scenario');
		$data['help_secure_1_scenario'] = $this->language->get('help_secure_1_scenario');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
			
		$data['breadcrumbs'] = array();

		if (VERSION >= '2.0.2.0') {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
			);
		}

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_payments'),
			'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('payment/globalpayments', 'token=' . $this->session->data['token'], 'SSL')
		);
						
		$data['action'] = $this->url->link('payment/globalpayments', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
				
		if (isset($this->request->post['globalpayments_merchant_id'])) {
			$data['merchant_id'] = $this->request->post['globalpayments_merchant_id'];
		} else {
			$data['merchant_id'] = $this->config->get('globalpayments_merchant_id');
		}
		
		if (isset($this->request->post['globalpayments_account_id'])) {
			$data['account_id'] = $this->request->post['globalpayments_account_id'];
		} else {
			$data['account_id'] = $this->config->get('globalpayments_account_id');
		}

		if (isset($this->request->post['globalpayments_secret'])) {
			$data['secret'] = $this->request->post['globalpayments_secret'];
		} else {
			$data['secret'] = $this->config->get('globalpayments_secret');
		}
		
		if (isset($this->request->post['globalpayments_checkout'])) {
			$data['checkout'] = $this->request->post['globalpayments_checkout'];
		} else {
			$data['checkout'] = $this->config->get('globalpayments_checkout');
		}
								
		if (isset($this->request->post['globalpayments_environment'])) {
			$data['environment'] = $this->request->post['globalpayments_environment'];
		} else {
			$data['environment'] = $this->config->get('globalpayments_environment');
		}
										
		if (isset($this->request->post['globalpayments_debug'])) {
			$data['debug'] = $this->request->post['globalpayments_debug'];
		} else {
			$data['debug'] = $this->config->get('globalpayments_debug');
		}
		
		if (isset($this->request->post['globalpayments_settlement_method'])) {
			$data['settlement_method'] = $this->request->post['globalpayments_settlement_method'];
		} else {
			$data['settlement_method'] = $this->config->get('globalpayments_settlement_method');
		}

		if (isset($this->request->post['globalpayments_total'])) {
			$data['total'] = $this->request->post['globalpayments_total'];
		} else {
			$data['total'] = $this->config->get('globalpayments_total');
		}

		if (isset($this->request->post['globalpayments_geo_zone_id'])) {
			$data['geo_zone_id'] = $this->request->post['globalpayments_geo_zone_id'];
		} else {
			$data['geo_zone_id'] = $this->config->get('globalpayments_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['globalpayments_status'])) {
			$data['status'] = $this->request->post['globalpayments_status'];
		} else {
			$data['status'] = $this->config->get('globalpayments_status');
		}

		if (isset($this->request->post['globalpayments_sort_order'])) {
			$data['sort_order'] = $this->request->post['globalpayments_sort_order'];
		} else {
			$data['sort_order'] = $this->config->get('globalpayments_sort_order');
		}
		
		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		// Setting 		
		$_config = new Config();
		$_config->load('globalpayments');
		
		$data['setting'] = $_config->get('globalpayments_setting');
						
		if (isset($this->request->post['globalpayments_setting'])) {
			$data['setting'] = array_replace_recursive((array)$data['setting'], (array)$this->request->post['globalpayments_setting']);
		} else {
			$data['setting'] = array_replace_recursive((array)$data['setting'], (array)$this->config->get('globalpayments_setting'));
		}
							
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('payment/globalpayments', $data));
	}
	
	public function install() {
		$this->load->model('payment/globalpayments');
		
		$this->model_payment_globalpayments->installExtension();
	}
	
	public function uninstall() {
		$this->load->model('payment/globalpayments');
		
		$this->model_payment_globalpayments->uninstallExtension();
	}
					
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'payment/globalpayments')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!isset($this->request->post['globalpayments_merchant_id']) || strlen($this->request->post['globalpayments_merchant_id']) <= 1 || strlen($this->request->post['globalpayments_merchant_id']) > 50) {
			$this->error['warning'] = $this->language->get('error_warning');
			$this->error['error_merchant_id'] = $this->language->get('error_merchant_id');
		}
		
		if (!isset($this->request->post['globalpayments_account_id']) || strlen($this->request->post['globalpayments_account_id']) <= 1 || strlen($this->request->post['globalpayments_account_id']) > 50) {
			$this->error['warning'] = $this->language->get('error_warning');
			$this->error['error_account_id'] = $this->language->get('error_account_id');
		}

		if (!isset($this->request->post['globalpayments_secret']) || strlen($this->request->post['globalpayments_secret']) <= 1 || strlen($this->request->post['globalpayments_secret']) > 50) {
			$this->error['warning'] = $this->language->get('error_warning');
			$this->error['error_secret'] = $this->language->get('error_secret');
		}
				
		return !$this->error;
	}
}