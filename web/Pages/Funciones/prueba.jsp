<%-- 
    Document   : prueba
    Created on : 22/10/2021, 10:26:46 AM
    Author     : milto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!--<script src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"> 
        </script>-->
        <script>
            $(function() {
                $('.error').hide();
                $(".button").click(function() {
                  // validate and process form here

                    $('.error').hide();
                    var name = $("input#name").val();
                    if (name === "") {
                        $("label#name_error").show();
                        $("input#name").focus();
                        return false;
                    }
                    var email = $("input#email").val();
                    if (email === "") {
                        $("label#email_error").show();
                        $("input#email").focus();
                        return false;
                    }
                    var phone = $("input#phone").val();
                    if (phone === "") {
                        $("label#phone_error").show();
                        $("input#phone").focus();
                        return false;
                    }
                    var dataString = 'name='+ name + '&email=' + email + '&phone=' + phone;
                    alert (dataString);return false;
                    $.ajax({
                        type: "POST",
                        url: "/CoronaTickets-Web/prueba",
                        data: dataString,
                        success: function() {
                            $('#contact_form').html("<div id='message'></div>");
                            $('#message').html("<h2>Contact Form Submitted!</h2>")
                            .append("<p>We will be in touch soon.</p>")
                            .hide()
                            .fadeIn(1500, function() {
                                $('#message').append("<img id='checkmark' src='images/check.png' />");
                            });
                        }
                    });
                    return false;
                });
            });
        </script>
        
    </head>
    <body>
        <div id="contact_form">
            <form name="contact" action="">
              <fieldset>
                <label for="name" id="name_label">Name</label>
                <input type="text" name="name" id="name" size="30" value="" class="text-input" />
                <label class="error" for="name" id="name_error">This field is required.</label>

                <label for="email" id="email_label">Return Email</label>
                <input type="text" name="email" id="email" size="30" value="" class="text-input" />
                <label class="error" for="email" id="email_error">This field is required.</label>

                <label for="phone" id="phone_label">Return Phone</label>
                <input type="text" name="phone" id="phone" size="30" value="" class="text-input" />
                <label class="error" for="phone" id="phone_error">This field is required.</label>

                  <br />
                <input type="submit" name="submit" class="button" id="submit_btn" value="Send" />
              </fieldset>
            </form>
        </div>
    </body>
</html>
