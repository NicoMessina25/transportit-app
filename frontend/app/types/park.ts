import { FieldValues } from "@modular-forms/react";
import { City } from "./city";
import { Trailer } from "./trailer";

export interface Park extends FieldValues {
    parkid: number;
    city: City;
    trailers: Trailer[];
}