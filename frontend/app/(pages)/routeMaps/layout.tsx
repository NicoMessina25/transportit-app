"use client"

import GenericLayout from '@/app/Components/GenericLayout/GenericLayout'
import React from 'react'

export default function RouteMapsLayout({children}:{children: React.ReactNode}) {
  return <GenericLayout title='Hojas de Ruta'>
    {children}
  </GenericLayout>
}
