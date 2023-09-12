"use client"

import React from 'react'
import GenericLayout from '../Components/GenericLayout/GenericLayout'

export default function CustomersLayout({children}:{children: React.ReactNode}) {
  return <GenericLayout title='Customers'>
    {children}
  </GenericLayout>
}
