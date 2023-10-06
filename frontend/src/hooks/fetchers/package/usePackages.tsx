import { GET_PACKAGE, PACKAGES } from '@/src/graphql/_package/packageQueries';
import { FetcherResult } from '@/src/types/fetcher';
import { Package } from '@/src/types/package';
import { useQuery } from '@apollo/client';
import React from 'react'

export default function usePackages(entityId?:number):FetcherResult<Package> {
    const {data, loading, error, refetch} = useQuery<{packages: Package[], package: Package}>(entityId? GET_PACKAGE : PACKAGES,{
        variables: {id:entityId}
    });
    return {data: data?.[entityId? "package":"packages"], loading, error: {error: !!error, message: error?.message}, refetch}; 
}