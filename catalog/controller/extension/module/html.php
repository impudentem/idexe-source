<?php
class ControllerExtensionModuleHTML extends Controller {
	public function index($setting) {
        $this->load->language('extension/module/html');

        $data['text_quality'] = $this->language->get('text_quality');
        $data['text_shipping'] = $this->language->get('text_shipping');
        $data['text_work_all'] = $this->language->get('text_work_all');

		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {


			$data['heading_title'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');

            $data['html'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');
            $data['class'] = $setting['class'];
            $data['template'] = $setting['template'];
			return $this->load->view('extension/module/html', $data);
		}
	}
}