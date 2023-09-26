"use client"

import BackButton from '@/app/Components/Buttons/BackButton/BackButton';
import SubmitButton from '@/app/Components/Buttons/SubmitButton/SubmitButton';
import { TextInput } from '@/app/Components/TextInput/TextInput';
import { Customer, defaultCustomer } from '@/app/types/customer'
import { FormProps, personSchema } from '@/app/types/form';
import { valibotResolver } from '@hookform/resolvers/valibot';
import React, { useEffect } from 'react'
import { useForm, Controller } from 'react-hook-form';
import { Output, object } from 'valibot';

const customerSchema = object({
       ...personSchema
})

type CustomerSchema = Output<typeof customerSchema>;

export default function CustomerForm({onSubmit,onCancel, initialValue}:FormProps<Customer>){
    
    
    const { handleSubmit, control, formState: {errors}} = useForm<CustomerSchema>({defaultValues: initialValue ?? defaultCustomer, resolver: valibotResolver(customerSchema)})
    

    return <div className='flex flex-col items-center'>
        <form onSubmit={handleSubmit((c:CustomerSchema)=>{
            onSubmit(c as Customer)
        })} className='flex flex-col w-1/2' >
            
            <Controller
                name="firstname"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Nombre'
                        {...field} 
                        error={errors.firstname?.message} 
                    />
                }
            />

            <Controller
                name="lastname"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Apellido'
                        {...field} 
                        error={errors.lastname?.message} 
                    />
                }
            />

            <Controller
                name="document"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Documento'
                        {...field} 
                        error={errors.document?.message}
                    />
                }
            />
            
            <Controller
                name="address"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Dirección'
                        {...field} 
                        error={errors.address?.message} 
                    />
                }
            />

            <div className='flex justify-end'>
                <SubmitButton text='Guardar' className='mx-1' />
                <BackButton text='Cancelar' onClick={onCancel} />
            </div>
        </form>
        
    </div>
}
