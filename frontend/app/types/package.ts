import { FieldValues } from "@modular-forms/react";
import { EShippingState } from "./EShippingState";
import { FeePricing } from "./fee";

export interface Package extends FieldValues {
    packageid: number,
    weight:number,
    size:number,
    price: number,
    state: EShippingState
    shippingRequestId: number,
    routeMapId: number,
    feePricing: FeePricing
    recipientDocument: string
    recipientFirstname: string
    cityFeeCoefficient: number
}