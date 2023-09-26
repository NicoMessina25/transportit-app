"use client"

import GenericLayout from '@/app/Components/GenericLayout/GenericLayout'
import React from 'react'

export default function DriversLayout({children}:{children: React.ReactNode}) {
  return <GenericLayout title='Conductores'>
    {children}
  </GenericLayout>
}
