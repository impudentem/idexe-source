<?php
class ControllerCommonFooter extends Controller {
	public function index() {

            	$this->load->language('product/search');
                $data['text_empty'] = $this->language->get('text_empty');

            	$data['text_view_all_results'] = $this->config->get('live_search_view_all_results')[$this->config->get('config_language_id')]['name'];
                $data['live_search_ajax_status'] = $this->config->get('live_search_ajax_status');
                $data['live_search_show_image'] = $this->config->get('live_search_show_image');
                $data['live_search_show_price'] = $this->config->get('live_search_show_price');
                $data['live_search_show_description'] = $this->config->get('live_search_show_description');
                $data['live_search_href'] = $this->url->link('product/search', 'search=');
                $data['live_search_min_length'] = $this->config->get('live_search_min_length');
            
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_customer_service'] = $this->language->get('text_customer_service');
		$data['text_sizes'] = $this->language->get('text_sizes');

		$data['text_visit_our_store'] = $this->language->get('text_visit_our_store');
		$data['text_have_questions'] = $this->language->get('text_have_questions');
		$data['text_write_to_us'] = $this->language->get('text_write_to_us');
        $data['text_actions'] = $this->language->get('text_actions');
        $data['text_news'] = $this->language->get('text_news');
        $data['text_special'] = $this->language->get('text_special');
        $data['text_franchise'] = $this->language->get('text_franchise');
        $data['text_about'] = $this->language->get('text_about');
        $data['text_career'] = $this->language->get('text_career');
        $data['text_corporate_website'] = $this->language->get('text_corporate_website');
        $data['text_support'] = $this->language->get('text_support');
        $data['text_legal_references'] = $this->language->get('text_legal_references');
        $data['text_privacy_policy'] = $this->language->get('text_privacy_policy');
        $data['text_terms'] = $this->language->get('text_terms');
        $data['text_terms_files'] = $this->language->get('text_terms_files');
        $data['text_follow_us'] = $this->language->get('text_follow_us');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $data['categories'] = array();

        $categories = $this->model_catalog_category->getCategories(0);

        foreach ($categories as $category) {
            // Level 1
            $data['categories'][] = array(
                'name'     => $category['name'],
                'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
            );
        }

        $data['text_home'] = $this->language->get('text_home');
        $data['text_blog'] = $this->language->get('text_blog');
        $data['text_shops'] = $this->language->get('text_shops');
        $data['text_catalog'] = $this->language->get('text_catalog');
        $data['text_delivery'] = $this->language->get('text_delivery');
        $data['text_contacts'] = $this->language->get('text_contacts');

        $data['shops'] = $this->url->link('information/information', 'information_id=7');
        $data['delivery'] = $this->url->link('information/information', 'information_id=6');
        $data['catalog'] = $this->url->link('product/allproduct');
        $data['blog'] = $this->url->link('blog/blog');

		$data['contact'] = $this->url->link('information/contact');
		//$data['return'] = $this->url->link('account/return/add', '', true);

		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
        $data['sizes'] = $this->url->link('information/information', 'information_id=9');
        $data['privacy_policy'] = $this->url->link('information/information', 'information_id=3');
        $data['about'] = $this->url->link('information/information', 'information_id=4');
        $data['franchise'] = $this->url->link('information/information', 'information_id=8');
        $data['terms'] = $this->url->link('information/information', 'information_id=5');
        $data['terms_files'] = $this->url->link('information/information', 'information_id=10');
        $data['return'] = $this->url->link('information/information', 'information_id=11');
        $data['career'] = $this->url->link('information/information', 'information_id=12');
        $data['news'] = $this->url->link('blog/blog_category', 'blog_path=6');
        $data['actions'] = $this->url->link('blog/blog_category', 'blog_path=7');

        $this->load->model('tool/image');
        if ($this->config->get('config_image')) {
            $data['image'] = $this->model_tool_image->resize($this->config->get('config_image'), $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
        } else {
            $data['image'] = false;
        }

        $data['store'] = $this->config->get('config_name');
        $data['telephone'] = $this->config->get('config_telephone');
        $data['fax'] = $this->config->get('config_fax');
        $data['address'] = nl2br($this->config->get('config_address'));
        $data['config_comment'] = nl2br($this->config->get('config_comment'));

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
