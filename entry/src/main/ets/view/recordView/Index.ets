import Header from "../../components/custonHeader/Index";
import ShowCard from "./components/showCard"

@Component
struct RecordView {

    build() {
        Column() {
            // 顶部header组件
            Header({isBack:false,title:'黑马健康'})
            // 顶部滑动框
            ShowCard()
            // 早 / 中 / 晚 食物列表
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Start)
        .backgroundColor('#f7f7f7')
    }
}

export default RecordView;