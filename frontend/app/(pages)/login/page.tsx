'use client'

import React, {useEffect} from 'react'
import { useLazyQuery } from '@apollo/client'
import { useRouter } from 'next/navigation';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { Controller, useForm } from 'react-hook-form';
import { notifyError, notifyInfo } from '@/app/types/toastFunctions';
import { Output, minLength, object, string } from 'valibot';
import { requiredMessage } from '@/app/types/form';
import { TextInput } from '@/app/Components/TextInput/TextInput';
import { valibotResolver } from '@hookform/resolvers/valibot';
import { LoginForm } from '@/app/types/login';
import { Label } from '@/app/Components/Labels/Label/Label'
import { Button } from '@/components/ui/button';
import { Spinner } from 'react-bootstrap';
import useAuth from '@/app/hooks/fetchers/auth/useAuth';
import JwtUser from '@/app/types/jwtUser';

const loginSchema = object({
    username: string([minLength(1,requiredMessage)]),
    password: string([minLength(1,requiredMessage)])
})

type LoginSchema = Output<typeof loginSchema>

export default function LoginPage() {
    const {handleSubmit, control, formState: {errors}} = useForm<LoginSchema>({defaultValues: {username:"", password:""} , resolver: valibotResolver(loginSchema)});
    const {authenticate,loading} = useAuth()
    const router:AppRouterInstance = useRouter();

    return (
        <section className='w-full h-screen flex flex-col justify-center items-center '>
            <form className='h-fit w-2/3 md:w-1/4 bg-slate-900/75  p-4 rounded-xl flex flex-col items-center' onSubmit={handleSubmit((u)=>{
                authenticate(u.username, u.password).then((u:JwtUser|null)=>{
                    console.log(u);
                    if(u?.accessToken){
                        notifyInfo("Has ingresado")
                        router.push('/')
                    } else notifyError("Usuario o contraseña incorrectos")
                })
            })}>
                <Controller 
                    name='username'
                    control={control}
                    render={({field})=>
                        <TextInput 
                            label='Usuario'
                            className='w-full'
                            {...field}
                            error={errors.username?.message}
                        />
                    }
                />

                <Controller 
                    name='password'
                    control={control}
                    render={({field})=>
                        <TextInput 
                            label='Contraseña'  
                            className='w-full'
                            {...field}
                            type='password'
                            error={errors.password?.message}
                        />
                    }
                />
                <Button variant='outline' className='mt-3' >{loading? <Spinner/>:"Ingresar"} </Button>
            </form>
        </section>
    )
}
