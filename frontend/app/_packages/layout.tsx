import React from 'react'
import GenericLayout from '../Components/GenericLayout/GenericLayout'

export default function PackagesLayout({children}:{children: React.ReactNode}) {
  return <GenericLayout title='Packages'>
    {children}
  </GenericLayout>
}
