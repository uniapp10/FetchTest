
import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    Dimensions,
    FlatList,

} from 'react-native';
// import { NativeModules } from 'react-native';

import {FlatItem} from './FlatItem';

import { NativeEventEmitter, NativeModules } from 'react-native';

export default class FetchTest extends Component {
    constructor(props) {
        super(props);
        this.state = {
            data:[]
        }
    }
    // componentWillMount() {
    //     // const { CalendarManager } = NativeModules;
    //     //
    //     // const calendarManagerEmitter = new NativeEventEmitter(CalendarManager);
    //     //
    //     // const subscription = calendarManagerEmitter.addListener(
    //     //     'EventReminder',
    //     //     (reminder) => console.log(reminder.name)
    //     // );
    // }
  componentDidMount() {
      // this.loadData();
      // this.timer = setInterval(() => {
      //     // console.log("aaaaaa");
      //     this.loadData();
      // }, 2000);
  }

    componentWillUnmount() {
        this.timer && clearInterval(this.timer);
        subscription.remove();
    }

  Item = ({item}) => {
    return(
      <FlatItem item={item}/>
    );
  }

  loadData = () => {
      // this.setState({
      //     data:[]
      // });
      var LoadHttp = NativeModules.LoadHttp;
      LoadHttp.loadData((response) => {
          // console.log("****" + response);
          // console.log("****" + response.success);
          if (response.success == 1){
              //请求成功
              this.setState({data: response.value});
          }else {
              //网络请求失败
              Alert.alert("请求失败");
          }

      });
  }
  render() {
    return (
        <View>
            <View style={styles.containerView}>
                <FlatList style={styles.topFlat}
                          data={this.state.data}
                          renderItem={this.Item}
                          horizontal={true}
                          keyExtractor={(item, index) => item.code}
                          showsHorizontalScrollIndicator={false}
                          ItemSeparatorComponent = {SeparatorComponent}
                          showsVerticalScrollIndicator={false}
                />
            </View>

        </View>
    );
  }
}
 // <Button title={"loadData"} style={{marginTop:10, height: 50}} onPress={this.loadData}/>
class SeparatorComponent extends Component {
    render() {
        return (
            <View style={styles.separatorComponent}/>
        );
    }
}
const {ScreenWidth, ScreenHeight} = Dimensions.get('window');

const styles = StyleSheet.create({
  containerView: {
    height: 90,
    width:ScreenWidth,
    backgroundColor:'azure',
  },
  topFlat: {
    height: 90,
    width:ScreenWidth,
  },
    separatorComponent:{
        backgroundColor:'aliceblue',
        width:2,
        height:90,
    }
});
AppRegistry.registerComponent('FetchTest', () => FetchTest);

