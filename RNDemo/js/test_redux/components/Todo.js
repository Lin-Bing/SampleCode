
import React from 'react'
import {StyleSheet, View, Text} from 'react-native'

export default class Todo extends React.Component {
    render() {
        return (
            <View>
                <Text 
                    style={[styles.text, this.props.completed ? styles.completedText : {}]}
                    onPress={this.props.onPress}
                    >
                    {this.props.text}
                </Text>
            </View>
        )
    }
}

const styles = StyleSheet.create({
    text: {
        color: '#727982',
        fontWeight: 'normal',
        fontSize: 17,
        padding: 10
    },
    completedText: {
        textDecorationLine:'line-through'
    }
  });