"use client"

import BackButton from '@/app/Components/Buttons/BackButton/BackButton';
import { FormProps } from '@/app/types/form'
import { Package } from '@/app/types/package'
import React from 'react'

export default function PackageForm({onSubmit,onCancel, initialValue}:FormProps<Package>) {

  
    return (
        <div className='flex flex-col'>
            <BackButton text='Cancelar' onClick={onCancel} />
        </div>
    )
}
