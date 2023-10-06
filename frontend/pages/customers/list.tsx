 

import GenericCRUDTable from '@/appComponents/GenericCRUDTable/GenericCRUDTable';
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout';
import useCustomersCont from '@/src/hooks/controllers/customer/useCustomersCont';
import useCustomers from '@/src/hooks/fetchers/customer/useCustomers';
import React from 'react'


export default function CustomerCRUD() {

  const { delete: {deleteEntity} } = useCustomersCont({});

  return <GenericLayout title='Customers'> 
    <GenericCRUDTable useFetcher={useCustomers} deleteEntity={deleteEntity} columns={[{
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
  </GenericLayout>
}
