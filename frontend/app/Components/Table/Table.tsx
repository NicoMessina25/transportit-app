import React from 'react'
import BoostrapTable from 'react-bootstrap/Table';
import { Icon } from '@iconify/react/dist/iconify.js';

export type Column<T> = {
  field: string;
  header: string;
  body?: (props: T, key:React.Key) => React.JSX.Element
}

export interface Indexable {
  [key: string]:any;
}

export type TableProps<T> = {
  columns: Column<T>[], 
  items:T[],
  itemsKeyField: string,
  onEdit?: (item:T)=> void
  onDelete?: (item:T) => void,
  className?: string
}

export default function Table<T extends Indexable>({columns, items, itemsKeyField, onEdit, onDelete, className}:TableProps<T>) {
  return (
    <BoostrapTable className={`table-auto`} striped bordered hover variant='dark'  >
    <thead>
      <tr>
        {columns.map((c)=><th key={c.field}>{c.header}</th>)}
        {onEdit && <th>Editar</th>}
        {onDelete && <th>Eliminar</th>}
      </tr>
    </thead>
    <tbody>
      {items.map((i)=><tr key={i[itemsKeyField]}>
        {columns.map((c)=> {
          const key = c.field + i[itemsKeyField]

          if(c.body)
            return c.body(i, key)
          else return <td key={key}>
              {c.field in i ? i[c.field] : c.field}
          </td>
        
        } )}
        {onEdit && <td className='cursor-pointer'><Icon icon={'uil:edit'} onClick={()=> onEdit(i)} className='w-5 h-5' /></td>}
        {onDelete && <td className='cursor-pointer'><Icon icon={'mdi:trash'} onClick={()=> onDelete(i)} className='w-5 h-5' /></td>}
      </tr>)}
    </tbody>
  </BoostrapTable>
  )
}
