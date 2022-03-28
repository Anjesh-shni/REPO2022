import {StyleSheet, Text, View, Dimensions, Button} from 'react-native';
import React from 'react';
import FirstPage from './component/FirstPage';

const windowWidth = Dimensions.get('window').width;
const windowHeight = Dimensions.get('window').height;

const App = () => {
  return <View>
    <FirstPage 
    title='mero ghar jnakpur'
    label='hello first appp'
    />
  </View>
};

export default App;
