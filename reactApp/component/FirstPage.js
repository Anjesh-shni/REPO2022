import { StyleSheet, Text, View } from 'react-native'
import React from 'react'

const FirstPage = ({title, label}) => {
  return (
    <View>
      <Text>Welcome to Kathmanadu</Text>
      <Text>{title} , {label}</Text>

    </View>
  );
}

export default FirstPage

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        color: "black",
    },
      
});