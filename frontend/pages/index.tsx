"use client"

import { useEffect, type ReactElement, useState } from 'react'
import type { NextPageWithLayout } from './_app'
import { NextPage } from 'next'
import { Button } from '@/components/ui/button'
import { Label } from '@/appComponents/Labels/Label/Label'
import { Icon } from '@iconify/react/dist/iconify.js'
import Card, { CardProps } from '@/appComponents/Card/Card'
import Title from '@/appComponents/Labels/Title/Title'
import useLoader from '@/src/hooks/useLoader'
import { getUserFromLocalStrg, isLogged } from '@/src/services/authServices'
import { useRouter } from 'next/router'
import JwtUser from '@/src/types/jwtUser'
import { Popover } from '@/appComponents/Popover/Popover'
 
export default function Page(){
  const router = useRouter();
  const [logged,setLogged] = useState<boolean|undefined>(undefined)
  const [user,setUser] = useState<JwtUser|undefined>()

  useEffect(()=>{
    setLogged(isLogged());
    setUser(getUserFromLocalStrg())
  },[])

  useEffect(()=>{
    if(!logged && logged !== undefined){
      window.location.pathname = "/login"
    }
  },[logged])

  const cards:CardProps[] = [{
      label: 'Clientes',
      description: 'Consulta, registra, modifica o elimina clientes',
      onClick: ()=>
        router.push('./customers/list'),
      icon:'mingcute:steering-wheel-fill'
    },
    {
      label:'Conductores', 
      description:'Consulta, registra, modifica o elimina conductores',
      onClick:()=>
        router.push('./drivers/list'),
      icon:'mingcute:steering-wheel-fill'
    },
    {
      label:'Hojas de Ruta',
      description:'Genera y consulta hojas de ruta de conductores',
      icon:'gis:map-route',
      onClick:()=>{
        router.push('./routeMaps/list')
      },
    },
    {
      label:'Paquetes',
      description:'Carga paquetes para asignarlos a una hoja de ruta o una solicitud de envío',
      onClick:()=>
        router.push('./packages/list'),
      icon:'tabler:package'
    },
    {
      label:'Solicitudes de Envío',
      description:'Consulta, registra, modifica o elimina conductores solicitudes de envío',
      onClick:()=>
        router.push('./shippingRequests/list'),
      icon:'quill:paper'
    },
    {
      label:'Reporte de Movimientos',
      description:'Consulta los movimientos que se realizaron',
      icon:'mingcute:transfer-fill'
    }
  ]
  
  return (
    <main className="flex min-h-screen flex-col items-center p-12 md:p-24">
      {user && <Popover text={user.username} className='self-end'>
        <div className='flex items-center w-48 justify-between'>
          <Button 
            type='button' 
            variant={'ghost'} 
            onClick={()=>{
              localStorage.removeItem('user')
              router.push('/login')
            }} 
          >
            Salir
          </Button>
        </div>
      </Popover>}
      
      <Title>Transp <Icon className='transition-transform translate-y-1' icon={'tabler:package'} /> rt It</Title>
      
      <div className="text-center flex flex-wrap justify-around mb-0  lg:max-w-5xl lg:w-full lg:text-left">
        {cards.map((card)=>
          <Card {...card} />
        )}
      </div>     
      
    </main>
  )
}