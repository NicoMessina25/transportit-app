import { FieldValues } from "@modular-forms/react";
import { EFeeType } from "./EFeeType";

export interface FeePayment extends FieldValues{
    feepayment: number;
    kgprice:number;
    kmprice:number,
    feeType: EFeeType.PAYMENT;
}

export interface FeePricing extends FieldValues{
    feePricing:number;
    feeType: EFeeType.PRICING;
    kgprice:number;
    cm3price:number;
}