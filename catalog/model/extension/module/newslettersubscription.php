<?php
class ModelExtensionModuleNewslettersubscription extends Model 
{ 
	public function EmailSubmit($email) 
	{
		$query =  $this->db->query("SELECT email FROM " . DB_PREFIX . "newslettersubscription WHERE email = '".$this->db->escape($email)."' ");

        $this->language->load('extension/module/newslettersubscription');

        if($query->row) { return $this->language->get('text_already_subscribed');}
		
 		$this->db->query("INSERT INTO " . DB_PREFIX . "newslettersubscription SET email = '".$this->db->escape($email)."' , status = 1, create_time = NOW()");

        return $this->language->get('text_thank_subscription');
	}
}
?>