"use client"

import useQueryMutHandler from '@/app/hooks/useQueryMutHandler';
import { EditProps, FormProps } from '@/app/types/form'
import { GraphMutation, GraphQuery } from '@/app/types/graphql';
import { DocumentNode, useMutation, useQuery } from '@apollo/client';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { useRouter } from 'next/navigation';
import React, { useEffect } from 'react'
import { Indexable } from '../Table/Table';
import { Spinner } from 'react-bootstrap';

interface GenericEditProps<TEntity> extends EditProps {
    getByIdQuery: GraphQuery,
    updateMutation: GraphMutation,
    queryToRefetch: DocumentNode,
    formComponent: (props: FormProps<TEntity>) => React.JSX.Element
    entityName: string,
    entityIdField:string,
}

export default function GenericEdit<TEntity, TGetByIdQuery extends Indexable, TUpdateMutation extends Indexable>({params, getByIdQuery, updateMutation, formComponent, entityName,queryToRefetch,entityIdField}:GenericEditProps<TEntity>) {

    const {id} = params;
    const router:AppRouterInstance = useRouter();
    const {data, loading, refetch} = useQuery<TGetByIdQuery>(getByIdQuery.query, {
        variables: {id}
    });
    const [updateEntity, updateEntityMutation] = useMutation<TUpdateMutation>(updateMutation.mutation, { refetchQueries: [ {query:queryToRefetch}]});
    
    useQueryMutHandler({result:updateEntityMutation, queryMutName: updateMutation.name, onSuccess: ()=>{
        router.push("../list");
        refetch();
    }})

    useEffect(()=>{
        console.log(data); 
    },[loading])

    if(loading)
        return <Spinner/>

    return React.createElement(formComponent, {
        onSubmit: (e:TEntity)=>{
            const variables = {[entityName]: {[entityIdField]: id, ...e}}
            updateEntity({variables})
        },
        initialValue: data?.[entityName]
    })
}
