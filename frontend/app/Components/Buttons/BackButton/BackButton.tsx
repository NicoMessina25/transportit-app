"use client"

import { useRouter } from 'next/navigation'
import React from 'react'
import { Button } from 'react-bootstrap';



export default function BackButton({className = "", text = "Volver", onClick}:ButtonProps) {
    const router = useRouter();

    return <Button className={`rounded-full flex-grow mx-4 font-bold p-1 my-1 border-0 bg-blue-950 text-white hover:bg-blue-500 transition-all ${className}`} onClick={onClick ?? router.back} > {text} </Button>
}
