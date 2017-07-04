<?php
// check if fields passed are empty
if(empty($_POST['foproduct'])  		||
   empty($_POST['foprice'])  		||
   empty($_POST['fomodel'])  		||
   empty($_POST['fostock'])  		||
   empty($_POST['name'])  		||
   empty($_POST['phone'])  		||
   empty($_POST['mail']) 		||
   empty($_POST['message'])	||
   !filter_var($_POST['mail'],FILTER_VALIDATE_EMAIL))
   {
	echo "No arguments Provided!";
	return false;
   }
	
$foprice = $_POST['foprice'];
$foproduct = $_POST['foproduct'];
$fomodel = $_POST['fomodel'];
$fostock = $_POST['fostock'];
$name = $_POST['name'];
$phone = $_POST['phone'];
$email_address = $_POST['emailcustomer'];
$message = $_POST['message'];

// create email body and send it	

$email_subject = "Быстрый заказ с Вашего магазина";
$email_body = "Вы получили новый заказ. \n\n".
				  " Товар: $foproduct \n ".
				  " Цена: $foprice \n ".
				  " $fomodel \n ".
				  " $fostock \n\n".
				  " Имя покупателя: $name \n ".
				  " Email покупателя: $emailcustomer \n ".
				  " Телефон покупателя: $phone \n ".
				  " Сообщение:\n $message";
$headers = "From: $email \n";
$headers .= "Reply-To: $email_address";	
mail($email,$email_subject,$email_body,$headers);
return true;			
?>