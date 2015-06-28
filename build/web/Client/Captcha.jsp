
<meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Contact Us</title>
    </head>
    <body>  
        <form action="" method="post" onsubmit="return checkform(this);">

            <label for="code" style="float:left; clear:both">Write code below > <span id="txtCaptchaDiv" style="color:#F00"></span><!-- this is where the script will place the generated code --> 
                <input type="hidden" id="txtCaptcha" /></label><!-- this is where the script will place a copy of the code for validation: this is a hidden field -->
            <input type="text" name="txtInput" id="txtInput" size="30" style="float:left; clear:both" /> 
        </form>

        <script type="text/javascript">
            //Generates the captcha function    
            var a = Math.ceil(Math.random() * 9)+ '';
            var b = Math.ceil(Math.random() * 9)+ '';       
            var c = Math.ceil(Math.random() * 9)+ '';  
            var d = Math.ceil(Math.random() * 9)+ '';  
            var e = Math.ceil(Math.random() * 9)+ '';  

            var code = a + b + c + d + e;
            document.getElementById("txtCaptcha").value = code;
            document.getElementById("txtCaptchaDiv").innerHTML = code;  
        </script>

        <script type="text/javascript">
            function checkform(theform){
                var why = "";

                if(theform.txtInput.value == ""){
                    why += "- Security code should not be empty.\n";
                }
                if(theform.txtInput.value != ""){
                    if(ValidCaptcha(theform.txtInput.value) == false){
                        why += "- Security code did not match.\n";
                    }
                }
                if(why != ""){
                    alert(why);
                    return false;
                }
            }

            // Validate the Entered input aganist the generated security code function   
            function ValidCaptcha(){
                var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
                var str2 = removeSpaces(document.getElementById('txtInput').value);
                if (str1 == str2){
                    return true;    
                }else{
                    return false;
                }
            }

            // Remove the spaces from the entered and generated code
            function removeSpaces(string){
                return string.split(' ').join('');
            }
        </script>
    </body>
</html><html><head></head><body></body></html>