import { Icon } from '@iconify/react/dist/iconify.js';
import React from 'react'

interface CardProps {
    label: string;
    desc?: string;
    onClick?:()=>void,
    icon?:string
}

export default function Card({label, desc,onClick,icon}:CardProps) {
  return <div
    onClick={onClick}
    className={`group rounded-lg border border-transparent px-5 py-4 transition-colors hover:border-gray-300 hover:bg-gray-100 hover:dark:border-neutral-700 hover:dark:bg-neutral-800/30 ${onClick? "cursor-pointer":""}`}
    >
        <h2 className={`mb-3 flex justify-center text-2xl font-semibold transition-transform group-hover:-translate-y-1 motion-reduce:transform-none`}>
            {label + ' '} {icon && <Icon className='ml-3' icon={icon} />}
        </h2>
        <p className={`m-0 max-w-[30ch] text-sm opacity-50`}>
            {desc}
        </p>
    </div>
}
