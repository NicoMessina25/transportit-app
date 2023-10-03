"use client"

import BackButton from '@/app/Components/Buttons/BackButton/BackButton';
import SubmitButton from '@/app/Components/Buttons/SubmitButton/SubmitButton';
import { TextInput } from '@/app/Components/TextInput/TextInput';
import { Package, defaultPackage } from '@/app/types/package'
import { FormProps, personSchema, requiredMessage } from '@/app/types/form';
import { valibotResolver } from '@hookform/resolvers/valibot';
import React, { useEffect, useState } from 'react'
import { Controller, useForm } from 'react-hook-form';
import {Output, string, minLength, number, object,optional,transform, minValue, maxValue, regex, nullable} from 'valibot'
import { Button } from '@/components/ui/button';
import { EFeeType } from '@/app/types/EFeeType';
import { Label } from '@/app/Components/Labels/Label/Label';
import { FeePricing } from '@/app/types/fee';

export const citySchema = object({
    cityId: transform(string(), (input:string)=>Number(input)),
    name: string()
})

export const feeSchema = object({
    feeId: optional(transform(string(requiredMessage),(input:string)=>Number(input))),
    kgprice: number([minValue(0,'No puede ser negativo'), maxValue(20,'No se permite más de 20 pesos por kg')]),
    cm3price: number([minValue(0,'No puede ser negativo'), maxValue(20,'No se permite más de 20 pesos por cm3')]),
    feeType: optional(transform(string(requiredMessage),()=>EFeeType.PRICING))
})

const packageSchema = object({
    packageid: optional(number()),
    recipientdocument: string([
        minLength(1,requiredMessage)
    ]),
    recipientfirstname: string([
        minLength(1,requiredMessage)
    ]),
    weight: optional(nullable(number())),
    cm3price: optional(nullable(number())),
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
                p.feepricing.feeId = initialFee.kgprice == p.feepricing.kgprice && initialFee.cm3price == p.feepricing.cm3price? p.feepricing.feeId : undefined
            }
            onSubmit(p as Package)
        })} className='flex flex-col w-1/2' >
            
            <Controller
                name="recipientfirstname"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Nombre'
                        {...field} 
                        error={errors.recipientfirstname?.message} 
                    />
                }
            />

            <Controller
                name="recipientfirstname"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Documento'
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
                    />
                }
            />
            
            <Controller
                name="cm3price"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Tamaño'
                        {...field} 
                        error={errors.cm3price?.message} 
                    />
                }
            />

            <Controller
                name="price"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='precio'
                        {...field} 
                        error={errors.price?.message} 
                    />
                }
            />

            {isFee ? <Controller
                    name='feepricing'
                    control={control}
                    render={({field})=>
                        <div className='my-3 justify-center w-2/3 rounded'>
                            <Label text='Tarifa' className='my-2 text-lg' />
                            <TextInput label='Pesos por kilo' value={field.value?.kgprice?.toString() ?? ""} name={field.name} onBlur={field.onBlur} onChange={(e)=>{
                                field.onChange({...field.value, kgprice: Number(e.target.value)})
                            }} error={errors.feepricing?.kgprice?.message} type='number' />
                    

                            <TextInput label='Pesos por metro' value={field.value?.cm3price?.toString() ?? ""} name={field.name} onBlur={field.onBlur} onChange={(e)=>{
                                field.onChange({...field.value, cm3price: Number(e.target.value)})
                            }} error={errors.feepricing?.cm3price?.message} type='number' />
                            <Button variant='destructive' onClick={()=>{
                                setIsFee(false)
                                field.onChange(undefined)
                            }} >Eliminar tarifa</Button>
                        </div>
                    }
                />
                :
                <Button className='my-2' onClick={()=>{
                    setIsFee(true)
                }} >Tarifa</Button>
            }
            
            <div className='flex justify-end'>
                <SubmitButton text='Guardar' className='mx-1' />
                <BackButton text='Cancelar' onClick={onCancel} />
            </div>
            
        </form>
    </div>
}
