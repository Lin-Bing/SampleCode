
import React from 'react';
import {StyleSheet, Text, View, Button, NativeModules} from 'react-native';
import {createStackNavigator} from 'react-navigation';
import NotifySetting from './NotifySetting';

class MyScreen extends React.Component {
  static navigationOptions = {title : '我的'};

  _pushSetting() {
    const {RouterHepler} = NativeModules;
    RouterHepler.pushPage(RouterHepler.Setting, {});
  }
  _pushMyCollection() {
    const {RouterHepler} = NativeModules;
    RouterHepler.pushPage(RouterHepler.MyCollection, {});
  }
  _pushOrder() {
    const {RouterHepler} = NativeModules;
    RouterHepler.pushPage(RouterHepler.Order, {type:666});
  }

  render() {
    return (
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Text>RN跳转原生</Text>
        <Button
          title="设置"
          onPress={this._pushSetting}
        />
        <Button
          title="我的收藏"
          onPress={this._pushMyCollection}
        />
        <Button
          title="订单"
          onPress={this._pushOrder}
        />
      </View>
    );
  }
}

const MyStack = createStackNavigator(
  {
    My: MyScreen,
    NotifySetting: NotifySetting,
  },
  {
    initialRouteName: 'My',
    defaultNavigationOptions: {
      headerStyle: {backgroundColor: '#f4511e'},
      headerTintColor:'#fff',
      headerTitleStyle: {fontWeight: 'bold'}
    }
  }
);
export default MyStack;