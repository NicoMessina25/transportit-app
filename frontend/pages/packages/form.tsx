import PackageForm from '@/appComponents/Forms/packageForm';
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout';
import usePackagesCont from '@/src/hooks/controllers/package/usePackagesCont';
import { NextRouter, useRouter } from 'next/router';
import React from 'react'


export default function PackageAddView() {
    const router:NextRouter = useRouter();
    
    const {save: {saveEntity}} = usePackagesCont({onSave:()=>{
        router.back();
    }})

    return <GenericLayout title='Packages'> 
        <PackageForm onSubmit={saveEntity} />      
    </GenericLayout>  

}
