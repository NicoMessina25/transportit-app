"use client"

import GenericLayout from '@/app/Components/GenericLayout/GenericLayout'
import React from 'react'

export default function PackagesLayout({children}:{children: React.ReactNode}) {
  return <GenericLayout title='Packages'>
    {children}
  </GenericLayout>
}
