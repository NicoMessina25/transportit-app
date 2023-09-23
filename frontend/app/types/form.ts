import { custom, minLength, string, toTrimmed,length, optional, nullable } from "valibot";

export const requiredMessage = 'Este campo es requerido'

export type FormProps<T> = {
    onSubmit: (e:T)=>void,
    onCancel?: ()=>void,
    initialValue?: T
}

export type EditProps = {
    params:{ id?: number}
}

export const personSchema = {
    firstname: string([
        minLength(1,requiredMessage)
    ]),
    lastname: string([
        minLength(1,requiredMessage),
        toTrimmed()
    ]),
    document: string([
        custom((input:string)=> !!Number(input), 'Debe ser un número'),
        length(8,'Debe tener 8 caracteres')
      ]),
    address: nullable(optional(string([
        toTrimmed()
    ])))
}