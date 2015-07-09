package com.nku403.entity;



/**
 * Subscribe entity. @author MyEclipse Persistence Tools
 */

public class Subscribe  implements java.io.Serializable {


    // Fields    

     private SubscribeId id;
     private String stete;


    // Constructors

    /** default constructor */
    public Subscribe() {
    }

	/** minimal constructor */
    public Subscribe(SubscribeId id) {
        this.id = id;
    }
    
    /** full constructor */
    public Subscribe(SubscribeId id, String stete) {
        this.id = id;
        this.stete = stete;
    }

   
    // Property accessors

    public SubscribeId getId() {
        return this.id;
    }
    
    public void setId(SubscribeId id) {
        this.id = id;
    }

    public String getStete() {
        return this.stete;
    }
    
    public void setStete(String stete) {
        this.stete = stete;
    }
   








}