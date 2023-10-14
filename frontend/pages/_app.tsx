"use client"

import type { ReactElement, ReactNode } from 'react'
import type { NextPage } from 'next'
import type { AppProps } from 'next/app'
import React, { use, useEffect, useState } from 'react'
import './globals.css'
import { ApolloClient, ApolloLink, ApolloProvider, InMemoryCache, concat, createHttpLink } from '@apollo/client'
import { Provider } from 'react-redux'
import { store } from '@/src/redux/store'
import AlertContainer from '@/appComponents/Alert/AlertContainer'
import WindowLoader from '@/appComponents/WindowLoader/WindowLoader'
import { Inter } from 'next/font/google'
import JwtUser from '@/src/types/jwtUser'
import { getUserFromLocalStrg, isLogged } from '@/src/services/authServices'
 
export type NextPageWithLayout<P = {}, IP = P> = NextPage<P, IP> & {
  getLayout?: (page: ReactElement) => ReactNode
}
 
type AppPropsWithLayout = AppProps & {
  Component: NextPageWithLayout
}

const inter = Inter({ subsets: ['latin'] })

const httpLink = createHttpLink({
  uri: 'http://localhost:8080/graphql',
});

const authMiddleware = new ApolloLink((operation, forward) => {


  // add the authorization to the headers
  operation.setContext(({ headers = {} }) => {
    // get the authentication token from local storage if it exists
    // return the headers to the context so httpLink can read them

    let user:JwtUser|undefined;
    if(typeof window !== "undefined")
      user = getUserFromLocalStrg()
    

    return {
      headers: {
        ...headers,
        authorization: user?.accessToken ? `Bearer ${user.accessToken}` : "",
      }
    }
  });  

  if (typeof window !== "undefined" && !isLogged()) {
    window.location.pathname = "/login"
    return null
  } else return forward(operation);
})



const client = new ApolloClient({
  connectToDevTools: true,
  //uri: "http://localhost:8080/graphql",
  cache: new InMemoryCache(),
  link: concat(authMiddleware,httpLink),
  name: "TransportIt",
  version: "1.0"
});
 
export default function MyApp({ Component, pageProps }: AppPropsWithLayout) {
  // Use the layout defined at the page level, if available
 
  return  <div className={inter.className + " body dark min-h-screen"}>
    <Provider store={store}>
      <ApolloProvider client={client} >
        <Component {...pageProps} />
        <AlertContainer/>
        <WindowLoader/>
      </ApolloProvider>
    </Provider>
  </div>
 
}