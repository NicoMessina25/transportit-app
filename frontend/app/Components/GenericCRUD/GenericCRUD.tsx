import { CustomResponse } from '@/app/types/serverResponse'
import { notifyError, notifyInfo } from '@/app/types/toastFunctions'
import { DocumentNode, useMutation, useQuery } from '@apollo/client'
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context'
import { useRouter } from 'next/navigation'
import React,{useEffect} from 'react'
import Table, { Column, Indexable } from '../Table/Table'
import { ToastContainer } from 'react-bootstrap'
import { GraphMutation, GraphQuery } from '@/app/types/graphql'
import useQueryMutHandler from '@/app/hooks/useQueryMutHandler'

interface GenericCRUDProps {
    getQuery: GraphQuery,
    deleteMutation: GraphMutation
    columns: Column[],
    entityIdField: string
}

export default function GenericCRUD<TQuery extends Indexable, TDeleteMutation extends Indexable>({getQuery, deleteMutation, columns, entityIdField}:GenericCRUDProps) {
    const router:AppRouterInstance = useRouter()
    const {data, loading, refetch} = useQuery<TQuery>(getQuery.query)
    const [deleteEntity, deleteEntityMutation] = useMutation<TDeleteMutation>(deleteMutation.mutation)
  
    useQueryMutHandler({result:deleteEntityMutation, queryMutName: deleteMutation.name, onSuccess: ()=>{
        refetch()
    }})
  
    if(loading)
      return <p>Cargando...</p>
  
    return (
      <div>
        {<Table columns={columns} items={data?.[getQuery.name] ?? []} itemsKeyField="customerid" onEdit={(c)=>{
          router.push(`./form/${c.customerid}`)
        }} onDelete={(e)=>{
          deleteEntity({variables: {
            id: e[entityIdField]
          }})
        }} />}
        <button className='bg-orange-400' onClick={()=>router.push("./form")} >Agregar</button>
  
        <ToastContainer />
      </div>
    )
}
