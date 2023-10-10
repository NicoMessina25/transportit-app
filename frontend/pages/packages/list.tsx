 

import GenericCRUDTable from '@/appComponents/GenericCRUDTable/GenericCRUDTable';
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout';
import { Cell } from '@/appComponents/Table/Table';
import usePackagesCont from '@/src/hooks/controllers/package/usePackagesCont';
import usePackages from '@/src/hooks/fetchers/package/usePackages';
import { Package } from '@/src/types/package';
import React from 'react'

export default function PackageCRUD() {

    const {delete:{deleteEntity}} = usePackagesCont({});

    return <GenericLayout title='Paquetes'> 
     <GenericCRUDTable useFetcher={usePackages} deleteEntity={deleteEntity} columns={[{
        accessorKey: 'packageId',
        header: 'Id'
    },{
        accessorKey: 'recipientFirstname',
        header: 'Nombre receptor'
    }, {
        accessorKey: 'recipientDocument',
        header: 'Documento receptor'
    },{
        accessorKey: 'weight',
        header: 'Peso'
    },{
        accessorKey: 'size',
        header: 'Tamaño'
    },{
        accessorKey: 'price',
        header: 'Precio'
    }]} entityIdField='packageId' />
    </GenericLayout>
}
