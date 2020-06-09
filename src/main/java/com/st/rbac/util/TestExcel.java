package com.st.rbac.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.io.File;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.yr.lize.pojo.SystemDepartment;
/**
 * 
 * @author sunchong
 * Excel版本不同用到的poi包和其依赖也会不同 具体查询百度!哈哈
 *
 */
public class TestExcel {
      //记录类的输出信息
      static Log log = LogFactory.getLog(TestExcel.class); 
      //获取Excel文档的路径
      
      public static List<SystemDepartment> getExcl(String url) {
    	  
    	  List<SystemDepartment> departments = new ArrayList<>();
    	  
            try {
                  // 创建对Excel工作簿文件的引用
            	XSSFWorkbook wookbook = new XSSFWorkbook(new FileInputStream(url));
                  // 在Excel文档中，第一张工作表的缺省索引是0
                  // 如果表格后缀是"xls"其语句为：HSSFSheet sheet = workbook.getSheetAt(0);
            	  //如果表格后缀是"xls"其语句为: XXSSFSheet sheet = wookbook.getSheetAt(0);
                  XSSFSheet sheet = wookbook.getSheet("Sheet1");
                  //获取到Excel文件中的所有行数
                  int rows = sheet.getPhysicalNumberOfRows();
                  //遍历行
                 
                  for (int i = 0; i < rows; i++) {
                        // 读取左上端单元格
                        XSSFRow row = sheet.getRow(i);
                        // 行不为空
                        if (row != null) {
                              //获取到Excel文件中的所有的列
                              int cells = row.getPhysicalNumberOfCells();
                              String value = "";     
                              //遍历列
                              for (int j = 0; j < cells; j++) {
                                    //获取到列的值­
                                    XSSFCell cell = row.getCell(j);
                                    if (cell != null) {
                                          switch (cell.getCellType()) {
                                                case HSSFCell.CELL_TYPE_FORMULA:
                                                break;
                                                case HSSFCell.CELL_TYPE_NUMERIC:
                                                      value += cell.getNumericCellValue() + ",";        
                                                break;  
                                                case HSSFCell.CELL_TYPE_STRING:
                                                      value += cell.getStringCellValue() + ",";
                                                break;
                                                default:
                                                      value += "0";
                                               break;
                                   }
                              }      
                        }
                        // 将数据插入到mysql数据库中
                        String[] val = value.split(",");
                        SystemDepartment department = new SystemDepartment();
                        //字符串转换数字 	
                       //int id = (int) Double.parseDouble(val[0]);
                        
/*	               		 SimpleDateFormat aDate= new SimpleDateFormat("yyyy-MM-dd");
	               		String time = "";
	               		 try {
	               			time = val[2];
						} catch (ArrayIndexOutOfBoundsException e) {
							System.out.println("空值");
						}
	               		  
	               		  System.out.println(time);
		           		  Date date = null;
		           		try {
		           			if (!"".equals(time)) {
		           				date = aDate.parse(time);
		           			}
		           			
		           		} catch (ParseException e) {
		           			// TODO Auto-generated catch block
		           			e.printStackTrace();
		           		}*/
                        Integer superiorid = null;
                        Integer company_id = null;
                        try {
                        	superiorid = (int) Double.parseDouble(val[1]);
                        	company_id = (int) Double.parseDouble(val[2]);
						} catch (ArrayIndexOutOfBoundsException e) {
							// TODO: handle exception
						}
                        
                        
		           		department.setDepartment_Name(val[0]);
		           		department.setSuperior_Id(superiorid);
		           		department.setCompany_Id(company_id);
		           		departments.add(department);
                  }
             }
      } catch (FileNotFoundException e) {
            e.printStackTrace();
      } catch (IOException e) {
            e.printStackTrace();
      }
			return departments;
   }
  	public static boolean deleteDir(File dir) {
	    if (!dir.exists())
	            return false;
	    if (dir.isDirectory()) {
	        String[] childrens = dir.list();
	        // 递归删除目录中的子目录下
	        for (String child : childrens) {
	             System.out.println(child);
	             File file1 = new File(dir, child);
	             file1.delete();
	        }
	    }
	    // 目录此时为空，可以删除
	    return true;
	}
}