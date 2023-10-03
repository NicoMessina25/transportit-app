"use client"

import { CustomResponse } from '@/app/types/serverResponse';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import usePackagesCont from '@/app/hooks/controllers/package/usePackagesCont';
import { useRouter } from 'next/navigation';
import React from 'react'
import PackageForm from '../../../Components/Forms/packageForm';
import useLoader from '@/app/hooks/useLoader';

interface SavePackageResponse {
    savePackage: CustomResponse
}


export default function PackageAddView() {
    const router:AppRouterInstance = useRouter();
    const {save:{saveEntity}} = usePackagesCont({onSave:()=>{
        router.back();
    }})
    useLoader()

    return <PackageForm onSubmit={saveEntity} />   
}
