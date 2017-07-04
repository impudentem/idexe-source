<?php
class ControllerExtensionModuleBlogCategoryTabs extends Controller {
    public function index($setting) {
        $this->load->language('extension/module/blog_category_tabs');
        $this->load->model('blog/blog_category');
        $this->load->model('blog/article');

        $this->document->addStyle('catalog/view/javascript/easy_blog/easy_blog.css');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['button_read_more'] = $this->language->get('button_read_more');
        $data['button_view_all'] = $this->language->get('button_view_all');
        $data['view_all'] = $this->url->link('blog/blog_category', 'blog_path=2');
        $data['name'] = $setting['name'];

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

        $data['blog_categories'] = array();

        foreach($setting['blog_category'] as $blog_category_id) {

            $blog_category_info = $this->model_blog_blog_category->getBlogCategory($blog_category_id);

            if($blog_category_info) {
                $data['blog_categories'][] = array(
                    'blog_category_id'    => $blog_category_info['blog_category_id'],
                    'name'          => $blog_category_info['name'],
                    'href' => $this->url->link('blog/blog_category', 'blog_path=' . $blog_category_info['blog_category_id'])
                );
            }



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

                foreach ($images as $image) {
                    $article_images[] = array(
                        'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                        'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height')),
                        'main' => $this->model_tool_image->resize($image['image'], 952, 320)
                    );
                }

                $data['articles'][] = array(
                    'article_id'    => $result['article_id'],
                    'blog_category_id'    => $blog_category_id,
                    'name'          => $result['name'],
                    'image_main'    => $image_main,
                    'images'        => $article_images,
                    'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
                    'author'        => $result['author'],
                    'viewed'        => $result['viewed'],
                    'comments'      => $result['comments'],
                    'intro_text'    => html_entity_decode($result['intro_text'], ENT_QUOTES, 'UTF-8'),
                    'href'          => $this->url->link('blog/article', 'article_id=' . $result['article_id']),
                    'categories'    => $categories,
                    'tags'          => $tags
                );
            }
        }

        return $this->load->view('extension/module/blog_category_tabs', $data);

    }
}