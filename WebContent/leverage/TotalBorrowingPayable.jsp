<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//	request.setCharacterEncoding("EUC-KR");
	choose_number.Financial fin = new choose_number.Financial();
	int borrowings = 0;
	int debenture = 0;
	int longdebt = 0;
	int TotalAssets = 0;
	double result = 0;
	try {
		borrowings = Integer.parseInt(request.getParameter("borrowings")); // ��ܱ����Ա�
		debenture = Integer.parseInt(request.getParameter("debenture")); // ȸ��ä
		longdebt = Integer.parseInt(request.getParameter("longdebt")); // ����������ä
		TotalAssets = Integer.parseInt(request.getParameter("TotalAssets")); // ���ڻ�
		result = fin.calTotalBorrowingPayable(borrowings, debenture, longdebt, TotalAssets);
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
			<td><a href="debt_ratio.html" class="detail">��ä����</a>
					</td>
			<td rowspan="3">
				<h2>
					��ܱ����Ա�:
					<%=borrowings%><br> <br> 
					ȸ��ä:
					<%=debenture%><br> <br> 
					����������ä:
					<%=longdebt%><br> <br> 
					���ڻ�:
					<%=TotalAssets%>
					<a href="total_borrowing_payable.html"><input type="button"
						value="����"></a> <br> <br> ���Ա���������
					<%=result%>%�Դϴ�. ���Ա��������� �������� ȸ���� �������� ���ͼ��� �����ϴ�.
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