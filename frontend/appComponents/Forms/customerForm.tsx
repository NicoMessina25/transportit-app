 

import { valibotResolver } from '@hookform/resolvers/valibot';
import React from 'react'
import { useForm, Controller } from 'react-hook-form';
import { Output, object } from 'valibot';
import { FormProps, personSchema } from '@/src/types/form';
import { Customer, defaultCustomer } from '@/src/types/customer';
import { TextInput } from '../TextInput/TextInput';
import BackButton from '../Buttons/BackButton/BackButton';
import SubmitButton from '../Buttons/SubmitButton/SubmitButton';

const customerSchema = object({
       ...personSchema
})

type CustomerSchema = Output<typeof customerSchema>;

export default function CustomerForm({onSubmit,onCancel, initialValue}:FormProps<Customer>){
    
    
    const { handleSubmit, control, formState: {errors}} = useForm<CustomerSchema>({defaultValues: initialValue ?? defaultCustomer, resolver: valibotResolver(customerSchema)})

    const inputsWidth = 'w-full md:w-2/5 lg:w-1/4 mx-1';
    

    return <div className='flex flex-col items-center'>
        <form onSubmit={handleSubmit((c:CustomerSchema)=>{
            onSubmit(c as Customer)
        })} className='flex flex-col w-full' >
            
            <div className='flex flex-wrap justify-between'><Controller
                name="firstname"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Nombre'
                        className={inputsWidth}
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
                        className={inputsWidth}
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
                        className={inputsWidth}
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
                        className={inputsWidth}
                        {...field} 
                        error={errors.address?.message} 
                    />
                }
            /></div>

            <div className='flex justify-end'>
                <BackButton text='Cancelar' onClick={onCancel} />
                <SubmitButton text='Guardar' className='mx-1' /> 
            </div>
        </form>
        
    </div>
}
