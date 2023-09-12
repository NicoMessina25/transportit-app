import { FieldValues } from "@modular-forms/react";

export interface Customer extends FieldValues {
    customerid: number;
    firstname: string;
    lastname: string;
    document: string;
    address: string;
}