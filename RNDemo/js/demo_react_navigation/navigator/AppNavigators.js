import React from 'react';
import {
    createAppContainer, 
    createBottomTabNavigator,
    createStackNavigator,
    createSwitchNavigator,
} from 'react-navigation';

import WelcomePage from '../page/WelcomePage';
import PopularPage from '../page/PopularPage';
import TrendingPage from '../page/TrendingPage';
import FavoritePage from '../page/FavoritePage';
import MyPage from '../page/MyPage';
import DetailPage from '../page/DetailPage';

/**
 * createSwitchNavigator : 用于只显示一次的页面
 */
const WeclomeNavigator = createStackNavigator({
    WelcomePage: {
        screen: WelcomePage,
        navigationOptions: {
            header: null  // 隐藏导航栏
        }
    }
})

const PopularNavigator = createStackNavigator({
    PopularPage: PopularPage,
    DetailPage: DetailPage
},{
    defaultNavigationOptions: { 
        headerMode: 'none'  // 隐藏导航栏
    }
})

const MainNavigator = createBottomTabNavigator({
    Popular: PopularNavigator,
    Trending: TrendingPage,
    Favorite: FavoritePage,
    MyPage: MyPage,
}, {
    initialRouteName: 'Popular',
})

const SwitchNavigator = createSwitchNavigator({
    Welcome: WeclomeNavigator,
    Main: MainNavigator,
},{
    initialRouteName: 'Welcome',
    defaultNavigationOptions: { 
        headerMode: 'none'  // 隐藏导航栏
    }
})

const AppContainer = createAppContainer(SwitchNavigator);
export default class App extends React.Component {

    render() {
        return <AppContainer/>
    };
};