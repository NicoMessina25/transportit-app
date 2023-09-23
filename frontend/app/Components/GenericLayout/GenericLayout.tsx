import React from 'react'
import BackButton from '../Buttons/BackButton/BackButton'

interface GenericLayoutProps {
    title?: string,
    children: React.ReactNode
}

export default function GenericLayout({title, children}:GenericLayoutProps) {
  return <section>
    <div className='flex w-10 items-center'>
      <BackButton />
      <h1>{title}</h1>
    </div>
    
    {children}
  </section>
}