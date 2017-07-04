<?php
// check if fields passed are empty
if(empty($_POST['callname'])  		||
   empty($_POST['callphone'])  		||
   empty($_POST['callmessage']))
   {
	echo "No arguments Provided!";
	return false;
   }
	
$name = $_POST['callname'];
$phone = $_POST['callphone'];
$message = $_POST['callmessage'];

// create email body and send it	

$email_subject = "Заказан обратный звонок с Вашего магазина";
$email_body = "Детали: \n\n".
			" Имя покупателя: $name \n ".
			" Телефон покупателя: $phone \n ".
			" Сообщение: $message \n ";
$headers = "From: $email \n";
$headers .= "Reply-To: $email";	
mail($email,$email_subject,$email_body,$headers);
return true;			
?>