import React from "react";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import HomeScreen from "../screens/HomeScreen";
import CartScreen from "../screens/CartScreen";
import PrintScreen from "../screens/PrintScreen";
import Category from "../screens/Category";

const Stack = createNativeStackNavigator();

const StackScreen = () => {
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false
      }}
    >
      <Stack.Screen name="Home" component={HomeScreen} />
      <Stack.Screen name="Categories" component={Category} />
      <Stack.Screen name="Cart" component={CartScreen} />
      <Stack.Screen name="Print" component={PrintScreen} />

    </Stack.Navigator>
  );
};

export default StackScreen;
