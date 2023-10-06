 

import GenericCRUDTable from '@/app/Components/GenericCRUDTable/GenericCRUDTable';
import useRouteMapsCont from '@/app/hooks/controllers/routeMap/useRouteMapsCont';
import useRouteMaps from '@/app/hooks/fetchers/routeMap/useRouteMaps';
import { RouteMap } from '@/app/types/routeMap';
import React from 'react'

export default function RouteMapCRUD() {

    const {delete:{deleteEntity}} = useRouteMapsCont({});


    return <GenericCRUDTable 
        useFetcher={useRouteMaps} 
        deleteEntity={deleteEntity} 
        columns={[]} 
        entityIdField='routeMapId' />
}

