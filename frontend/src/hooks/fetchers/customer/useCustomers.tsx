import { useQuery } from '@apollo/client'
import React, { useEffect, useState } from 'react'
import { Customer } from '../../../types/customer';
import { CUSTOMERS, GET_CUSTOMER } from '../../../graphql/customer/customerQueries';
import { FetcherResult } from '@/src/types/fetcher';



export default function useCustomers(entityId?:number):FetcherResult<Customer> {
    const {data, loading, error, refetch} = useQuery<{customers: Customer[], customer: Customer}>(entityId? GET_CUSTOMER : CUSTOMERS,{
        variables: {customerId:entityId}
    });
    return {data: data?.[entityId? "customer":"customers"], loading, error: {error: !!error, message: error?.message}, refetch};
}
