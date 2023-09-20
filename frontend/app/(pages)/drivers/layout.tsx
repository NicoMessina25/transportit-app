"use client"

import GenericLayout from '@/app/Components/GenericLayout/GenericLayout'
import React from 'react'

export default function CustomersLayout({children}:{children: React.ReactNode}) {
  return <GenericLayout title='Conductores'>
    {children}
  </GenericLayout>
}
