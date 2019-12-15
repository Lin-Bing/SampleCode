import React from 'react';
import {StyleSheet, Text, View, Button} from 'react-native';


export default class FavoritePage extends React.Component {
    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.text}>Favorite</Text>
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