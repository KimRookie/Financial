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
		sales = Integer.parseInt(request.getParameter("sales")); // �����
		Ownequity = Integer.parseInt(request.getParameter("Ownequity")); // �������ڻ�
		Ownequity2 = Integer.parseInt(request.getParameter("Ownequity2")); // ��������ڻ�
		result = fin.calInventoryTurnover(sales, Ownequity, Ownequity2);
	} catch (Exception e) {

	}
	if (result >= 100 || result <= 150) {
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
			<td>
			<a href="total_assets_turnover.html" class="detail">���ڻ�ȸ����</a>
			</td>
			<td rowspan="8">
				<h2>
					�����:
					<%=sales%><br><br>
					�������ڻ�:
					<%=Ownequity%><br> <br> ��������ڻ�:
					<%=Ownequity2%>
					<a href="inventory_turnover.html"><input type="button"
						value="����"></a> <br> <br> ����ڻ�ȸ������
					<%=result%>%�Դϴ�.
				</h2>
			</td>
		<tr>
			<td>
			<a href="inventory_turnover.html" class="detail">����ڻ�ȸ����</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="inventory_turnover_period.html" class="detail">����ڻ�ȸ���Ⱓ</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="payables_turnover.html" class="detail">����ä��ȸ����</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="payables_turnover_period.html" class="detail">����ä��ȸ���Ⱓ</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="receivables_turnover.html" class="detail">����ä��ȸ����</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="receivables_turnover_period.html" class="detail">����ä�����ȸ���Ⱓ</a>
			</td>
		</tr>
		<tr>
			<td>
			<a href="one_rotation_period.html" class="detail">1ȸ�� �����Ⱓ</a>
			</td>
		</tr>		
	</table>

</body>
</html>