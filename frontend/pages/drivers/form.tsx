 

import DriverForm from '@/appComponents/Forms/driverForm';
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout';
import useDriversCont from '@/src/hooks/controllers/driver/useDriversCont';
import { NextRouter, useRouter } from 'next/router';
import React from 'react'


export default function DriverAddView() {
    const router:NextRouter = useRouter();
    
    const {save: {saveEntity}} = useDriversCont({onSave:()=>{
        router.back();
    }})

    return <GenericLayout title='Conductores'> 
        <DriverForm onSubmit={saveEntity} />      
    </GenericLayout>  

}
