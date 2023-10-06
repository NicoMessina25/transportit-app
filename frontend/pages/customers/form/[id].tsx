 

import CustomerForm from '@/appComponents/Forms/customerForm'
import GenericEditEntityView from '@/appComponents/GenericEditEntityView/GenericEditEntityView'
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout'
import useCustomersCont from '@/src/hooks/controllers/customer/useCustomersCont'
import useCustomers from '@/src/hooks/fetchers/customer/useCustomers'
import { EditProps } from '@/src/types/form'
import { NextRouter, useRouter } from 'next/router'
import React from 'react'

export default function CustomerEdit() {
    const router:NextRouter = useRouter();
    const {params}:EditProps = {params: {
        id: Number(router.query.id)
    }} 
    return <GenericLayout title='Customers'> 
        <GenericEditEntityView formComponent={CustomerForm} useFetcher={useCustomers} useEntityCont={useCustomersCont} params={params} />    
    </GenericLayout>

}
