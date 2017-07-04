<?php
class ControllerExtensionModuleBlogLatestArticles extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/blog_latest_articles');
        $this->load->model('blog/blog_category');
        $this->load->model('blog/article');

        //$this->document->addStyle('catalog/view/javascript/oc_blog/oc_blog.css');

		$data['heading_title'] = $this->language->get('heading_title');
        $data['button_read_more'] = $this->language->get('button_read_more');
        $data['view_all_news'] = $this->language->get('view_all_news');

        $data['href_all_news'] = $this->url->link('blog/blog_category', 'blog_path=6');

        $data['name'] = $setting['name'];
        $data['design'] = $setting['design'];

        $data['column'] = $setting['column'];

        $data['show'] = array(
            'date' => $setting['show_date'],
            'author' => $setting['show_author'],
            'view' => $setting['show_viewed'],
            'comment' => $setting['show_number_of_comments'],
            'category' => $setting['show_category'],
            'tag'=> $setting['show_tag']
        );
        
        $data['articles'] = array();

        foreach ($setting['blog_category'] as $blog_category_id) {

            $filter_data = array(
                'filter_blog_category_id' => $blog_category_id,
                'start'              => 0,
                'limit'              => $setting['limit'],
                'filter_sub_category' => $setting['include_sub_category']
            );

            $results = $this->model_blog_article->getArticles($filter_data);

            foreach ($results as $result) {
                $categories_result = $this->model_blog_article->getCategoriesWithName($result['article_id']);
                $categories = array();
                foreach ($categories_result as $category){
                    $categories[]=array(
                        'name' => $category['name'],
                        'href' => $this->url->link('blog/blog_category', 'blog_path=' . $category['blog_category_id'])
                    );
                }

                $tags=array();
                if ($result['tag']) {
                    $tags_result = explode(',', $result['tag']);
                    foreach ($tags_result as $tag) {
                        $tags[] = array(
                            'tag' => trim($tag),
                            'href' => $this->url->link('blog/blog', 'tag=' . trim($tag))
                        );
                    }
                }

                $this->load->model('tool/image');

                if ($result['image_main']) {
                    $image_main = $this->model_tool_image->cropsize($result['image_main'], $setting['width'], $setting['height']);
                } else {
                    $image_main = '';
                }

                $article_images = array();

                $images = $this->model_blog_article->getArticleImages($result['article_id']);


                if($images) {
                    foreach ($images as $image) {
                        $article_images[] = array(
                            'popup' => $this->model_tool_image->resize($image['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                            'thumb' => $this->model_tool_image->resize($image['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height')),
                            'main' => $this->model_tool_image->resize($image['image'], 952, 320)
                        );
                    }
                }


                $data['articles'][] = array(
                    'article_id'    => $result['article_id'],
                    'name'          => $result['name'],
                    'image_main'    => $image_main,
                    'images'        => $article_images,
                    'date' => date($this->language->get('date_format_custom'), strtotime($result['date_modified'])),
                    'author'        => $result['author'],
                    'viewed'        => $result['viewed'],
                    'comments'      => $result['comments'],
                    //'intro_text'    => strip_tags(html_entity_decode($result['intro_text'], ENT_QUOTES, 'UTF-8')),
                    'intro_text'    => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                    'href'          => $this->url->link('blog/article', 'article_id=' . $result['article_id']),
                    'categories'    => $categories,
                    'tags'          => $tags
                );
            }
        }
        
		return $this->load->view('extension/module/blog_latest_articles', $data);
	}
}