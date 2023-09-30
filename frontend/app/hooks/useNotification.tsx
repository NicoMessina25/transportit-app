"use client"

import React from 'react'
import { AppDispatch } from '../redux/store'
import { useDispatch } from 'react-redux'
import { createAlert } from '../redux/slices/alertSlice'
import { EAlertType } from '../types/alert'

export type NotifyFunction = (message:string)=>void

export interface UseNotificationProps{
    notifyInfo:NotifyFunction,
    notifyError:NotifyFunction,
    notifyWarning:NotifyFunction,
    notifySuccess:NotifyFunction
}

export default function useNotification():UseNotificationProps {
    const dispatch:AppDispatch = useDispatch();
    
    /* const getAlertColor = (type:EAlertType):string =>{
        if(type == EAlertType.ERROR) return "red"
        if(type == EAlertType.WARNING) return "yellow"
        if(type == EAlertType.SUCCESS) return "lime"
        return "cyan"
    } */

    const notifyInfo = (message:string) =>
        dispatch(createAlert({title:"Info",color:"cyan",message,icon:"ph:info-bold"}))

    
    const notifyError = (message:string) => 
        dispatch(createAlert({title:"Error",color:"red",message,icon:"ph:warning-circle-bold"}))
    
    const notifyWarning = (message:string) => 
        dispatch(createAlert({title:"Advertencia",color:"yellow",message,icon:"ph:warning-bold"}))
    
    const notifySuccess = (message:string) => 
    dispatch(createAlert({title:"Éxito",color:"lime",message,icon:"ph:check-circle-bold"}))

    return {notifyInfo, notifyError, notifyWarning, notifySuccess}
}
