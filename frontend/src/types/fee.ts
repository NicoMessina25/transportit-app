import { Indexable } from "@/src/types/indexable";
import { EFeeType } from "./EFeeType";

export interface FeePayment extends Indexable{
    feeId?: number;
    kgprice:number;
    kmprice:number,
    feeType: EFeeType;
}

export const defaultFeePayment: FeePayment = {
    feeId: undefined,
    kgprice: 0,
    kmprice: 0,
    feeType: EFeeType.PAYMENT
}

export interface FeePricing extends Indexable{
    feeId?:number;
    feeType: EFeeType.PRICING;
    kgprice:number;
    size:number;
}

export const defaultFeePricing: FeePricing = {
    feeId: undefined,
    kgprice: 0,
    size: 0,
    feeType: EFeeType.PRICING
}
