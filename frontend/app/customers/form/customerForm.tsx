"use client"

import BackButton from '@/app/Components/BackButton/BackButton';
import { TextInput } from '@/app/Components/TextInput/TextInput';
import useLoadForm from '@/app/hooks/useLoadForm';
import { Customer } from '@/app/types/customer'
import { FormProps } from '@/app/types/form';
import { maxLength, minLength, required, useForm } from '@modular-forms/react';
import React from 'react'



export default function CustomerForm({onSubmit,onCancel, loadingInitialValue, initialValue}:FormProps<Customer>){
    
    const [form, {Field, Form}] = useForm<Customer>();
    useLoadForm(form, loadingInitialValue, initialValue)

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
        <BackButton text='Cancelar' onBack={onCancel} />
    </div>
}
