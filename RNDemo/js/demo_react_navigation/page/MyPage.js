import React from 'react';
import {StyleSheet, Text, View, Button} from 'react-native';
import TestFocus from "./TestFocus"

export default class MyPage extends React.Component {
    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.text}>My</Text>
                <TestFocus />
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1, 
        justifyContent: 'center', 
        alignItems: 'center'
    },
    text: {
        fontSize: 50,
        color: 'black'
    }
});