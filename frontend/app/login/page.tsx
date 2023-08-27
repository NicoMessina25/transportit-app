'use client'

import { useForm } from '@modular-forms/react'
import React, {useEffect} from 'react'
import { TextInput } from '../Components/TextInput';
import { useLazyQuery } from '@apollo/client'
import { AUTHENTICATE } from '../graphql/user/queries';
import { useRouter } from 'next/navigation';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';

export default function Page() {
    const [, {Field, Form}] = useForm<LoginForm>();
    const [authenticate, { data, error }] = useLazyQuery<{authenticate: boolean}>(AUTHENTICATE);
    const router:AppRouterInstance = useRouter()
    
    useEffect(()=>{
        if(data?.authenticate){
            router.push('/')
        } else if(error) console.log("error", error.message);
    },[data])

    return (
        <section className='w-full h-screen bg-slate-900 flex flex-col justify-center items-center '>
            <div className='h-fit w-1/4 bg-blue-800 rounded-xl '>
                <Form onSubmit={(e:LoginForm)=>{
                    authenticate({variables: e})
                }} className='flex flex-col justify-center p-4' >
                    <Field name='username'>
                        {(field, props)=><TextInput label={'Nombre de usuario'} className='text-neutral-950 my-1' type='text' value={field.value} error={field.error} onChange={props.onChange} name={field.name} onBlur={props.onBlur} />}
                    </Field>
                    <Field name='password' >
                        {(field, props)=><TextInput label='Contraseña' type='password' value={field.value} error={field.error} onChange={props.onChange} name={field.name} onBlur={props.onBlur} className='text-neutral-950 my-1' />}
                    </Field>
                    <button type='submit' className='rounded-full font-bold p-1 my-1 bg-blue-900 text-white hover:bg-blue-500 transition-all' >Ingresar</button>
                </Form>
            </div>
        </section>
    )
}
