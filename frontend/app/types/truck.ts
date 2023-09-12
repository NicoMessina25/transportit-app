import { FieldValues } from "@modular-forms/react";
import { City } from "./city";
import { Driver } from "./driver";

export interface Truck extends FieldValues {
    truckid: number;
    driver: Driver;
    dischargedate: Date;
    tuition: string;
    maxweight:number;
    available:boolean;
    city:City;
}