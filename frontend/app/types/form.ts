export type FormProps<T> = {
    onSubmit: (c:T)=>void,
    onCancel?: ()=>void,
    loadingInitialValue?: boolean,
    initialValue?: T
}

export type EditProps = {
    params:{ id?: number}
}