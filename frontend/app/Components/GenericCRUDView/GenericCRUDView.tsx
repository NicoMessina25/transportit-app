"use client"

import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context'
import { useRouter } from 'next/navigation'
import React from 'react'
import { Button } from '@/components/ui/button'
import { Fetcher } from '@/app/types/fetcher'
import AddButton from '../Buttons/AddButton/AddButton'
import { DataTable } from '../Table/Table'
import { ColumnDef } from '@tanstack/react-table'
import { Indexable } from '@/app/types/indexable'

interface GenericCRUDViewProps<TEntity> {
    useFetcher: Fetcher<TEntity>,
    deleteEntity: (e:TEntity)=>void 
    columns: ColumnDef<TEntity>[],
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
        <DataTable columns={columns} data={data ?? []} onEdit={(c)=>{
          router.push(`./form/${c[entityIdField]}`)
        }} onDelete={deleteEntity} />
        <AddButton onClick={()=>router.push("./form")}className='my-3' />
      </div>
    )
}
