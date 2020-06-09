package com.st.rbac.util;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.RetentionPolicy;


import java.lang.annotation.ElementType;


/*@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)*/
@Target({ElementType.TYPE,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface DataSource {

	String value();

}
