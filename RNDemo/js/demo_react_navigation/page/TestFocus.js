
import React from 'react';
import {StyleSheet, Text, View, Button} from 'react-native';
import { withNavigationFocus } from 'react-navigation';


class Test extends React.Component {

    render() {
        console.log("isFocused ");
        console.log(this.props.isFocused);

        return (
            <View style={{backgroundColor:"red"}}>
                <Text>isFocus</Text>
            </View>
        );
    }
}

export default withNavigationFocus(Test);