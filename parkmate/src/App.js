import React,{useState,useEffect} from "react";
import Web3 from "web3";
import './App.css';

function App() {
  useEffect(()=>{
    const init=async()=>{
      try{
        const ganacheProvider=new Web3.providers.HttpProvider("http://127.0.0.1:7545");

      }
      catch(error){
        console.log(error);
      }
    };
    init();
  },[]}

export default App;
