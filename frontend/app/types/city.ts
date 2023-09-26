import { Indexable } from "../Components/Table/Table";

export interface City extends Indexable {
    cityId?: number,
    name?: string
}

export const defaultCity:City = {
    cityId:-1,
    name:""
}

