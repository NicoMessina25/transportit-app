import { Icon } from '@iconify/react/dist/iconify.js';
import React from 'react'

export interface CardProps {
    label: string;
    description?: string;
    onClick?:()=>void,
    icon?:string
}

export default function Card({label, description,onClick,icon}:CardProps) {
  return <div
    onClick={onClick}
    className={`group w-full md:w-5/12 rounded-lg border border-transparent px-5 py-7 my-4 transition-colors hover:dark:border-slate-400/75 hover:dark:bg-slate-800/30 ${onClick? "cursor-pointer":""}`}
    >
        <h2 className={`mb-3 flex justify-center text-2xl font-semibold transition-transform group-hover:-translate-y-1 motion-reduce:transform-none`}>
            {label + ' '} {icon && <Icon className='ml-3' icon={icon} />}
        </h2>
        <p className={`m-0 text-sm opacity-50`}>
            {description}
        </p>
    </div>
}
