import shippingRequestForm from '@/appComponents/Forms/shippingRequestForm'
import GenericEditEntityView from '@/appComponents/GenericEditEntityView/GenericEditEntityView'
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout'
import useShippingRequestsCont from '@/src/hooks/controllers/shippingRequest/useShippingRequestsCont'
import useShippingRequests from '@/src/hooks/fetchers/shippingRequest/useShippingRequests'
import { EditProps } from '@/src/types/form'
import { NextRouter, useRouter } from 'next/router'
import React from 'react'

export default function ShippingRequestEdit() {
    const router:NextRouter = useRouter();
    const {params}:EditProps = {params: {
        id: Number(router.query.id)
    }} 
    return <GenericLayout title='Conductores'> 
        <GenericEditEntityView formComponent={shippingRequestForm} useFetcher={useShippingRequests} useEntityCont={useShippingRequestsCont} params={params} />    
    </GenericLayout>

}