<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//	request.setCharacterEncoding("EUC-KR");
	choose_number.Financial fin = new choose_number.Financial();
	int TotalDebt = 0;
	int TotalCapital = 0;
	double result = 0;
	String evaluation;
	try {
		TotalDebt = Integer.parseInt(request.getParameter("TotalDebt")); // ��ä�Ѱ�
		TotalCapital = Integer.parseInt(request.getParameter("TotalCapital")); // �ں��Ѱ�
		result = fin.calDebtRatio(TotalDebt, TotalCapital);
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
			<td><a href="debt_ratio.html" class="detail">��ä����</a>
					</td>
			<td rowspan="3">
				<h2>
					��ä�Ѱ�:
					<%=TotalDebt%><br> <br> �ں��Ѱ�:
					<%=TotalCapital%>
					<a href="debt_ratio.html"><input type="button"
						value="����"></a> <br> <br> ��ä������
					<%=result%>%�Դϴ�. ǥ�غ����� ������ ��
					<%=evaluation%>�մϴ�.
				</h2>
			</td>
		</tr>
		<tr>
			<td><a href="total_borrowing_payable.html" class="detail">���Ա�������</a>
					</td>
		</tr>
		<tr>
			<td><a href="interest_earned_ratio.html" class="detail">���ں������</a>
					</td>
		</tr>
	</table>
</body>
</html>