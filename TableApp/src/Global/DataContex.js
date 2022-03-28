import React, { useEffect, useState, createContext, useReducer } from "react";
import AsyncStorage from "@react-native-async-storage/async-storage";

const DataContext = createContext(null);

export const DataProvider = ({ children }) => {
  const [cart, setCart] = useState([]);
  const [table, setTable] = useState([]);

  const cartItems = JSON.stringify(cart);
  const tableNumber = JSON.stringify(table)

  setCartItems = async () => {
    try {
      await AsyncStorage.setItem("cartItems", cartItems);


    } catch (error) {
      console.log("adding data error");
    }
  };

 setTableNumber = async () => {
    try {

      await AsyncStorage.setItem("tableNumber", tableNumber);

    } catch (error) {
      console.log("adding data error");
    }
  };
  getItemStorage = async () => {
    try {
      const cartItems = await AsyncStorage.getItem("cartItems");
      const tableNumber = await AsyncStorage.getItem("TableNumber");

      if (cartItems !== null && tableNumber !==null ) {
        setCart(JSON.parse(cartItems));
        setTable(JSON.parse(tableNumber));

      }
    } catch (error) {
      console.log("reading data error");
    }
  };
  useEffect(() => {
    this.getItemStorage();
  }, []);

  removeItemStorage = async () => {
    try {
      await AsyncStorage.setItem("name", cartItems);
    } catch (error) {
      console.log("adding data error");
    }
  };

  const completeTask = item => {
    let itemsCopy = [...cart];
    itemsCopy.splice(item, 1);
    setCart(itemsCopy);
    this.setItemStorage();
  };

  return (
    <DataContext.Provider
      value={{
        cart,
        setCart,
        setCartItems,
        completeTask,
        table,
        setTable,
        setTableNumber
      }}
    >
      {children}
    </DataContext.Provider>
  );
};

export default DataContext;
