package Cognizant_Deepskilling.Week1_DataStructuresAndAlgorithms_HandsOn.HandsOn2_FinancialForecast.Code;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter present value: ");
        double presentValue=sc.nextDouble();

        System.out.println("Enter annual growth rate (in %): ");
        double rate=sc.nextDouble();

        System.out.println("Enter number of years to forecast: ");
        int years=sc.nextInt();

        double futureValue=FinancialForecast.predictFutureValue(presentValue, rate, years);
        System.out.printf("Predicted Future Value (recursive): ₹%.2f\n", futureValue);

        
        double[] memo=new double[years + 1];
        double memoFutureValue = FinancialForecast.predictWithMemoization(presentValue, rate, years, memo);
        System.out.printf("Predicted Future Value (memoized): ₹%.2f\n", memoFutureValue);
        sc.close();
    }
}