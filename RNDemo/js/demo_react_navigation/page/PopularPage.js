import React from 'react';
import {StyleSheet, Text, View} from 'react-native';
import {createMaterialTopTabNavigator, createAppContainer} from 'react-navigation'


class PopularTab extends React.Component {
    componentDidMount() {
        console.log('componentDidMount PopularTab');
        console.log(this.props.navigation.state);
    }
    
    render () {
        return (
            <View style={styles.container}>
                <Text style={styles.text}>{this.props.tabLabel}</Text>
                <Text style={{fontSize: 20, color: 'black'}}>{this.props.index}</Text>
            </View>
        );
    }
}

export default class PopularPage extends React.Component {
    static navigationOptions = {
        title: '最热'
    };

    constructor(props) {
        super(props);
        this.tabTitles = ['Java', 'Object-C', 'Python', 'Swift', 'JavaScript', 'C', 'C++', 'React', 'React Native'];
    }

    _getTabs() {
        const tabs = {};
        this.tabTitles.forEach((item,index) => {
            tabs[`Tab${index}`] = {
                screen: (props) => <PopularTab {...props} index={index} tabLabel={item}/>,
                navigationOptions: {
                   title: item 
                }
            }
        });
        return tabs;
    }

    componentDidMount() {
        console.log('componentDidMount PopularPage');
        console.log(this.props.navigation.state);
    }

    render() {
        const TopTabNavigator = createMaterialTopTabNavigator(
            this._getTabs(),
            {
                tabBarOptions: {
                    style: { backgroundColor: '#678',},
                    tabStyle: styles.tabStyle,
                    indicatorStyle: styles.indicatorStyle,
                    labelStyle: styles.labelStyle,
                    upperCaseLabel: false,
                    scrollEnabled: true,
                }
            }
        );
        const TopTabNavigatorContainer = createAppContainer(TopTabNavigator);

        return (
            <View style={{flex:1}}>
                <TopTabNavigatorContainer/>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1, 
        justifyContent: 'center', 
        alignItems: 'center',
        backgroundColor: 'lightgray'
    },
    text: {
        fontSize: 50,
        color: 'black',
        backgroundColor: 'yellow'
    },
    toDetail: {
        fontSize: 30,
        color: 'black',
        backgroundColor: 'lightgray'
    },
    tab: {
        flex: 1, 
        justifyContent: 'center', 
        alignItems: 'center',
        backgroundColor: 'red'
    },
    tabStyle:{
        minWidth: 50,
    },
    indicatorStyle: {
        height: 2,
        backgroundColor: 'white',
    },
    labelStyle: {
        fontSize: 13,
        marginTop: 6,
        marginBottom: 6,
    }
});