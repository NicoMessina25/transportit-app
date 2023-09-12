import { DocumentNode } from "@apollo/client"

export interface GraphQuery {
    query: DocumentNode,
    name: string
}

export interface GraphMutation {
    mutation: DocumentNode,
    name: string
}