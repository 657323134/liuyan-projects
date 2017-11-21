package com.vpfinance.util.codec;

import com.vpfinance.util.codec.HexUtil;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class HMacMD5 {

    private static String encoding = "UTF-8";

    private static byte[] md5(byte[] str) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(str);
        return md.digest();
    }

    public static byte[] getHmacMd5Bytes(byte[] key, byte[] data)
            throws NoSuchAlgorithmException {

        int length = 64;
        byte[] ipad = new byte[length];
        byte[] opad = new byte[length];
        for (int i = 0; i < 64; i++) {
            ipad[i] = 0x36;
            opad[i] = 0x5C;
        }
        byte[] actualKey = key; // Actual key.
        byte[] keyArr = new byte[length]; // Key bytes of 64 bytes length

        if (key.length > length) {
            actualKey = md5(key);
        }
        for (int i = 0; i < actualKey.length; i++) {
            keyArr[i] = actualKey[i];
        }

        if (actualKey.length < length) {
            for (int i = actualKey.length; i < keyArr.length; i++)
                keyArr[i] = 0x00;
        }

        byte[] kIpadXorResult = new byte[length];
        for (int i = 0; i < length; i++) {
            kIpadXorResult[i] = (byte) (keyArr[i] ^ ipad[i]);
        }

        byte[] firstAppendResult = new byte[kIpadXorResult.length + data.length];
        for (int i = 0; i < kIpadXorResult.length; i++) {
            firstAppendResult[i] = kIpadXorResult[i];
        }
        for (int i = 0; i < data.length; i++) {
            firstAppendResult[i + keyArr.length] = data[i];
        }

        byte[] firstHashResult = md5(firstAppendResult);

        byte[] kOpadXorResult = new byte[length];
        for (int i = 0; i < length; i++) {
            kOpadXorResult[i] = (byte) (keyArr[i] ^ opad[i]);
        }

        byte[] secondAppendResult = new byte[kOpadXorResult.length
                + firstHashResult.length];
        for (int i = 0; i < kOpadXorResult.length; i++) {
            secondAppendResult[i] = kOpadXorResult[i];
        }
        for (int i = 0; i < firstHashResult.length; i++) {
            secondAppendResult[i + keyArr.length] = firstHashResult[i];
        }

        byte[] hmacMd5Bytes = md5(secondAppendResult);
        return hmacMd5Bytes;
    }

    public static String hmacMd5(String key, String data) {
        byte[] md5Bytes;
        String md5 = null;
        try {
            md5Bytes = getHmacMd5Bytes(key.getBytes(encoding), data.getBytes(encoding));
            md5 = HexUtil.bytesToHexString(md5Bytes);

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return md5;
    }

    public static void main(String[] args) {
        System.out.println(hmacMd5("123123", "1234567890"));
    }
}
