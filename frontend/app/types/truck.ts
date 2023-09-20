import { Indexable } from "../Components/Table/Table";
import { City } from "./city";
import { Driver } from "./driver";

export interface Truck extends Indexable {
    truckid?: number;
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