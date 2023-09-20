"use client"

import BackButton from '@/app/Components/Buttons/BackButton/BackButton';
import { TextInput } from '@/app/Components/TextInput/TextInput';
import useLoadForm from '@/app/hooks/useLoadForm';
import { FormProps } from '@/app/types/form'
import { Package } from '@/app/types/package'
import { minRange, useForm } from '@modular-forms/react';
import React from 'react'

export default function PackageForm({onSubmit,onCancel, loadingInitialValue, initialValue}:FormProps<Package>) {
  
    const [form, {Field, Form}] = useForm<Package>();
    useLoadForm(form, loadingInitialValue, initialValue)
  
    return (
        <div className='flex flex-col'>
            <Form onSubmit={onSubmit} className='flex flex-col justify-center p-4'>
                <Field name='weight' validate={[
                    require(requiredMessage),
                    minRange(0.1, 'Mínimo de tamaño debe ser 100g')
                ]} type='number'>
                   {(field, props)=><TextInput label={'Peso'} className='my-2' inputClassName='text-neutral-950 my-1' type="number" value={field.value} error={field.error} onChange={props.onChange} name={field.name} onBlur={props.onBlur} required />}
                </Field>
                <Field name='size' validate={[
                    require(requiredMessage),
                    minRange(1, 'Mínimo de tamaño debe ser 1cm cúbico')
                ]} type='number'>
                   {(field, props)=><TextInput label={'Tamaño'} className='my-2' inputClassName='text-neutral-950 my-1' type="number" value={field.value} error={field.error} onChange={props.onChange} name={field.name} onBlur={props.onBlur} required />}
                </Field>
            </Form>
            <BackButton text='Cancelar' onBack={onCancel} />
        </div>
    )
}
