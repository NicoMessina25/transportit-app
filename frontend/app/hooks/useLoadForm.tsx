import { FieldValues, FormStore, PartialValues, ResponseData, setValues } from '@modular-forms/react';
import React, {useEffect} from 'react'

export default function useLoadForm<TFieldValue extends FieldValues, TResponseData extends ResponseData = undefined>(form:FormStore<TFieldValue, TResponseData>, loadingInitialValue?:boolean, initialValue?: PartialValues<TFieldValue>) {


    useEffect(() => {
        if(!loadingInitialValue && initialValue){
            setValues(form, {
                ...initialValue
            });
        }
    }, [loadingInitialValue])
}

