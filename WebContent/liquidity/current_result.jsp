<%@page import="java.util.ArrayList"%>
<%@page import="choose_number.FinancialDB"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
//	request.setCharacterEncoding("EUC-KR");
	choose_number.Financial fin = new choose_number.Financial(); 
	double assets = 0;
	double liability = 0;
	double result = 0;
	String evaluation;
	ArrayList list = new ArrayList();
	int i = 0;
	try {
		//assets = Integer.parseInt(request.getParameter("assets")); // 유동자산
		//liability = Integer.parseInt(request.getParameter("liability")); // 유동부채
		assets = Double.parseDouble(request.getParameter("assets")); // 유동자산
		liability = Double.parseDouble(request.getParameter("liability")); // 유동부채
		////
		FinancialDB db = new FinancialDB();
		list = db.getAllStudent();
		////
		result = fin.calCurrentRatio(assets, liability);
		//result = Double.parseDouble(request.getParameter("assets")) / Double.parseDouble(request.getParameter("liability")) * 100; 
	} catch (Exception e) {

	}
	if (result >= 150) {
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
	<div>
	<table>
		<tr>
			<td><a href="current_ratio.html" class="detail">유동비율</a></td>		</tr>
		<tr>
			<td><a href="quick_ratio.html" class="detail">당좌비율</a></td>
		</tr>
	</table>
	</div>	
		<h2>
			유동자산:
			<%=assets%><br>
			<br> 유동부채:
			<%=liability%>
			<a href="current_ratio.html"><input type="button" value="재계산"></a>
			<br>
			<br> 유동비율은
			<%=result%>%입니다. 표준비율과 비교했을 때
			<%=evaluation%>합니다.
		</h2>
		
		
		<table>
		<%
			for(Object o : list)
			{ String[] data = (String[])o;
		%>
		<tr>
			<td><%= (++i) %></td><td><%=data[0] %></td><td><%=data[1] %></td><td><%=data[2] %></td>
		</tr>
		<%	}
		%>
		</table>
	
	
	
	
</body>
</html>