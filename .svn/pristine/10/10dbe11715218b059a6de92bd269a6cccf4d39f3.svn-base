package com.netdisc.util;

import lombok.Data;
import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import sun.net.ftp.FtpClient;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Random;


/**
 * ftp连接
 * @author Stodger
 * @date 2019年8月28日
 * @version
 */
@Data
public class FtpUtil {
    private static final Logger LOGGER = LoggerFactory.getLogger(FtpUtil.class);
    private String ip;
    private String username;
    private String password;
    private int port;
    private FTPClient ftpClient;


    private FtpUtil(String ip, String username, String password, int port) {
        this.ip = ip;
        this.username = username;
        this.password = password;
        this.port = port;
    }

    public static boolean uploadFile(List<File> fileList) {
        String ftpIp = "139.199.162.74";
        String ftpUsername = "ftpuser";
        String ftpPassword = "123456";
        int ftpPort = 21;
        FtpUtil ftpUtil = new FtpUtil(ftpIp, ftpUsername, ftpPassword, ftpPort);
        LOGGER.info("开始连接ftp服务器上传文件");
        boolean result = ftpUtil.uploadFile("images", fileList);
        LOGGER.info("上传文件:{}");
        return result;
    }

    private boolean uploadFile(String remotePath, List<File> fileList) {
        boolean upload = true;
        FileInputStream fileInputStream = null;
        if (connectServer(this.ip, this.username, this.password, this.port)) {
            try {
                ftpClient.changeWorkingDirectory(remotePath);
                ftpClient.setBufferSize(1024);
                ftpClient.setControlEncoding("utf-8");
                ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
                ftpClient.enterLocalPassiveMode();
                for (File file : fileList) {
                    fileInputStream = new FileInputStream(file);
                    ftpClient.storeFile(file.getName(), fileInputStream);
                }
            } catch (IOException e) {
                LOGGER.error("文件上传异常", e);
                upload = false;
                e.printStackTrace();
            } finally {
                try {
                    if (fileInputStream != null) {
                        fileInputStream.close();
                    }
                    ftpClient.disconnect();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return upload;
    }

    private boolean connectServer(String ip, String username, String password, int port) {
        boolean isSuccess = false;
        ftpClient = new FTPClient();
        try {
            ftpClient.connect(ip);
            isSuccess = ftpClient.login(username, password);
        } catch (IOException e) {
            e.printStackTrace();
            LOGGER.error("连接异常", e);
        }
        return isSuccess;
    }
}
