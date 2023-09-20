import { Indexable } from "../Components/Table/Table";
import { City } from "./city";
import { Trailer } from "./trailer";

export interface Park extends Indexable {
    parkid: number;
    city: City;
    trailers: Trailer[];
}