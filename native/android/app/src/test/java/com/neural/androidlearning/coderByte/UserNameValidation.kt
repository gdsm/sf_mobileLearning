package com.neural.androidlearning.coderByte

import org.junit.Test
import org.junit.Assert.*

class UserNameValidation {
    //https://coderbyte.com/editor/Codeland%20Username%20Validation:Kotlin

    fun CodelandUsernameValidation(str: String): String {
        // code goes here
        var hashMap = hashMapOf<Char, Boolean>(
            'a' to true, 'A' to true, 'b' to true, 'B' to true, 'c' to true, 'C' to true,
            'd' to true, 'D' to true, 'e' to true, 'E' to true, 'f' to true, 'F' to true,
            'g' to true, 'G' to true, 'h' to true, 'H' to true, 'i' to true, 'I' to true,
            'j' to true, 'J' to true, 'k' to true, 'K' to true, 'l' to true, 'L' to true,
            'm' to true, 'M' to true, 'n' to true, 'N' to true, 'o' to true, 'O' to true,
            'p' to true, 'P' to true, 'q' to true, 'Q' to true, 'r' to true, 'R' to true,
            's' to true, 'S' to true, 't' to true, 'T' to true, 'u' to true, 'U' to true,
            'v' to true, 'V' to true, 'w' to true, 'W' to true, 'x' to true, 'X' to true,
            'y' to true, 'Y' to true, 'z' to true, 'Z' to true
        )
        if ((str.count() <= 4) || (str.count() >= 25) || (str.last() == '_') || (hashMap[str.first()] == null)) {
            return "false"
        }
        hashMap['_'] = true
        hashMap['0'] = true
        hashMap['1'] = true
        hashMap['2'] = true
        hashMap['3'] = true
        hashMap['4'] = true
        hashMap['5'] = true
        hashMap['6'] = true
        hashMap['7'] = true
        hashMap['8'] = true
        hashMap['9'] = true
        for (c in str) {
            if (hashMap[c] == null) { return "false" }
        }
        return "true"
    }

    @Test
    fun test() {
//        assertEquals("false", CodelandUsernameValidation("_"))
//        assertEquals("false", CodelandUsernameValidation("_aa"))
//        assertEquals("false", CodelandUsernameValidation("aa_"))
//        assertEquals("false", CodelandUsernameValidation("a%a"))
//        assertEquals("false", CodelandUsernameValidation("0aa"))
//        assertEquals("false", CodelandUsernameValidation("aa"))
//
        assertEquals("true", CodelandUsernameValidation("__bbbbbbb"))
//        assertEquals("true", CodelandUsernameValidation("aaaaa_a"))
//        assertEquals("true", CodelandUsernameValidation("rtyu1a"))
    }
}