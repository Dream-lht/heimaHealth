@Extend(Text) function labelStyle() {
    .fontSize(18)
    .fontWeight(FontWeight.Bold)
}

@Extend(Text) function valueStyle() {
    .fontSize(18)
    .fontWeight(FontWeight.Bold)
}

@Component
struct ShowCard {

    // 组件显示
    aboutToAppear() {
    }

    build() {
        Column() {
            Row(){
                // 日期标题
                Text('2024-03-28')
                    .fontColor($r('app.color.gray'))
                Image($r('app.media.ic_public_spinner'))
                    .width(20)
                    .height(20)
                    .margin({
                        left:10
                    })
            }
            .height(30)
            //数据图表
            Swiper(){
                Row(){
                    Column(){
                        Text('饮食摄入').labelStyle()
                        Text('100').valueStyle()
                    }
                    Stack({alignContent:Alignment.Center}){
                        Progress({
                            total:2000,
                            value:89,
                            type:ProgressType.Ring
                        })
                            .width(120)
                            .style({
                                strokeWidth:10,
                            })
                            .color($r('app.color.primary_color'))
                        Column() {
                            Text('还可以吃').labelStyle()
                            Text('89').valueStyle()
                        }

                    }
                    Column(){
                        Text('运动消耗').labelStyle()
                        Text('54').valueStyle()
                    }
                }
                .justifyContent(FlexAlign.SpaceAround)
                Row(){
                    Text('2')
                }
            }
            .width('100%')
            .height(170)
            .backgroundColor('#fff')
            .borderRadius(20)
        }
        .width('100%')
        .height(200)
        .borderRadius(20)
        .backgroundColor($r('app.color.stats_title_bgc'))
    }
}

export  default  ShowCard;