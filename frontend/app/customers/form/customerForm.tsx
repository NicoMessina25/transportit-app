import { TextInput } from '@/app/Components/TextInput/TextInput';
import { Customer } from '@/app/types/customer'
import { maxLength, minLength, required, setValues, useForm } from '@modular-forms/react';
import { useRouter } from 'next/navigation';
import React, { forwardRef, useImperativeHandle, useEffect } from 'react'

type CustomFormProps<T> = {
    onSubmit: (c:Customer)=>void,
    onCancel?: ()=>void,
    loadingInitialValue?: boolean,
    initialValue?: T
}

export default function CustomerForm({onSubmit,onCancel, loadingInitialValue, initialValue}:CustomFormProps<Customer>){
    
    const [form, {Field, Form}] = useForm<Customer>();
    const router = useRouter();

    useEffect(() => {
        if(!loadingInitialValue && initialValue){
            console.log('Entraa', initialValue);
            setValues(form, {
                firstname: initialValue.firstname,
                lastname: initialValue.lastname,
                document: initialValue.document,
                address: initialValue.address
            });
        }
    }, [loadingInitialValue])

    return <div className='flex flex-col'>
        <Form onSubmit={onSubmit} className='flex flex-col justify-center p-4' >
            <Field name='firstname' validate={[
                required("Debe completar este campo")
            ]} >
                {(field, props)=><TextInput label={'Nombre'} className='my-2' inputClassName='text-neutral-950 my-1' type='text' value={field.value} error={field.error} onChange={props.onChange} name={field.name} onBlur={props.onBlur} required />}
            </Field>
            <Field name='lastname' validate={[
                required("Debe completar este campo")
            ]}>
                {(field, props)=><TextInput label='Apellido' type='text' value={field.value} error={field.error} onChange={props.onChange} name={field.name} onBlur={props.onBlur} className='my-2' inputClassName='text-neutral-950 my-1' required />}
            </Field>
            <Field name='document' validate={[
                required("Debe completar este campo"),
                minLength(8, "Este campo debe tener 8 caracteres"),
                maxLength(8, "Este campo debe tener 8 caracteres")
            ]}>
                {(field, props)=><TextInput label='Documento (DNI)' type='text' value={field.value} error={field.error} onChange={props.onChange} name={field.name} onBlur={props.onBlur} className='my-2' inputClassName='text-neutral-950 my-1' required />}
            </Field>
            <Field name='address'>
                {(field, props)=><TextInput label='Dirección' type='text' value={field.value} error={field.error} onChange={props.onChange} name={field.name} onBlur={props.onBlur} className='my-2' inputClassName='text-neutral-950 my-1' />}
            </Field>
            <button type='submit' className='rounded-full font-bold p-1 my-1 bg-blue-950 text-white hover:bg-blue-500 transition-all' > {initialValue? "Guardar":"Crear"} </button>
            
        </Form>
        <button className='rounded-full flex-grow mx-4 font-bold p-1 my-1 bg-blue-950 text-white hover:bg-blue-500 transition-all' onClick={onCancel ?? router.back} > Cancelar </button>
    </div>
}
