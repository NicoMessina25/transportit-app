 

import GenericCRUDTable from '@/appComponents/GenericCRUDTable/GenericCRUDTable';
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout';
import { Cell } from '@/appComponents/Table/Table';
import useDriversCont from '@/src/hooks/controllers/driver/useDriversCont';
import useDrivers from '@/src/hooks/fetchers/driver/useDrivers';
import { Driver } from '@/src/types/driver';
import React from 'react'


export default function DriverCRUD() {
    const cityField: ({row}: Cell<Driver>) => React.JSX.Element = ({row:{original}}) => <div>{original.currentcity?.name ?? ""}</div>
    const { delete: {deleteEntity} } = useDriversCont({});

    return <GenericLayout title='Conductores'> 
        <GenericCRUDTable useFetcher={useDrivers} deleteEntity={deleteEntity} columns={[{
            accessorKey: 'driverId',
            header: 'Id'
        }, {
            accessorKey: 'firstname',
            header: 'Nombre'
        },{
            accessorKey: 'lastname',
            header: 'Apellido'
        },{
            accessorKey: 'document',
            header: 'Documento'
        },{
            accessorKey: 'address',
            header: 'Dirección'
        },{
            accessorKey: 'phone',
            header: 'Teléfono'
        },{
            accessorKey: 'currentcity',
            header: 'Ciudad actual',
            cell: cityField
        }]} entityIdField='driverId' />
    </GenericLayout>
}
