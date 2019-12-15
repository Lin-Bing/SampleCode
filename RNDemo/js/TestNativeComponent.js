
import React from 'react';
import {
    Text, View, WebView,
    requireNativeComponent, 
} from 'react-native';
import PropTypes from 'prop-types';


const MapView = requireNativeComponent('MapView', null);

MapView.PropTypes = {
    // 是否允许缩放
    zoomEnabled: PropTypes.bool,

    // 地图要显示的区域。
    region: PropTypes.shape({
        // 地图中心点的坐标
        latitude: PropTypes.number.isRequired,
        longitude: PropTypes.number.isRequired,
        // 最小/最大经、纬度间的距离。
        latitudeDelta: PropTypes.number.isRequired,
        longitudeDelta: PropTypes.number.isRequired,
    }),

    // 地图显示区域变化回调
    onRegionChange: PropTypes.func,
};


export default class TestNativeComponent extends React.Component {
    static navigationOptions = {
        headerTitle: <Text style={{color: "#fff", fontSize: 20, fontWeight: 'bold'}}>使用原生组件</Text>,
    };

    constructor(props){
        super(props);
        this.state = {
            region: {
                latitude: 23.6566981005,
                longitude: 116.6229466330,
                latitudeDelta: 0.1,
                longitudeDelta: 0.1,
            }
        };
        this._onRegionChange = this._onRegionChange.bind(this);
        this.mapViewRef = React.createRef();
    }
    
    _onRegionChange(event) {
        console.log(event.nativeEvent);
    }

    render() {
        return (
            // <MapView 
            //     ref = {this.mapViewRef}
            //     style = {{ flex: 1 }}
            //     zoomEnabled = {true}
            //     region = {this.state.region}
            //     onRegionChange = {this._onRegionChange}
            // />

            <WebView 
                source={{uri: 'https://www.baidu.com'}}
                style={{flex:1}}
                useWebKit={true}
            />
        );
    }
}



