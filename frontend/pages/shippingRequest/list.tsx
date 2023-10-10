import GenericCRUDTable from '@/appComponents/GenericCRUDTable/GenericCRUDTable';
import GenericLayout from '@/appComponents/GenericLayout/GenericLayout';
import { Cell } from '@/appComponents/Table/Table';
import useShippingRequestsCont from '@/src/hooks/controllers/shippingRequest/useShippingRequestsCont';
import useShippingRequests from '@/src/hooks/fetchers/shippingRequest/useShippingRequests';
import { ShippingRequest } from '@/src/types/shippingRequest';
import React from 'react'

export default function ShippingRequestCRUD() {
    const cityFrom: ({row}: Cell<ShippingRequest>) => React.JSX.Element = ({row:{original}}) => <div>{original.cityFrom?.name ?? ""}</div>
    const cityTo: ({row}: Cell<ShippingRequest>) => React.JSX.Element = ({row:{original}}) => <div>{original.cityTo?.name ?? ""}</div>
    const customer: ({row}: Cell<ShippingRequest>) => React.JSX.Element = ({row:{original}}) => <div>{original.customer?.firstname ?? ""}</div>
    const requestDate: ({ row }: Cell<ShippingRequest>) => React.JSX.Element = ({ row: { original } }) => ( <div>{original.requestDate?.toString() ?? ""}</div>  );
    const {delete:{deleteEntity}} = useShippingRequestsCont({});


    return <GenericLayout title='Solicitudes de Envío'> 
     <GenericCRUDTable useFetcher={useShippingRequests} deleteEntity={deleteEntity} columns={[{
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
    </GenericLayout>
}
