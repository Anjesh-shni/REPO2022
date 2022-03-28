import React from "react";
import {
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  Dimensions,
  ActivityIndicator
} from "react-native";
import * as COLOR from "./Colors";
import Spacer from "./Spacer";

const windowWidth = Dimensions.get("window").width;
const windowHeight = Dimensions.get("window").height;

const ButtonComponent = ({ label, onPress }) => {
  return (
    <TouchableOpacity onPress={onPress} style={styles.button}>
      <Text style={styles.txt}>
        {label}
      </Text>
    </TouchableOpacity>
  );
};

export default ButtonComponent;

const styles = StyleSheet.create({
  button: {
    backgroundColor: COLOR.BUTTON_BACKGROUND,
    shadowColor: COLOR.SHADOWCOLOR,
    shadowOpacity: 0.3,
    shadowOffset: { width: 2, height: 4 },
    shadowRadius: 3,
    padding: 20,
    borderRadius: 15,
    alignItems: "center",
    height:60
  },
  txt: {
    fontSize: 18,
    fontWeight: "500",
    color: COLOR.WHITE,
    shadowColor: COLOR.BUTTON_TEXT
  }
});
