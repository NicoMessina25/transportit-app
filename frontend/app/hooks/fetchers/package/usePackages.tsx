
import { PACKAGES, GET_PACKAGE } from '@/app/graphql/_package/packageQueries';
import { FetcherResult } from '@/app/types/fetcher';
import { Package } from '@/app/types/package';
import { useQuery } from '@apollo/client';
import React from 'react'

export default function usePackages(entityId?:number):FetcherResult<Package> {
    const {data, loading, error, refetch} = useQuery<{packages: Package[], package: Package}>(entityId? GET_PACKAGE : PACKAGES,{
        variables: {id:entityId}
    });
    return {data: data?.[entityId? "package":"packages"], loading, error: {error: !!error, message: error?.message}, refetch}; 
}