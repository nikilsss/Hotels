<%@include file="../header.jsp" %>
<% 
    
if(session.getAttribute("username")==null) 
{

response.sendRedirect("login.jsp");
}
%>
   
<h1>Booking</h1>
        <div class="pull-right">
                <p>
                <a href="${SITE_URL}/admin/booking/add" class="btn btn-primary" title="Add User"/>
                <span class="glyphicon glyphicon-plus"></span>
                </a>
                </p>
        </div>
        <table class="table table-bordered table-hover table-striped">
            <tr>
            <td>Id</td>
            <td>First Name</td>
            <td>Last Name</td>
            <td>Room Id</td>
            <td>Room Price</td>
            <td>Room Number</td>
            <td>Room Type</td>
            <td>CheckIn</td>
            <td>Total Nights</td>
            <td>Check outDate</td>
            <td>Booked By</td>
            <td>Total Price</td>
            
            <td>Status</td>
            <td>Action</td>
            </tr>
            <c:forEach var="booking" items="${Booking}">
                <tr>
                <td>${booking.bId}</td>
                <td>${booking.firstName}</td>
                <td>${booking.lastName}</td>
                <td>${booking.getRoom().getRo_id()}</td>
                <td>${booking.getRoom().getRoomPrice()}</td>
                <td>${booking.getRoom().getRoomNumber ()}</td>
                <td>${booking.getRoom().getRoomType()}</td>
                <td>${booking.checkinDate}</td>
                <td>${booking.totalNights}</td>
                <td>${booking.checkoutDate}</td>
                <td>${booking.getCustomer().getC_id()}</td>
                <td>${booking.totalPrice}</td>
               
                <td>${booking.status}</td>
                <td>
                    <a href="${SITE_URL}/admin/booking/edit/${booking.bId}" class="btn btn-success" >
                        <span class="glyphicon glyphicon-pencil"></span>
                    </a>
                    <a href="${SITE_URL}/admin/booking/delete/${booking.bId}" class="btn btn-danger"  onclick=" return confirm('Are you sure to Delete')">
                        <span class="glyphicon glyphicon-trash"></span>
                    </a>
                        <a href="${SITE_URL}/admin/checkin/"  class="btn btn-success" onclick=" return confirm('Are you sure to checkin')">
                        <span class="glyphicon glyphicon-home"></span>
                    </a>
                        
                </td>
                </tr>
            </c:forEach>
        </table>
        <%@include  file="../footer.jsp" %>
