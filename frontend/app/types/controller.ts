import { ApolloCache, DefaultContext, FetchResult, MutationFunctionOptions, MutationResult, MutationTuple, OperationVariables } from "@apollo/client";
import { CustomResponse } from "./serverResponse";
import { TError } from "./fetcher";

export interface TResult {
    data?: CustomResponse | null;
    error?: TError;
    loading: boolean;
}

export interface ControllerProps {
    onSave?: ()=>void
    onUpdate?: ()=>void
    onDelete?: ()=>void
}

export interface ControllerInterface<TEntity = any> {
    save: {
        saveEntity: (e:TEntity)=>void,
        result: TResult
    },
    delete:{
        deleteEntity: (e:TEntity)=>void,
        result: TResult
    },
    update:{
        updateEntity: (e:TEntity,id:number)=>void,
        result: TResult
    } 
} 