<?php
class ControllerExtensionModuleBlogLatestArticles extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/blog_latest_articles');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			if (!isset($this->request->post['show_date'])) {
				$this->request->post['show_date'] = 0;
			}
			if (!isset($this->request->post['show_author'])) {
				$this->request->post['show_author'] = 0;
			}
			if (!isset($this->request->post['show_viewed'])) {
				$this->request->post['show_viewed'] = 0;
			}
			if (!isset($this->request->post['show_number_of_comments'])) {
				$this->request->post['show_number_of_comments'] = 0;
			}
			if (!isset($this->request->post['show_category'])) {
				$this->request->post['show_category'] = 0;
			}
			if (!isset($this->request->post['show_tag'])) {
				$this->request->post['show_tag'] = 0;
			}

			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('blog_latest_articles', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

						
			$this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}


		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_none'] = $this->language->get('text_none');
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_blog_category'] = $this->language->get('entry_blog_category');
		$data['entry_limit'] = $this->language->get('entry_limit');
        $data['entry_width'] = $this->language->get('entry_width');
        $data['entry_height'] = $this->language->get('entry_height');
        $data['entry_column'] = $this->language->get('entry_column');
		$data['entry_status'] = $this->language->get('entry_status');
        $data['entry_include_sub_category'] = $this->language->get('entry_include_sub_category');
		$data['entry_show_for_articles'] = $this->language->get('entry_show_for_articles');
		$data['entry_show_date'] = $this->language->get('entry_show_date');
		$data['entry_show_author'] = $this->language->get('entry_show_author');
		$data['entry_show_viewed'] = $this->language->get('entry_show_viewed');
		$data['entry_show_comment'] = $this->language->get('entry_show_comment');
		$data['entry_show_categories'] = $this->language->get('entry_show_categories');
		$data['entry_show_tags'] = $this->language->get('entry_show_tags');
        $data['entry_design'] = $this->language->get('entry_design');
        $data['entry_design_0'] = $this->language->get('entry_design_0');
        $data['entry_design_1'] = $this->language->get('entry_design_1');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

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
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/blog_latest_articles', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
			    'href' => $this->url->link('extension/module/blog_latest_articles', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
            );
		}


        if (!isset($this->request->get['module_id'])) {
            $data['action'] = $this->url->link('extension/module/blog_latest_articles', 'token=' . $this->session->data['token'], true);
        } else {
            $data['action'] = $this->url->link('extension/module/blog_latest_articles', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
        }
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

        // Categories
        $this->load->model('blog/blog_category');

        $data['categories'] = array();

        if (!empty($this->request->post['blog_category'])) {
            $categories = $this->request->post['blog_category'];
        } elseif (!empty($module_info['blog_category'])) {
            $categories = $module_info['blog_category'];
        } else {
            $categories = array();
        }

        foreach ($categories as $blog_category_id) {
            $category_info = $this->model_blog_blog_category->getBlogCategory($blog_category_id);
            if ($category_info) {
                $data['categories'][] = array(
                    'blog_category_id' => $category_info['blog_category_id'],
                    'name' => $category_info['name']
                );
            }
        }

        if (isset($this->request->post['include_sub_category'])) {
            $data['include_sub_category'] = $this->request->post['include_sub_category'];
        } elseif (!empty($module_info)) {
            $data['include_sub_category'] = $module_info['include_sub_category'];
        } else {
            $data['include_sub_category'] = 0;
        }

        if (isset($this->request->post['design'])) {
            $data['design'] = $this->request->post['design'];
        } elseif (!empty($module_info)) {
            $data['design'] = $module_info['design'];
        } else {
            $data['design'] = 0;
        }

		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = 4;
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

        if (isset($this->request->post['column'])) {
            $data['column'] = $this->request->post['column'];
        } elseif (!empty($module_info)) {
            $data['column'] = $module_info['column'];
        } else {
            $data['column'] = 1;
        }

		if (isset($this->request->post['show_date'])) {
			$data['show_date'] = $this->request->post['show_date'];
		} elseif (!empty($module_info)) {
			$data['show_date'] = $module_info['show_date'];
		} else {
			$data['show_date'] = 1;
		}
		
		if (isset($this->request->post['show_author'])) {
			$data['show_author'] = $this->request->post['show_author'];
		} elseif (!empty($module_info)) {
			$data['show_author'] = $module_info['show_author'];
		} else {
			$data['show_author'] = 1;
		}
		
		if (isset($this->request->post['show_viewed'])) {
			$data['show_viewed'] = $this->request->post['show_viewed'];
		} elseif (!empty($module_info)) {
			$data['show_viewed'] = $module_info['show_viewed'];
		} else {
			$data['show_viewed'] = 1;
		}
			
		if (isset($this->request->post['show_number_of_comments'])) {
			$data['show_number_of_comments'] = $this->request->post['show_number_of_comments'];
		} elseif (!empty($module_info)) {
			$data['show_number_of_comments'] = $module_info['show_number_of_comments'];
		} else {
			$data['show_number_of_comments'] = 1;
		}
		
		if (isset($this->request->post['show_category'])) {
			$data['show_category'] = $this->request->post['show_category'];
		} elseif (!empty($module_info)) {
			$data['show_category'] = $module_info['show_category'];
		} else {
			$data['show_category'] = 1;
		}

		if (isset($this->request->post['show_tag'])) {
			$data['show_tag'] = $this->request->post['show_tag'];
		} elseif (!empty($module_info)) {
			$data['show_tag'] = $module_info['show_tag'];
		} else {
			$data['show_tag'] = 1;
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
				
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/blog_latest_articles', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/blog_latest_articles')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

        if (!$this->request->post['width']) {
            $this->error['width'] = $this->language->get('error_width');
        }

        if (!$this->request->post['height']) {
            $this->error['height'] = $this->language->get('error_height');
        }
		
		return !$this->error;
	}
}