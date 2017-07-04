<?php  
class ControllerExtensionModuleNewsletterpopup extends Controller {

	public function index() {	
	
		if($this->config->get('newsletterpopup_disp')){
			$this->load->model('tool/image');
			$this->load->model('extension/module/newsletterpopup');
			$this->load->language('extension/module/newsletterpopup');
			$data['newsletterpopup_bg_image'] = $this->model_tool_image->resize($this->config->get('newsletterpopup_bg_image'), 700,400);
			$data['newsletterpopup_title'] = $this->model_extension_module_newsletterpopup->getNewsletterpopupTitle();

			$data['newsletterpopup_description'] = $this->model_extension_module_newsletterpopup->getNewsletterpopupDescription();

			$data['text_subscribe'] = $this->language->get('text_subscribe');
			$data['text_dont_show'] = $this->language->get('text_dont_show');
			$data['text_success'] = $this->language->get('text_success');
			$data['entry_email'] = $this->language->get('entry_email');
			$data['magik_theme']=$this->config->get('theme_default_directory');
			return $this->load->view('extension/module/newsletterpopup', $data);
			
		}
	
	}
	

}
?>