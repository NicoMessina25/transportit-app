"use client"

import BackButton from '@/app/Components/Buttons/BackButton/BackButton';
import SubmitButton from '@/app/Components/Buttons/SubmitButton/SubmitButton';
import { RouteMap, defaultRouteMap } from '@/app/types/routeMap'
import { FormProps } from '@/app/types/form';
import { valibotResolver } from '@hookform/resolvers/valibot';
import React, {  } from 'react'
import { Controller, useForm } from 'react-hook-form';
import {Output, array, string, number, object,optional,transform, date, boolean} from 'valibot'
import { citySchema, truckSchema } from './driverForm';
import { DateInput } from '../DateInput/DateInput';
import { Combobox } from '../Combobox/Combobox';

const driverSchema = object({
    driverId: number(),
    firstname: string(),
    lastname: string(),
    particular: boolean()
})

const trailerSchema = object({
    trailerId: number(),
    registration: string()
})

const routeMapSchema = object({
    routeMapid: optional(number()),
    payloadVolume: number(),
    startDate: date(),
    driver: driverSchema,
    truck: truckSchema,
    trailer: trailerSchema,
    packages: array(object({})),
    cities: optional(array(citySchema))
})




type RouteMapSchema = Output<typeof routeMapSchema>

export default function RouteMapForm({onSubmit,onCancel, initialValue}:FormProps<RouteMap>){   

    const { handleSubmit, control, formState: {errors}} = useForm<RouteMapSchema>({defaultValues: initialValue ?? defaultRouteMap, resolver: valibotResolver(routeMapSchema)})
    
    

    return <div className='flex flex-col items-center'>
        
        <form onSubmit={handleSubmit((d:RouteMapSchema)=>{
            console.log(d);
        })} className='flex flex-col w-1/2' >
            
            <Controller
                name="startDate"
                control={control}
                render={({ field }) => 
                    <DateInput 
                        label='Fecha de partida'
                        {...field} 
                        error={errors.startDate?.message} 
                        minDate={new Date()}
                    />
                }
            />

            {/* <Controller 
                name='driver'
                control={control}
                render={({ field })=>
                <Combobox
                    label='Ciudad actual'
                    keyField={"cityId"}
                    optionLabel={"name"}
                    value={field.value}
                    onChange={field.onChange}
                    items={data?.cities}
                    placeholder='Selecciona una ciudad'
                    notFoundText='No se encontró la ciudad'
                    error={errors.currentcity?.name?.message}
                />
                }
            /> */}

           
            
            <div className='flex justify-end'>
                <SubmitButton text='Guardar' className='mx-1' />
                <BackButton text='Cancelar' onClick={onCancel} />
            </div>
            
        </form>
    </div>
}
