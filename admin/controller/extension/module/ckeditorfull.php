<?php
class ControllerExtensionModuleCkeditorfull extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/ckeditorfull');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('ckeditorfull', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		// Skins directory.
		$data['ck_skins_dir'] = HTTPS_SERVER . "view" . DIRECTORY_SEPARATOR . "javascript" . DIRECTORY_SEPARATOR . "ckeditor" . DIRECTORY_SEPARATOR . "skins" . DIRECTORY_SEPARATOR ;

		// Local literals
		$data['ck_skins'] = array("bootstrapck","flat","icy_orange","kama","minimalist","moono","moono-lisa","moono_blue","moonocolor","moono-dark","office2013");
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['entry_skin'] = $this->language->get('entry_skin');
		$data['entry_skin_preview'] = $this->language->get('entry_skin_preview');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_apikey'] = $this->language->get('entry_apikey');
		$data['entry_acf'] = $this->language->get('entry_acf');
		$data['help_apikey'] = $this->language->get('help_apikey');

		// Global literals.
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/ckeditorfull', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/ckeditorfull', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);


		if (isset($this->request->post['ckeditorfull_skin'])) {
			$data['ckeditorfull_skin'] = $this->request->post['ckeditorfull_skin'];
		} else {
			$data['ckeditorfull_skin'] = $this->config->get('ckeditorfull_skin')?$this->config->get('ckeditorfull_skin'):"moono-lisa";
		}

		if (isset($this->request->post['ckeditorfull_height'])) {
			$data['ckeditorfull_height'] = $this->request->post['ckeditorfull_height'];
		} elseif ($this->config->has('ckeditorfull_height')) {
			$data['ckeditorfull_height'] = $this->config->get('ckeditorfull_height');
		} else {
			$data['ckeditorfull_height'] = '';
		}

		if (isset($this->request->post['ckeditorfull_apikey'])) {
			$data['ckeditorfull_apikey'] = $this->request->post['ckeditorfull_apikey'];
		} elseif ($this->config->has('ckeditorfull_apikey')) {
			$data['ckeditorfull_apikey'] = $this->config->get('ckeditorfull_apikey');
		} else {
			$data['ckeditorfull_apikey'] = '';
		}

		if (isset($this->request->post['ckeditorfull_acf'])) {
			$data['ckeditorfull_acf'] = $this->request->post['ckeditorfull_acf'];
		} elseif ($this->config->has('ckeditorfull_acf')) {
			$data['ckeditorfull_acf'] = $this->config->get('ckeditorfull_acf');
		} else {
			$data['ckeditorfull_acf'] = 'true';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/ckeditorfull', $data));
	}

	private function install_method_1(){
		// Rename summernote folder.
		$old_name = DIR_APPLICATION . 'view' . DIRECTORY_SEPARATOR . 'javascript' . DIRECTORY_SEPARATOR . 'summernote';
		$new_name = DIR_APPLICATION . 'view' . DIRECTORY_SEPARATOR . 'javascript' . DIRECTORY_SEPARATOR . 'original_summernote_ckeditorfull_replaced';
		$success = rename($old_name, $new_name);

		if (!$success) {
			return $success;
		}

		// Link summernote to ckeditor.
		$target = DIR_APPLICATION . 'view' . DIRECTORY_SEPARATOR . 'javascript' . DIRECTORY_SEPARATOR . 'ckeditor';
		$link_name = DIR_APPLICATION . 'view' . DIRECTORY_SEPARATOR . 'javascript' . DIRECTORY_SEPARATOR . 'summernote';
		$success = symlink($target, $link_name);

		if (!$success) {
			return $success;
		}

		// Link js file.
		$target = DIR_APPLICATION . 'view' . DIRECTORY_SEPARATOR . 'javascript' . DIRECTORY_SEPARATOR . 'ckeditor' . DIRECTORY_SEPARATOR . 'ckeditor.js';
		$link_name = DIR_APPLICATION . 'view' . DIRECTORY_SEPARATOR . 'javascript' . DIRECTORY_SEPARATOR . 'ckeditor' . DIRECTORY_SEPARATOR . 'summernote.js';
		$success = symlink($target, $link_name);
		return $success;
	}

	private function uninstall_method_1() {
		// Remove link.
		$link_name = DIR_APPLICATION . 'view' . DIRECTORY_SEPARATOR . 'javascript' . DIRECTORY_SEPARATOR . 'summernote';
		$success_unlink = unlink($link_name);

		if (!$success_unlink) {
			return;
		}

		// Reverse the renaming of summernote.
		$old_name = DIR_APPLICATION . 'view' . DIRECTORY_SEPARATOR . 'javascript' . DIRECTORY_SEPARATOR . 'original_summernote_ckeditorfull_replaced';
		$new_name = DIR_APPLICATION . 'view' . DIRECTORY_SEPARATOR . 'javascript' . DIRECTORY_SEPARATOR . 'summernote';
		rename($old_name, $new_name);

		// UnLink js file.
		unlink(DIR_APPLICATION . 'view' . DIRECTORY_SEPARATOR . 'javascript' . DIRECTORY_SEPARATOR . 'ckeditor' . DIRECTORY_SEPARATOR . 'summernote.js');
	}

	/**
	 * # CKEditor Installation (comment out the following 3 lines to deactivate CKEditor Full Extension)
	Redirect /admin/view/javascript/summernote/summernote.js /admin/view/javascript/ckeditor/ckeditor.js
	Redirect /admin/view/javascript/summernote/opencart.js /admin/view/javascript/ckeditor/opencart.js
	Redirect /admin/view/javascript/summernote/summernote.css /admin/view/javascript/ckeditor/summernote.css

	below the line:
	RewriteEngine On
	 * @return bool
	 */
	private function install_method_2(){
		$url_path = parse_url(HTTP_SERVER)['path'];
		$lines = array(
			'Redirect ' . $url_path . 'view/javascript/summernote/summernote.js ' . $url_path . 'view/javascript/ckeditor/ckeditor.js',
			'Redirect ' . $url_path . 'view/javascript/summernote/opencart.js ' . $url_path . 'view/javascript/ckeditor/opencart.js',
			'Redirect ' . $url_path . 'view/javascript/summernote/summernote.css ' . $url_path . 'view/javascript/ckeditor/summernote.css'
		);
		$htaccess_txt_file = DIR_APPLICATION . '../.htaccess.txt';
		$htaccess_file = DIR_APPLICATION . '../.htaccess';
		$success = False;

		if (!file_exists($htaccess_file) && file_exists($htaccess_txt_file)){
			// Copy file.
			file_put_contents($htaccess_file, file_get_contents($htaccess_txt_file));
		}

		if (file_exists($htaccess_file)) {
			// Open .htaccess file for editing.
			$htaccess_file_contents = file_get_contents($htaccess_file);

			if ($htaccess_file_contents === False) {
				return False;
			}

			$htaccess_file_lines = explode("\n", $htaccess_file_contents);


			// Find installation lines and replace them by uncommented ones.
			foreach ($lines as $line){
				$found = False;
				foreach ($htaccess_file_lines as $key => $htaccess_file_line) {
					if (strstr($htaccess_file_line, $line) !== False) {
						$found = True;
						$htaccess_file_lines[$key] = $line;
						break;
					}
				}
				if (!$found) {
					// Append it.
					$htaccess_file_lines[] = $line;
				}
			}

			// Write edited .htaccess file back to disk.
			$success = file_put_contents($htaccess_file, implode("\n", $htaccess_file_lines));
			$success = ($success === False)?False:True;
		}


		return $success;
	}

	private function uninstall_method_2(){
		$url_path = parse_url(HTTP_SERVER)['path'];
		$lines = array(
			'Redirect ' . $url_path . 'view/javascript/summernote/summernote.js ' . $url_path . 'view/javascript/ckeditor/ckeditor.js',
			'Redirect ' . $url_path . 'view/javascript/summernote/opencart.js ' . $url_path . 'view/javascript/ckeditor/opencart.js',
			'Redirect ' . $url_path . 'view/javascript/summernote/summernote.css ' . $url_path . 'view/javascript/ckeditor/summernote.css'
		);

		$htaccess_file = DIR_APPLICATION . '../.htaccess';

		if (!file_exists($htaccess_file)){
			// Someone deleted the file.
			return True;
		}

		// Open .htaccess file for editing.
		$htaccess_file_contents = file_get_contents($htaccess_file);

		if ($htaccess_file_contents === False) {
			return False;
		}

		$htaccess_file_lines = explode("\n", $htaccess_file_contents);

		// Find installation lines and replace them by uncommented ones.
		foreach ($lines as $line){
			$found = False;
			foreach ($htaccess_file_lines as $key => $htaccess_file_line) {
				if (strstr($htaccess_file_line, $line) !== False) {
					$found = True;
					$htaccess_file_lines[$key] = "#" . $line;
					break;
				}
			}
			if (!$found) {
				// Append it.
				$htaccess_file_lines[] = "#" . $line;
			}
		}

		// Write edited .htaccess file back to disk.
		$success = file_put_contents($htaccess_file, implode("\n", $htaccess_file_lines));
		$success = ($success === False)?False:True;

		return $success;
	}

	public function install() {
		$success = False;
		$unsupported = False;
		// Determine installation procedure based on PHP function support.
		if (function_exists('rename') && function_exists('symlink') && function_exists('unlink')) {
			$success = $this->install_method_1();
		} elseif (function_exists('file_get_contents') && function_exists('file_put_contents') && function_exists('file_exists')){
			$success = $this->install_method_2();
		} else {
			$unsupported = True;
		}

		if (!$success) {
			$this->error['warning'] = $this->language->get('error_general');
		}

		if ($unsupported) {
			$this->error['warning'] = $this->language->get('error_unsupported');
		}
	}

	public function uninstall() {
		$success = False;
		$unsupported = False;
		// Determine installation procedure based on PHP function support.
		if (function_exists('rename') && function_exists('symlink') && function_exists('unlink')) {
			$success = $this->uninstall_method_1();
		} elseif (function_exists('file_get_contents') && function_exists('file_put_contents') && function_exists('file_exists')){
			$success = $this->uninstall_method_2();
		} else {
			$unsupported = True;
		}

		if (!$success) {
			$this->error['warning'] = $this->language->get('error_general');
		}

		if ($unsupported) {
			$this->error['warning'] = $this->language->get('error_unsupported');
		}

	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/ckeditorfull')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!ctype_digit($this->request->post['ckeditorfull_height']) and $this->request->post['ckeditorfull_height'] !== '') {
			$this->error['height'] = $this->language->get('error_height');
		}

		return !$this->error;
	}
}
