import { FieldValues } from "@modular-forms/react";
import { City } from "./city";
import { FeePayment } from "./fee";
import { Truck } from "./truck";

export interface Driver extends FieldValues {
    driverid: number,
    firstname: string;
    lastname:string;
    dni: string;
    address:string;
    province:string;
    city:string;
    phone:string;
    particular:boolean;
    available:boolean;
    feepayment: FeePayment;
    trucks: Truck[];
    currentcity: City;
}