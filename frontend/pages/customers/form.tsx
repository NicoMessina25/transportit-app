 

import CustomerForm from '@/appComponents/Forms/customerForm';
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout';
import useCustomersCont from '@/src/hooks/controllers/customer/useCustomersCont';
import { NextRouter, useRouter } from 'next/router';
import React from 'react'


export default function CustomerAddView() {
    const router:NextRouter = useRouter();
    
    const {save: {saveEntity}} = useCustomersCont({onSave:()=>{
        router.back();
    }})

    return <GenericLayout title='Customers'> 
        <CustomerForm onSubmit={saveEntity} />      
    </GenericLayout>  

}
