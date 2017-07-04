<section class="subscribe-section">
    <div class="subsribe-container form-inline clearfix">
        <div class="form-group">
            <label for="subscriber_email" class="subscribe-label"><?php echo $text_newsletter; ?></label>
            <input type="email" name="subscriber_email" id="subscriber_email" class="form-control email-subscribe" placeholder="<?php echo $text_your_email; ?>">
            <button type="submit" type="button" name="submit_newsletter" id="submit_newsletter" onclick="return MgkEmailValidation()" class="subscribe-button"><?php echo $text_newsletter_subscribe;?></button>
            <p id="subscriber_content" class="alert-success"></p>
        </div>
    </div>
</section>

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