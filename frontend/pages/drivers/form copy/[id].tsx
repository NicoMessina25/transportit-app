 

import driverForm from '@/appComponents/Forms/driverForm'
import GenericEditEntityView from '@/appComponents/GenericEditEntityView/GenericEditEntityView'
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout'
import useDriversCont from '@/src/hooks/controllers/driver/useDriversCont'
import useDrivers from '@/src/hooks/fetchers/driver/useDrivers'
import { EditProps } from '@/src/types/form'
import { NextRouter, useRouter } from 'next/router'
import React from 'react'

export default function DriverEdit() {
    const router:NextRouter = useRouter();
    const {params}:EditProps = {params: {
        id: Number(router.query.id)
    }} 
    return <GenericLayout title='Conductores'> 
        <GenericEditEntityView formComponent={driverForm} useFetcher={useDrivers} useEntityCont={useDriversCont} params={params} />    
    </GenericLayout>

}
