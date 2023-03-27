package com.oracle.ssmphone.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

public class UploadFileUtil {
    /**
     * @param path
     * @return 新的文件名
     */
    public static String doUpload(MultipartFile goodsImgFile, String path, HttpSession session) throws IOException {

        //1.将文件名存入数据库
        String oldFileName = goodsImgFile.getOriginalFilename();//获取上传到的文件名
        String newFileName = null;
        if (oldFileName != null && !"".equals(oldFileName)) {
            //System.out.println(oldFileName);
            //文件名字建议:uuid
            newFileName = FileUtil.getFileName() + FileUtil.getTypeName(oldFileName);//获产生新的文件名
            //2.将文件存入文件夹  static/images
            //System.out.println(newFileName);
            //获取static/images绝对路径"/static/images/"
            String realPath = session.getServletContext().getRealPath(path);
            // System.out.println(realPath);
            goodsImgFile.transferTo(new File(realPath + newFileName));//从缓存中转存
        }

        return newFileName;
    }
}
