package Cognizant_Deepskilling.Week1_DesignPrinciplesAndPatterns_HandsOn.HandsOn2_FactoryMethod_Pattern.Code;

public class WordDocumentFactory extends DocumentFactory {
    public IDocument createDocument() {
        return new WordDocument();
    }
}