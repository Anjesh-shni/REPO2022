import { StyleSheet, Text, View, SafeAreaView, TouchableOpacity } from 'react-native'
import React from 'react'

const PrintScreen = ({navigation, route}) => {
  const { printList: item } = route.params;
  return (
    <SafeAreaView>
 <View>
      <Text>PrintScreen</Text>

      <TouchableOpacity onPress={()=>navigation.navigate("Home")}>
        <Text>
          press me to go home 
        </Text>
      </TouchableOpacity>
    </View>
    </SafeAreaView>
   
  )
}

export default PrintScreen

const styles = StyleSheet.create({})