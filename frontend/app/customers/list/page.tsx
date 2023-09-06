"use client"

import Table, { Column } from '@/app/Components/Table/Table'
import { CUSTOMERS, DELETE_CUSTOMER } from '@/app/graphql/customer/customerQueries';
import { Customer } from '@/app/types/customer';
import { CustomResponse } from '@/app/types/serverResponse';
import { notifyError, notifyInfo } from '@/app/types/toastFunctions';
import { useMutation, useQuery } from '@apollo/client';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { useRouter } from 'next/navigation';
import React, { useEffect } from 'react'
import { ToastContainer } from 'react-toastify';

export default function CustomerPage() {

  const customerColums: Column[] = [{
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
  }]

  const router:AppRouterInstance = useRouter()
  const {data, error, loading, refetch} = useQuery<{customers: Customer[]}>(CUSTOMERS)
  const [deleteCustomer, deleteCustomerMutation] = useMutation<{deleteCustomer: CustomResponse}>(DELETE_CUSTOMER)


  useEffect(() => {
      const responseMessage = deleteCustomerMutation.data?.deleteCustomer.message ?? "";
      if(!deleteCustomerMutation.loading && deleteCustomerMutation.data?.deleteCustomer.success){
          notifyInfo(responseMessage);
          refetch();
      } else if (deleteCustomerMutation.error) notifyError(responseMessage)
  }, [deleteCustomerMutation.loading])

  if(loading)
    return <p>Cargando...</p>

  return (
    <div>
      {<Table columns={customerColums} items={data?.customers ?? []} itemsKeyField="customerid" onEdit={(c)=>{
        router.push(`./form/${c.customerid}`)
      }} onDelete={(c)=>{
        deleteCustomer({variables: {
          id: c.customerid
        }})
      }} />}
      <button className='bg-orange-400' onClick={()=>router.push("./form")} >Agregar</button>

      <ToastContainer />
    </div>
  )
}
