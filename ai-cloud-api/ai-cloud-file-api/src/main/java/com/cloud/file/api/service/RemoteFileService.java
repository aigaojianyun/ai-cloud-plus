package com.cloud.file.api.service;

import com.cloud.common.constant.ServiceNameConstants;
import com.cloud.common.domain.R;
import com.cloud.file.api.domain.File;
import com.cloud.file.api.factory.RemoteFileFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件服务
 *
 * @author ai-cloud
 */
@FeignClient(contextId = "remoteSysFileService", value = ServiceNameConstants.FILE_SERVICE, fallbackFactory = RemoteFileFallbackFactory.class)
public interface RemoteFileService {
    /**
     * 上传文件
     *
     * @param file 文件信息
     * @return 结果
     */
    @PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<File> upload(@RequestPart(value = "file") MultipartFile file);
}
