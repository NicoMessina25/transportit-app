"use client"

import { Button } from '@/components/ui/button';
import { Icon } from '@iconify/react/dist/iconify.js';
import useRouter from '@/app/hooks/useRouter';
import React from 'react'



export default function AddButton({className = "", text = "Agregar", onClick}:ButtonProps) {
    const router = useRouter();

    return <Button type='button' variant={'ghost'} className={`transition-all bg-blue-700 hover:bg-blue-500 ${className}`} onClick={onClick ?? router.back} > {text} <Icon className='ml-1' icon={"mingcute:add-fill"} />  </Button>
}
