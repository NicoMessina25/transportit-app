import { ApolloQueryResult, MutationResult, OperationVariables, QueryResult } from '@apollo/client';
import { DocumentNode } from 'graphql';
import React, { useEffect } from 'react'
import { Indexable } from '../types/indexable';
import useNotification from './useNotification';

interface QueryMutHandlerProps<TResult extends Indexable> {
    result: MutationResult<TResult> | QueryResult<TResult>
    queryMutName: string,
    onSuccess?: () => void
}

export default function useQueryMutHandler<TResult extends Indexable>({result, queryMutName, onSuccess}:QueryMutHandlerProps<TResult>) {

    const {notifyError,notifyInfo} = useNotification()
    
    useEffect(() => {
        const responseMessage = result.data?.[queryMutName].message ?? "";
        const errorMessage = result.error?.message ?? "";
        if(!result.loading && result.data?.[queryMutName].success){
            notifyInfo(responseMessage)
            console.log('A');
            onSuccess?.()
        } else if (result.error) notifyError(responseMessage + " ERROR: " + errorMessage)
    }, [result.loading])
}
