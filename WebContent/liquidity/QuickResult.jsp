<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
//	request.setCharacterEncoding("EUC-KR");
	choose_number.Financial fin = new choose_number.Financial(); 
	int assets = 0;
	int liability = 0;
	int InventoryAssetsint = 0;
	double result = 0;
	String evaluation;
	try {
		assets = Integer.parseInt(request.getParameter("assets")); // 유동자산
		InventoryAssetsint = Integer.parseInt(request.getParameter("InventoryAssetsint")); // 재고자산
		liability = Integer.parseInt(request.getParameter("liability")); // 유동부채
		result = fin.calQuickRatio(assets, InventoryAssetsint, liability);
	} catch (Exception e) {

	}
	if (result >= 100) {
		evaluation = "양호";
	} else {
		evaluation = "미흡";
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
			<td><a href="current_ratio.html" class="detail">유동비율</a></td>
			<td rowspan="2">
				<h2>
					유동자산:
					<%=assets%><br>
					<br>
					재고자산:<%=InventoryAssetsint %> 
					<br><br>
					유동부채:
					<%=liability%>
					<a href="quick_ratio.html"><input type="button" value="재계산"></a>
					<br>
					<br> 당좌비율은
					<%=result%>%입니다. 표준비율과 비교했을 때
					<%=evaluation%>합니다.
				</h2>
			</td>
		</tr>
		<tr>
			<td><a href="quick_ratio.html" class="detail">당좌비율</a></td>
		</tr>
	</table>
</body>
</html>