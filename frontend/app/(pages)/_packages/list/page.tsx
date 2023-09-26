import GenericCRUDView from '@/app/Components/GenericCRUDView/GenericCRUDView'
import { DELETE_PACKAGE, PACKAGES } from '@/app/graphql/_package/packageQueries'
import React from 'react'

export default function PackageCRUD() {

    return <GenericCRUDView getQuery={{name: "packages", query: PACKAGES}} deleteMutation={{name:"deletePackage", mutation:DELETE_PACKAGE}} entityIdField='packageid' columns={[

    ]} />
}
