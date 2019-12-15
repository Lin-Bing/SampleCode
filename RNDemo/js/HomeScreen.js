
import React from 'react';
import {StyleSheet, Text, View, Button, NativeModules} from 'react-native';
import {createStackNavigator} from 'react-navigation';

import TestNativeModule from './TestNativeModule';
import TestNativeComponent from './TestNativeComponent';


class HomeScreen extends React.Component {
  static navigationOptions = {title : '首页'};

  render() {
    return (
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Button
          title="使用原生模块"
          onPress={() => this.props.navigation.navigate('NativeModule')}
        />
        <Button
          title="使用原生组件"
          onPress={() => this.props.navigation.navigate('NativeComponent')}
        />
      </View>
    );
  }
}

const HomeStack = createStackNavigator(
  {
    Home: HomeScreen,
    NativeModule: TestNativeModule,
    NativeComponent: TestNativeComponent,
  },
  {
    initialRouteName: 'Home',
    defaultNavigationOptions: {
    headerStyle: {backgroundColor: '#f4511e'},
    headerTintColor:'#fff',
    headerTitleStyle: { fontWeight: 'bold'}
    }
  }
);
export default HomeStack;