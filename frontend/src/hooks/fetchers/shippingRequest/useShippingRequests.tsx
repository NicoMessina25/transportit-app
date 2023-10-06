import { GET_SHIPPING_REQUEST, SHIPPING_REQUESTS } from '@/src/graphql/shippingRequest/shippingRequestQueries';
import { FetcherResult } from '@/src/types/fetcher';
import { ShippingRequest } from '@/src/types/shippingRequest';
import { useQuery } from '@apollo/client';
import React from 'react'

export default function useShippingRequests(entityId?:number):FetcherResult<ShippingRequest> {
    const {data, loading, error, refetch} = useQuery<{shippingRequests: ShippingRequest[], shippingRequest: ShippingRequest}>(entityId? GET_SHIPPING_REQUEST : SHIPPING_REQUESTS,{
        variables: {id:entityId}
    });
    return {data: data?.[entityId? "shippingRequest":"shippingRequests"], loading, error: {error: !!error, message: error?.message}, refetch}; 
}
