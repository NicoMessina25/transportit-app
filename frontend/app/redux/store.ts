'use client'

import { configureStore } from "@reduxjs/toolkit";
import { AlertSlice } from "./slices/alertSlice";
import LoaderSlice from "./slices/loaderSlice";

const reducer = {
  notifications: AlertSlice.reducer,
  loader: LoaderSlice.reducer
};

export const store = configureStore({
  reducer,
  devTools: process.env.NODE_ENV !== "production"
});


// Infer the `RootState` and `AppDispatch` types from the store itself
export type RootState = ReturnType<typeof store.getState>
// Inferred type: {posts: PostsState, comments: CommentsState, users: UsersState}
export type AppDispatch = typeof store.dispatch