'use client'

import { IAlert } from "@/src/types/alert";
import { PayloadAction, createSlice } from "@reduxjs/toolkit";

export interface AlertState{
  alerts: Array<IAlert>
}

export const initialAlertState:AlertState = {
  alerts: []
}

export const AlertSlice = createSlice({
  name: "alert",
  initialState: initialAlertState,
  reducers: {
    createAlert: (state, action:PayloadAction<IAlert>) => {
      const alert:IAlert = {...action.payload} 
      state.alerts.push(alert);
    },
    deleteAlert: (state, action:PayloadAction<IAlert>) => {
      state.alerts.splice(state.alerts.indexOf(action.payload),1)
    }
  }
});

export const {createAlert,deleteAlert} = AlertSlice.actions;

export default AlertSlice;