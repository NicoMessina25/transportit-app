import { Indexable } from "../Components/Table/Table";
import { Park } from "./park";

export interface Trailer extends Indexable {
    trailerid:number;
    weight:number;
    payloadWeight:number;
    registration:string;
    available:boolean;
    park: Park;
}