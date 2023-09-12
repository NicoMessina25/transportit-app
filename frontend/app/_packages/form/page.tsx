

import { SAVE_PACKAGE } from '@/app/graphql/_package/packageQueries';
import useQueryMutHandler from '@/app/hooks/useQueryMutHandler';
import { CustomResponse } from '@/app/types/serverResponse';
import { useMutation } from '@apollo/client';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { useRouter } from 'next/navigation';
import React from 'react'
import PackageForm from './packageForm';
import { Package } from '@/app/types/package';

interface SavePackageResponse {
    savePackage: CustomResponse
}


export default function PagkageAddView() {
    const router:AppRouterInstance = useRouter();

    const [savePackage, savePackageMutation] = useMutation<SavePackageResponse>(SAVE_PACKAGE);
    
    useQueryMutHandler<SavePackageResponse>({result: savePackageMutation, queryMutName:"savePackage", onSuccess:()=>{
        router.push("./list");
    }})
    
    return <PackageForm onSubmit={(p:Package)=>{
        savePackage({variables: {package: p}})
    }} />
}
