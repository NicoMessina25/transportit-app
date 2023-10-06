import { EMovementType } from "./EMovementType";
import { Indexable } from "../Components/Table/Table";

export interface Movement extends Indexable {
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