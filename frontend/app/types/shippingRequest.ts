import { Indexable } from "../Components/Table/Table";
import { EShippingState } from "./EShippingState";
import { City } from "./city";
import { Customer } from "./customer";
import { Package } from "./package";

export interface ShippingRequest extends Indexable {
    requestid: number,
    price: number,
    state: EShippingState,
    requesDate: Date
    cityFrom: City;
    cityTo: City,
    customer: Customer;
    packages: Package[]
}