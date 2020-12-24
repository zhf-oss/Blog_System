<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 分页 -->
<c:if test="${pageCode!=null}">
    <nav class="pagination" id="pagination">
            ${pageCode }
    </nav>
</c:if>


