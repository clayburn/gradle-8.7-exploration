package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class StringUtilsTest {

    @Test
    public void testReturnString() {
        assertEquals("foo", StringUtils.returnString("foo"));
    }
}
