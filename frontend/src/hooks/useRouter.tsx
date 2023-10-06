 

import React from 'react'
import { useRouter as useNextRouter } from 'next/navigation'
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { useDispatch } from 'react-redux';
import { setLoader } from '../redux/slices/loaderSlice';

export default function useRouter():AppRouterInstance {
    const router:AppRouterInstance = useNextRouter();
    const dispatch = useDispatch()

    return {...router, push:(path:string)=>{
        dispatch(setLoader(true))
        return router.push(path)
    }}
}
