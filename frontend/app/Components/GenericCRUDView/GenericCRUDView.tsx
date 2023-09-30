"use client"

import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context'
import useRouter from '@/app/hooks/useRouter';
import React from 'react'
import { Button } from '@/components/ui/button'
import { Fetcher } from '@/app/types/fetcher'
import AddButton from '../Buttons/AddButton/AddButton'
import { DataTable } from '../Table/Table'
import { ColumnDef } from '@tanstack/react-table'
import { Indexable } from '@/app/types/indexable'
import useLoader from '@/app/hooks/useLoader';
import Spinner from '../Spinner/Spinner';

interface GenericCRUDViewProps<TEntity> {
    useFetcher: Fetcher<TEntity>,
    deleteEntity: (e:TEntity)=>void 
    columns: ColumnDef<TEntity>[],
    entityIdField: string
}

export default function GenericCRUDView<TEntity extends Indexable>({useFetcher, deleteEntity, columns, entityIdField}:GenericCRUDViewProps<TEntity>) {
    const router:AppRouterInstance = useRouter()
    const {data, loading} = useFetcher();
    useLoader();
  
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
