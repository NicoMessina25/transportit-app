"use client"

import { SAVE_SHIPPING_REQUEST } from '@/app/graphql/shippingRequest/shippingRequestQueries';
import useQueryMutHandler from '@/app/hooks/useQueryMutHandler';
import { CustomResponse } from '@/app/types/serverResponse';
import { ShippingRequest } from '@/app/types/shippingRequest';
import { useMutation } from '@apollo/client';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import useRouter from '@/app/hooks/useRouter';
import React from 'react'
import ShippingRequestForm from '../../../Components/Forms/shippingRequestForm';

interface SaveShippingRequestResponse {
    saveShippingRequest: CustomResponse
}


export default function ShippingRequestAddView() {
    const router:AppRouterInstance = useRouter();

    const [saveShippingRequest, saveShippingRequestMutation] = useMutation<SaveShippingRequestResponse>(SAVE_SHIPPING_REQUEST);
    
    useQueryMutHandler<SaveShippingRequestResponse>({result: saveShippingRequestMutation, queryMutName:"saveShippingRequest", onSuccess:()=>{
        router.push("./list");
    }})
    
    return <ShippingRequestForm onSubmit={(sr:ShippingRequest)=>{
        saveShippingRequest({variables: {package: sr}})
    }} />
}
