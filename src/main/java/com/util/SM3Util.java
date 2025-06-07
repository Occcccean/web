package com.util;

import org.bouncycastle.crypto.digests.SM3Digest;
import org.bouncycastle.util.encoders.Hex;

public class SM3Util {
    public static String encrypt(String plainText) {
        byte[] plainBytes = plainText.getBytes();
        SM3Digest digest = new SM3Digest();
        digest.update(plainBytes, 0, plainBytes.length);
        byte[] cipherBytes = new byte[digest.getDigestSize()];
        digest.doFinal(cipherBytes, 0);
        return new String(Hex.encode(cipherBytes));
    }

    public static boolean verify(String plainText, String cipherText) {
        return encrypt(plainText).equals(cipherText);
    }
}