import React from 'react';
import {StyleSheet, Text, View, Button} from 'react-native';


export default class WelcomePage extends React.Component {

    componentDidMount() {
        this.timer = setTimeout(() => {
            const {navigation} = this.props;
            navigation.navigate('Main');
        }, 2000);
    }
    componentWillUnmount() {
        this.timer && clearTimeout(this.timer);
    }

    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.text}>Welcome</Text>
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