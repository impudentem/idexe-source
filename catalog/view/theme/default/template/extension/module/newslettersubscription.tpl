<input  type="text" name="subscriber_email" id="subscriber_email" value="" placeholder="Enter Your Email" class="form-control input-text required-entry validate-email" />
<button class="button subscribe" type="button" name="submit_newsletter" id="submit_newsletter" onclick="return MgkEmailValidation()" ><span><?php echo $text_newsletter_subscribe;?></span></button>
<p id="subscriber_content" class="required"></p>

<script language="javascript">
function MgkEmailValidation(mail)   
{  
	subscribemail = document.getElementById("subscriber_email").value;
	var emailRegEx = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i;
	if (subscribemail != '') { 

	    if ( subscribemail.search(emailRegEx)!=-1 ) {  
		    

		    email = document.getElementById("subscriber_email").value;
		    var xmlhttp;
		    if (window.XMLHttpRequest){
			    xmlhttp=new XMLHttpRequest();
		    }else{
			    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		    }
		    
		    xmlhttp.onreadystatechange=function() {
			    if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				    document.getElementById("subscriber_content").innerHTML=xmlhttp.responseText;
			    }
		    }
		    xmlhttp.open("GET","index.php?route=extension/module/newslettersubscription/addsubscriberemail&email="+email,true);
		    xmlhttp.send();
		    return (true) ; 
	  }  
		  document.getElementById("subscriber_content").innerHTML="Please enter an email address.";
		  return (false); 
	}
		document.getElementById("subscriber_content").innerHTML="This is a required field.";
		return false;
}  
</script>