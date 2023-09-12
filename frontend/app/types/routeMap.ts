import { FieldValues } from "@modular-forms/react";
import { EShippingState } from "./EShippingState";
import { Driver } from "./driver";
import { Package } from "./package";
import { Trailer } from "./trailer";
import { Truck } from "./truck";

export interface RouteMap extends FieldValues {
    routeMapid: number;
    state: EShippingState;
    payloadVolume: number;
    startDate:Date;
    price: number;
    driver:Driver;
    truck: Truck;
    trailer: Trailer;
    packages: Package[];
}