import React from 'react';
import {View, TouchableOpacity} from 'react-native';

export default class TestRender extends React.Component {
    render() {
     return  (
        <View style={{ backgroundColor: 'white', paddingTop: 64,}} testID="white">
            <View style={{ backgroundColor: "yellow",width: 50, height: 50}} testID="white-yellow"/>
            <View 
                style={{backgroundColor: 'green',width: 100, height: 100,justifyContent:"center",alignItems:"center"}} testID="white-green"
            >
                <View style={{backgroundColor: 'red', width: 50, height: 50,}} testID="white-green-red"></View>
            </View>
            <TouchableOpacity
                style={{backgroundColor: 'blue', width: 50, height: 50}}
                testID="white-blue"
                onPress={() => console.log("onPress") }
            />
        </View>
    );
    }
}

/*
export default class TestRender extends React.Component {
    render() {
      return 
        React.createElement(View, {
            style: {
                backgroundColor: 'white',
                paddingTop: 64
            },
            testID: "white"
        }, React.createElement(View, {
                style: {
                    backgroundColor: "yellow",
                    width: 50,
                    height: 50
                },
                testID: "white-yellow"
            }),
            React.createElement(View, {
                style: {
                    backgroundColor: 'green',
                    width: 100,
                    height: 100,
                    justifyContent: "center",
                    alignItems: "center"
                },
                testID: "white-green"
            }, React.createElement(View, {
                    style: {
                        backgroundColor: 'red',
                        width: 50,
                        height: 50
                    },
                    testID: "white-green-red"
                })), 
            React.createElement(TouchableOpacity, {
                style: {
                    backgroundColor: 'blue',
                    width: 50,
                    height: 50
                },
                testID: "white-blue",
                onPress: () => console.log("onPress")})
        );
    }
  }
*/


/*
{
    $$typeof: Symbol(react.element),
    type: {$$typeof: Symbol(react.forward_ref), displayName: "View",},
    props: {
        children: [
            {
                $$typeof: Symbol(react.element),
                type: {$$typeof: Symbol(react.forward_ref), displayName: "View"},
                props: {
                    style: {backgroundColor: "yellow", width: 50, height: 50},
                    testID: "white-yellow"
                },
            },
            {
                $$typeof: Symbol(react.element),
                type: {$$typeof: Symbol(react.forward_ref), displayName: "View"},
                props:{
                    children: [{
                        $$typeof: Symbol(react.element),
                        props:{
                            style: {backgroundColor: "red", width: 50, height: 50},
                            testID: "white-green-red"
                        },
                        type: {$$typeof: Symbol(react.forward_ref), displayName: "View"}
                    }],
                    style: {backgroundColor: "green", width: 100, height: 100},
                    testID: "white-green",
                },
            },
            {
                $$typeof: Symbol(react.element),
                type: {displayName: "TouchableOpacity"},
                props: {
                    style: {backgroundColor: "blue", width: 50, height: 50}, 
                    testID: "white-blue", 
                    activeOpacity: 0.2, 
                    onPress: ƒ
                },
            }
        ],
        style: {backgroundColor: "white", paddingTop: 64},
        testID: "white",
    },
}
*/