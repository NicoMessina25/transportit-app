
import { City, defaultCity } from "./city";
import { FeePayment, defaultFeePayment } from "./fee";
import { Indexable } from "./indexable";
import { Truck } from "./truck";

export interface Driver extends Indexable{
    driverId?: number,
    firstname: string;
    lastname:string;
    document: string;
    address?:string;
    province?:string;
    city?:string;
    phone:string;
    particular?:boolean;
    available?:boolean;
    fee?: FeePayment;
    trucks?: Truck[];
    currentcity?: City;
}

export const defaultDriver:Driver = {
    driverId: undefined,
    firstname: "",
    lastname: "",
    address: "",
    document: "",
    province:"",
    phone:"",
    city:"",
    particular:false,
    available:true,
    fee: undefined,
    trucks: [],
    currentcity: undefined
}