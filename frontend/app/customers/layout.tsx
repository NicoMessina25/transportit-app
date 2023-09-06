"use client"

import React from 'react'

export default function CustomersLayout({children}:{children: React.ReactNode}) {
  return (
    <section>
        <h1>Customers</h1>
        {children}
    </section>
  )
}
