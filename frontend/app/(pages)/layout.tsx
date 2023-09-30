"use client"

import { ApolloClient, ApolloLink, ApolloProvider, InMemoryCache, concat, createHttpLink } from '@apollo/client'
import { setContext } from '@apollo/client/link/context';
import '../globals.css'
import { Inter } from 'next/font/google'
import { ToastContainer } from 'react-toastify';
import JwtUser from '../types/jwtUser';
import { getUserFromLocalStrg, isLogged } from '../services/authServices';
import { Provider } from 'react-redux'
import { store } from '../redux/store';
import AlertContainer from '../Components/Alert/AlertContainer';
import WindowLoader from '../Components/WindowLoader/WindowLoader';


const inter = Inter({ subsets: ['latin'] })

const httpLink = createHttpLink({
  uri: 'http://localhost:8080/graphql',
});

const authMiddleware = new ApolloLink((operation, forward) => {

  // add the authorization to the headers
  operation.setContext(({ headers = {} }) => {
    // get the authentication token from local storage if it exists
    const user = getUserFromLocalStrg()
    // return the headers to the context so httpLink can read them
    return {
      headers: {
        ...headers,
        authorization: user?.accessToken ? `Bearer ${user.accessToken}` : "",
      }
    }
  });  

  if (!isLogged()) {
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

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className + " dark"}>
        <Provider store={store}>
          <ApolloProvider client={client} >
            {children}
            <AlertContainer/>
            <WindowLoader/>
          </ApolloProvider>
        </Provider>
      </body>
    </html>
  )
}
