"use client"

import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context'
import { useRouter } from 'next/navigation'
import React from 'react'
import Table, { Column, Indexable } from '../Table/Table'
import { Button } from '@/components/ui/button'
import { Fetcher } from '@/app/types/fetcher'
import AddButton from '../Buttons/AddButton/AddButton'

interface GenericCRUDViewProps<TEntity> {
    useFetcher: Fetcher<TEntity>,
    deleteEntity: (e:TEntity)=>void 
    columns: Column<TEntity>[],
    entityIdField: string
}

export default function GenericCRUDView<TEntity extends Indexable>({useFetcher, deleteEntity, columns, entityIdField}:GenericCRUDViewProps<TEntity>) {
    const router:AppRouterInstance = useRouter()
    const {data, loading} = useFetcher();
  
    if(loading)
      return <p>Cargando...</p>
    
    if(!(data instanceof Array))
      return
      
    return (
      <div>
        {<Table columns={columns} items={data ?? []} className='rounded' itemsKeyField={entityIdField} onEdit={(c)=>{
          router.push(`./form/${c[entityIdField]}`)
        }} onDelete={deleteEntity} />}
        <AddButton onClick={()=>router.push("./form")} />
      </div>
    )
}
