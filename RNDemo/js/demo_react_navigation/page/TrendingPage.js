import React from 'react';
import {StyleSheet, Text, View, Button} from 'react-native';


export default class TrendingPage extends React.Component {
    
    render() {
        const {navigation} = this.props;
        return (
            <View style={styles.container}>
                <Text style={styles.text}>Trending</Text>
                {/* <Button
                title="改变主题色"
                onPress={() => {
                    console.log('改变主题色');
                    navigation.setParams({theme:{
                        tintColor:'red',
                        updateTime:new Date().getTime()
                    }})
                }}
                /> */}
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