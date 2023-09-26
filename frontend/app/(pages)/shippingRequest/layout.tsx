import GenericLayout from '@/app/Components/GenericLayout/GenericLayout'
import React from 'react'

export default function ShippingRequestLayout({children}:{children: React.ReactNode}) {
  return <GenericLayout title='Solicitudes de Envío' >
    {children}
  </GenericLayout>
}
