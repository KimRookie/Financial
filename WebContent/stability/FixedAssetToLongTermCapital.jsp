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
		FixedAssets = Integer.parseInt(request.getParameter("FixedAssets")); // �������ڻ�
		FixedDebt = Integer.parseInt(request.getParameter("FixedDebt")); // ��������ä
		Ownequity = Integer.parseInt(request.getParameter("Ownequity")); // �ڱ��ں�
		result = fin.calFixedAssetToLongTermCapital(FixedAssets, FixedDebt, Ownequity);
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
			<td><a href="fixed_ratio.html" class="detail">������(����)����</a></td>
			<td rowspan="2">
				<h2>
					�������ڻ�:
					<%=FixedAssets%><br>
					<br>
					��������ä:
					<%=FixedDebt%><br>
					<br>
					�ڱ��ں�:<%=Ownequity %>	
					<a href="fixed_asset_to_long_term_capital.html"><input type="button" value="����"></a>
					<br>
					<br> ������������ <%=result%>%�Դϴ�. 
					ǥ�غ����� ������ ��	<%=evaluation%>�մϴ�.
				</h2>
			</td>
		</tr>
		<tr>
			<td><a href="fixed_asset_to_long_term_capital.html" class="detail">������(����)������շ�</a></td>
		</tr>
	</table>
</body>
</html>