
import { City } from "./city";
import { Driver } from "./driver";
import { Indexable } from "./indexable";

export interface Truck extends Indexable {
    truckId?: number;
    driver?: Driver;
    registrationDate?: Date;
    registration: string;
    maxweight:number;
    available?:boolean;
    city?:City;
}

export const defaultTruck:Truck = {
    registration:"",
    maxweight:7000
}