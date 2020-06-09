package com.yr.lize.pojo;

/**
 * Created by admin on 2019/5/23.
 */
public class sampleCode {
    private Integer id;
    private Integer process_id;
    private String code;
    private Integer code_int;
    private Integer code_int2;
    private String code_string;
    private String code_string2;

    public sampleCode() {
    }

    public sampleCode(Integer id, Integer process_id, String code, Integer code_int, Integer code_int2, String code_string, String code_string2) {
        this.id = id;
        this.process_id = process_id;
        this.code = code;
        this.code_int = code_int;
        this.code_int2 = code_int2;
        this.code_string = code_string;
        this.code_string2 = code_string2;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProcess_id() {
        return process_id;
    }

    public void setProcess_id(Integer process_id) {
        this.process_id = process_id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getCode_int() {
        return code_int;
    }

    public void setCode_int(Integer code_int) {
        this.code_int = code_int;
    }

    public Integer getCode_int2() {
        return code_int2;
    }

    public void setCode_int2(Integer code_int2) {
        this.code_int2 = code_int2;
    }

    public String getCode_string() {
        return code_string;
    }

    public void setCode_string(String code_string) {
        this.code_string = code_string;
    }

    public String getCode_string2() {
        return code_string2;
    }

    public void setCode_string2(String code_string2) {
        this.code_string2 = code_string2;
    }
}
