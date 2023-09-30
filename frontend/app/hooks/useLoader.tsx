"use client"

import React, { useEffect } from 'react'
import { useDispatch } from 'react-redux'
import { setLoader } from '../redux/slices/loaderSlice'

export default function useLoader() {
    const dispatch = useDispatch()
    
    useEffect(()=>{
        dispatch(setLoader(false))
    },[])

    const loader = (loading:boolean)=>dispatch(setLoader(loading))

    return loader
}
