"use client"

import { useMutation, useQuery } from '@apollo/client'
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context'
import { useRouter } from 'next/navigation'
import React from 'react'
import Table, { Column, Indexable } from '../Table/Table'
import { GraphMutation, GraphQuery } from '@/app/types/graphql'
import useQueryMutHandler from '@/app/hooks/useQueryMutHandler'
import { Button } from '@/components/ui/button'

interface GenericCRUDProps<TEntity> {
    getQuery: GraphQuery,
    deleteMutation: GraphMutation
    columns: Column<TEntity>[],
    entityIdField: string
}

export default function GenericCRUD<TQuery extends Indexable, TDeleteMutation extends Indexable, TEntity extends Indexable>({getQuery, deleteMutation, columns, entityIdField}:GenericCRUDProps<TEntity>) {
    const router:AppRouterInstance = useRouter()
    const {data, loading} = useQuery<TQuery>(getQuery.query)
    const [deleteEntity, deleteEntityMutation] = useMutation<TDeleteMutation>(deleteMutation.mutation, { refetchQueries: [ {query: getQuery.query}]})
  
    useQueryMutHandler({result:deleteEntityMutation, queryMutName: deleteMutation.name})
  
    if(loading)
      return <p>Cargando...</p>
  
    return (
      <div>
        {<Table columns={columns} items={data?.[getQuery.name] ?? []} itemsKeyField={entityIdField} onEdit={(c)=>{
          router.push(`./form/${c[entityIdField]}`)
        }} onDelete={(e)=>{
          deleteEntity({variables: {
            id: e[entityIdField]
          }})
        }} />}
        <Button onClick={()=>router.push("./form")} >Agregar</Button>
      </div>
    )
}
