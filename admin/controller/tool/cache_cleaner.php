<?php
/**
 * @package		Cache Cleaner
 * @copyright	Copyright (C) 2015 Fido-X IT (John Simon). All rights reserved. (fido-x.net)
 * @license		GNU General Public License version 3; see http://www.gnu.org/licenses/gpl-3.0.en.html
 */

class ControllerToolCacheCleaner extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('tool/cache_cleaner');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_list'] = $this->language->get('text_list');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['button_clear'] = $this->language->get('button_clear');

		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];

			unset($this->session->data['error']);
		} elseif (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('tool/cache_cleaner', 'token=' . $this->session->data['token'], true)
		);

		$cached_images = array();

		$image_cache = glob(DIR_IMAGE . 'cache/*');

		foreach ($image_cache as $cached_image) {
			$cached_images[] = basename($cached_image);

			if (is_dir($cached_image)) {
				$files = glob($cached_image . '/*');

				foreach ($files as $file) {
					$cached_images[] = basename($cached_image) . '/' . basename($file);

					if (is_dir($file)) {
						$more_files = glob($file . '/*');

						foreach ($more_files as $filename) {
							$cached_images[] = basename($cached_image) . '/' . basename($file) . '/' . basename($filename);
						}
					}
				}
			}
		}

		$cached_systems = array();

		$system_cache = glob(DIR_CACHE . '*');

		foreach ($system_cache as $cached_file) {
			$cached_systems[] = basename($cached_file);
		}

		if (file_exists('../vqmod/vqcache') && is_dir('../vqmod/vqcache')) {
			$cached_vqmods = array();

			$vqmod_cache = glob('../vqmod/vqcache/*');

			foreach ($vqmod_cache as $cached_file) {
				$cached_vqmods[] = basename($cached_file);
			}
		}

		$cache_dirs = array();

		$cache_dirs[] = array(
			'name'   => $this->language->get('text_image_cache'),
			'files'  => $cached_images,
			'div_id' => 'image-cache',
			'clear'  => $this->url->link('tool/cache_cleaner/clear', 'token=' . $this->session->data['token'] . '&clear=image', true)
		);

		$cache_dirs[] = array(
			'name'   => $this->language->get('text_system_cache'),
			'files'  => $cached_systems,
			'div_id' => 'system-cache',
			'clear'  => $this->url->link('tool/cache_cleaner/clear', 'token=' . $this->session->data['token'] . '&clear=system', true)
		);

		if (file_exists('../vqmod/vqcache') && is_dir('../vqmod/vqcache')) {
			$cache_dirs[] = array(
				'name'   => $this->language->get('text_vqmod_cache'),
				'files'  => $cached_vqmods,
				'div_id' => 'vqmod-cache',
				'clear'  => $this->url->link('tool/cache_cleaner/clear', 'token=' . $this->session->data['token'] . '&clear=vqmod', true)
			);
		}

		$data['cache_dirs'] = $cache_dirs;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('tool/cache_cleaner', $data));
	}

	public function clear() {
		$this->load->language('tool/cache_cleaner');

		if (!$this->user->hasPermission('modify', 'tool/cache_cleaner')) {
			$this->session->data['error'] = sprintf($this->language->get('error_permission'), $this->request->get['clear']);
		} else {
			if ($this->request->get['clear'] == 'image') {
				$cache_dir = DIR_IMAGE . 'cache/';
			}

			if ($this->request->get['clear'] == 'system') {
				$cache_dir = DIR_CACHE;
			}

			if ($this->request->get['clear'] == 'vqmod') {
				$cache_dir = '../vqmod/vqcache/';
			}

			$files = array();

			// Make path into an array
			$path = array($cache_dir . '*');

			// While the path array is still populated keep looping through
			while (count($path) != 0) {
				$next = array_shift($path);

				foreach (glob($next) as $file) {
					// If directory add to path array
					if (is_dir($file)) {
						$path[] = $file . '/*';
					}

					// Add the file to the files to be deleted array
					$files[] = $file;
				}
			}

			// Reverse sort the file array
			rsort($files);

			// Clear all cached files
			foreach ($files as $file) {
				if ($file != $cache_dir . 'index.html') {
					// If file just delete
					if (is_file($file)) {
						unlink($file);

					// If directory use the remove directory function
					} elseif (is_dir($file)) {
						rmdir($file);
					}
				}
			}					

			$this->session->data['success'] = sprintf($this->language->get('text_success'), $this->request->get['clear']);
		}

		$this->response->redirect($this->url->link('tool/cache_cleaner', 'token=' . $this->session->data['token'], true));
	}
}