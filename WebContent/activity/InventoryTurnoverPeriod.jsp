<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
//	request.setCharacterEncoding("EUC-KR");
	choose_number.Financial fin = new choose_number.Financial(); 
	int FixedAssets = 0;
	int equity = 0;
	double result = 0;
	String evaluation;
	try {
		FixedAssets = Integer.parseInt(request.getParameter("FixedAssets")); // �������ڻ�
		equity = Integer.parseInt(request.getParameter("equity")); // �ڱ��ں�
		//result = fin.calInventoryTurnover(sales, Ownequity, Ownequity2);
	} catch (Exception e) {

	}
	if (result <= 100) {
		evaluation = "��ȣ";
	} else {
		evaluation = "����";
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
	<h1>�繫���� System</h1>
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
			<td><a href="fixed_ratio.html"><input type="submit"
					value="������(����)����" class="detail"></a></td>
			<td rowspan="2">
				<h2>
					�������ڻ�:
					<%=FixedAssets%><br>
					<br>
					�ڱ��ں�:<%=equity %>	
					<a href="fixed_ratio.html"><input type="button" value="����"></a>
					<br>
					<br> ������������ <%=result%>%�Դϴ�. 
					ǥ�غ����� ������ ��	<%=evaluation%>�մϴ�.
				</h2>
			</td>
		</tr>
		<tr>
			<td><a href="fixed_asset_to_long_term_capital.html"><input type="submit"
					value="������(����)������շ�" class="detail"></a></td>
		</tr>
	</table>
</body>
</html>