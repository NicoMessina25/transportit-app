import React from 'react'

interface ErrorLabelProps{
    text?:string,
    htmlFor?:string,
    className?:string,
    error?:boolean
}

export default function ErrorLabel({text, htmlFor, className = "",error}:ErrorLabelProps) {
  return error ?  <label id={`${htmlFor}-error`} className={'text-red-500 text-xs ' + className}>{text}</label>:<></>
}
