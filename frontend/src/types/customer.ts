import { Indexable } from "../Components/Table/Table";

export interface Customer extends Indexable {
    customerid: number | null;
    firstname: string;
    lastname: string;
    document: string;
    address: string;
}

export const defaultCustomer:Customer = {
    customerid: null,
    firstname: "",
    lastname: "",
    address: "",
    document: ""
}