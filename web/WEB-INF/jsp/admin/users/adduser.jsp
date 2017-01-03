<%@include file="../header.jsp" %>
<% 
    
if(session.getAttribute("username")==null) 
{

response.sendRedirect("login.jsp");
}
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<h1>Add Users</h1>
<form:form modelAttribute="User" action="${SITE_URL}/admin/users/save" method="post" role="form" id="userForm">
    <div class="form-group">
        <label>First Name</label>
        <form:input path="firstName" placeholder="Enter name" required="required" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Last Name</label>
        <form:input path="lastName"  required="required" class="form-control"/>
    </div>
    
    <div class="form-group">
        <label>Email</label>
        <form:input path="email"  required="required" class="form-control"/>
    </div>
    
    <div class="form-group">
        <label>Username</label>
        <form:input path ="username" placeholder="Enter Username" required="required" class="form-control"/>
    </div>
    
      <div class="form-group">
        <label>Password</label>
        <form:input path ="password" type="password" required="required" class="form-control"/>
    </div>
    
    
   <label>Role</label>
                <form:select path="r_id" class="form-control">
                    <form:option value="0">Select</form:option>
                    <form:option value="1">Admin</form:option>
                    <<form:option value="2">User</form:option>
                </form:select>
 
    <form:hidden path="u_id"/>
    <div class="form-group"> 
    <button type="submit" class="btn btn-success" >Save</button>
    </div>
   <script>
      $.validator.setDefaults({
		submitHandler: function() {
			alert("submitted!");
		}
	});

	$(document).ready(function() {
		// validate the comment form when it is submitted
		//$("#customerForm").validate();

		// validate signup form on keyup and submit
		$("#userForm").validate({
			rules: {
				firstName: {
                                    required: true,
                                    lettersonly: true
                                },                                
				lastName: {
                                    required: true,
                                    lettersonly: true
                                },
				username: {
					required: true,
					minlength: 5,
                                        lettersonly: true
				},
				password: {
					required: true,
					minlength: 5,
                                        maxlength:20
				},
//				confirm_password: {
//					required: true,
//					minlength: 5,
//					equalTo: "#password"
//				},
				email: {
					required: true,
					email: true
				}
//				contactNo: {
//					required: true,
//                                        minlength:7,
//					maxlength: 10,
//                                        integer:true
//                                        
//				}
//				agree: "required"
			    },
			messages: {
				firstname:{ 
                                    required:"Please enter your firstname",
                                   lettersonly:"only letters"
                                    
                                },
                                
				lastname:{ 
                                    required:"Please enter your lastname",
                                    lettersonly:"only letters"
                                    
                                },
				username: {
					required: "Please enter a username",
					minlength: "Your username must consist of at least 5 characters",
                                        lettersonly:"only letters"
				},
				password: {
					required: "Please provide a password",
					minlength: "Your password must be at least 5 characters long"
				},
//				confirm_password: {
//					required: "Please provide a password",
//					minlength: "Your password must be at least 5 characters long",
//					equalTo: "Please enter the same password as above"
//				},
				email:{
                                    email:"Please enter a valid email address"
                                }
//				agree: "Please accept our policy",
//				topic: "Please select at least 2 topics"
//                                contactNo:{
//                                    integer:"Please enter only numbers"
//                                    minlength:"number should not be at least 10"
//                                }
			}
		}); 
            
        });
        
   </script>
</form:form>

<%@include  file="../footer.jsp" %>