<?php

class ControllerExtensionModuleCategorylist extends Controller {
	public function index($setting) {
	
		$this->load->model('tool/image');
		$this->load->language('extension/module/category_list');
		$this->load->model('catalog/category');
		$this->load->model('extension/module/category_list');

        $data['text_collections'] = $this->language->get('text_collections');

		$cat_info = $this->model_extension_module_category_list->getInfo();		
		$slider = array();
		global $config;

		foreach ($cat_info as $slide) {

			$href=array();		
			$category_result = $this->model_catalog_category->getCategory($slide['category_id']);
			$parent_id = $category_result['parent_id'];
			$href=array('self'=>$slide['category_id'],'parent0'=>$category_result['parent_id']);

			$i=1;
			while($parent_id!=0){

				$result = $this->model_catalog_category->getCategory($parent_id);
				$parent_id=$result['parent_id'];
				$href['parent'.$i]=$parent_id;
				$i++;
			}

			array_pop($href);	//remove parent 0
			$re_href= array_reverse($href);//reverse array
			$cat_href=NULL;
			$cat_href=implode('_', $re_href);//put' _ ' between 'id's
			//$cat_href="#";
			$slider[] = array('name'=>$category_result['name'],'href'=>$this->url->link('product/category', 'path=' . $cat_href),'image'=>$this->model_tool_image->cropsize($slide['image'], $this->config->get('category_list_width'),$this->config->get('category_list_width') ) );
			}
			$data['slider'] = $slider;
		    $data['heading_title_top_categories'] = $this->language->get('heading_title_top_categories');

			
		    return $this->load->view('extension/module/category_list', $data);		
			
			
		}
}	