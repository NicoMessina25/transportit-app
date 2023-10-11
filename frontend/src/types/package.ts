import { EShippingState } from "./EShippingState";
import { FeePricing } from "./fee";
import { Indexable } from '@/src/types/indexable';

export interface Package extends Indexable {
    packageId?: number,
    weight:number,
    size:number,
    price?: number,
    state?: EShippingState
    requestId?: number,
    routemapid?: number,
    feepricing?: FeePricing
    recipientdocument: string
    recipientfirstname: string
    cityfeecoefficient?: number
}

export const defaultPackage:Package = {
    packageId: undefined,
    recipientfirstname: "",
    recipientdocument: "",
    weight: 0,
    size: 0,
    price:0,
    cityfeecoefficient:0,
    routemapid: undefined,
    feepricing: undefined,
    state: undefined,
    requestId: undefined
}