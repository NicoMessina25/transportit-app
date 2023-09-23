"use client"

import useQueryMutHandler from '@/app/hooks/useQueryMutHandler';
import { EditProps, FormProps } from '@/app/types/form'
import { GraphMutation, GraphQuery } from '@/app/types/graphql';
import { DocumentNode, useMutation, useQuery } from '@apollo/client';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { useRouter } from 'next/navigation';
import React, { useEffect, useState } from 'react'
import { Indexable } from '../Table/Table';
import { Spinner } from 'react-bootstrap';
import { Fetcher } from '@/app/types/fetcher';
import { ControllerInterface, ControllerProps } from '@/app/types/controller';

interface GenericEditProps<TEntity> extends EditProps {
    useFetcher: Fetcher<TEntity>,
    useEntityCont: (props: ControllerProps) => ControllerInterface
    formComponent: (props: FormProps<TEntity>) => React.JSX.Element
}

export default function GenericEdit<TEntity>({params, useFetcher, useEntityCont, formComponent}:GenericEditProps<TEntity>) {

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
