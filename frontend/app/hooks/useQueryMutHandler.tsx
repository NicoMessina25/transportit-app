import { ApolloQueryResult, MutationResult, OperationVariables, QueryResult } from '@apollo/client';
import { DocumentNode } from 'graphql';
import React, { useEffect } from 'react'
import { notifyError, notifyInfo } from '../types/toastFunctions';
import { useRouter } from 'next/navigation';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { Indexable } from '../Components/Table/Table';

interface QueryMutHandlerProps<TResult extends Indexable> {
    result: MutationResult<TResult> | QueryResult<TResult>
    queryMutName: string,
    onSuccess?: () => void
}

export default function useQueryMutHandler<TResult extends Indexable>({result, queryMutName, onSuccess}:QueryMutHandlerProps<TResult>) {
    
    useEffect(() => {
        const responseMessage = result.data?.[queryMutName].message ?? "";
        if(!result.loading && result.data?.[queryMutName].success){
            notifyInfo(responseMessage)
            onSuccess?.()
        } else if (result.error) notifyError(responseMessage)
    }, [result.loading])
}
