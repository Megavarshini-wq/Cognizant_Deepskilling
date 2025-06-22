package Cognizant_Deepskilling.Week1_DesignPrinciplesAndPatterns_HandsOn.HandsOn2_FactoryMethod_Pattern.Code;

public class Main {
    public static void main(String[] args) {
        // Create a Word Document
        DocumentFactory wordFactory = new WordDocumentFactory();
        IDocument wordDoc = wordFactory.createDocument();
        wordDoc.open();

        // Create a PDF Document
        DocumentFactory pdfFactory = new PdfDocumentFactory();
        IDocument pdfDoc = pdfFactory.createDocument();
        pdfDoc.open();

        // Create an Excel Document
        DocumentFactory excelFactory = new ExcelDocumentFactory();
        IDocument excelDoc = excelFactory.createDocument();
        excelDoc.open();
    }
}