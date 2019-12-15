
import React from 'react'
import { StyleSheet, View, Text, TextInput, Button} from 'react-native'
import { connect } from 'react-redux'

export default class AddTodo extends React.Component {
    render() {
        return (
            <View>
                <TextInput
                    onChangeText
                />
                <Button
                />
            </View>
        )
    }
}