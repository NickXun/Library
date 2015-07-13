package com.nku403.entity;

import java.util.HashSet;
import java.util.Set;


/**
 * Type entity. @author MyEclipse Persistence Tools
 */

public class Type  implements java.io.Serializable {


    // Fields    

     private Integer typeId;
     private String typeName;
     private Set books = new HashSet(0);


    // Constructors

    /** default constructor */
    public Type() {
    }

	/** minimal constructor */
    public Type(String typeName) {
        this.typeName = typeName;
    }
    
    /** full constructor */
    public Type(String typeName, Set books) {
        this.typeName = typeName;
        this.books = books;
    }

   
    // Property accessors

    public Integer getTypeId() {
        return this.typeId;
    }
    
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return this.typeName;
    }
    
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Set getBooks() {
        return this.books;
    }
    
    public void setBooks(Set books) {
        this.books = books;
    }
   








}