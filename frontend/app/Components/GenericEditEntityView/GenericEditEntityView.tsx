"use client"

import { EditProps, FormProps } from '@/app/types/form'
import useRouter from '@/app/hooks/useRouter';
import React, {  } from 'react'
import { Fetcher } from '@/app/types/fetcher';
import { ControllerInterface, ControllerProps } from '@/app/types/controller';
import useLoader from '@/app/hooks/useLoader';
import Spinner from '../Spinner/Spinner';

interface GenericEditEntityViewProps<TEntity> extends EditProps {
    useFetcher: Fetcher<TEntity>,
    useEntityCont: (props: ControllerProps) => ControllerInterface
    formComponent: (props: FormProps<TEntity>) => React.JSX.Element
}

export default function GenericEditEntityView<TEntity>({params, useFetcher, useEntityCont, formComponent}:GenericEditEntityViewProps<TEntity>) {

    const {id} = params;
    const router = useRouter();
    const {data, loading, refetch} = useFetcher(id);
    const {update:{updateEntity}} = useEntityCont({onUpdate:()=>{
        router.back();
        refetch();
    }});

    useLoader()


    if(loading)
        return <Spinner/>
    
    if(data instanceof Array)
        return
 

    return React.createElement(formComponent, {
        onSubmit: (e:TEntity)=>{
            id && updateEntity(e, id);
        },
        initialValue: data 
    })
}
