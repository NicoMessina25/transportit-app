import { PayloadAction, createSlice } from "@reduxjs/toolkit";

const initialState = {
    loader: false
};

const LoaderSlice = createSlice({
    name: "loader",
    initialState,
    reducers: {
        setLoader: (state, action: PayloadAction<boolean>) => {
            state.loader = action.payload;
        }
    }
});

export const { setLoader } = LoaderSlice.actions;

export default LoaderSlice;