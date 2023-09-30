"use client"

import React from 'react'
import CustomerForm from '../../../Components/Forms/customerForm';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import useCustomersCont from '@/app/hooks/controllers/customer/useCustomersCont';
import useRouter from '@/app/hooks/useRouter';
import useLoader from '@/app/hooks/useLoader';


export default function CustomerAddView() {
    const router:AppRouterInstance = useRouter();
    useLoader()
    
    const {save: {saveEntity}} = useCustomersCont({onSave:()=>{
        router.back();
    }})

    return <CustomerForm onSubmit={saveEntity} />        

}
