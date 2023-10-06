import { EShippingState } from "./EShippingState";
import { City } from "./city";
import { Customer } from "./customer";
import { Indexable } from "./indexable";
import { Package } from "./package";

export interface ShippingRequest extends Indexable {
    requestid?: number,
    price: number,
    state?: EShippingState,
    requestDate?: Date
    cityFrom?: City;
    cityTo?: City,
    customer?: Customer;
    packages: Package[]
}

export const defaultShippingRequest:ShippingRequest = {
    requestid: undefined,
    price: 0,
    state: undefined,
    requestDate: undefined,
    cityFrom: undefined,
    cityTo: undefined,
    customer: undefined,
    packages: []
    

}