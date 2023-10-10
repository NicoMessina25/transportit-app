package com.funmesseg.transportit.model.enums;

public enum EFeeType {
    CHARITY(0),
    PAYMENT(1),
    PRICING(2);

    private int value;

    private EFeeType(int value){
        this.value = value;
    }

    public int getValue(){
        return value;
    }

}
