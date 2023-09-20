/* 'use client'

import { minLength, required, useForm } from '@modular-forms/react'
import React, {useEffect} from 'react'
import { TextInput } from '../Components/TextInput/TextInput';
import { useLazyQuery } from '@apollo/client'
import { AUTHENTICATE } from '../graphql/user/userQueries';
import { useRouter } from 'next/navigation';
import { AppRouterInstance } from 'next/dist/shared/lib/app-router-context';
import { ToastContainer, toast } from 'react-toastify';

export default function LoginPage() {
    const [, {Field, Form}] = useForm<LoginForm>();
    const [authenticate, { data, error, loading }] = useLazyQuery<{authenticate: number}>(AUTHENTICATE);
    const router:AppRouterInstance = useRouter()

    const notify = () => toast.error("Usuario o contraseña incorrectos", {
        position: toast.POSITION.TOP_RIGHT,
        theme: 'colored'
      });
    
    useEffect(()=>{
        if(data)
            if(data.authenticate != -1){
                router.push('/')
            } else  if(error) console.log("error", error.message);
                    else notify()
    },[data, router, error])

    return (
        <section className='w-full h-screen bg-slate-700 flex flex-col justify-center items-center '>
            <div className='h-fit w-1/4 bg-blue-800 rounded-xl '>
                <Form onSubmit={(e:LoginForm)=>{
                    authenticate({variables: e})
                }} className='flex flex-col justify-center p-4' >
                    <Field name='username' validate={[
                        required("Debe completar este campo")
                    ]} >
                        {(field, props)=><TextInput label={'Nombre de usuario'} className='my-2' inputClassName='text-neutral-950 my-1' type='text' value={field.value} error={field.error} onChange={props.onChange} name={field.name} onBlur={props.onBlur} required />}
                    </Field>
                    <Field name='password' validate={[
                        required("Debe completar este campo"),
                        minLength(4, "La contraseña debe tener al menos 4 caracteres")
                    ]}>
                        {(field, props)=><TextInput label='Contraseña' type='password' value={field.value} error={field.error} onChange={props.onChange} name={field.name} onBlur={props.onBlur} className='my-2' inputClassName='text-neutral-950 my-1' required />}
                    </Field>
                    <button type='submit' className='rounded-full font-bold p-1 my-1 bg-blue-950 text-white hover:bg-blue-500 transition-all' > {loading? "Cargando...":"Ingresar"} </button>
                </Form>
            </div>
            <ToastContainer />
        </section>
    )
}
 */