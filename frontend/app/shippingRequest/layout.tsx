import React from 'react'
import GenericLayout from '../Components/GenericLayout/GenericLayout'

export default function ShippingRequestLayout({children}:{children: React.ReactNode}) {
  return <GenericLayout title='Solicitudes de Envío' >
    {children}
  </GenericLayout>
}
