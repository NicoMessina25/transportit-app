import { Indexable } from "../Components/Table/Table";
import { Park, defaultPark } from "./park";

export interface Trailer extends Indexable {
    trailerid?:number;
    weight:number;
    payloadWeight:number;
    registration:string;
    available:boolean;
    park: Park;
}

export const defaultTrailer:Trailer = {
    weight: 0,
    payloadWeight: 0,
    registration: "",
    available: true,
    park: defaultPark
}