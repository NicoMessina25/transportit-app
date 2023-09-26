import { Button } from '@/components/ui/button'
import React from 'react'

export default function SubmitButton({className="", text = "", onClick}:ButtonProps) {
  return <Button type='submit' onClick={onClick} className={`border-0 font-bold bg-cyan-500 text-white hover:bg-cyan-400 transition-all ${className}`} >{text}</Button>
}
