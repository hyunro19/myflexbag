<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div id="orderdetailcontainer">
    <h1>주문이 완료되었습니다 !</h1>
    <br>
    <h2>주문 정보</h2>

    <div id="container_box">
        <div>
        <table border="1" class="table">
        <thead>
            <tr><th>주문번호</th><th>주문자</th><th>수령인</th><th>주소</th><th>연락처</th><th>가격</th></tr>      
        </thead>
        
        <tbody>
        <tr>
                <td align="center">${ordervo.orderno}</td>
                <td>${ordervo.userid}</td>
                <td>${ordervo.receiver}</td>
                <td>${ordervo.address}</td>
                <td>${ordervo.orderphon}</td>
                <td><fmt:formatNumber pattern="###,###,###" value="${ordervo.pricesum}" /> 원</td>
        </tr>
        </tbody>
        </table>

        </div>
    </div> <br>

    <h3>주문 상세 내역</h3>

    <div>
        <table border="1">
            <thead>
                <tr><th>상품명</th><th>개당 가격</th><th>구입 수량</th><th>최종 가격</th>      
            </thead>
            <tbody>
                <c:forEach items="${odlist}" var="oditem">
                    <tr>
                        <td align="center">${oditem.pid}</td>
                        <td><fmt:formatNumber pattern="###,###,###" value="${oditem.unitprice}" /> 원</td>
                        <td>${oditem.quantity} 개</td>
                        <td><fmt:formatNumber pattern="###,###,###" value="${oditem.mprice}" /> 원</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <div class="centermain">
            <button type="button" class="tomain_btn">메인페이지로</button>
        </div>
        <script>
            $(".tomain_btn").click(function() {
                location.href = "/myflexbag/"
            });
        </script>
    </div>

</div>