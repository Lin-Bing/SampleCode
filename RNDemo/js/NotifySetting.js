

import React from 'react';
import {StyleSheet, Text, View, Button, NativeModules} from 'react-native';
import {createStackNavigator} from 'react-navigation';

export default class NotifySetting extends React.Component {
    static navigationOptions = {title : '我的'};

    render() {
        return (
            <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
            <Text>通知设置</Text>
          </View>
        );
    }
}