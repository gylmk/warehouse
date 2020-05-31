package com.baidu.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * md5加密类
 * @author Administrator
 *
 */
public class MD5Utils {
	/**
	 * md5加密
	 */
	public static String md5(String plainText) {
		byte[] secretBytes = null;
		try {
			secretBytes = MessageDigest.getInstance("md5").digest(plainText.getBytes());
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("运行时异常");
		}
		String md5code = new BigInteger(1, secretBytes).toString(16);// 16进制
		//加密
		for (int i = 0; i < 32 - md5code.length(); i++) {
			md5code = "0" + md5code;
		}
		return md5code;
	}
	
	/**
	 * 测试主函数
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(md5("caozhuang"));
	}
}
