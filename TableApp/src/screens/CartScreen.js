import {
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  Image,
  TouchableOpacity,
  Dimensions,
  FlatList
} from "react-native";
import React, { useContext } from "react";
import Title from "../components/Title";
import * as COLOR from "../components/Colors";
import DataContext from "../Global/DataContex";

const windowWidth = Dimensions.get("window").width;
const windowHeight = Dimensions.get("window").height;

const CartScreen = ({ navigation, route }) => {
  const { table, cart,  completeTask } = useContext(DataContext);

  // console.log(JSON.stringify(cart), "from cart page");
  console.log(cart, "form cart page 1");


 

  const renderItem = ({ item }) => {
    return (
      <View style={styles.itemList}>
        <View style={{justifyContent:'space-between', alignItems:'center', flexDirection:'row', width:'90%'}}>
        <Text style={styles.itemText}>
          {item.name}
        </Text>
        <Text  style={styles.itemText}>
          $: {item.price}
        </Text>
        </View>
       
        <TouchableOpacity key={item} onPress={()=> completeTask(item)} >
          <Image
            style={{ height: 30, width: 30 }}
            source={require("../images/delete.png")}
          />
        </TouchableOpacity>
      </View>
    );
  };

  return (
    <SafeAreaView>
      <View style={styles.container}>
        <TouchableOpacity onPress={() => navigation.navigate("Categories")}>
          <Image
            style={styles.imageStyle}
            source={require("../images/back.png")}
          />
        </TouchableOpacity>

        <Title title={"Cart"} />
        {/* <Title title={table} /> */}
      </View>
      <View
        style={{
          justifyContent: "flex-start",
          alignItems: "center",
          height: windowHeight * 0.8
        }}
      >
        <FlatList
          data={cart}
          keyExtractor={item => item}
          renderItem={renderItem}
        />
      </View>
    </SafeAreaView>
  );
};

export default CartScreen;

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    justifyContent: "space-around",
    alignItems: "center"
  },
  imageStyle: {
    height: 30,
    width: 30
  },
  itemList: {
    flexDirection: "row",
    width: windowWidth * 0.8,
    backgroundColor: COLOR.WHITE,
    padding: 14,
    margin: 4,
    borderRadius: 12,
    justifyContent: "space-between",
    alignItems: "center",
    borderColor: COLOR.BORDER_COLOR,
    borderWidth: 1
  },
  itemText:{
    color:'#041316'
  }
});
