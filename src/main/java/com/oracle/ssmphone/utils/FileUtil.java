package com.oracle.ssmphone.utils;

import java.util.UUID;

public class FileUtil {
    public static String getFileName() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString().replace("-", "");
    }

    public static String getTypeName(String realName) {
        return realName.substring(realName.lastIndexOf("."));
    }

    public static void main(String[] args) {
        System.out.print(FileUtil.getFileName());
        System.out.println(FileUtil.getTypeName("aaa.png"));
    }
}
