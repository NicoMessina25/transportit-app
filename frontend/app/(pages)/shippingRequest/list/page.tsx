"use client"

import GenericCRUDView from '@/app/Components/GenericCRUDView/GenericCRUDView';
import { Cell } from '@/app/Components/Table/Table';
import useShippingRequestsCont from '@/app/hooks/controllers/shippingRequest/useShippingRequestsCont';
import useShippingRequests from '@/app/hooks/fetchers/shippingRequest/useShippingRequests';
import { ShippingRequest } from '@/app/types/shippingRequest';
import React from 'react'

export default function ShippingRequestCRUD() {
    const cityFrom: ({row}: Cell<ShippingRequest>) => React.JSX.Element = ({row:{original}}) => <div>{original.cityFrom?.name ?? ""}</div>
    const cityTo: ({row}: Cell<ShippingRequest>) => React.JSX.Element = ({row:{original}}) => <div>{original.cityTo?.name ?? ""}</div>
    const customer: ({row}: Cell<ShippingRequest>) => React.JSX.Element = ({row:{original}}) => <div>{original.customer?.firstname ?? ""}</div>
    const requestDate: ({ row }: Cell<ShippingRequest>) => React.JSX.Element = ({ row: { original } }) => ( <div>{original.requestDate?.toString() ?? ""}</div>  );
    const {delete:{deleteEntity}} = useShippingRequestsCont({});


    return <GenericCRUDView useFetcher={useShippingRequests} deleteEntity={deleteEntity} columns={[{
        accessorKey: 'shippingRequestId',
        header: 'Id'
    }, {
        accessorKey: 'customer',
        header: 'Cliente',
        cell: customer
    },{
        accessorKey: 'cityfrom',
        header: 'Ciudad de partida',
        cell: cityFrom
    },{
        accessorKey: 'cityto',
        header: 'Ciudad destino',
        cell: cityTo
    },{
      accessorKey: 'requestDate',
      header: 'Fecha Solicitada',
      cell: requestDate
    }]} entityIdField='shippingRequestId' />
}
