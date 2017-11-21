package com.vpfinance.util;

import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import Decoder.BASE64Decoder;
import Decoder.BASE64Encoder;


public class EncryptUtil {

    /**
     * AES加密
     *
     * @param str
     * @param key
     * @return
     * @throws Exception
     */
    public static String aesEncrypt(String str, String key) throws Exception {
        if (str == null || key == null) return null;
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key.getBytes("utf-8"), "AES"));
        byte[] bytes = cipher.doFinal(str.getBytes("utf-8"));
        return new BASE64Encoder().encode(bytes);
    }

    /**
     * AES解密
     *
     * @param str
     * @param key
     * @return
     * @throws Exception
     */
    public static String aesDecrypt(String str, String key) throws Exception {
        if (str == null || key == null) return null;
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key.getBytes("utf-8"), "AES"));
        byte[] bytes = new BASE64Decoder().decodeBuffer(str);
        bytes = cipher.doFinal(bytes);
        return new String(bytes, "utf-8");
    }

    public static void main(String[] args) throws Exception {
        //System.out.println(aesEncrypt("我草","1234567891234567"));
//    	System.out.println(aesDecrypt("GJm1hG4FGtp1K04rYjh15w==","1234567891234567"));
//    	
//    	Map<String, String> map=new TreeMap<String, String>();
//    	map.put("sttt", "5");
//    	map.put("a", "444");
//    	map.put("c", "33");
//    	map.put("b", "1");
//    	
//    	StringBuffer signSrc = new StringBuffer();
//		Set<String> keys = map.keySet();
//		for(String key : keys){
//			signSrc.append(key);
//			signSrc.append("=");
//			signSrc.append(aesEncrypt(map.get(key),"vpclubvpfinance8"));
//			signSrc.append("&");
//		}
//		
//		//signSrc = signSrc.deleteCharAt(signSrc.length()-1);
//		signSrc.append("appkey=3KJBI23U923B8W0NF8WB");
//		System.out.println(signSrc);
//		String ggg=HMacMD5.hmacMd5("3KJBI23U923B8W0NF8WB", signSrc.toString());
//    	System.out.println(ggg);
//        System.out.println(aesEncrypt("99999999", "vpclubvpfinance8"));
//        System.out.println(aesEncrypt("15922222222", "vpclubvpfinance8"));
//        System.out.println(aesDecrypt("YM4pu+2tBtCXSetG72KiaQ==", "vpclubvpfinance8"));
//
//        Map<String, String> map = new TreeMap<String, String>();
//        map.put("sttt", "5");
//        map.put("a", "444");
//        map.put("c", "33");
//        map.put("b", "1");
//
//        StringBuffer signSrc = new StringBuffer();
//        Set<String> keys = map.keySet();
//        for (String key : keys) {
//            signSrc.append(key);
//            signSrc.append("=");
//            signSrc.append(aesEncrypt(map.get(key), "vpclubvpfinance8"));
//            signSrc.append("&");
//        }
//
//        //signSrc = signSrc.deleteCharAt(signSrc.length()-1);
//        signSrc.append("appkey=3KJBI23U923B8W0NF8WB");
//        System.out.println(signSrc);
//        String ggg = HMacMD5.hmacMd5("", signSrc.toString());
//        System.out.println(ggg);
    }
}
