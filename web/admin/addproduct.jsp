<%-- 
    Document   : addproduct
    Created on : Nov 4, 2019, 1:45:36 AM
    Author     : Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add products</h1>
        <c:if test="${not empty error}">
            <p>${error}
            </c:if>
        <form action="addproduct" method="GET">
            <p>Enter name <input type="text" name="name" value="">
            <p>Enter description <input type="text" name="des" value="">
            <p>Enter price <input type="text" name="price" value="">
            <p>Image (Source) <input type="text" name="image" value="">      
            <p>Type of products <select name="type">
                    <option value="cellphone">Cell phone</option>
                    <option value="earphone">Earphone</option>
                    <option value="speaker">Speaker</option>
                    <option value="powerbank">Power bank</option>
                    <option value="screenstickers">Screen stickers</option>
                    <option value="cable-charger">Cable Charger</option>
                    <option value="case">Case</option>
                </select>
            <p>Brand of product <select name="brand" onchange="disable()" id="s">
                    <option value="apple">Apple</option>
                    <option value="samsung">Samsung</option>
                    <option value="oppo">Oppo</option>
                    <option value="sony">Sony</option>
                    <option value="jbl">Jbl</option>
                    <option value="easaver">Easaver</option>
                    <option value="energizer">Energizer</option>
                    <option value="ava">Ava</option>
                    <option value="anker">Anker</option>
                    <option value="1">Other</option>
                </select>
                <input type="type" name="brand2" value="" id="hidden_div" disabled="disabled">
            
            <p>Number <input type="text" name="number" value="">
            <p><input type="submit" name="add" value="Add">
        </form>
            
        <script>
                function disable(){
                    let s = document.getElementById("s").value;
                    if(s === "1"){
                        document.getElementById("hidden_div").disabled = false;
                    }
                    else
                        document.getElementById("hidden_div").disabled = true;
                }
        </script>
    </body>

</html>
