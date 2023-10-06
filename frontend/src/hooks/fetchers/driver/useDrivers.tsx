import { DRIVERS, GET_DRIVER } from '@/src/graphql/driver/driverQueries';
import { Driver } from '@/src/types/driver';
import { FetcherResult } from '@/src/types/fetcher';
import { useQuery } from '@apollo/client';
import React from 'react'

export default function useDrivers(entityId?:number):FetcherResult<Driver> {
    const {data, loading, error, refetch} = useQuery<{drivers: Driver[], driver: Driver}>(entityId? GET_DRIVER : DRIVERS,{
        variables: {id:entityId}
    });
    return {data: data?.[entityId? "driver":"drivers"], loading, error: {error: !!error, message: error?.message}, refetch}; 
}
