 

import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context'
import React from 'react'
import { Button } from '@/components/ui/button'
import AddButton from '../Buttons/AddButton/AddButton'
import { DataTable } from '../Table/Table'
import { ColumnDef } from '@tanstack/react-table'
import Spinner from '../Spinner/Spinner';
import { Indexable } from '@/src/types/indexable'
import { Fetcher } from '@/src/types/fetcher'
import { NextRouter, useRouter } from 'next/router'

interface GenericCRUDViewProps<TEntity> {
    useFetcher: Fetcher<TEntity>,
    deleteEntity: (e:TEntity)=>void 
    columns: ColumnDef<TEntity>[],
    entityIdField: string
}

export default function GenericCRUDTable<TEntity extends Indexable>({useFetcher, deleteEntity, columns, entityIdField}:GenericCRUDViewProps<TEntity>) {
    const router:NextRouter = useRouter()
    const {data, loading} = useFetcher();
  
    if(loading)
      return <Spinner/>
    
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
