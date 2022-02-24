package choose_number;


import java.util.ArrayList;
import java.util.Scanner;

public class Financial {

	double resultCurrentRatio;	
	double resultQuickRatio;
	double resultDebtRatio;
	double resultTotalBorrowingPayable;
	double resultInterestEarnedRatio;
	double resultFixedRatio;
	double resultFixedAssetToLongTermCapital;
	double resultOperatingIncomeToSale;
	double resultNetIncomeToSale;
	double resultROE;
	double resultROA;
	double resultTotalAssetsTurnover;
	double resultInventoryTurnover;
	String resultInventoryTurnoverPeriod;
	double resultPayablesTurnover;
	double resultPayablesTurnoverPeriod;
	double resultReceivablesTurnover;
	double resultReceivablesTurnoverPeriod;
	double resultOneRotationPeriod;
	double resultNetSalesGrowth;
	double resultCapitalGrowth;
	double resultNetIncomeGrowth;
	String InventoryTurnoverPeriod;
	double PayablesTurnoverPeriod;
	double ReceivablesTurnoverPeriod;
	private double CurrentRatio;

//	public int calCurrentRatio(int assets, int liability) {	//유동비율
//		resultCurrentRatio = ((double)Math.round(assets / liability * 10000) /100);		
//		return (int) Math.round(calCurrentRatio((double)assets, liability));		
//	}
//	/**
//	 * Over-loading...
//	 * @param assets
//	 * @param liability
//	 * @return
//	 */
//	public double calCurrentRatio(double assets, double liability) {	//유동비율
//		resultCurrentRatio = assets / liability * 100;		
//		return resultCurrentRatio;		
//	}
// 모바일같은 속도,용량이 작을 때 int 값으로 받는 용도로 적합한 코드
	
	public double calCurrentRatio(double assets, double liability) {	//유동비율
		resultCurrentRatio = Math.round(assets / liability * 10000);		
		return resultCurrentRatio/100;	
	}

	public double calQuickRatio(double assets, double InventoryAssetsint, double liability) {	//당좌비율
		resultQuickRatio = Math.round((assets - InventoryAssetsint)/liability*10000);
		return resultQuickRatio/100;
	}
	
	public double calDebtRatio(double TotalDebt, double TotalCapital) {	//부채비율
		resultDebtRatio = Math.round(TotalDebt / TotalCapital * 10000);	
		return resultDebtRatio/100;
	}

	public double calTotalBorrowingPayable(double borrowings, double debenture, double longdebt, double TotalAssets) {	//차입금의존도
		resultTotalBorrowingPayable = Math.round((borrowings + debenture + longdebt)/ TotalAssets * 10000);
		return resultTotalBorrowingPayable/100;
	}

	public double calInterestEarnedRatio(double profit,double expense) {	//이자보상비율
		resultInterestEarnedRatio = Math.round(profit / expense * 10000);
		return resultInterestEarnedRatio/100;
	}

	public double calFixedRatio(double FixedAssets, double equity) {	//비유동비율
		resultFixedRatio = Math.round(FixedAssets / equity * 10000);
		return resultFixedRatio/100;
	}

	public double calFixedAssetToLongTermCapital(double FixedAssets,double FixedDebt,double Ownequity) {	//비유동장기적합률
		resultFixedAssetToLongTermCapital = Math.round(FixedAssets / (FixedDebt + Ownequity) * 10000);
		return resultFixedAssetToLongTermCapital/100;
	}

	public double calOperatingIncomeToSale(double profit, double sales) {	//매출액영업이익률
		resultOperatingIncomeToSale = Math.round(profit / sales * 10000);
		return resultOperatingIncomeToSale/100;
	}

	public double calNetIncomeToSale(double NetProfit, double sales) {	//매출액순이익률
		resultNetIncomeToSale = Math.round(NetProfit / sales * 10000);
		return resultNetIncomeToSale/100;
	}

	public double calROE(double NetProfit, double Ownequity, double Ownequity2) {	//자기자본순이익률
		resultROE = Math.round(NetProfit / ((Ownequity+Ownequity2)/2) * 10000);
		return resultROE/100;
	}

	public double calROA(double NetProfit, double TotalAssets, double TotalAssets2) {	//총자산순이익률
		resultROA = Math.round(NetProfit / ((TotalAssets+TotalAssets2)/2) * 10000);
		return resultROA/100;
	}

	public double calTotalAssetsTurnover(double sales, double TotalAssets, double TotalAssets2) {	//총자산회전율
		resultTotalAssetsTurnover = Math.round(sales / ((TotalAssets+TotalAssets2)/2) * 10000);
		return resultTotalAssetsTurnover/100;
	}

	public double calInventoryTurnover(double sales,double Ownequity, double Ownequity2) {	//재고자산회전율
		resultInventoryTurnover = Math.round(sales / ((Ownequity+Ownequity2)/2) * 10000);
		InventoryTurnoverPeriod = String.format("%,.2f",(365 / (sales / ((Ownequity + Ownequity2) / 2))));
		return resultInventoryTurnover/100;
	}

	public String calInventoryTurnoverPeriod( ) {	//재고자산회전기간
		if (InventoryTurnoverPeriod == null) {
			resultInventoryTurnoverPeriod = "재고자산회전율을 먼저 계산해야 합니다";
		} else {
			resultInventoryTurnoverPeriod = InventoryTurnoverPeriod;
		}
		return resultInventoryTurnoverPeriod;
	}

	public double calPayablesTurnover(double sales, double receivable, double receivable2) {	//매출채권회전율
		resultPayablesTurnover = Math.round(sales / ((receivable+receivable2)/2) * 10000);
		PayablesTurnoverPeriod = Math.round(365 / (sales / ((receivable + receivable2) / 2)));
		return resultPayablesTurnover/100;
	}

//	public double calPayablesTurnoverPeriod(int ,int ) {	//매출채권평균회수시간
//		if (payables_turnover_period == 0) {
//			result = fr.get(16) + "(메뉴17)을 먼저 실행해야 합니다";
//		} else {
//			result = fr.get(17) + "을 계산합니다.\n" + fr.get(17) + "=" + payables_turnover_period + "일 입니다.";
//		}
//		if (payables_turnover_period <= 90) {
//			result = "표준비율과 비교했을 때 양호합니다.";
//		} else {
//			result = "표준비율과 비교했을 때 미흡합니다.";
//		}
//		return result;
//	}

	public double calReceivablesTurnover(double sales, double purchase, double purchase2) {	//매입채무회전율
		resultReceivablesTurnover = Math.round(sales / ((purchase+purchase2)/2) * 10000);
		ReceivablesTurnoverPeriod = Math.round(365 / (sales / ((purchase + purchase2) / 2)));
		return resultReceivablesTurnover/100;
	}

//	public double calReceivablesTurnoverPeriod(int ,int ) {	//매입채무평균회전기간
//		if (receivables_turnover_period == 0) {
//			result = fr.get(18) + "(메뉴19)을 먼저 실행해야 합니다";
//		} else {
//			result = fr.get(19) + "을 계산합니다.\n" + fr.get(19) + "=" + receivables_turnover_period + "일 입니다.";
//		}
//		return result;
//	}

	public double calOneRotationPeriod(double InventoryTurnoverPeriod,double PayablesTurnoverPeriod, double ReceivablesTurnoverPeriod) {	//1회전 운전기간
//		if (InventoryTurnoverPeriod == 0 || PayablesTurnoverPeriod == 0 || ReceivablesTurnoverPeriod == 0) {
//			result = fr.get(15) + ", " + fr.get(17) + ", " + fr.get(19) + "(메뉴16,18,20)을 먼저 실행해야 합니다.";
//		} else {
//			result = fr.get(20) + "= " + InventoryTurnoverPeriod + "+" + PayablesTurnoverPeriod + "-" + (-ReceivablesTurnoverPeriod) + "일 입니다.";
//		}
		resultOneRotationPeriod = InventoryTurnoverPeriod + PayablesTurnoverPeriod - ReceivablesTurnoverPeriod;
		return resultOneRotationPeriod;
	}

	public double calNetSalesGrowth(int sales, int sales2) {	//매출액증가율
		resultNetSalesGrowth = ((int)(((sales / sales2) * 100) - 100));
		return resultNetSalesGrowth;
	}

	public double calCapitalGrowth(int capital, int capital2) {	//자기자본증가율
		resultCapitalGrowth = ((int)(((capital / capital2) * 100) - 100));
		return resultCapitalGrowth;
	}

	public double calNetIncomeGrowth(int NetProfit,int NetProfit2) {	//순이익증가율
		resultNetIncomeGrowth = ((int)(((NetProfit / NetProfit2) * 100) - 100));
		return resultNetIncomeGrowth;
	}
}
