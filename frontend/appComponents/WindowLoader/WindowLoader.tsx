import React from 'react'
import { useSelector } from 'react-redux';
import Spinner from '../Spinner/Spinner';
import style from './WindowLoader.module.scss'
import { RootState } from '@/src/redux/store';



export default function WindowLoader() {

  const {loader} = useSelector((state:RootState) => state.loader);

  return (
    loader ? <div className={style.divLoader}>
        <Spinner/>
    </div> : null
  )
}