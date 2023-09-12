"use client"

import useQueryMutHandler from '@/app/hooks/useQueryMutHandler';
import { EditProps, FormProps } from '@/app/types/form'
import { GraphMutation, GraphQuery } from '@/app/types/graphql';
import { useMutation, useQuery } from '@apollo/client';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { useRouter } from 'next/navigation';
import React from 'react'
import { Indexable } from '../Table/Table';

interface GenericEditProps<TEntity> extends EditProps {
    getByIdQuery: GraphQuery,
    updateMutation: GraphMutation,
    formComponent: (props: FormProps<TEntity>) => React.JSX.Element
    entityName: string
}

export default function GenericEdit<TEntity, TGetByIdQuery extends Indexable, TUpdateMutation extends Indexable>({params, getByIdQuery, updateMutation, formComponent, entityName}:GenericEditProps<TEntity>) {

    const {id} = params;
    const router:AppRouterInstance = useRouter();
    const {data, loading} = useQuery<TGetByIdQuery>(getByIdQuery.query, {
        variables: {id}
    });
    const [updateEntity, updateEntityMutation] = useMutation<TUpdateMutation>(updateMutation.mutation);
    
    useQueryMutHandler({result:updateEntityMutation, queryMutName: updateMutation.name, onSuccess: ()=>{
        router.push("../list");
    }})

    return React.createElement(formComponent, {
        onSubmit: (e:TEntity)=>{
            const variables = {id: id, [entityName]: e}
            updateEntity({variables})
        },
        initialValue: data?.[entityName],
        loadingInitialValue: loading
    })
}
