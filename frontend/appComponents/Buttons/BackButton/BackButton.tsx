 

import { Button } from '@/components/ui/button';
import { Icon } from '@iconify/react/dist/iconify.js';
import { useRouter } from 'next/router';
import React from 'react'



export default function BackButton({className = "", text = "Volver", onClick}:ButtonProps) {
    const router = useRouter();

    return <Button type='button' variant={'outline'} className={className} onClick={onClick ?? router.back} ><Icon className='mr-1' icon={"icon-park-solid:back"} /> {text}  </Button>
}
