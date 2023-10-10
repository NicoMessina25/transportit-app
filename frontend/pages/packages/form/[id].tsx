import packageForm from '@/appComponents/Forms/packageForm'
import GenericEditEntityView from '@/appComponents/GenericEditEntityView/GenericEditEntityView'
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout'
import usePackagesCont from '@/src/hooks/controllers/package/usePackagesCont'
import usePackages from '@/src/hooks/fetchers/package/usePackages'
import { EditProps } from '@/src/types/form'
import { NextRouter, useRouter } from 'next/router'
import React from 'react'

export default function PackageEdit() {
    const router:NextRouter = useRouter();
    const {params}:EditProps = {params: {
        id: Number(router.query.id)
    }} 
    return <GenericLayout title='Paquetes'> 
        <GenericEditEntityView formComponent={packageForm} useFetcher={usePackages} useEntityCont={usePackagesCont} params={params} />    
    </GenericLayout>

}