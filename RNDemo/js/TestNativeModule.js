import React from 'react';
import {
    Text, View, Button,
    NativeModules,
    NativeEventEmitter,
} from 'react-native';
const { TestManager, EventEmitter} = NativeModules;

export default class TestNativeModule extends React.Component {
    static navigationOptions = {
        headerTitle: <Text style={{color: "#fff", fontSize: 20, fontWeight: 'bold'}}>使用原生模块</Text>,
    };
    
    constructor(props) {
        super(props);
        this.state = {
            events: [],
            becomeActiveSub: '',
            enterBackgroundSub: '',
        };
        
        this._addEvent = this._addEvent.bind(this);
        this._findEvents = this._findEvents.bind(this);
        this._findEventsWithResolver = this._findEventsWithResolver.bind(this);
    }
    
/************ 使用原生模块 ***************/
    _addEvent() {
        console.log("调用原生函数 TestManager addEvent");
        TestManager.addEvent('Birthday Party', '4 Privet Drive, Surrey', Date.now());
    }
    _findEvents() {
        TestManager.findEvents((error, events) => {
            console.log("执行回调");
            if (!error) {
                this.setState({events: events});
            }
        });
    }
    
    _findEventsWithResolver() {
        TestManager.findEventsWithResolver()
        .then((events) => {
            this.setState({events: events});
        })
        .catch((error) => {
            console.error(error);
        });
    }

    /******************** 订阅原生事件 *****************/
    componentDidMount() {
        // 使用原生注入的常量
        const becomeActive = EventEmitter.becomeActive;
        const enterBackground = EventEmitter.enterBackground;
        
        const emitter = new NativeEventEmitter(EventEmitter);
        this.becomeActiveSub = emitter.addListener(becomeActive, (userInfo) => {
            console.log('进入前台');
            console.log(userInfo);
        });
        this.enterBackgroundSub = emitter.addListener(enterBackground, (userInfo) => {
            console.log('进入后台');
            console.log(userInfo);
        });
    }
    // 取消订阅
    componentWillUnmount() {
        this.becomeActiveSub.remove();
        this.enterBackgroundSub.remove();
    }

    render() {
                
      return (
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
          <Text>使用原生组件!</Text>
          <Button 
            title='调用原生函数addEvent'
            onPress = {this._addEvent}
          />
          <Button 
            title='调用原生函数findEvents(带回调)'
            onPress = {this._findEvents}
          />
          <Button 
            title='findEventsWithResolver(返回Promise)'
            onPress = {this._findEventsWithResolver}
          />
            <Text>{this.state.events[0]}</Text>
            <Text>{this.state.events[1]}</Text>

            <Text>{TestManager.age}</Text>
            <Text>{TestManager.name}</Text>
            <Text>{TestManager.tag}</Text>
        </View>
      );
    }
  }