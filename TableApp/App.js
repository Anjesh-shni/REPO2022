import * as React from "react";
import { NavigationContainer } from "@react-navigation/native";
import StackScreen from "./src/stackNavigation/StackScreen";
import { DataProvider } from "./src/Global/DataContex";

const App = () => {
  return (
    <DataProvider>
      <NavigationContainer>
        <StackScreen />
      </NavigationContainer>
    </DataProvider>
  );
};

export default App;
