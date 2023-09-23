"use client"

import GenericCRUD from '@/app/Components/GenericCRUD/GenericCRUD';
import useDriversCont from '@/app/hooks/controllers/driver/useDriversCont';
import useDrivers from '@/app/hooks/fetchers/driver/useDrivers';
import { Driver } from '@/app/types/driver';
import React from 'react'

export default function DriverCRUD() {

    const cityField = (driver:Driver, key:React.Key) => <td key={key}>{driver.currentcity?.name ?? ""}</td>
    const {delete:{deleteEntity}} = useDriversCont({});


    return <GenericCRUD useFetcher={useDrivers} deleteEntity={deleteEntity} columns={[{
        field: 'driverId',
        header: 'Id'
    }, {
        field: 'firstname',
        header: 'Nombre'
    },{
        field: 'lastname',
        header: 'Apellido'
    },{
        field: 'document',
        header: 'Documento'
    },{
        field: 'address',
        header: 'Dirección'
    },{
        field: 'phone',
        header: 'Teléfono'
    },{
        field: 'currentcity',
        header: 'Ciudad actual',
        body: cityField
    }]} entityIdField='driverId' />
}
