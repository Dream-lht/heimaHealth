/*
 * 自定义日历组件
 * 时间范围： 当前月前后两个月
 */

@Extend(Text) function weekLabelStyle() {
    .fontSize(18)
    .padding({
        top:6,
        bottom:6
    })
}

@Preview
@Component
struct CustomCalendar {
    // @Link show:boolean
    private weeks = ['日','一','二','三','四','五','六']

    build() {
        Panel(true) {
            Column() {
                Row() {
                    ForEach(this.weeks,(weekItem:string) => {
                        if(weekItem === '日' || weekItem === '六') {
                            Text(weekItem).weekLabelStyle().fontColor($r('app.color.primary_color'))
                        } else {
                            Text(weekItem).weekLabelStyle()
                        }
                    })
                }.width('100%').justifyContent(FlexAlign.SpaceAround).shadow({
                    offsetX:5,
                    offsetY:5,
                    color:'#ccc',
                    radius:10
                })

            }
        }
        .width('100%')
        .halfHeight(500)
        .backgroundColor('#fff')
    }
}

export default CustomCalendar;