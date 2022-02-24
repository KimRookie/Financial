<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
//	request.setCharacterEncoding("EUC-KR");
	choose_number.Financial fin = new choose_number.Financial(); 
	int FixedAssets = 0;
	int FixedDebt = 0;
	int Ownequity = 0;
	double result = 0;
	String evaluation;
	try {
		FixedAssets = Integer.parseInt(request.getParameter("FixedAssets")); // 비유동자산
		FixedDebt = Integer.parseInt(request.getParameter("FixedDebt")); // 비유동부채
		Ownequity = Integer.parseInt(request.getParameter("Ownequity")); // 자기자본
		result = fin.calFixedAssetToLongTermCapital(FixedAssets, FixedDebt, Ownequity);
	} catch (Exception e) {

	}
	if (result <= 100) {
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
			<td><a href="fixed_ratio.html" class="detail">비유동(고정)비율</a></td>
			<td rowspan="2">
				<h2>
					비유동자산:
					<%=FixedAssets%><br>
					<br>
					비유동부채:
					<%=FixedDebt%><br>
					<br>
					자기자본:<%=Ownequity %>	
					<a href="fixed_asset_to_long_term_capital.html"><input type="button" value="재계산"></a>
					<br>
					<br> 비유동비율은 <%=result%>%입니다. 
					표준비율과 비교했을 때	<%=evaluation%>합니다.
				</h2>
			</td>
		</tr>
		<tr>
			<td><a href="fixed_asset_to_long_term_capital.html" class="detail">비유동(고정)장기적합률</a></td>
		</tr>
	</table>
</body>
</html>