import { Indexable } from "../Components/Table/Table";
import { EShippingState } from "./EShippingState";
import { Driver, defaultDriver } from "./driver";
import { Package } from "./package";
import { Trailer, defaultTrailer } from "./trailer";
import { Truck, defaultTruck } from "./truck";

export interface RouteMap extends Indexable {
    routeMapid?: number;
    state: EShippingState;
    payloadVolume: number;
    startDate:Date;
    price?: number;
    driver:Driver;
    truck: Truck;
    trailer: Trailer;
    packages: Package[];
}

export const defaultRouteMap:RouteMap = {
    routeMapid: undefined,
    state: EShippingState.ORDERED,
    payloadVolume: 0,
    startDate: new Date(),
    driver: defaultDriver,
    truck: defaultTruck,
    trailer: defaultTrailer,
    packages: []
}