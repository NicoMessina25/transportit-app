"use client"

import Image from 'next/image'
import Card from '../Components/Card/Card'
import { useRouter } from 'next/navigation'
import { Icon } from '@iconify/react';

export default function Home() {

  const router = useRouter();
  
  return (
    <main className="flex min-h-screen flex-col items-center p-24">
      <h1 className="mb-5 font-bold text-5xl relative flex place-items-center before:absolute before:h-[300px] before:w-[480px] before:-translate-x-1/2 before:rounded-full before:bg-gradient-radial before:from-white before:to-transparent before:blur-2xl before:content-[''] after:absolute after:-z-20 after:h-[180px] after:w-[240px] after:translate-x-1/3 after:bg-gradient-conic after:from-sky-200 after:via-blue-200 after:blur-2xl after:content-[''] before:dark:bg-gradient-to-br before:dark:from-transparent before:dark:to-blue-700 before:dark:opacity-10 after:dark:from-sky-900 after:dark:via-[#0141ff] after:dark:opacity-40 before:lg:h-[360px] z-[-1] " >Transp <Icon className='transition-transform translate-y-1' icon={'tabler:package'} /> rt It</h1>
      
      <div className="mb-32 text-center flex justify-around lg:max-w-5xl lg:w-full lg:mb-0 lg:text-left">
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
          icon='healthicons:truck-driver'
        />
      </div>
    </main>
  )
}
