/*
 * 用户确认弹窗
 * */

@Extend(Button) function ButtonStyle(color:Resource) {
    .borderRadius(15)
    .padding({
        left:30,
        right:30
    })
    .backgroundColor(color)
}

@CustomDialog struct UserConfirmDialog {
    controller: CustomDialogController
    confirm:() => void
    cancel:() => void
    build() {
        Column() {
            Text($r('app.string.user_privacy_content'))
            .fontSize(16)
            Row({space:20}){
                Button('确认',{type:ButtonType.Normal})
                    .ButtonStyle($r('app.color.primary_color'))
                    .onClick(() => {
                        // 执行回调函数
                        this.confirm();
                        this.controller.close()
                    })
                Button('取消',{type:ButtonType.Normal})
                    .ButtonStyle($r('app.color.tab_default'))
                    .onClick(() => {
                        // 执行回调函数
                        this.cancel();
                        this.controller.close()
                    })
            }
            .margin({
                top:20
            })
        }
        .padding({
            left:20,
            right:20,
            top:20,
            bottom:20
        })
    }
}

export  default  UserConfirmDialog;