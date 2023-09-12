"use client"

import { useRouter } from 'next/navigation'
import React from 'react'

interface BackButtonProps {
    text: string,
    className?:string,
    onBack?: () => void
}

export default function BackButton({className = "", text = "Volver", onBack}:BackButtonProps) {
    const router = useRouter();

    return <button className={`rounded-full flex-grow mx-4 font-bold p-1 my-1 bg-blue-950 text-white hover:bg-blue-500 transition-all ${className}`} onClick={onBack ?? router.back} > {text} </button>
}
