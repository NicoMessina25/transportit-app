"use client"

import BackButton from '@/app/Components/Buttons/BackButton/BackButton';
import { FormProps } from '@/app/types/form';
import { ShippingRequest } from '@/app/types/shippingRequest';
import React from 'react'
import { useForm } from 'react-hook-form';

export default function ShippingRequestForm({onSubmit,onCancel, initialValue}:FormProps<ShippingRequest>) {
    const {} = useForm<ShippingRequest>()
  
    return (
        <div className='flex flex-col'>
            <BackButton text='Cancelar' onClick={onCancel} />
        </div>
    )
}
