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
		//assets = Integer.parseInt(request.getParameter("assets")); // �����ڻ�
		//liability = Integer.parseInt(request.getParameter("liability")); // ������ä
		assets = Double.parseDouble(request.getParameter("assets")); // �����ڻ�
		liability = Double.parseDouble(request.getParameter("liability")); // ������ä
		////
		FinancialDB db = new FinancialDB();
		list = db.getAllStudent();
		////
		result = fin.calCurrentRatio(assets, liability);
		//result = Double.parseDouble(request.getParameter("assets")) / Double.parseDouble(request.getParameter("liability")) * 100; 
	} catch (Exception e) {

	}
	if (result >= 150) {
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
	<div>
	<table>
		<tr>
			<td><a href="current_ratio.html" class="detail">��������</a></td>		</tr>
		<tr>
			<td><a href="quick_ratio.html" class="detail">���º���</a></td>
		</tr>
	</table>
	</div>	
		<h2>
			�����ڻ�:
			<%=assets%><br>
			<br> ������ä:
			<%=liability%>
			<a href="current_ratio.html"><input type="button" value="����"></a>
			<br>
			<br> ����������
			<%=result%>%�Դϴ�. ǥ�غ����� ������ ��
			<%=evaluation%>�մϴ�.
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