<?php


// check if fields passed are empty
if(empty($_POST['feedname'])  		||
   empty($_POST['feedphone'])  		||
   empty($_POST['feedmessage'])  	||
   !filter_var($_POST['feedemail'],FILTER_VALIDATE_EMAIL))
   {
	echo "No arguments Provided!";
	return false;
   }
	
$name = $_POST['feedname'];
$phone = $_POST['feedphone'];
$feedemail = $_POST['feedemail'];
$message = $_POST['feedmessage'];

// create email body and send it	

$email_subject = "Сообщение с Вашего магазина";
$email_body = "Детали: \n\n".
			" Имя покупателя: $name \n ".
			" Телефон покупателя: $phone \n ".
			" Сообщение: $message \n ";
$headers = "From: $feedemail \n";
$headers .= "Reply-To: $email";	
mail($email,$email_subject,$email_body,$headers);
return true;			
?>