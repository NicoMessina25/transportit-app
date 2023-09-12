import { FieldValues } from "@modular-forms/react";
import { EMovementType } from "./EMovementType";

export interface Movement extends FieldValues {
    movement:number;
    amounttopay:number;
    movementtype: EMovementType;
}

export interface PricingMovement extends Movement {
    movementtype: EMovementType.PRICING,
    shippingRequestId: number;
    _packageId: number;
}

export interface PaymentMovement extends Movement {
    movementtype: EMovementType.PAYMENT,
    driverId:number;
    routmapId:number;
}