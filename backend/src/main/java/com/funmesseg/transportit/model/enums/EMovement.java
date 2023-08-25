package com.funmesseg.transportit.model.enums;

public enum EMovement {
    COLLECTION(1),
    PAYMENT(2);

    private final int value;

    private EMovement(int value){
        this.value = value;
    }

    public int getValue(){
        return value;
    }

}
