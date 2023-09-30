"use client"

import BackButton from '@/app/Components/Buttons/BackButton/BackButton';
import SubmitButton from '@/app/Components/Buttons/SubmitButton/SubmitButton';
import { Combobox } from '@/app/Components/Combobox/Combobox';
import { TextInput } from '@/app/Components/TextInput/TextInput';
import { CITIES } from '@/app/graphql/city/cityQueries';
import { City } from '@/app/types/city';
import { Driver, defaultDriver } from '@/app/types/driver'
import { FormProps, personSchema, requiredMessage } from '@/app/types/form';
import { useQuery } from '@apollo/client';
import { valibotResolver } from '@hookform/resolvers/valibot';
import React, { useEffect, useState } from 'react'
import { Controller, useForm } from 'react-hook-form';
import {Output, array, string, minLength, number, object,optional,transform, minValue, maxValue, regex, nullable} from 'valibot'
import { Button } from '@/components/ui/button';
import { EFeeType } from '@/app/types/EFeeType';
import { Label } from '@/app/Components/Labels/Label/Label';
import { Truck, defaultTruck } from '@/app/types/truck';
import ErrorLabel from '@/app/Components/Labels/ErrorLabel/ErrorLabel';
import KeyValueLabel from '@/app/Components/Labels/KeyValueLabel/KeyValueLabel';
import { FeePayment } from '@/app/types/fee';
import Spinner from '../Spinner/Spinner';

export const citySchema = object({
    cityId: transform(string(), (input:string)=>Number(input)),
    name: string()
})

export const feeSchema = object({
    feeId: optional(transform(string(requiredMessage),(input:string)=>Number(input))),
    kgprice: number([minValue(0,'No puede ser negativo'), maxValue(20,'No se permite más de 20 pesos por kg')]),
    kmprice: number([minValue(0,'No puede ser negativo'), maxValue(20,'No se permite más de 20 pesos por km')]),
    feeType: optional(transform(string(requiredMessage),()=>EFeeType.PAYMENT))
})

export const truckSchema = object({
    truckId: optional(transform(string(), (input:string)=>Number(input))),
    registration: string(requiredMessage,[
        regex(/^[A-Z]{2}\d{4}[A-Z]{2}$/, 'La matrícula debe ser del tipo XX9999XX')
    ]),
    maxweight: number([minValue(7000,'No puede ser menor a 7000kg')])
})

const driverSchema = object({
    driverid: optional(number()),
    ...personSchema,
    phone: string([
        minLength(1,requiredMessage)
    ]),
    province: optional(nullable(string())),
    city: optional(nullable(string())),
    currentcity: optional(citySchema),
    fee: optional(nullable(feeSchema)),
    trucks: optional(array(truckSchema))
})




type DriverSchema = Output<typeof driverSchema>

export default function DriverForm({onSubmit,onCancel, initialValue}:FormProps<Driver>){   

    const { handleSubmit, control, formState: {errors}} = useForm<DriverSchema>({defaultValues: initialValue ?? defaultDriver, resolver: valibotResolver(driverSchema)})
    const initialFee: FeePayment | undefined = initialValue?.fee;
    const [isFee, setIsFee] = useState(!!initialValue?.fee);
    const [areTrucks, setAreTrucks] = useState(!!initialValue?.trucks?.length);
    const [newTruck, setNewTruck] = useState<Truck|null>(defaultTruck)

    const inputsWidth = 'w-full md:w-2/5 lg:w-1/4 mx-1';

    useEffect(()=>{
        console.log(errors);
    },[errors])

    const {data, loading, error} = useQuery(CITIES);

    const truckTemplate = (truck:Truck,index:number,onEdit:()=>void,registrationErr:string|undefined, maxWeightErr:string|undefined) => {
        if(!truck) return

        return <div key={truck.registration + index} className='rounded-lg bg-cyan-950 p-3 flex flex-col justify-around my-3'>
            <Label className='font-bold italic text-cyan-200 mr-3' text={truck.truckId ? `Id: ${truck.truckId}` : 'Nuevo camión'}/>
            <div className='flex my-4'>
                <KeyValueLabel label='Matrícula: ' value={truck.registration} errorMessage={registrationErr} className='mx-1' />
                <KeyValueLabel label='Peso máximo: ' value={truck.maxweight} errorMessage={maxWeightErr} className='mx-1' /> 
            </div>
              
            <Button className='mr-1' variant='outline' onClick={onEdit} >Editar</Button>
       
            
        </div>
    }
    

    return <div className='flex flex-col items-center'>
        
        <form onSubmit={handleSubmit((d:DriverSchema)=>{
            if(d.fee && initialFee){
                d.fee.feeId = initialFee.kgprice == d.fee.kgprice && initialFee.kmprice == d.fee.kmprice? d.fee.feeId : undefined
            }
            onSubmit(d as Driver)
        })} className='flex flex-col w-full' >
            
            <div className='flex flex-wrap justify-between' ><Controller
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
            />

            <Controller
                name="phone"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Teléfono'
                        className={inputsWidth}
                        {...field} 
                        error={errors.phone?.message} 
                    />
                }
            />

            <Controller
                name="province"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Provincia Nac.'
                        className={inputsWidth}
                        {...field} 
                        error={errors.province?.message} 
                    />
                }
            />

            <Controller
                name="city"
                control={control}
                render={({ field }) => 
                    <TextInput 
                        label='Ciudad Nac.'
                        className={inputsWidth}
                        {...field} 
                        error={errors.city?.message} 
                    />
                }
            />

            {!loading? <Controller
                name="currentcity"
                control={control}
                render={({ field }) => 
                    <Combobox
                        label='Ciudad actual'
                        keyField={"cityId"}
                        optionLabel={"name"}
                        value={field.value}
                        onChange={field.onChange}
                        className={inputsWidth}
                        items={data?.cities}
                        placeholder='Selecciona una ciudad'
                        notFoundText='No se encontró la ciudad'
                        error={errors.currentcity?.name?.message}
                    />
                }
            />:<Spinner size={20}/>}</div>

            <div className='flex flex-col md:flex-row justify-between'>
            {isFee ? <Controller
                    name='fee'
                    control={control}
                    render={({field})=>
                        <div className='my-3 justify-center w-full md:w-1/4 rounded'>
                            <Label text='Tarifa' className='my-2 text-lg' />
                            <TextInput label='Pesos por kilo' value={field.value?.kgprice?.toString() ?? ""} name={field.name} onBlur={field.onBlur} onChange={(e)=>{
                                field.onChange({...field.value, kgprice: Number(e.target.value)})
                            }} error={errors.fee?.kgprice?.message} type='number' />
                    

                            <TextInput label='Pesos por metro' value={field.value?.kmprice?.toString() ?? ""} name={field.name} onBlur={field.onBlur} onChange={(e)=>{
                                field.onChange({...field.value, kmprice: Number(e.target.value)})
                            }} error={errors.fee?.kmprice?.message} type='number' />
                            <Button variant='destructive' onClick={()=>{
                                setIsFee(false)
                                field.onChange(undefined)
                            }} >Eliminar tarifa particular</Button>
                        </div>
                    }
                />
                :
                <Button className='my-3 w-full md:w-1/4 text-white transition-all bg-blue-700 hover:bg-blue-500' onClick={()=>{
                    setIsFee(true)
                }} >Tarifa Particular</Button>
            }

            {areTrucks ? <Controller
                    name='trucks'
                    control={control}
                    render={({field})=>
                        <div className='my-3 w-full md:w-2/3 justify-center rounded'>
                            {field.value && field.value.length > 0 && <Label className='my-1 text-lg' text='Camiones' />}
                            {field.value?.map((truck,index)=>{
                                
                                return truckTemplate(truck,index,()=>{
                                    field.value?.splice(field.value.indexOf(truck),1)
                                    field.onChange(field.value)
                                    setNewTruck(truck)
                                }, errors.trucks?.[index]?.registration?.message, errors.trucks?.[index]?.maxweight?.message)
                            })}

                            {newTruck ? <><Label className='mt-2 text-lg' text={newTruck.truckId ? `Id: ${newTruck.truckId}`: 'Nuevo camión'} />
                            <div className='rounded-lg bg-cyan-600 p-3'>
                                <TextInput label='Matrícula' name='registration' value={newTruck.registration} onChange={(e)=>{
                                    setNewTruck({...newTruck, registration: e.target.value})
                                }} placeholder='XX9999XX' />


                                <TextInput label='Peso máximo' name='maxweight' value={newTruck.maxweight.toString()} onChange={(e)=>{
                                    setNewTruck({...newTruck, maxweight: Number(e.target.value)})
                                }} type='number' />

                                <div className='flex justify-between'>
                                    <Button className='mr-1' variant='outline' type='button' onClick={()=>{
                                        field.value?.push(newTruck)
                                        field.onChange(field.value)
                                        setNewTruck(defaultTruck)
                                    }} >Agregar camión</Button>
                                    <Button variant='destructive' onClick={()=>{
                                        setNewTruck(null)
                                        field.value?.length == 0 && setAreTrucks(false)
                                    }} >Eliminar camión</Button>
                                </div>
                                
                            </div> </>  
                            :
                            <Button className='my-1' variant={'outline'} onClick={()=>setNewTruck(defaultTruck)} >Agregar camión</Button>
                            }                         
                        </div>
                    }
                />
                :
                <Button className='my-3 w-full md:w-1/4 text-white transition-all bg-blue-700 hover:bg-blue-500' onClick={()=>{
                    setAreTrucks(true)
                    setNewTruck(defaultTruck)
                }} >Camiones particulares</Button>}</div>
            
            <div className='flex justify-end'>
                <BackButton text='Cancelar' onClick={onCancel} />
                <SubmitButton text='Guardar' className='mx-1' />
            </div>
            
        </form>
    </div>
}
