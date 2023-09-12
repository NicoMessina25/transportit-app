import { FieldValues } from "@modular-forms/react";
import { Park } from "./park";

export interface Trailer extends FieldValues {
    trailerid:number;
    weight:number;
    payloadWeight:number;
    registration:string;
    available:boolean;
    park: Park;
}