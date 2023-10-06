 

import React, {  } from 'react'
import Spinner from '../Spinner/Spinner';
import { EditProps, FormProps } from '@/src/types/form';
import { Fetcher } from '@/src/types/fetcher';
import { ControllerInterface, ControllerProps } from '@/src/types/controller';
import { useRouter } from 'next/router';

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
