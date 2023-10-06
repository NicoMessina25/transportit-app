export interface TError {
    error:boolean,
    message:string | undefined
}

export type FetcherResult<TEntity> = {data: TEntity[] | TEntity | undefined, loading: boolean, error: TError, refetch: ()=>void}

export type Fetcher<TEntity> = (entityId?:number)=>FetcherResult<TEntity>