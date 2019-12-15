import React from 'react';
import {Button, Platform} from 'react-native'

import {
    createAppContainer, 
    createBottomTabNavigator,
} from 'react-navigation';
import {BottomTabBar} from '../../../node_modules/react-navigation-tabs/src/views/BottomTabBar'

import PopularPage from '../page/PopularPage';
import TrendingPage from '../page/TrendingPage';
import FavoritePage from '../page/FavoritePage';
import MyPage from '../page/MyPage';

const TABs = {
    Popular: {
        screen: PopularPage,
        navigationOptions: {
            tabBarLabel: '最热',
        }
    },
    Trending: {
        screen: TrendingPage,
        navigationOptions: {
            tabBarLabel: '趋势',
        }
    },
    Favorite: {
        screen: FavoritePage,
        navigationOptions: {
            tabBarLabel: '收藏',
        }
    },
    My: {
        screen: MyPage,
        navigationOptions: {
            tabBarLabel: '我的',
        }
    }
}

class DynamicTabNavigators extends React.Component {
    constructor(props) {
        super(props);
        console.disableYellowBox = true;
    }
    
    // 动态配置TABs
    _tabNavigator() {
        if (this.Tabs) {
            return this.Tabs;
        }

        // 动态配置Tab
        let {Popular, Trending, Favorite, My} = TABs;
        let tabs = {Popular, Trending, My};
        // 动态修改tabBarLabel
        Popular.navigationOptions.tabBarLabel = '最火';

        const BottomTabBar = createBottomTabNavigator(tabs, {
            tabBarOptions: {
                activeTintColor: Platform.OS === 'ios' ? 'blue' : 'red'
            }
        });

        this.Tabs = createAppContainer(BottomTabBar);
        return this.Tabs;
    }
    render() {
        const Tabs = this._tabNavigator();
        return <Tabs
        onNavigationStateChange={(prevState, newState, action) => {
            console.log('Tabs onNavigationStateChange');
            console.log(prevState);
            console.log(newState);
            console.log(action);
        }}
        />
    }
}

export  {DynamicTabNavigators as AppContainerDynamic}
