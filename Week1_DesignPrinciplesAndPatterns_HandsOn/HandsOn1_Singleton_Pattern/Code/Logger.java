package Cognizant_Deepskilling.Week1_DesignPrinciplesAndPatterns_HandsOn.HandsOn1_Singleton_Pattern.Code;
public class Logger {
    private static Logger instance;

    private Logger() {
        System.out.println("Logger Initialized.");
    }
    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger(); // Create only once
        }
        return instance;
    }

    public void log(String message) {
        System.out.println("Log Message: " + message);
    }
}




// Step 1: Create a private static instance of the Logger class
// Step 2: Make the constructor private so no other class can instantiate it
// Step 3: Provide a public static method to return the single instance
// Method to simulate logging