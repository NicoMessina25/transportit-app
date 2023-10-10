import { EShippingState } from "./EShippingState";
import { FeePricing } from "./fee";
import { Indexable } from '@/src/types/indexable';

export interface Package extends Indexable {
    packageId?: number,
    weight:number,
    cm3price:number,
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
    packageId: undefined,
    recipientfirstname: "",
    recipientdocument: "",
    weight: 0,
    cm3price: 0,
    price:0,
    cityfeecoefficient:0,
    routemapid: undefined,
    feepricing: undefined,
    state: undefined,
    shippingrequestid: undefined
}