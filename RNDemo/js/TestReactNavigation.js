import React from 'react';
import {Text, View, Button, Alert} from 'react-native';
import {createStackNavigator, createAppContainer, NavigationActions, withNavigation} from 'react-navigation';

class HomeScreen extends React.Component {
  // static navigationOptions = {title : '首页'};
  static navigationOptions = {
    // title : '首页',
    headerTitle: <Text style={{color: "#fff", fontSize: 20, fontWeight: 'bold'}}>首页</Text>,
    headerRight: (
      <Button 
        onPress={() => Alert.alert( 'Alert Title', 'My Alert Msg')}
        title="弹窗"
        color="#fff"
      />
    ),
  };

  componentDidMount() {
    console.log('componentDidMount HomeScreen');
    console.log(this.props.navigation.state);
  }
  componentWillUnmount() {
    console.log('componentWillUnmount HomeScreen');
  }

  render() {
    console.log('render start');
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
        <Text>Home Screen</Text>
        <Button
          title="Go to Details"
          onPress={() => { 
            this.props.navigation.navigate('Detail', {
              itemId: 100,
              otherParam: '详情'
            })
          }}
        />
        <Button
          title="Go to My"
          onPress={() => { 
            const navigateAction = NavigationActions.navigate({
              routeName: 'My',
              params: {},
            });
            this.props.navigation.dispatch(navigateAction);
          }}
        />
      </View>
    );
  }  
}

/********* withNavigation 传递navigation到自定义组件 *********/
class MyBackButton extends React.Component {
    render() {
      return (
        <Button 
        onPress = {this._navigateBack}
        title = "自定义返回按钮"
        color = "red"
        />
      );
    }

    _navigateBack = () => { this.props.navigation.goBack(null); };
  }
  const MyBackButtonWithNavigation = withNavigation(MyBackButton);

class DetailsScreen extends React.Component {
  static navigationOptions = ({navigation, navigationOptions}) => {
    return {
      title: navigation.getParam('otherParam', '默认标题'),
      headerStyle: { backgroundColor: navigationOptions.headerTintColor},
      headerTintColor: navigationOptions.headerStyle.backgroundColor,
    };
  };

 /********* addListener - 订阅导航生命周期的更新  **********/
 _willFocus;
 _didFocus;
 _willBlur;
 _didBlur;
 componentDidMount() {
   console.log('componentDidMount DetailsScreen');
   console.log(this.props.navigation.state);

   this._willFocus = this.props.navigation.addListener('willFocus', (a) => {
       console.log('_willFocus DetailsScreen', a);
   });
   this._didFocus = this.props.navigation.addListener('didFocus', (a) => {
       console.log('_didFocus DetailsScreen', a);
   });
   this._willBlur = this.props.navigation.addListener('willBlur', (a) => {
       console.log('_willBlur DetailsScreen', a);
   });
   this._didBlur = this.props.navigation.addListener('didBlur', (a) => {
       console.log('_didBlur DetailsScreen', a);
   });
 }
 componentWillUnmount() {
   console.log('componentWillUnmount DetailsScreen');
   this._willFocus.remove();
   this._didFocus.remove();
   this._willBlur.remove();
   this._didBlur.remove();
 }

  render() {
    const { navigation } = this.props;
    const itemId = navigation.getParam('itemId', 'NO-ID');
    const otherParam = navigation.getParam('otherParam', 'default otherParam');
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
        <Text>Details Screen</Text>
        <Text>itemId: {JSON.stringify(itemId)}</Text>
        <Text>otherParam: {JSON.stringify(otherParam)}</Text>
        <Button
          title="Go to Detail again"
          onPress={() => {this.props.navigation.push('Detail')} }
        />
        <Button
          title="Back"
          onPress={() => {this.props.navigation.goBack()} }
        />
         <Button
          title="Back Home"
          onPress={() => {this.props.navigation.navigate('Home')} }
          // onPress={() => {this.props.navigation.popToTop()} }
        />
        <MyBackButtonWithNavigation />
      </View>
    );
  }  
}

class MyScreen extends React.Component {
  render() {
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
        <Text>My Screen</Text>
      </View>
    );
  }
}


const AppNavigator = createStackNavigator(
  // 路由表
  {
    Home: HomeScreen,
    Detail: DetailsScreen,
    My: MyScreen
  }, 
  // 配置
  {
    initialRouteName: 'Home',   // 初始化路由
    defaultNavigationOptions: { // 通用样式
      headerStyle: {backgroundColor: '#f4511e'},
      headerTintColor:'#fff',
      headerTitleStyle: { fontWeight: 'bold'}
    }
  }
);

const AppContainer = createAppContainer(AppNavigator);
export default class TestReactNavigation extends React.Component {
  render() {
    return <AppContainer />;
  }
}


