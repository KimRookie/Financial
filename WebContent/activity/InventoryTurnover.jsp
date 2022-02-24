<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//	request.setCharacterEncoding("EUC-KR");
	choose_number.Financial fin = new choose_number.Financial();
	int sales = 0;
	int Ownequity = 0;
	int Ownequity2 = 0;
	double result = 0;
	String evaluation;
	try {
		sales = Integer.parseInt(request.getParameter("sales")); // 매출액
		Ownequity = Integer.parseInt(request.getParameter("Ownequity")); // 당기재고자산
		Ownequity2 = Integer.parseInt(request.getParameter("Ownequity2")); // 전기재고자산
		result = fin.calInventoryTurnover(sales, Ownequity, Ownequity2);
	} catch (Exception e) {

	}
	if (result >= 100 || result <= 150) {
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
			<td>
			<a href="total_assets_turnover.html" class="detail">총자산회전율</a>
			</td>
			<td rowspan="8">
				<h2>
					매출액:
					<%=sales%><br><br>
					당기재고자산:
					<%=Ownequity%><br> <br> 전기재고자산:
					<%=Ownequity2%>
					<a href="inventory_turnover.html"><input type="button"
						value="재계산"></a> <br> <br> 재고자산회전율은
					<%=result%>%입니다.
				</h2>
			</td>
		<tr>
			<td>
			<a href="inventory_turnover.html" class="detail">재고자산회전율</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="inventory_turnover_period.html" class="detail">재고자산회전기간</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="payables_turnover.html" class="detail">매출채권회전율</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="payables_turnover_period.html" class="detail">매출채권회전기간</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="receivables_turnover.html" class="detail">매입채무회전율</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="receivables_turnover_period.html" class="detail">매입채무평균회수기간</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="one_rotation_period.html" class="detail">1회전 운전기간</a>
			</td>
		</tr>		
	</table>

</body>
</html>