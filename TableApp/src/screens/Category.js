import {
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TouchableOpacity,
  FlatList,
  Image,
  ScrollView,
  Dimensions
} from "react-native";
import React, { useState, useContext } from "react";
import * as CATEGORY from "../data/CategeoryList";
import * as MENU from "../data/ItemList";
import * as COLOR from "../components/Colors";
import Title from "../components/Title";
import DataContext from "../Global/DataContex";


const windowWidth = Dimensions.get("window").width;
const windowHeight = Dimensions.get("window").height;

const Category = ({ navigation, route }) => {
  const { setCart, cart, setCartItems, table } = useContext(DataContext);

  const [category, setCategory] = useState("All");
  const [dataList, setDataList] = useState(MENU.ItemList);

console.log(table, 'tables');
  //categories filtering method 

  const setStatusFilter = category => {
    if (category !== "All") {
      setDataList([
        ...MENU.ItemList.filter(elements => elements.Category === category)
      ]);
    } else {
      setDataList(MENU.ItemList);
    }
    setCategory(category);
  };

  // Category list render Component
  const renderCatagory = ({ item }) => {
    return (
      <TouchableOpacity
        key={item.id}
        onPress={() => setStatusFilter(item.Category)}
      >
        <View style={styles.cateContainer}>
          <Text style={styles.itemText}>
            {item.Category}
          </Text>
        </View>
      </TouchableOpacity>
    );
  };
  // Menu list render Component
  const renderItem = ({ item }) => {
    return (
      <TouchableOpacity key={item.id} onPress={() => setCart([...cart, item])}>
        <View style={styles.itemList}>
          <Text style={styles.itemText}>
            {item.name}
          </Text>
          <Text style={styles.itemText}>
            $: {item.price}
          </Text>
        </View>
      </TouchableOpacity>
    );
  };
const goToCart =() => {
  navigation.navigate("Cart");
  setCartItems(cart)
}
  return (
    <SafeAreaView>
      <View
        style={{
          flexDirection: "row",
          justifyContent: "center",
          alignItems: "center"
        }}
      >
        <Title title={"Main Category list"} />
        <Title title={table.id} />
      </View>

      <View style={styles.categoriesList}>
        <FlatList
          showsHorizontalScrollIndicator={false}
          data={CATEGORY.CategoriesList}
          keyExtractor={item => item.id}
          renderItem={renderCatagory}
          horizontal={true}
        />
      </View>
      <Title title={"Menu List"} />

      <View
        style={{
          justifyContent: "center",
          alignItems: "center",
          height: windowHeight * 0.6
        }}
      >
        <FlatList
          showsVerticalScrollIndicator={false}
          data={dataList}
          keyExtractor={item => item.id}
          renderItem={renderItem}
        />
      </View>

      <View style={styles.buttomNav}>
        <TouchableOpacity onPress={() => navigation.navigate("Home")}>
          <Image
            style={styles.imageStyle}
            source={require("../images/back.png")}
          />
        </TouchableOpacity>

        <TouchableOpacity
          onPress={goToCart}
        >
          <Image
            style={styles.imageStyle}
            source={require("../images/cart1.png")}
          />
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
};

export default Category;

const styles = StyleSheet.create({
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
  cateContainer: {
    backgroundColor: COLOR.WHITE,
    padding: 15,
    margin: 8,
    justifyContent: "center",
    alignItems: "center",
    borderRadius: 10
  },
  categoriesList: {
    backgroundColor: "gray"
  },
  buttomNav: {
    flexDirection: "row",
    justifyContent: "space-around",
    alignItems: "center",
    padding: 10
  },
  imageStyle: {
    height: 30,
    width: 30
  },
  itemText:{
    color:'#041316'
  }
});
