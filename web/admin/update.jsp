<%-- 
    Document   : update
    Created on : Nov 5, 2019, 9:02:28 PM
    Author     : Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update products</h1>
        <c:if test="${not empty error}">
            <p>${error}
        </c:if>    
        <form action="getupdate" method="GET">
            
            <p>Product id <input type="text" name="id" value="${product.id}" readonly="">
            <p>Enter name <input type="text" name="name" value="${product.name}">
            <p>Enter description <input type="text" name="des" value="${product.description}">
            <p>Enter price <input type="text" name="price" value="${product.price}">
            <p>Image (Source) <input type="text" name="image" value="${product.src}">      
            <p>Type of products <input type="text" name="type" value="${product.type}" readonly="">
            <p>Brand of product <select name="brand" onchange="disable()" id="s">
                    <option value="apple" ${product.brand.equals("apple") ? "selected" : ""}>Apple</option>
                    <option value="samsung" ${product.brand.equals("samsung") ? "selected" : ""}>Samsung</option>
                    <option value="oppo" ${product.brand.equals("oppo") ? "selected" : ""}>Oppo</option>
                    <option value="sony" ${product.brand.equals("sony") ? "selected" : ""}>Sony</option>
                    <option value="jbl" ${product.brand.equals("jbl") ? "selected" : ""}>Jbl</option>
                    <option value="easaver" ${product.brand.equals("easaver") ? "selected" : ""}>Easaver</option>
                    <option value="energizer" ${product.brand.equals("energizer") ? "selected" : ""}>Energizer</option>
                    <option value="ava" ${product.brand.equals("ava") ? "selected" : ""}>Ava</option>
                    <option value="anker" ${product.brand.equals("anker") ? "selected" : ""}>Anker</option>
                    <option value="1">Other</option>
                </select>
                <input type="type" name="brand2" value="" id="hidden_div" disabled="disabled">
            
            <p><input type="submit" value="Update">
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
