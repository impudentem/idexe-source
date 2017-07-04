<?php
class ControllerExtensionModuleCategoryList extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/category_list');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->load->model('setting/setting');
		$this->load->model('catalog/category');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
 			$this->model_setting_setting->editSetting('category_list', $this->request->post);
			
			$this->cache->delete('product');

			$this->session->data['success'] = $this->language->get('text_success');		
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_category_name'] = $this->language->get('entry_category_name');
		$data['entry_category_second'] = $this->language->get('entry_category_second');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_module_add'] = $this->language->get('button_module_add');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}
		
		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
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

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/category_list', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/category_list', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}		
		

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/category_list', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/category_list', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
						
		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = 5;
		}	

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = 200;
		}	
			
		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = 200;
		}		
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		 // POST ALL valaues from module
        if (isset($this->request->post['category_list_status'])) {
            $data['category_list_status'] = $this->request->post['category_list_status'];
        } else {
            $category_list_status =  $this->config->get('category_list_status');
            $data['category_list_status'] = !empty($category_list_status) ? $category_list_status : '0';
        }

        
        if (isset($this->request->post['category_list_name'])) {
            $data['category_list_name'] = $this->request->post['category_list_name'];
	    } else {
	            $data['category_list_name'] = $this->config->get('category_list_name');
	    }

	    if (isset($this->request->post['category_list_limit'])) {
            $data['category_list_limit'] = $this->request->post['category_list_limit'];
	    } else {
	            $data['category_list_limit'] = $this->config->get('category_list_limit');
	    }


	    if (isset($this->request->post['category_list_width'])) {
            $data['category_list_width'] = $this->request->post['category_list_width'];
	    } else {
	            $data['category_list_width'] = $this->config->get('category_list_width');
	    }

	    if (isset($this->request->post['category_list_height'])) {
            $data['category_list_height'] = $this->request->post['category_list_height'];
	    } else {
	            $data['category_list_height'] = $this->config->get('category_list_height');
	    }


				
		$this->load->model('design/layout');
		$this->load->model('tool/image');
		$this->load->model('catalog/category');
		
		$data['categories'] = array();
		$this->load->model('extension/module/category_list');
		$data['categories'] = $this->model_extension_module_category_list->getCategories(array());

		$cat_info = array();
		if (isset($this->request->post['category_list_module'])) {
			$cat_info = $this->request->post['category_list_module'];
		} else {
			$this->load->model('extension/module/category_list');
			$cat_info = $this->model_extension_module_category_list->getInfo();
		}


		$data['cat_info'] = array();
		if($cat_info){
			foreach ($cat_info as $category) {
			if (is_file(DIR_IMAGE . $category['image'])) {
			$image = $category['image'];
			$thumb = $category['image'];
			} else {
			$image = '';
			$thumb = 'no_image.png';
			}

			$data['cat_info'][] = array(

			'category_id'                   => $category['category_id'],
			'image'                         => $image,
			'thumb'                         => $this->model_tool_image->resize($thumb, 100, 100)
			
			);
			}
	    }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module/category_list', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/category_list')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['category_list_name']) < 3) || (utf8_strlen($this->request->post['category_list_name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if (!$this->request->post['category_list_width']) {
			$this->error['width'] = $this->language->get('error_width');
		}
		
		if (!$this->request->post['category_list_height']) {
			$this->error['height'] = $this->language->get('error_height');
		}

		return !$this->error;
	}
}
?>