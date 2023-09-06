import { toast } from "react-toastify";

export const notifyInfo = (message:string) => toast.info(message, {
    position: toast.POSITION.TOP_RIGHT,
    theme: 'colored'
});

export const notifyError = (message:string) => toast.error(message, {
    position: toast.POSITION.TOP_RIGHT,
    theme: 'colored'
});