import router from '@ohos.router';
@Component struct Header {
    @Prop title:string;
    @Prop isBack:boolean;
    back?: () => void
    build() {
        Row() {
            if(this.isBack) {
                // 返回图标
                Image($r('app.media.back'))
                    .height(24)
                    .position({
                        x:15,
                        y:13
                    })
                    .onClick(() => {
                        // 执行back回调函数
                        this.back();
                    })
            }
            // 标题
            Text(this.title).fontSize(20).fontWeight(FontWeight.Bold).fontColor($r('app.color.primary_color'))
        }.width('100%').height(50).backgroundColor('#fff').justifyContent(FlexAlign.Center)
    }
}

export  default  Header;