import ShippingRequestForm from '@/appComponents/Forms/shippingRequestForm';
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout';
import useShippingRequestsCont from '@/src/hooks/controllers/shippingRequest/useShippingRequestsCont';
import { NextRouter, useRouter } from 'next/router';
import React from 'react'


export default function ShippingRequestAddView() {
    const router:NextRouter = useRouter();
    
    const {save: {saveEntity}} = useShippingRequestsCont({onSave:()=>{
        router.back();
    }})

    return <GenericLayout title='Solicitudes de Envío'> 
        <ShippingRequestForm onSubmit={saveEntity} />      
    </GenericLayout>  

}
