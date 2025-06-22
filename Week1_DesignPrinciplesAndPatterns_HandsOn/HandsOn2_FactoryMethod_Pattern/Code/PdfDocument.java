package Cognizant_Deepskilling.Week1_DesignPrinciplesAndPatterns_HandsOn.HandsOn2_FactoryMethod_Pattern.Code;

public class PdfDocument implements IDocument {
    public void open() {
        System.out.println("Opening PDF Document.");
    }
}
