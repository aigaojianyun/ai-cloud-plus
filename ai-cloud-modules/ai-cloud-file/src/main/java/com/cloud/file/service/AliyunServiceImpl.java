package com.cloud.file.service;

import cn.hutool.core.date.DateTime;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.cloud.common.utils.uuid.UUID;
import com.cloud.file.config.AliyunConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;

/**
 * 阿里云 文件存储
 *
 * @author ai-cloud
 */
@Primary
@Service
public class AliyunServiceImpl implements ISysFileService {

    /**
     * 阿里云api的内或外网域名
     */
    @Value("${aliyun.endpoint}")
    public String endpoint;
    /**
     * 阿里云api的密钥access key id
     */
    @Value("${aliyun.accessKeyId}")
    public String accessKeyId;
    /**
     * 阿里云api的密钥access key secret
     */
    @Value("${aliyun.accessKeySecret}")
    public String accessKeySecret;
    @Autowired
    private AliyunConfig aliyunConfig;

    @Override
    public String uploadFile(MultipartFile file) throws Exception {
        // 创建OSS实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        //获取上传文件输入流
        InputStream inputStream = file.getInputStream();
        //获取文件名称
        String fileName = file.getOriginalFilename();
        //1、在文件名称里面添加随机唯一值（因为如果上传文件名称相同的话，后面的问价会将前面的文件给覆盖了）
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");//因为生成后的值有横岗，我们就把它去除，不替换也可以，也没有错
        fileName = uuid + fileName;
        //2、把文件安装日期进行分类： 2022/10/11/1.jpg
        //获取当前日期
        String datePath = new DateTime().toString("yyyy/MM/dd");//在依赖中引入了该工具类
        //拼接
        fileName = datePath + "/" + fileName;
        //调用oss方法实现上传
        //参数一：Bucket名称  参数二：上传到oss文件路径和文件名称  比如 /aa/bb/1.jpg 或者直接使用文件名称  参数三：上传文件的流
        ossClient.putObject(aliyunConfig.getBucketName(), fileName, inputStream);
        //关闭OSSClient
        ossClient.shutdown();
        //把上传之后的文件路径返回
        //需要把上传到阿里云路径返回    https://edu-guli-eric.oss-cn-beijing.aliyuncs.com/1.jpg
        String url = " https://" + aliyunConfig.getBucketName() + "." + aliyunConfig.getEndpoint() + "/" + fileName;
        return url;
    }

}
