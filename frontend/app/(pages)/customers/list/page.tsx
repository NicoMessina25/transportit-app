"use client"

import GenericCRUD from '@/app/Components/GenericCRUD/GenericCRUD';
import useCustomersCont from '@/app/hooks/controllers/customer/useCustomersCont';
import useCustomers from '@/app/hooks/fetchers/customer/useCustomers';
import React from 'react'


export default function CustomerCRUD() {

  const { delete: {deleteEntity} } = useCustomersCont({});

  return <GenericCRUD useFetcher={useCustomers} deleteEntity={deleteEntity} columns={[{
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
