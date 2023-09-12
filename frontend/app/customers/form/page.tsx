"use client"

import { SAVE_CUSTOMER } from '@/app/graphql/customer/customerQueries';
import { Customer } from '@/app/types/customer';
import { CustomResponse } from '@/app/types/serverResponse';
import {  useMutation } from '@apollo/client';
import React from 'react'
import CustomerForm from './customerForm';
import { ToastContainer } from 'react-toastify';
import useQueryMutHandler from '@/app/hooks/useQueryMutHandler';
import { useRouter } from 'next/navigation';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';


export default function CustomerAddView() {
    const router:AppRouterInstance = useRouter();

    const [saveCustomer, saveCustomerMutation] = useMutation<{saveCustomer: CustomResponse}>(SAVE_CUSTOMER);
    
    useQueryMutHandler<{saveCustomer: CustomResponse}>({result: saveCustomerMutation, queryMutName:"saveCustomer", onSuccess:()=>{
        router.push("./list");
    }})

    return <CustomerForm onSubmit={(e:Customer)=>{
                saveCustomer({variables:{customer: e}})
        }} />        

}
