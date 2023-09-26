import { ROUTE_MAPS, GET_ROUTE_MAP } from '@/app/graphql/routeMap/routeMapQueries';
import { RouteMap } from '@/app/types/routeMap';
import { FetcherResult } from '@/app/types/fetcher';
import { useQuery } from '@apollo/client';
import React from 'react'

export default function useRouteMaps(entityId?:number):FetcherResult<RouteMap> {
    const {data, loading, error, refetch} = useQuery<{routeMaps: RouteMap[], routeMap: RouteMap}>(entityId? GET_ROUTE_MAP : ROUTE_MAPS,{
        variables: {id:entityId}
    });
    return {data: data?.[entityId? "routeMap":"routeMaps"], loading, error: {error: !!error, message: error?.message}, refetch}; 
}
