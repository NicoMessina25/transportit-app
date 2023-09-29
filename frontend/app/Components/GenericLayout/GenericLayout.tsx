import React from 'react'
import BackButton from '../Buttons/BackButton/BackButton'
import Title from '../Labels/Title/Title'

interface GenericLayoutProps {
    title?: string,
    children: React.ReactNode
}

export default function GenericLayout({title, children}:GenericLayoutProps) {
  return <section className='p-5 md:p-10 lg:p-20'>
    <div className='flex items-center'>
      <BackButton className='mr-2 ' />
      <Title>{title}</Title>
    </div>
    
    {children}
  </section>
}