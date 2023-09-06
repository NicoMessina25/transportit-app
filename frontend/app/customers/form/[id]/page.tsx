"use client"

import { GET_CUSTOMER, UPDATE_CUSTOMER } from '@/app/graphql/customer/customerQueries';
import { Customer } from '@/app/types/customer';
import { CustomResponse } from '@/app/types/serverResponse';
import { useMutation, useQuery } from '@apollo/client';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { useRouter } from 'next/navigation';
import React, {useEffect} from 'react'
import CustomerForm from '../customerForm';
import { ToastContainer } from 'react-toastify';

type CustomerEditProps = {
    params:{ id?: number}
}

export default function CustomerEdit({params}:CustomerEditProps) {

    const {id} = params;
    const router:AppRouterInstance = useRouter();
    const {data, loading} = useQuery<{customer: Customer}>(GET_CUSTOMER, {
        variables: {id}
    });
    const [updateCustomer, updateCustomerMutation] = useMutation<{updateCustomer: CustomResponse}>(UPDATE_CUSTOMER);
    
    useEffect(() => {
        console.log(updateCustomerMutation);
        if(!updateCustomerMutation.loading && updateCustomerMutation.data?.updateCustomer.success){
            router.push("../list");
        }
    }, [updateCustomerMutation.loading])
    

    return (<>
    
        <CustomerForm initialValue={data?.customer} loadingInitialValue={loading} onSubmit={(e:Customer)=>{
            const variables = {id: id, customer: e}
            updateCustomer({variables});
        }} />

        <ToastContainer />
    
    </>)

}
