"use client"

import GenericCRUD from '@/app/Components/GenericCRUD/GenericCRUD';
import { DELETE_DRIVER, DRIVERS } from '@/app/graphql/driver/driverQueries';
import { Driver } from '@/app/types/driver';
import React from 'react'

export default function DriverCRUD() {

    const cityField = (driver:Driver, key:React.Key) => <td key={key}>{driver.currentcity?.name ?? ""}</td>

    return <GenericCRUD getQuery={{name: "drivers", query: DRIVERS}} deleteMutation={{name:"deleteDriver", mutation: DELETE_DRIVER}} columns={[{
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
