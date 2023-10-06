package com.funmesseg.transportit.model.enums;

public enum EShippingState {
    NONE(0),
    ORDERED(1),
    PENDING(2),
    SHIPPED(3),
    DELIVERED(4),
    RECEIVED(5);

    private final int value;

    private EShippingState(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
