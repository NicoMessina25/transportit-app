"use client"

import { CUSTOMERS, GET_CUSTOMER, UPDATE_CUSTOMER } from '@/app/graphql/customer/customerQueries';
import React from 'react'
import CustomerForm from '../customerForm';
import { EditProps } from '@/app/types/form';
import GenericEdit from '@/app/Components/GenericEdit/GenericEdit';

export default function CustomerEdit({params}:EditProps) {

    return <GenericEdit formComponent={CustomerForm} getByIdQuery={{name: "customer", query: GET_CUSTOMER}} updateMutation={{name:"updateCustomer", mutation:UPDATE_CUSTOMER}} entityName='customer' params={params} queryToRefetch={CUSTOMERS} entityIdField={"customerid"} />    
  

}
