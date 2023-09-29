"use client"

import GenericCRUDView from '@/app/Components/GenericCRUDView/GenericCRUDView';
import useCustomersCont from '@/app/hooks/controllers/customer/useCustomersCont';
import useCustomers from '@/app/hooks/fetchers/customer/useCustomers';
import React from 'react'


export default function CustomerCRUD() {

  const { delete: {deleteEntity} } = useCustomersCont({});

  return <GenericCRUDView useFetcher={useCustomers} deleteEntity={deleteEntity} columns={[{
    accessorKey: 'customerid',
    header: 'Id'
  }, {
    accessorKey: 'firstname',
    header: 'Nombre'
  },{
    accessorKey: 'lastname',
    header: 'Apellido'
  },{
    accessorKey: 'document',
    header: 'Documento'
  },{
    accessorKey: 'address',
    header: 'Dirección'
  }]} entityIdField='customerid' />
}
