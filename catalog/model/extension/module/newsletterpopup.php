<?php
class ModelExtensionModuleNewsletterpopup extends Model 
{ 
	
	public function getNewsletterpopupTitle(){
	
		$desc_array = array();
		$desc_array = $this->config->get('newsletterpopup_description');
		if(isset($desc_array[$this->config->get('config_language_id')]['title']))
		if($desc_array[$this->config->get('config_language_id')]['title']!='')
		return $desc_array[$this->config->get('config_language_id')]['title'];
		else return '';	

	} 

	public function getNewsletterpopupDescription(){
		
		$desc_array = array();
		$desc_array = $this->config->get('newsletterpopup_description');
		if(isset($desc_array[$this->config->get('config_language_id')]['description']))
		if($desc_array[$this->config->get('config_language_id')]['description']!='')
		return html_entity_decode($desc_array[$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');
		else return '';
	} 

	public function EmailSubmit($email) 
	{
		$query =  $this->db->query("SELECT email FROM " . DB_PREFIX . "newslettersubscription WHERE email = '".$this->db->escape($email)."' ");

		if($query->row) { return "Already Subscribed!!!";}
		
 		$this->db->query("INSERT INTO " . DB_PREFIX . "newslettersubscription SET email = '".$this->db->escape($email)."' , status = 1, create_time = NOW()");
		
		return "Thank you for your subscription.";
	}
}
?>