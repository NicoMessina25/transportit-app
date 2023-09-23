"use client"

import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context'
import { useRouter } from 'next/navigation'
import React from 'react'
import Table, { Column, Indexable } from '../Table/Table'
import { Button } from '@/components/ui/button'
import { Fetcher } from '@/app/types/fetcher'

interface GenericCRUDProps<TEntity> {
    useFetcher: Fetcher<TEntity>,
    deleteEntity: (e:TEntity)=>void 
    columns: Column<TEntity>[],
    entityIdField: string
}

export default function GenericCRUD<TEntity extends Indexable>({useFetcher, deleteEntity, columns, entityIdField}:GenericCRUDProps<TEntity>) {
    const router:AppRouterInstance = useRouter()
    const {data, loading} = useFetcher();
  
    if(loading)
      return <p>Cargando...</p>
    
    if(!(data instanceof Array))
      return
      
    return (
      <div>
        {<Table columns={columns} items={data ?? []} itemsKeyField={entityIdField} onEdit={(c)=>{
          router.push(`./form/${c[entityIdField]}`)
        }} onDelete={deleteEntity} />}
        <Button onClick={()=>router.push("./form")} >Agregar</Button>
      </div>
    )
}
