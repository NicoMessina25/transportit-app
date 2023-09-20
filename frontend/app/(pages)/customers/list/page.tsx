"use client"

import GenericCRUD from '@/app/Components/GenericCRUD/GenericCRUD';
import { CUSTOMERS, DELETE_CUSTOMER } from '@/app/graphql/customer/customerQueries';
import React from 'react'


export default function CustomerCRUD() {

  return <GenericCRUD getQuery={{name: "customers", query: CUSTOMERS}} deleteMutation={{name:"deleteCustomer", mutation: DELETE_CUSTOMER}} columns={[{
    field: 'customerid',
    header: 'Id'
  }, {
    field: 'firstname',
    header: 'Nombre'
  },{
    field: 'lastname',
    header: 'Apellido'
  },{
    field: 'document',
    header: 'Documento'
  },{
    field: 'address',
    header: 'Dirección'
  }]} entityIdField='customerid' />
}
