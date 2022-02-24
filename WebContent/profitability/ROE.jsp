<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//	request.setCharacterEncoding("EUC-KR");
	choose_number.Financial fin = new choose_number.Financial();
	int NetProfit = 0;
	int Ownequity = 0;
	int Ownequity2 = 0;
	double result = 0;
	String evaluation;
	try {
		NetProfit = Integer.parseInt(request.getParameter("NetProfit")); // 영업이익
		Ownequity = Integer.parseInt(request.getParameter("Ownequity")); // 매출액
		Ownequity2 = Integer.parseInt(request.getParameter("Ownequity2")); // 매출액
		result = fin.calROE(NetProfit, Ownequity, Ownequity2);
	} catch (Exception e) {

	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Financial/mycss.css">
</head>
<body>
	<h1>재무관리 System &nbsp;<a href="/Financial/Home.html"><img src="/Financial/home.jpg" width="40" height="40"></a></h1>
	<hr width="80%">
	<div class="area">
		<a href="/Financial/liquidity_ratio.html"><input type="submit"
			value="유동성비율" class="item"></a> <a
			href="/Financial/leverage_ratio.html"><input type="submit"
			value="레버리지비율" class="item"></a> <a
			href="/Financial/stability_ratio.html"><input type="submit"
			value="안정성비율" class="item"></a> <a
			href="/Financial/profitability_ratio.html"><input type="submit"
			value="수익성비율" class="item"></a> <a
			href="/Financial/activity_ratio.html"><input type="submit"
			value="활동성비율" class="item"></a> <a
			href="/Financial/growth_ratio.html"><input type="submit"
			value="성장성비율" class="item"></a>
	</div>
	<br>
	<br>
	<table>
		<tr>
			<td><a href="operating_income_to_sale.html" class="detail">매출액영업이익률</a></td>
			<td rowspan="4">
				<h2>
					당기순이익:<%=NetProfit%>
					<br> <br>
					 총자산(전기):<%=Ownequity%>
					<br><br>
					총자산(당기):<%=Ownequity2%>
					<a href="ROE.html"><input type="button"	value="재계산"></a>
					<br> <br> 
					자기자본순이익률(ROE)는 <%=result%>%입니다.			
				</h2>
			</td>
		<tr>
			<td><a href="net_income_to_sale.html" class="detail">매출액순이익률</a></td>
		</tr>
		<tr>
			<td><a href="ROE.html" class="detail">자기자본순이익률(ROE)</a>></td>
		</tr>
		<tr>
			<td><a href="ROA.html" class="detail">총자산순이익률(ROA)</a></td>
		</tr>
	</table>
</body>
</html>