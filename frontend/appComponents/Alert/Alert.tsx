 

import { Icon } from "@iconify/react/dist/iconify.js";
import React, { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import style from './Alert.module.scss' 
import { IAlert } from "@/src/types/alert";
import { deleteAlert } from "@/src/redux/slices/alertSlice";

export const Alert = (alert:IAlert) => {
  const {message="",color="cyan",title,icon} = alert;
  const dispatch = useDispatch();
  
  
  const onClose = () =>{
    dispatch(deleteAlert(alert))
  }

  useEffect(()=>{
    setTimeout(onClose,3000)
  },[])

  //const [color] = useState<string>(getAlertColor(type));

  return <div className={`flex px-3 py-7 items-center justify-between bg-cyan-300 rounded-lg border border-cyan-600 ${style.alert}`}>
        {icon && <Icon icon={icon} className={`text-cyan-700 text-2xl`} />}
        <div className={`flex flex-col flex-grow ml-5`}>
          <p className={`font-semibold text-cyan-800`}>{title}</p>  
          <p className={`text-sm text-cyan-700`}>{message}</p>
        </div>
        <Icon
            icon={'tabler:x'}
            onClick={onClose}
            className={`text-cyan-700 text-2xl`}
            style={{ cursor: "pointer" }}
        />
    </div>;
};