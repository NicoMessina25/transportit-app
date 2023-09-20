import { EShippingState } from "./EShippingState";
import { FeePricing } from "./fee";
import { Indexable } from "../Components/Table/Table";

export interface Package extends Indexable {
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