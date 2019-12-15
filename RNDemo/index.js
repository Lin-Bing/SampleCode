/** @format */

import {AppRegistry} from 'react-native';
import Main from './Main';
import NotifySetting from './js/NotifySetting';
import TestRender from './js/test_render/TestRender'
import AppNavigators from './js/demo_react_navigation/navigator/AppNavigators'
import {AppContainerDynamic} from './js/demo_react_navigation/navigator/DynamicTabNavigators'
import TestReactNavigation from './js/TestReactNavigation'



AppRegistry.registerComponent('Main', () => Main);
AppRegistry.registerComponent('ReactNavigationDemo',()=>  AppContainerDynamic);
AppRegistry.registerComponent('NotifySetting', () => NotifySetting);
AppRegistry.registerComponent('TestRender', () => TestRender);
