<%-- 
    Document   : orderinfo
    Created on : Nov 12, 2019, 4:20:59 PM
    Author     : DuongDT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Order Information</h1>
        
        <form action="change">
        <h3>Order ID: ${order.orderId}</h3>
        <input type="text" name ="orderId" value="${order.orderId}" hidden>
        <h3>Order Date: ${order.orderDate}</h3>
        <h3>Order Address: ${order.address}</h3>    
        <h3>Status</h3> <select name="status" onchange="disable()" id="s">
                    <option value="3">Cancel</option>
                    <option value="2">Not Yet</option>
                    <option value="1">Successful</option>
                    
                </select>
        
        <p id="myP" hidden>Received Date</p>
                <input type="type" name="receivedDate" value="" id="hidden_div" disabled="disabled">
            
            <p><input type="submit" value="Change">
        </form>
            
        <script>
                function disable(){
                    let s = document.getElementById("s").value;
                    
                    if(s === "1"){
                       
                        document.getElementById("hidden_div").disabled = false;
                       document.getElementById("myP").style.visibility = "visible";
                    }
                    else
                        document.getElementById("hidden_div").disabled = true;
                        
                }
        </script>
    </body>
</html>
