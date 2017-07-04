<?php  
class ControllerExtensionModuleNewslettersubscription extends Controller {

	public function index() {

		$this->language->load('extension/module/newslettersubscription');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_newsletter_subscribe'] = $this->language->get('text_newsletter_subscribe');
		$data['text_your_email'] = $this->language->get('text_your_email');

		return $this->load->view('extension/module/newslettersubscription', $data);		

	}
	
	public function addsubscriberemail() {

		$this->language->load('extension/module/newslettersubscription');

		$this->load->model('extension/module/newslettersubscription');
 		
		if(isset($this->request->get['email']))
		{
			$msg = $this->model_extension_module_newslettersubscription->EmailSubmit(trim($this->request->get['email']));
		}
		echo $msg;
	}
}
?>