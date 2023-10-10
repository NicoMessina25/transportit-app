 

import { useQuery } from '@apollo/client';
import { valibotResolver } from '@hookform/resolvers/valibot';
import React, { useEffect, useState } from 'react'
import { Controller, useForm } from 'react-hook-form';
import {Output, array, string, minLength, number, object,optional,transform, minValue, maxValue, regex, nullable} from 'valibot'
import { Button } from '@/components/ui/button';
import Spinner from '../Spinner/Spinner';
import { FormProps, requiredMessage } from '@/src/types/form';
import { EFeeType } from '@/src/types/EFeeType';
import { personSchema } from '@/src/types/form';
import { FeePayment } from '@/src/types/fee';
import { ShippingRequest, defaultShippingRequest } from '@/src/types/shippingRequest';
import { Package, defaultPackage } from '@/src/types/package';
import { CITIES } from '@/src/graphql/city/cityQueries';
import KeyValueLabel from '../Labels/KeyValueLabel/KeyValueLabel';
import { Label } from '../Labels/Label/Label';
import { TextInput } from '../TextInput/TextInput';
import { Combobox } from '../Combobox/Combobox';
import BackButton from '../Buttons/BackButton/BackButton';
import SubmitButton from '../Buttons/SubmitButton/SubmitButton';

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

const customerSchema = object({
  ...personSchema
})

export const packageSchema = object({
  packageId: optional(number()),
  recipientdocument: string([
      minLength(1,requiredMessage)
  ]),
  recipientfirstname: string([
      minLength(1,requiredMessage)
  ]),
  weight: optional(nullable(number([minValue(0,'No puede ser menor a 0kg')]))),
  size: optional(nullable(number([minValue(0,'No puede ser menor a 0cm3')]))),
  price: optional(nullable(number([minValue(0,'No puede ser menor a 0 pesos')]))),
})

const shippingRequestSchema = object({
    requestid: optional(number()),
    customer: customerSchema,
    cityFrom: citySchema,
    cityTo: optional(citySchema),
    packages: optional(array(packageSchema))
})




type ShippingRequestSchema = Output<typeof shippingRequestSchema>

export default function ShippingRequestForm({onSubmit,onCancel, initialValue}:FormProps<ShippingRequest>){   

    const { handleSubmit, control, formState: {errors}} = useForm<ShippingRequestSchema>({defaultValues: initialValue ?? defaultShippingRequest, resolver: valibotResolver(shippingRequestSchema)})
    const initialFee: FeePayment | undefined = initialValue?.fee;
    const [isFee, setIsFee] = useState(!!initialValue?.fee);
    const [arePackages, setArePackages] = useState(!!initialValue?.packages?.length);
    const [newPackage, setNewPackage] = useState<Package|null>(defaultPackage)

    const inputsWidth = 'w-full md:w-2/5 lg:w-1/4 mx-1';

    useEffect(()=>{
        console.log(errors);
    },[errors])

    const {data, loading, error} = useQuery(CITIES);

    const packageTemplate = (packagee:Package,index:number,onEdit:()=>void,recipientdocumentErr:string|undefined, recipientfirstnameErr:string|undefined, weightErr:string|undefined, sizeErr:string|undefined ) => {
        if(!packagee) return

        return <div key={packagee.recipientdocument + index} className='rounded-lg bg-cyan-950 p-3 flex flex-col justify-around my-3'>
            <Label className='font-bold italic text-cyan-200 mr-3' text={packagee.packageId ? `Id: ${packagee.packageId}` : 'Nuevo paquete'}/>
            <div className='flex my-4'>
                <KeyValueLabel label='Documento del receptor: ' value={packagee.recipientdocument} errorMessage={recipientdocumentErr} className='mx-1' />
                <KeyValueLabel label='Nombre del receptor: ' value={packagee.recipientfirstname} errorMessage={recipientfirstnameErr} className='mx-1' /> 
                <KeyValueLabel label='Peso: ' value={packagee.weight} errorMessage={weightErr} className='mx-1' /> 
                <KeyValueLabel label='Tamaño: ' value={packagee.size} errorMessage={sizeErr} className='mx-1' /> 
            </div>
              
            <Button className='mr-1' variant='outline' onClick={onEdit} >Editar</Button>
       
            
        </div>
    }
    

    return <div className='flex flex-col items-center'>

        <form>
            <div className='flex flex-wrap justify-between' >

            {!loading? <Controller
                name="cityFrom"
                control={control}
                render={({ field }) => 
                    <Combobox
                        label='Ciudad de partida'
                        keyField={"cityId"}
                        optionLabel={"name"}
                        value={field.value}
                        onChange={field.onChange}
                        className={inputsWidth}
                        items={data?.cities}
                        placeholder='Selecciona una ciudad'
                        notFoundText='No se encontró la ciudad'
                        error={errors.cityFrom?.name?.message}
                    />
                }
            />:<Spinner size={20}/>}

            {!loading? <Controller
                name="cityTo"
                control={control}
                render={({ field }) => 
                    <Combobox
                        label='Ciudad de destino'
                        keyField={"cityId"}
                        optionLabel={"name"}
                        value={field.value}
                        onChange={field.onChange}
                        className={inputsWidth}
                        items={data?.cities}
                        placeholder='Selecciona una ciudad'
                        notFoundText='No se encontró la ciudad'
                        error={errors.cityFrom?.name?.message}
                    />
                }
            />:<Spinner size={20}/>}</div>

            <div className='flex flex-col md:flex-row justify-between'>
            
            {arePackages ? <Controller
                    name='packages'
                    control={control}
                    render={({field})=>
                        <div className='my-3 w-full md:w-2/3 justify-center rounded'>
                            {field.value && field.value.length > 0 && <Label className='my-1 text-lg' text='Camiones' />}
                            {field.value?.map((packagee,index)=>{
                                
                                return packageTemplate(packagee,index,()=>{
                                    field.value?.splice(field.value.indexOf(packagee),1)
                                    field.onChange(field.value)
                                    setNewPackage(packagee)
                                }, errors.packages?.[index]?.recipientdocument?.message, errors.packages?.[index]?.recipientfirstname?.message,
                                errors.packages?.[index]?.weight?.message, errors.packages?.[index]?.size?.message,)
                            })}

                            {newPackage ? <><Label className='mt-2 text-lg' text={newPackage.packageId ? `Id: ${newPackage.packageId}`: 'Nuevo paquete'} />
                            <div className='rounded-lg bg-cyan-600 p-3'>
                                <TextInput label='Documento del receptor' name='recipientdocument' value={newPackage.recipientdocument} onChange={(e)=>{
                                    setNewPackage({...newPackage, recipientdocument: e.target.value})
                                }} placeholder='XX9999XX' />


                                <TextInput label='Peso' name='weight' value={newPackage.weight.toString()} onChange={(e)=>{
                                    setNewPackage({...newPackage, weight: Number(e.target.value)})
                                }} type='number' />

                                <TextInput label='Tamaño' name='size' value={newPackage.weight.toString()} onChange={(e)=>{
                                    setNewPackage({...newPackage, weight: Number(e.target.value)})
                                }} type='number' />

                                <TextInput label='Precio' name='weight' value={newPackage.weight.toString()} onChange={(e)=>{
                                    setNewPackage({...newPackage, weight: Number(e.target.value)})
                                }} type='number' />

                                <div className='flex justify-between'>
                                    <Button className='mr-1' variant='outline' type='button' onClick={()=>{
                                        field.value?.push(newPackage)
                                        field.onChange(field.value)
                                        setNewPackage(defaultPackage)
                                    }} >Agregar camión</Button>
                                    <Button variant='destructive' onClick={()=>{
                                        setNewPackage(null)
                                        field.value?.length == 0 && setArePackages(false)
                                    }} >Eliminar camión</Button>
                                </div>
                                
                            </div> </>  
                            :
                            <Button className='my-1' variant={'outline'} onClick={()=>setNewPackage(defaultPackage)} >Agregar camión</Button>
                            }                         
                        </div>
                    }
                />
                :
                <Button className='my-3 w-full md:w-1/4 text-white transition-all bg-blue-700 hover:bg-blue-500' onClick={()=>{
                    setArePackages(true)
                    setNewPackage(defaultPackage)
                }} >Camiones particulares</Button>}</div>
            
            <div className='flex justify-end'>
                <BackButton text='Cancelar' onClick={onCancel} />
                <SubmitButton text='Guardar' className='mx-1' />
            </div>
            
        </form>
    </div>
}
