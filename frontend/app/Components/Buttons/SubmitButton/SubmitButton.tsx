import React from 'react'
import { Button } from 'react-bootstrap'

export default function SubmitButton({className="", text = "", onClick}:ButtonProps) {
  return <Button type='submit' onClick={onClick} className={`rounded-full flex-grow mx-4 border-0 font-bold p-1 my-1 bg-green-950 text-white hover:bg-green-500 transition-all ${className}`} >{text}</Button>
}
