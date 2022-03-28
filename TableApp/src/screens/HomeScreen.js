import {
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TouchableOpacity,
  FlatList,
  Image,
  VirtualizedList,
  ScrollView
} from "react-native";
import React, { useContext } from "react";
import * as COLOR from "../components/Colors";
import Title from "../components/Title";
import * as TABLE from "../data/TablesList";

import DataContext from "../Global/DataContex";

const HomeScreen = ({ navigation }) => {
  const { setTable, table, setTableNumber } = useContext(DataContext);

  const setTableId = () => {
    setTableNumber(table);
    navigation.navigate("Categories");
  };

  return (
    <SafeAreaView>
      <View style={styles.container}>
        <View
          style={{
            flexDirection: "row",
            justifyContent: "space-between",
            alignItems: "center",
            width: "95%",
            marginVertical: 10,
            paddingHorizontal: 29,
            backgroundColor: COLOR.BUTTON_BACKGROUND,
            borderRadius: 10
          }}
        >
          <Title title={"List of Tables"} />

          <TouchableOpacity onPress={setTableId}>
            <Image
              style={styles.imageStyle}
              source={require("../images/cart1.png")}
            />
          </TouchableOpacity>
        </View>

        <FlatList
          data={TABLE.TablesList}
          numColumns={3}
          showsVerticalScrollIndicator={false}
          horizontal={false}
          keyExtractor={item => item.id}
          renderItem={({ item }) =>
            <TouchableOpacity onPress={() => setTable([...table, item])}>
              <View
                style={[
                  styles.tableView,
                  table === item.title && styles.tableViewActive
                ]}
              >
                <Text style={styles.tableText}>
                  {item.title}
                </Text>
              </View>
            </TouchableOpacity>}
        />
      </View>
    </SafeAreaView>
  );
};

export default HomeScreen;

const styles = StyleSheet.create({
  container: {
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: COLOR.HOME_BACKGROUND,
    height: "100%"
  },
  tableView: {
    backgroundColor: COLOR.TABLE_BACKGROUND1,
    margin: 8,
    height: 100,
    width: 100,
    borderRadius: 40,
    justifyContent: "center",
    alignItems: "center",
    borderColor: COLOR.BorderClo,
    borderWidth: 2,
    shadowColor: COLOR.SHADOWCOLOR,
    shadowOpacity: 0.3,
    shadowOffset: { width: 2, height: 4 },
    shadowRadius: 3
  },
  tableViewActive: {
    backgroundColor: COLOR.TABLE_BACKGROUND2,
    margin: 8,
    height: 100,
    width: 100,
    borderRadius: 40,
    justifyContent: "center",
    alignItems: "center",
    borderColor: COLOR.BorderClo,
    borderWidth: 2,
    shadowColor: COLOR.SHADOWCOLOR,
    shadowOpacity: 0.3,
    shadowOffset: { width: 2, height: 4 },
    shadowRadius: 3
  },
  imageStyle: {
    height: 30,
    width: 30
  },
  tableText: {
    color: COLOR.TABLE_TEXT,
    fontSize: 18,
    fontWeight: "500"
  }
});
