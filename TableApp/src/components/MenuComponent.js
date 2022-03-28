import { StyleSheet, Text, View, Dimensions } from "react-native";
import React from "react";
const windowWidth = Dimensions.get("window").width;
const windowHeight = Dimensions.get("window").height;
const MenuComponent = ({ value, price }) => {
  return (
    <View style={styles.container}>
      <Text style={styles.menuText}>
        {value}:
      </Text>
      <Text style={styles.menuText} >
        $:{price}
      </Text>
    </View>
  );
};

export default MenuComponent;

const styles = StyleSheet.create({
  container: {
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#BEE3DB",
    borderColor: "#FFD6BA",
    borderRadius: 20,
    borderWidth: 1,
    width: windowWidth/2.2,
    margin: 5
  },
  menuText: {
    // margin:10,
    paddingHorizontal:10,
    paddingVertical:6,
    fontWeight: "500",
    fontSize: 15
  }
});
