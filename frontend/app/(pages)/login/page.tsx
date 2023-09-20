'use client'

import React, {useEffect} from 'react'
import { useLazyQuery } from '@apollo/client'
import { useRouter } from 'next/navigation';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { AUTHENTICATE } from '@/app/graphql/user/userQueries';
import { Controller, useForm } from 'react-hook-form';
import { notifyError, notifyInfo } from '@/app/types/toastFunctions';
import { Output, minLength, object, string } from 'valibot';
import { requiredMessage } from '@/app/types/form';
import { TextInput } from '@/app/Components/TextInput/TextInput';
import { valibotResolver } from '@hookform/resolvers/valibot';
import { LoginForm } from '@/app/types/login';
import { Label } from '@/app/Components/Label/Label'
import { Button } from '@/components/ui/button';
import { Spinner } from 'react-bootstrap';

const loginSchema = object({
    username: string([minLength(1,requiredMessage)]),
    password: string([minLength(1,requiredMessage)])
})

type LoginSchema = Output<typeof loginSchema>

export default function LoginPage() {
    const {handleSubmit, control, formState: {errors}} = useForm<LoginSchema>({defaultValues: {username:"", password:""} , resolver: valibotResolver(loginSchema)});
    const [authenticate, { data, error, loading }] = useLazyQuery<{authenticate: number}>(AUTHENTICATE);
    const router:AppRouterInstance = useRouter()
    
    useEffect(()=>{
        if(data)
            if(data.authenticate != -1){
                notifyInfo("Has ingresado")
                router.push('/')
            } else  if(error) console.log("error", error.message);
                    else notifyError("Usuario o contraseña incorrectos")
    },[data, router, error])

    return (
        <section className='w-full h-screen flex flex-col justify-center items-center '>
            <form className='h-fit w-1/4 bg-blue-950 p-4 rounded-xl flex flex-col items-center' onSubmit={handleSubmit((u)=>{
                authenticate({variables: {username: u.username, password:u.password }})
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
                <Button className='text-xl mt-3' >{loading? <Spinner/>:"Ingresar"} </Button>
            </form>
        </section>
    )
}
