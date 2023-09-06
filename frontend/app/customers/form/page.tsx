"use client"

import { SAVE_CUSTOMER } from '@/app/graphql/customer/customerQueries';
import { Customer } from '@/app/types/customer';
import { CustomResponse } from '@/app/types/serverResponse';
import {  useMutation } from '@apollo/client';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { useRouter } from 'next/navigation';
import React, {useEffect} from 'react'
import CustomerForm from './customerForm';
import { ToastContainer } from 'react-toastify';
import { notifyError, notifyInfo } from '@/app/types/toastFunctions';


export default function CustomerAddView() {

    const router:AppRouterInstance = useRouter();
    const [saveCustomer, saveCustomerMutation] = useMutation<{saveCustomer: CustomResponse}>(SAVE_CUSTOMER);
    
    useEffect(() => {
        const responseMessage = saveCustomerMutation.data?.saveCustomer.message ?? "";
        if(!saveCustomerMutation.loading && saveCustomerMutation.data?.saveCustomer.success){
            notifyInfo(responseMessage)
            router.push('./list')
        } else if (saveCustomerMutation.error) notifyError(responseMessage)
    }, [saveCustomerMutation.loading])
    

    return (<>
        <CustomerForm onSubmit={(e:Customer)=>{
                saveCustomer({variables:{customer: e}})
        }} />
        
        <ToastContainer />
        
        </>
    )
}
