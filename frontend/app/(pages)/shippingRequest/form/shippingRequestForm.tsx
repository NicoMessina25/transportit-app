"use client"

import BackButton from '@/app/Components/Buttons/BackButton/BackButton';
import { TextInput } from '@/app/Components/TextInput/TextInput';
import useLoadForm from '@/app/hooks/useLoadForm';
import { FormProps } from '@/app/types/form';
import { ShippingRequest } from '@/app/types/shippingRequest';
import { minRange, useForm } from '@modular-forms/react';
import React from 'react'

export default function ShippingRequestForm({onSubmit,onCancel, loadingInitialValue, initialValue}:FormProps<ShippingRequest>) {
    const [form, {Field, Form}] = useForm<ShippingRequest>();
    useLoadForm(form, loadingInitialValue, initialValue)
  
    return (
        <div className='flex flex-col'>
            <Form onSubmit={onSubmit} className='flex flex-col justify-center p-4'>
                
            </Form>
            <BackButton text='Cancelar' onBack={onCancel} />
        </div>
    )
}
