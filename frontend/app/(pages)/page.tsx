"use client"

import Card from '../Components/Card/Card'
import { Icon } from '@iconify/react';
import Title from '../Components/Labels/Title/Title';
import { Button } from '@/components/ui/button';
import { getUserFromLocalStrg, isLogged } from '../services/authServices';
import { Label } from '../Components/Labels/Label/Label';
import { useDispatch } from 'react-redux';
import useLoader from '../hooks/useLoader';
import { useEffect } from 'react';
import useRouter from '../hooks/useRouter';

export default function Home() {

  const router = useRouter();
  if(!isLogged()){
    window.location.pathname = "/login"
  }
  const loader = useLoader();
  const user = getUserFromLocalStrg();
  
  return (
    <main className="flex min-h-screen flex-col items-center p-12 md:p-24">
      
      <Title>Transp <Icon className='transition-transform translate-y-1' icon={'tabler:package'} /> rt It</Title>
      
      <div className="text-center flex flex-wrap justify-around mb-0  lg:max-w-5xl lg:w-full lg:text-left">
        <Card 
          label='Clientes' 
          desc='Consulta, registra, modifica o elimina clientes' 
          onClick={()=>
            router.push('./customers/list')
          }
          icon='fa-solid:user-tie' 
        />
        <Card 
          label='Conductores' 
          desc='Consulta, registra, modifica o elimina conductores' 
          onClick={()=>
            router.push('./drivers/list')
          }
          icon='mingcute:steering-wheel-fill'
        />
        <Card 
          label='Hojas de Ruta'
          desc='Genera y consulta hojas de ruta de conductores'
          icon='gis:map-route'
          onClick={()=>{
            router.push('./routeMaps/list')
            loader(true)
          }}
        />
        <Card 
          label='Paquetes'
          desc='Carga paquetes para asignarlos a una hoja de ruta o una solicitud de envío'
          icon='tabler:package'
        />
        <Card 
          label='Solicitudes de Envío'
          desc='Consulta, registra, modifica o elimina conductores solicitudes de envío'
          icon='quill:paper'
        />
        <Card 
          label='Reporte de Movimientos'
          desc='Consulta los movimientos que se realizaron'
          icon='mingcute:transfer-fill'
        />
      </div>
      <div className='flex items-center w-48 justify-between'>
        <div className='flex'>
          <Icon icon={"solar:user-bold"} />
          <Label text={user?.username} />
        </div>
        <Button 
          type='button' 
          variant={'ghost'} 
          onClick={()=>{
            localStorage.removeItem('user')
            router.push('/login')
            loader(true)
          }} 
        >
          Salir
        </Button>
      </div>
      
    </main>
  )
}
