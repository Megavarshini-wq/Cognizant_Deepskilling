package com.example;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

public class MyServiceTest {

    @Test
    public void testVerifyInteraction() {
        // Step 1: Create mock
        ExternalApi mockApi = Mockito.mock(ExternalApi.class);
        // Step 2: Call method using service
        MyService service = new MyService(mockApi);
        service.fetchData();
        // Step 3: Verify the interaction happened
        verify(mockApi).getData();
    }
}
