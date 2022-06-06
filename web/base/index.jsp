<%--
  Created by IntelliJ IDEA.
  User: tian
  Date: 2022/5/28
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<base href="${ pageContext.request.scheme }://${ pageContext.request.serverName }:${ pageContext.request.serverPort }${ pageContext.request.contextPath }/">
<c:if test="${ not empty username }">
    <header class="app-header fixed-top">
        <div id="app-sidepanel" class="app-sidepanel">
            <div class="sidepanel-inner d-flex flex-column">
                <a href="#" id="sidepanel-close" class="sidepanel-close d-xl-none">&times;</a>
                <div class="app-branding">
                    <a class="app-logo" href="over/view.jsp">
                        <img class="logo-icon mr-2 rounded-circle" src="assets/images/app-logo.svg" alt="logo"><span
                            class="logo-text"> Management</span>
                    </a>
                </div>


                <nav id="app-nav-main" class="app-nav app-nav-main flex-grow-1">
                    <ul class="app-menu list-unstyled accordion" id="menu-accordion">
                        <c:forEach items="${ indexData }" var="item" varStatus="status">
                            <li class="nav-item">
                                <a class="nav-link ${ param.active == status.count? 'active': '' }" href="${ item[0] }">
                            <span class="nav-icon">
                                <jsp:include page="../assets/images/${ item[1] }"/>
                            </span>
                                    <span class="nav-link-text">${ item[2] }</span>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>

                <div class="app-sidepanel-footer">
                    <nav class="app-nav app-nav-footer">
                        <ul class="app-menu footer-menu list-unstyled">
                            <li class="nav-item">
                                <a class="nav-link ${ param.active == '4'? 'active': '' }" href="user/users.jsp">
                                <span class="nav-icon">
                                    <jsp:include page="../assets/images/user.svg.jsp"/>
                                </span>
                                    <span class="nav-link-text">用户中心</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
</c:if>
<c:if test="${ empty username }">
    <jsp:forward page="../login/loginView.jsp"/>
</c:if>