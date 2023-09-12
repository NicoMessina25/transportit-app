import React from 'react'

interface GenericLayoutProps {
    title?: string,
    children: React.ReactNode
}

export default function GenericLayout({title, children}:GenericLayoutProps) {
  return <section>
    <h1>{title}</h1>
    {children}
  </section>
}