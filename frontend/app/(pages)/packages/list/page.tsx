"use client"

import GenericCRUDView from '@/app/Components/GenericCRUDView/GenericCRUDView';
import usePackagesCont from '@/app/hooks/controllers/package/usePackagesCont';
import usePackages from '@/app/hooks/fetchers/package/usePackages';
import React from 'react'

export default function PackageCRUD() {

    const {delete:{deleteEntity}} = usePackagesCont({});

    return <GenericCRUDView useFetcher={usePackages} deleteEntity={deleteEntity} columns={[{
        accessorKey: 'packageId',
        header: 'Id'
    }, {
        accessorKey: 'weight',
        header: 'Peso'
    },{
        accessorKey: 'size',
        header: 'Tamaño'
    },{
        accessorKey: 'price',
        header: 'Precio'
    },{
        accessorKey: 'recipientDocument',
        header: 'Documento receptor'
    },{
        accessorKey: 'recipientFirstname',
        header: 'Nombre receptor'
    }]} entityIdField='packageId' />
}
