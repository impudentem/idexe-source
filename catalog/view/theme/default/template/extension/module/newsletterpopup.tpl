<!-- <div class="popup1" id="myModal"> -->
<div class="popup1" id="myModal" tabindex="-1" role="dialog">
   <?php if(isset($newsletterpopup_bg_image)) { ?>
  <div class="newsletter-sign-box" style="background: url(<?php echo $newsletterpopup_bg_image; ?>) no-repeat center left #f8f8f8">
  <?php } else { ?>
  <div class="newsletter-sign-box">
  <?php } ?>
    <div class="newsletter"> 
       <button type="button" class="x" data-dismiss="modal" aria-label="Close"><img src="catalog/view/theme/<?php echo $magik_theme ?>/image/f-box-close-icon.png" alt="close" class="x" id="x"></button>
      <div id="formSuccess1" style="display:none;">Thank you for your subscription.</div>
      <div class="email-form">
        
        <h3><?php if(isset($newsletterpopup_title)){ echo $newsletterpopup_title;}?></h3>  
        <div class="starSeparator">
            <div class="line-left"></div>
            <div class="star"></div>
            <div class="line-right"></div>
          </div>
        <h5><?php if(isset($newsletterpopup_description)) echo $newsletterpopup_description;?></h5>
        <div class="newsletter-form">
          <div class="input-box">
            <p id="subscriber_content_popup"></p>
               <input  type="text" name="subscriber_email_popup" id="subscriber_email_popup" value="" placeholder="Enter your email address" class="input-text required-entry validate-email" />
           
            <button class="button subscribe" type="submit" name="submit_newsletter_popup" id="submit_newsletter_popup" onclick="return MgkEmailValidation_popup()" ><span><?php echo $text_subscribe; ?></span></button>
            <img src="catalog/view/theme/<?php echo $magik_theme ?>/image/loading.gif" alt="Loading" id="loader1" style="display:none;margin-left:120px;margin-top:10px;"> </div>
          <!--input-box--> 
        </div>
        <!--newsletter-form-->
        <label class="subscribe-bottom">
          <input name="notshowpopup" id="notshowpopup" type="checkbox">
          <?php echo $text_dont_show; ?></label>
      </div>
    </div>
    
    <!--newsletter--> 
    
  </div>
  <!--newsletter-sign-box--> 
</div>

<script type="text/javascript">
$(document).ready(function(){
    if (localStorage.getItem("disp_mgknewsletter") === null || localStorage.getItem("disp_mgknewsletter")=='show') {
        $('#myModal').modal('show');
            $('#notshowpopup').click(function(){
                if($("#notshowpopup").is(':checked')){
                localStorage.setItem('disp_mgknewsletter', 'hide');
                }
                else
                {
                 localStorage.setItem('disp_mgknewsletter', 'show');
                }

                
            });
        }
});
</script>
<script language="javascript">
function MgkEmailValidation_popup(mail)   
{  
  subscribemail = document.getElementById("subscriber_email_popup").value;
  var emailRegEx = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i;
  if (subscribemail != '') { 

      if ( subscribemail.search(emailRegEx)!=-1 ) {  
        

        email = document.getElementById("subscriber_email_popup").value;
        var xmlhttp;
        if (window.XMLHttpRequest){
          xmlhttp=new XMLHttpRequest();
        }else{
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        
        xmlhttp.onreadystatechange=function() {
          if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            document.getElementById("subscriber_content_popup").innerHTML=xmlhttp.responseText;
          }
        }
        xmlhttp.open("GET","index.php?route=extension/module/newslettersubscription/addsubscriberemail&email="+email,true);
        xmlhttp.send();
        return (true) ; 
    }  
      document.getElementById("subscriber_content_popup").innerHTML="Please enter an email address.";
      return (false); 
  }
    document.getElementById("subscriber_content_popup").innerHTML="This is a required field.";
    return false;
}  
</script>