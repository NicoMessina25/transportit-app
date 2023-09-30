"use client"

import React from 'react'
import RouteMapForm from '../../../Components/Forms/routeMapForm';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import useRouteMapsCont from '@/app/hooks/controllers/routeMap/useRouteMapsCont';
import useRouter from '@/app/hooks/useRouter';


export default function RouteMapAddView() {
    const router:AppRouterInstance = useRouter();
    
    const {save: {saveEntity}} = useRouteMapsCont({onSave:()=>{
        router.back();
    }})

    return <RouteMapForm onSubmit={saveEntity} />        

}
