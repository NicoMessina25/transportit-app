import { useQuery } from '@apollo/client';
import { valibotResolver } from '@hookform/resolvers/valibot';
import React, { useEffect, useState } from 'react'
import { Controller, useForm } from 'react-hook-form';
import {Output, array, string, minLength, number, object,optional,transform, minValue, maxValue, regex, nullable} from 'valibot'
import { FormProps, requiredMessage } from '@/src/types/form';
import { EFeeType } from '@/src/types/EFeeType';
import { FeePricing } from '@/src/types/fee';
import { Package, defaultPackage } from '@/src/types/package';
import { TextInput } from '../TextInput/TextInput';
import BackButton from '../Buttons/BackButton/BackButton';
import SubmitButton from '../Buttons/SubmitButton/SubmitButton';

export const citySchema = object({
    cityId: transform(string(), (input:string)=>Number(input)),
    name: string()
})

export const feeSchema = object({
    feeId: optional(transform(string(requiredMessage),(input:string)=>Number(input))),
    kgprice: number([minValue(0,'No puede ser negativo'), maxValue(20,'No se permite más de 20 pesos por kg')]),
    size: number([minValue(0,'No puede ser negativo'), maxValue(20,'No se permite más de 20 pesos por cm3')]),
    feeType: optional(transform(string(requiredMessage),()=>EFeeType.PRICING))
})

const packageSchema = object({
    packageId: optional(number()),
    recipientdocument: string([
        minLength(1,requiredMessage)
    ]),
    recipientfirstname: string([
        minLength(1,requiredMessage)
    ]),
    weight: number([minValue(0.1,'Debe tener un peso válido')]),
    size: number([minValue(0.1,'Debe tener un tamaño válido')]),
    price: optional(nullable(number())),
    feepricing: optional(nullable(feeSchema))
})

type PackageSchema = Output<typeof packageSchema>

export default function PackageForm({onSubmit,onCancel, initialValue}:FormProps<Package>) {

  
    const { handleSubmit, control, formState: {errors}} = useForm<PackageSchema>({defaultValues: initialValue ?? defaultPackage, resolver: valibotResolver(packageSchema)})
    const initialFee: FeePricing | undefined = initialValue?.feepricing;
    const [isFee, setIsFee] = useState(!!initialValue?.feepricing);

    useEffect(()=>{
        console.log(errors);
    },[errors]) 

    return <div className='flex flex-col items-center'>
        
        <form onSubmit={handleSubmit((p:PackageSchema)=>{
            if(p.feepricing && initialFee){
                p.feepricing.feeId = initialFee.kgprice == p.feepricing.kgprice && initialFee.size == p.feepricing.size? p.feepricing.feeId : undefined
            }
            onSubmit(p as Package)
        })} className='flex flex-col w-1/2' >
            
            <Controller
                name="recipientfirstname"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Nombre del destinatario'
                        {...field} 
                        error={errors.recipientfirstname?.message} 
                    />
                }
            />

            <Controller
                name="recipientdocument"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Documento del destinatario'
                        {...field} 
                        error={errors.recipientfirstname?.message} 
                    />
                }
            />

            <Controller
                name="weight"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Peso'
                        {...field} 
                        error={errors.weight?.message}
                        type = 'number'
                        onChange={(e)=>{
                            field.onChange(Number(e.target.value))
                        }} 
                    />
                }
            />
            
            <Controller
                name="size"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Tamaño'
                        {...field}
                        onChange={(e)=>{
                            field.onChange(Number(e.target.value))
                        }} 
                        error={errors.size?.message} 
                        type = 'number'
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
