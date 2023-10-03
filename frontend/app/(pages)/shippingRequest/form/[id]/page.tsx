"use client"

import React from 'react'
import { EditProps } from '@/app/types/form';
import GenericEditEntityView from '@/app/Components/GenericEditEntityView/GenericEditEntityView';
import ShippingRequestForm from '../../../../Components/Forms/shippingRequestForm';
import useShippingRequests from '@/app/hooks/fetchers/shippingRequest/useShippingRequests';
import useShippingRequestsCont from '@/app/hooks/controllers/shippingRequest/useShippingRequestsCont';

export default function ShippingRequestUpdateForm({params}:EditProps) {
    return <GenericEditEntityView formComponent={ShippingRequestForm} useFetcher={useShippingRequests} useEntityCont={useShippingRequestsCont}  params={params} />    

}