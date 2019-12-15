/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React from 'react';
import {
  createBottomTabNavigator,
  createAppContainer,
} from 'react-navigation';
import MyStack  from './js/MyScreen';
import HomeStack from './js/HomeScreen';

const TabNavigator = createBottomTabNavigator(
  {
    首页: HomeStack,
    我的: MyStack,
  },
  {
    tabBarOptions: {
      activeTintColor: 'tomato',
      inactiveTintColor: 'gray',
    },
  }
);

const AppContainer = createAppContainer(TabNavigator);

export default class Main extends React.Component {
  render() {
    return <AppContainer />;
  }
}