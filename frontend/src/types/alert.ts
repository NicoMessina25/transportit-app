export enum EAlertType {
    INFO,
    WARNING,
    ERROR,
    SUCCESS
}
  
interface IAlert {
    message?:string,
    color?:string
    title:string,
    icon?:string
}

export type {IAlert}