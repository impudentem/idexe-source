<?php
class ControllerModuleBlogCategoryMenu extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('module/oc_blog_category_menu');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('oc_blog_category_menu', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_article_count'] = $this->language->get('entry_article_count');

        $data['help_article_count'] = $this->language->get('help_article_count');

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
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/oc_blog_category_menu', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['action'] = $this->url->link('module/oc_blog_category_menu', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['oc_blog_category_menu_status'])) {
            $data['oc_blog_category_menu_status'] = $this->request->post['oc_blog_category_menu_status'];
        } else {
            $data['oc_blog_category_menu_status'] = $this->config->get('oc_blog_category_menu_status');
        }

        if (isset($this->request->post['oc_blog_category_menu_article_count'])) {
            $data['oc_blog_category_menu_article_count'] = $this->request->post['oc_blog_category_menu_article_count'];
        } else {
            $data['oc_blog_category_menu_article_count'] = $this->config->get('oc_blog_category_menu_article_count');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/blog_category_menu.tpl', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/oc_blog_category_menu')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    public function install() {
        $this->load->model('setting/setting');
        $data = array(
            'oc_blog_category_menu_status' => '0',
            'oc_blog_category_menu_article_count' => '1',
        );
        $this->model_setting_setting->editSetting('oc_blog_category_menu', $data, 0);
    }

    public function uninstall() {
        $this->load->model('setting/setting');
        $this->load->model('extension/extension');

        $this->model_extension_extension->uninstall('oc_blog_category_menu', $this->request->get['extension']);
        $this->model_setting_setting->deleteSetting($this->request->get['extension']);
    }
}