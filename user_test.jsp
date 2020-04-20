<%-- 
    Document   : index
    Created on : Apr 11, 2017, 9:13:12 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BandStar User Login!</title>
<link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<style type="text/css">
table, td, th
{
border:1px solid green;
font-family: 'Oxygen', sans-serif;
}
th
{
background-color:green;
color:white;
}
body
{
 text-align: center;
}
.container
{
 margin-left: auto;
 margin-right: auto;
 width: 40em;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    
     //Stops the submit request
    $("#myAjaxRequestForm").submit(function(e){
           e.preventDefault();
    });
   
    
     $("#showTable").click(function(event){
    
       
         //get the form data and then serialize that
        dataString = $("#myAjaxRequestForm").serialize();
           
        //get the form data using another method 
        var userId = $("input#userId").val(); 
        dataString = "userId=" + userId;
   
          //make the AJAX request, dataType is set to json
            //meaning we are expecting JSON data in response from the server
            $.ajax({
                type: "POST",
                url: "ValidateUser",
                data: dataString,
                dataType: "json",
      
                success: function(data,textStatus, jqXHR) {
                if( data.success ) {

                         $("#ajaxResponse").html("");
                         $("#ajaxResponse").append("<b>User Exists!<br/>");
                         $("#ajaxResponse").append("<b>First Name:</b> " + data.userInfo.firstName + "<br/>");
                         $("#ajaxResponse").append("<b>Last Name:</b> " + data.userInfo.lastName + "<br/>");
                         $("#ajaxResponse").append("<b>Phone:</b> " + data.userInfo.contactPhone + "<br/>");
                         $("#ajaxResponse").append("<b>Email:</b> " + data.userInfo.email + "<br/>");
                }
                else {
                         $("#ajaxResponse").html("");
                         $("#ajaxResponse").append("<b>User Exists!<br/>");
                }
  },
               
                //If there was no resonse from the server
                error: function(jqXHR, textStatus, errorThrown){
                     console.log("Something really bad happened " + textStatus);
                      $("#ajaxResponse").html(jqXHR.responseText);
                },
               
                //capture the request before it was sent to server
                beforeSend: function(jqXHR, settings){
                    //adding some Dummy data to the request
                    settings.data += "&dummyData=whatever";
                    //disable the button until we get the response
                    $('#showTable').attr("disabled", true);
                },
               
                //this is called after the response or error functions are finsihed
                //so that we can take some action
                complete: function(jqXHR, textStatus){
                    //enable the button 
                    $('#showTable').attr("disabled", false);
                }
     
            });        
    });

});


</script>
</head>
<body class="container">
<h1>Bandstar Sample User Login</h1>

   <form id="myAjaxRequestForm">
        <fieldset>
            <legend>jQuery Ajax Form data Submit Request</legend>

                <p>
                    <label for="userId">User Id</label><br />
                    <input id="userId" type="text" name="User Id" />
                </p>
                <p>
                    <input id="showTable" type="button" value="Login" />
                </p>
        </fieldset>
    </form>
  




<div id="anotherSection">
        <fieldset>
            <legend>User Details</legend>
                 <div id="ajaxResponse"></div>
        </fieldset>
    </div>   


</body>
</html>