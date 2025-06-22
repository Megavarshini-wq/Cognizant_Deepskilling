package Cognizant_Deepskilling.Week1_DataStructuresAndAlgorithms_HandsOn.HandsOn1_EcommerceSearchFunctionality.Code;

import java.util.Arrays;
import java.util.Comparator;

public class Main {
    public static void main(String[] args)
     {
        Product[] products=
        {
            new Product(1, "Laptop", "Electronics"),
            new Product(2, "Shoes", "Fashion"),
            new Product(3, "Smartphone", "Electronics"),
            new Product(4, "T-Shirt", "Clothing"),
            new Product(5, "Watch", "Accessories")
        };
        Product result1=Search.linearSearch(products,"Smartphone");
        System.out.println("Linear Search Result: "+result1);

        Arrays.sort(products, Comparator.comparing(p->p.productName.toLowerCase()));
        Product result2=Search.binarySearch(products,"Smartphone");
        System.out.println("Binary Search Result: "+result2);
    }
}
