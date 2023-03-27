package com.oracle.ssmphone.utils;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
	// ↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000122607532";

	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCMw+qc1ciJXJZYrVfY506/egAYSECejj3QrJ8JqESGRFLGCLNyixKS9UOujffcZVPtWkXQFskaED4KlO7G70GVrPwNvLarSZpOsdDJPrFet70vWqNMxaugqv7h528nty1aKGHexE8w+CKVZAovoEJ6IuDe5gmXOZKJAHlVOmuNjG95FBYnjzvNvII8WXivRedmfQPzkIl3scytmJWfZ3MxUm9TlCL8PK5xtRIp6Od8w5LR2ueN2/Islxl4XRYb1uMigzAu6ZdqFJsMe7QYB0Evs5tDIaEEQu6p85lY+aqdcesnDVSiahQ6qUF7Wo+noS9wui9FmlNO0vraNoQenDspAgMBAAECggEAbI0s4JMwGVWQD4RliTwfCyPe7NrTEjKo0sI7xqu/ZDdOCa9uCrfas/91mSeb65csWI5T5fucS4AZB/oABOM+lVkX6tQLnh2dZHBVjMvO5jcVKm5gHfUVvEoBUl4x5tOooq0fhDWoyB+iM8g43q9cdGlvNhT5cmgQa5w09RefF0D8mPg0ohBBh79cO8fg8dX//At2UKonJcvcNIhPiF/AYAyi7slqfqi6TvB0f4bPDIx6RCK2+2JYN5IA4GwGwSmsVcMtE4XhohO1HLUq3ke7c9177KnPMtY1PaDflf0iLx2v5XcERsIQYFdslvHHgfUYqWSh4Oue9iwhgdcocCAqrQKBgQDaNarBnyv689kil38GwRuUovYbzo3GqymrLxYqwKBrpaeQUlSONE5C9b6v5EeycWnOs1h2uF0m8gyKAEbMwOzQr4G2h1o3Wt9+rje4xp4wmZ1M5MIbBEImjnb5Tx6p2Yfk04FAyicChFO7mdPLx92HSgsggG5E2Wbe/uuOTMsAqwKBgQClJMBpUyk9zT7ZhEMRLXuoxNYu+S1z+gJDN7PmplpC8s8ZUhSGHcS03Px4Yzmq6MGjVTStHJYh1QjhBRFPufgpVmoBaejLOmne+oV9Uvzeis6LtbeTbh9oGpB4ZHD9C8ha30GbffwbfdC+frlZ12xwDzwPzP2Ttw8pEocPSsK7ewKBgHgp+aCqgNOvmTFdcAxOJ1wQ6aqicpynAUlNos1kSnM9RCtLy1iMIVTqc1n1Qi5YGkZDqUGngVTDEnikclirHT5GiA32N44oMs9WLUVJyy9ESMVhbCroi20kIwxjr6UlL5qphpIhQJ44NMwoh+O+apXoBnydfRvZBLdkdl9klp4FAoGAY5mEyoEzcGinLT0NzgBmgmUk4HO8LCRu1Od1gvh1m8chjJ3qbvDpQEO/qUP+9csnbkDnYjjJe2Im1r/drv30Y8oQaQXdNyTl0Wu6stkoVXfWFoDkVPCn1HuhAlthodxHXDcmNIeJU3NQQHPhigPZDMTDbqwti7duV1ErT9fBFp0CgYB5+F9tOGNTVkMgrek7p0jHhiyWha1xpx7aSAU70udGJo+ZfsQAhdGR2ICgo/s+6LSugmff/bDbp0+DFv4bcXRPPJbUO7b4VM5g8/X1nLcMDX3dgnqXyyyj+VdqGmHBvtxq5TYt/ctqcFVsfFSDb1Yi2wMZ5ciUtI52EBhOtDQV4Q==";

	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm
	// 对应APPID下的支付宝公钥(不是应用公钥)。
	public static String alipay_public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";
	// 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/ssmphone_war_exploded/userOrder/payresult";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/ssmphone_war_exploded/userOrder/payresult";

	// 签名方式
	public static String sign_type = "RSA2";

	// 字符编码格式
	public static String charset = "utf-8";

	// 支付宝网关 //
	// public static String gatewayUrl ="https://openapi.alipay.com/gateway.do";// 正式
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";// 测试

	// 支付宝网关 日志
	public static String log_path = "D:\\alipay\\";

	// ↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	/**
	 * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
	 * 
	 * @param sWord
	 *            要写入日志里的文本内容
	 */
	public static void logResult(String sWord) {
		FileWriter writer = null;
		try {
			writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
			writer.write(sWord);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}