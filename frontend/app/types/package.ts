import { EShippingState } from "./EShippingState";
import { FeePricing } from "./fee";
import { Indexable } from "../Components/Table/Table";

export interface Package extends Indexable {
    packageid?: number,
    weight:number,
    size:number,
    price: number,
    state?: EShippingState
    shippingrequestid?: number,
    routemapid?: number,
    feepricing?: FeePricing
    recipientdocument: string
    recipientfirstname: string
    cityfeecoefficient: number
}

export const defaultPackage:Package = {
    packageid: undefined,
    recipientfirstname: "",
    recipientdocument: "",
    weight: 0,
    size: 0,
    price:0,
    cityfeecoefficient:0,
    routemapid: undefined,
    feepricing: undefined,
    state: undefined,
    shippingrequestid: undefined
}