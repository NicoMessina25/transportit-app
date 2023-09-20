"use client"

import { ApolloClient, ApolloProvider, InMemoryCache } from '@apollo/client'
import '../globals.css'
import { Inter } from 'next/font/google'
import { ToastContainer } from 'react-toastify';

const inter = Inter({ subsets: ['latin'] })

const client = new ApolloClient({
  connectToDevTools: true,
  uri: "http://localhost:8080/graphql",
  cache: new InMemoryCache(),
  name: "TransportIt",
  version: "1.0"
});

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className + " dark"}>
        <ApolloProvider client={client} >
          {children}
          <ToastContainer />
        </ApolloProvider>
      </body>
    </html>
  )
}
