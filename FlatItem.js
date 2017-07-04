/**
 * Created by zhudong on 2017/6/24.
 */
import React, {Component} from 'react';
import {View,
    Text,
    StyleSheet,
    Dimensions,
    TouchableOpacity,
    NativeModules,
} from 'react-native';
import {ScreenWidth, ScreenHeight} from './ScreenUnit';


export default class FlatItem extends Component {

    click = () => {
        let Navigate = NativeModules.Navigate;
        Navigate.push(this.props.item);
    }

    dealIncreasePoint = (item) => {
        let point = item.last - item.lastclose;
        let pointPercent = (item.last - item.lastclose) * 100 / item.lastclose;
        let pointStr;
        let pointPercentStr;
        let str;
        if (point > 0){
            currentColor = upperColor;
            //金,保留2位
            if(item.code.toString() == "LLG") {
                pointStr = '+' + point.toFixed(2);
                pointPercentStr = '+' + pointPercent.toFixed(2) + '%';
            }else if(item.code.toString() == "LLS"){
                //银,保留3位
                pointStr = '+' + point.toFixed(3);
                pointPercentStr = '+' + pointPercent.toFixed(3) + '%';
            }else {
                //美元指数,保留4位
                pointStr = '+' + point.toFixed(4);
                pointPercentStr = '+' + pointPercent.toFixed(4) + '%';
            }

        }else if(point < 0){
            currentColor = lowerColor;
            //金,保留2位
            if(item.code.toString() == "LLG") {
                pointStr = point.toFixed(2);
                pointPercentStr = pointPercent.toFixed(2) + '%';
            }else if(item.code.toString() == "LLS"){
                //银,保留3位
                pointStr = point.toFixed(3);
                pointPercentStr = pointPercent.toFixed(3) + '%';
            }else {
                //美元指数,保留4位
                pointStr = point.toFixed(4);
                pointPercentStr = pointPercent.toFixed(4) + '%';
            }
        }else {
            currentColor = item.lastColor;
        }
        item.lasColor = currentColor;

        return {pointString: pointStr, percentString: pointPercentStr};
    }

    dealBottomColor = (item) => {
        let point = item.last - item.lastclose;
        if (point > 0) {
            currentColor = upperColor;
        }else if(point < 0) {
            currentColor = lowerColor;
        }else {
            currentColor = item.lastColor;
        }
        item.lasColor = currentColor;
        return currentColor;
    }
    constructor(props){
        super(props);

    }
    render(){
        return(
            <TouchableOpacity onPress={this.click}>
                <View style={styles.item}>
                    <Text>
                        {this.props.item.name}
                    </Text>
                    <Text style={{color:this.dealBottomColor(this.props.item), marginTop: 5}}>
                        {this.props.item.last}
                    </Text>
                    <View flexDirection="row">
                        <Text style= {{color:this.dealBottomColor(this.props.item), padding:5}}>
                            {this.dealIncreasePoint(this.props.item).pointString}
                        </Text>
                        <Text style= {{color:this.dealBottomColor(this.props.item), padding:5}}>
                            {this.dealIncreasePoint(this.props.item).percentString}
                        </Text>
                    </View>
                </View>
            </TouchableOpacity>

        );
    };
}

let upperColor = '#F56262';
let lowerColor = '#00B876';
let currentColor;
const styles = StyleSheet.create({
    item: {width: ScreenWidth / 3.0, height: 90,
        alignItems:'center',justifyContent:'center'},
});
