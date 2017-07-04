<?php
class ControllerExtensionModuleNewsletterpopup extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/newsletterpopup');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('newsletterpopup', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_image'] = $this->language->get('entry_image');

		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/newsletterpopup', 'token=' . $this->session->data['token'], true)
		);

		
		$data['action'] = $this->url->link('extension/module/newsletterpopup', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		

		if (isset($this->request->post['newsletterpopup_disp'])) {
			$data['newsletterpopup_disp'] = $this->request->post['newsletterpopup_disp'];
		} else {
			$data['newsletterpopup_disp'] = $this->config->get('newsletterpopup_disp');
		}

		if (isset($this->request->post['newsletterpopup_bg_image'])) {
			$data['newsletterpopup_bg_image'] = $this->request->post['newsletterpopup_bg_image'];
		} else {
			$data['newsletterpopup_bg_image'] = $this->config->get('newsletterpopup_bg_image'); 
		} 

		$this->load->model('tool/image');

		if (isset($this->request->post['newsletterpopup_bg_image']) && is_file(DIR_IMAGE . $this->request->post['newsletterpopup_bg_image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['newsletterpopup_bg_image'], 100, 100);
		} elseif ( $this->config->get( 'newsletterpopup_bg_image')!=''  && is_file(DIR_IMAGE . $this->config->get('newsletterpopup_bg_image')) ) {
			$data['thumb'] = $this->model_tool_image->resize($this->config->get('newsletterpopup_bg_image'), 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);


		$data['newsletterpopup_description'] = array();
		if (isset($this->request->post['newsletterpopup_description'])) {
		$data['newsletterpopup_description'] = $this->request->post['newsletterpopup_description'];
		} else {
		$data['newsletterpopup_description'] = $this->config->get('newsletterpopup_description');
		} 

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/newsletterpopup', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/newsletterpopup')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}