'use client';
import { useState,useEffect } from "react";
import {useSearchParams} from 'next/navigation';

export const ErrorMessage=({message}:{message:string})=>{
    const [error,setErrorMessage]=useState('');
   const searchParam =useSearchParams();
 
    useEffect(()=>{
       
        let err =  searchParam.get('message')??'';
        setErrorMessage(err);
        
      return ()=>{
      
        setTimeout(()=>{setErrorMessage('');
           
        },5000)
      }
    },[])
   
   
    if(error){
return(
    <p className="mt-4 p-4 bg-red-500 z-10 text-white rounded-lg text-center">
    {error}
  </p>
)
    }
}