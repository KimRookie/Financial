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
		NetProfit = Integer.parseInt(request.getParameter("NetProfit")); // ��������
		Ownequity = Integer.parseInt(request.getParameter("Ownequity")); // �����
		Ownequity2 = Integer.parseInt(request.getParameter("Ownequity2")); // �����
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
	<h1>�繫���� System &nbsp;<a href="/Financial/Home.html"><img src="/Financial/home.jpg" width="40" height="40"></a></h1>
	<hr width="80%">
	<div class="area">
		<a href="/Financial/liquidity_ratio.html"><input type="submit"
			value="����������" class="item"></a> <a
			href="/Financial/leverage_ratio.html"><input type="submit"
			value="������������" class="item"></a> <a
			href="/Financial/stability_ratio.html"><input type="submit"
			value="����������" class="item"></a> <a
			href="/Financial/profitability_ratio.html"><input type="submit"
			value="���ͼ�����" class="item"></a> <a
			href="/Financial/activity_ratio.html"><input type="submit"
			value="Ȱ��������" class="item"></a> <a
			href="/Financial/growth_ratio.html"><input type="submit"
			value="���强����" class="item"></a>
	</div>
	<br>
	<br>
	<table>
		<tr>
			<td><a href="operating_income_to_sale.html" class="detail">����׿������ͷ�</a></td>
			<td rowspan="4">
				<h2>
					��������:<%=NetProfit%>
					<br> <br>
					 ���ڻ�(����):<%=Ownequity%>
					<br><br>
					���ڻ�(���):<%=Ownequity2%>
					<a href="ROE.html"><input type="button"	value="����"></a>
					<br> <br> 
					�ڱ��ں������ͷ�(ROE)�� <%=result%>%�Դϴ�.			
				</h2>
			</td>
		<tr>
			<td><a href="net_income_to_sale.html" class="detail">����׼����ͷ�</a></td>
		</tr>
		<tr>
			<td><a href="ROE.html" class="detail">�ڱ��ں������ͷ�(ROE)</a>></td>
		</tr>
		<tr>
			<td><a href="ROA.html" class="detail">���ڻ�����ͷ�(ROA)</a></td>
		</tr>
	</table>
</body>
</html>