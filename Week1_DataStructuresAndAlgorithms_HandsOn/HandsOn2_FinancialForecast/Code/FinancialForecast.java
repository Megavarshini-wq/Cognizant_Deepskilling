package Cognizant_Deepskilling.Week1_DataStructuresAndAlgorithms_HandsOn.HandsOn2_FinancialForecast.Code;

public class FinancialForecast
 {
    public static double predictFutureValue(double presentValue, double rate, int years)
     { 
        if (years==0)
         {
            return presentValue;
        }
        double future=presentValue*(1+rate/100);
        return predictFutureValue(future,rate,years-1);
    }
       public static double predictWithMemoization(double presentValue, double rate, int years, double[] memo)
     {
        if (years == 0) 
        return presentValue;
        if (memo[years] != 0)
         return memo[years];

        double future=presentValue*(1+rate/100);
        memo[years]=predictWithMemoization(future,rate,years-1,memo);
        return memo[years];
    }
}