import React from 'react'
import {StyleSheet, View, Text} from 'react-native'
import Todo from './Todo'


export default class TodoList extends React.Component {
    render() {
        return (
            <View>
                {this.props.todos.map(todo => 
                    <Todo
                        key={todo.id}
                        {...todo}
                        onPress={() => this.props.toggleTodo(todo.id)}
                    />
                )}
            </View>
        )
    }
}