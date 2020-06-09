package com.yr.lize.storage.service.impl;

import com.yr.lize.pojo.SystemCode;
import com.yr.lize.storage.service.StorageBarCodeService;
import com.yr.lize.system.service.ISystemCompanyService;
import org.apache.commons.lang.StringUtils;
import org.krysalis.barcode4j.impl.code39.Code39Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Calendar;

/**
 * Created by Lic on 2019/5/21.
 */
@Service
public class StorageBarCodeServiceImpl implements StorageBarCodeService {

    @Autowired
    ISystemCompanyService iSystemCompanyService;

    @Autowired
    private ServletContext servletContext;

    @Override
    public String storageBarCode() {

        //修改编码字段
        iSystemCompanyService.updateCode(666);
        //查询修改后的值
        SystemCode code2 = iSystemCompanyService.selectCode(666);
        Calendar now = Calendar.getInstance();

        Integer code3 = code2.getNumber();
        int num = 10;
        String result = "";

        result = String.format("%0" + num + "d", code3);

        System.err.println(now.get(Calendar.YEAR)+((now.get(Calendar.MONTH) + 1) + "")+now.get(Calendar.DAY_OF_MONTH)+"-"+result);
        String code4 = now.get(Calendar.YEAR)+((now.get(Calendar.MONTH) + 1) + "")+now.get(Calendar.DAY_OF_MONTH)+"-"+result;
        //生成编号
        String msg = code2.getCode()+code4;

        String path = servletContext.getRealPath("/")+"img/StorageBarCode/";// + "/webapp/img/StorageBarCode";
        generateFile(msg, path);
        return msg;
    }

    /**
     * 生成文件
     *
     * @param msg
     * @param path
     * @return
     */
    public static File generateFile(String msg, String path) {
        File file = new File(path);
        try {
            generate(msg, new FileOutputStream(file));
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        return file;
    }



    /**
     * 生成字节
     *
     * @param msg
     * @return
     */
    public static byte[] generate(String msg) {
        ByteArrayOutputStream ous = new ByteArrayOutputStream();
        generate(msg, ous);
        return ous.toByteArray();
    }



    /**
     * 生成到流
     *
     * @param msg
     * @param ous
     */
    public static void generate(String msg, OutputStream ous) {

        if (StringUtils.isEmpty(msg) || ous == null) {
            return;
        }

        Code39Bean bean = new Code39Bean();

        // 精细度
        final int dpi = 150;
        // module宽度
        final double moduleWidth = UnitConv.in2mm(1.0f / dpi);
        // 配置对象
        bean.setModuleWidth(moduleWidth);
        bean.setWideFactor(3);
        bean.doQuietZone(false);
        String format = "image/png";
        try {
            // 输出到流
            BitmapCanvasProvider canvas = new BitmapCanvasProvider(ous, format, dpi, BufferedImage.TYPE_BYTE_BINARY, false, 0);
            // 生成条形码
            bean.generateBarcode(canvas, msg);
            // 结束绘制
            canvas.finish();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
