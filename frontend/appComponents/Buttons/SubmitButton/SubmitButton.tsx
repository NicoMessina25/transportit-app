import { Button } from '@/components/ui/button'
import React from 'react'

export default function SubmitButton({className="", text = "", onClick}:ButtonProps) {
  return <Button type='submit' variant={'secondary'} onClick={onClick} className={className} >{text}</Button>
}
