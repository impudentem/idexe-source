<?php
class ModelExtensionModuleCategoryList extends Model {
	public function getInfo() {
		$category_list_data = array();
		$category_list_data_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE  `key` LIKE  'category_list_module'");
        $info = $category_list_data_query->rows;
        if($info){ 
        //$categoryslider = unserialize($info[0]['value']);
        $categoryslider = json_decode($info[0]['value'], true);
		foreach ($categoryslider as $categoryslider_image) {
			$category_list_data[] = array(
				'category_id'                   => $categoryslider_image['category_id'],
				'image'                         => $categoryslider_image['image'],
			);
		}
		return $category_list_data;
	}else { return 0; }
	}
}?>