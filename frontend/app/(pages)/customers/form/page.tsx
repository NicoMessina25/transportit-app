"use client"

import { CUSTOMERS, SAVE_CUSTOMER } from '@/app/graphql/customer/customerQueries';
import { Customer } from '@/app/types/customer';
import { CustomResponse } from '@/app/types/serverResponse';
import {  useMutation } from '@apollo/client';
import React from 'react'
import CustomerForm from '../../../Components/Forms/customerForm';
import { ToastContainer } from 'react-toastify';
import useQueryMutHandler from '@/app/hooks/useQueryMutHandler';
import { useRouter } from 'next/navigation';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { DRIVERS } from '@/app/graphql/driver/driverQueries';
import useCustomersCont from '@/app/hooks/controllers/customer/useCustomersCont';


export default function CustomerAddView() {
    const router:AppRouterInstance = useRouter();
    
    const {save: {saveEntity}} = useCustomersCont({onSave:()=>{
        router.back();
    }})

    return <CustomerForm onSubmit={saveEntity} />        

}
