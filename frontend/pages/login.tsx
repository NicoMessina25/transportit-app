import React, {useEffect, useState} from 'react'
import { useLazyQuery } from '@apollo/client'
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { Controller, useForm } from 'react-hook-form';
import { Output, minLength, object, string } from 'valibot';
import { valibotResolver } from '@hookform/resolvers/valibot';
import { Button } from '@/components/ui/button';
import { useDispatch } from 'react-redux';
import { requiredMessage } from '@/src/types/form';
import useAuth from '@/src/hooks/fetchers/auth/useAuth';
import { NextRouter, useRouter } from 'next/router';
import useNotification from '@/src/hooks/useNotification';
import useLoader from '@/src/hooks/useLoader';
import JwtUser from '@/src/types/jwtUser';
import { TextInput } from '@/appComponents/TextInput/TextInput';

const loginSchema = object({
    username: string([minLength(1,requiredMessage)]),
    password: string([minLength(1,requiredMessage)])
})

type LoginSchema = Output<typeof loginSchema>

export default function Login() {
    const {handleSubmit, control, formState: {errors}} = useForm<LoginSchema>({defaultValues: {username:"", password:""} , resolver: valibotResolver(loginSchema)});
    const {authenticate} = useAuth()
    const router:NextRouter = useRouter();
    const {notifyError,notifyInfo} = useNotification();
    const loader = useLoader();

    return (
        <section className='w-full h-screen flex flex-col justify-center items-center '>
            <form className='h-fit w-2/3 md:w-1/4 bg-slate-900/75  p-4 rounded-xl flex flex-col items-center' onSubmit={handleSubmit((u)=>{
                loader(true)
                authenticate(u.username, u.password).then((u:JwtUser|null)=>{
                    loader(false)
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
                <Button variant='outline' className='mt-3' >Ingresar</Button>
            </form>
        </section>
    )
}
