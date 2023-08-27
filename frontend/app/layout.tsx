"use client"

import { ApolloClient, ApolloProvider, InMemoryCache } from '@apollo/client'
import './globals.css'
import 'react-toastify/dist/ReactToastify.css';
import { Inter } from 'next/font/google'

const inter = Inter({ subsets: ['latin'] })

const client = new ApolloClient({
  uri: "http://localhost:8080/graphql",
  cache: new InMemoryCache()
});

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <ApolloProvider client={client} >
          {children}
        </ApolloProvider>
      </body>
    </html>
  )
}
