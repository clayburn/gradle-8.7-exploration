package com.example;

import org.testng.annotations.Test;
import static org.testng.Assert.assertEquals;

public class StringUtilsTest {

    @Test
    public void testReturnString() {
        assertEquals("foo", StringUtils.returnString("foo"));
    }
}
