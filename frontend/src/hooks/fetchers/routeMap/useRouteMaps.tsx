import { GET_ROUTE_MAP, ROUTE_MAPS } from '@/src/graphql/routeMap/routeMapQueries';
import { FetcherResult } from '@/src/types/fetcher';
import { RouteMap } from '@/src/types/routeMap';
import { useQuery } from '@apollo/client';
import React from 'react'

export default function useRouteMaps(entityId?:number):FetcherResult<RouteMap> {
    const {data, loading, error, refetch} = useQuery<{routeMaps: RouteMap[], routeMap: RouteMap}>(entityId? GET_ROUTE_MAP : ROUTE_MAPS,{
        variables: {id:entityId}
    });
    return {data: data?.[entityId? "routeMap":"routeMaps"], loading, error: {error: !!error, message: error?.message}, refetch}; 
}
