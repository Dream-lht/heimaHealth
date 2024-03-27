import UserConfirmDialog from "./components/UserConfirmDialog";
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import customPreferences from "../../utils/preferences"
import router from '@ohos.router';
@Extend(Text) function labelStyle(fontSize:number = 10,opacity:number) {
    .fontSize(fontSize)
    .fontColor($r('app.color.opacity_white_CC'))
    .opacity(opacity)
}
const PREF_KEY = 'userPrivacyKey'
@Entry
@Component
struct WelcomePage {
    // 获取当前上线文对象
    context = getContext(this) as common.UIAbilityContext;

    // 实现弹窗实例
    dialogController:CustomDialogController = new CustomDialogController({
        builder:UserConfirmDialog({
            confirm:() => this.handleConfirm(),
            cancel:() => this.handleCancel()
        })
    })

    async aboutToAppear() {
        // 获取当前用户首选项是否已经同意协议条款
        const isAgree = await customPreferences.get(PREF_KEY,false);
        console.log(JSON.stringify(isAgree));
        if(isAgree) {
            //     跳转到首页
            this.handleJump();
        }
        else {
            //     页面加载时开启弹窗
            this.dialogController.open()
        }
    }

    // 弹框确认事件
    handleConfirm() {
        // 将用户的操作存储到用户首选项当中，当用户下一次进入时，直接进入首页
        const isAgree = customPreferences.add(PREF_KEY,true);
        // 跳转到首页
        this.handleJump();
    }
    // 弹窗取消事件
    handleCancel() {
        // 直接退出程序
        this.context.terminateSelf()
    }

    // 跳转页面
    handleJump() {
        setTimeout(() => {
            router.replaceUrl({
                url:'pages/home/Index'
            })
        },1000)

    }

    build() {
        Column() {
            Row() {
                Image($r('app.media.home_slogan'))
                    .width(260)
            }.layoutWeight(1)
            Column({space:10}) {
                Image($r('app.media.home_logo'))
                    .width(150)
                Row(){
                    Text('黑马健康支持')
                        .labelStyle(14,0.8)
                    Text('IPV6')
                        .labelStyle(12,0.8)
                        .border({
                            color:'#fff',
                            width:2,
                            radius:10,
                            style:BorderStyle.Solid
                        })
                        .padding({
                            left:5,
                            right:5
                        })
                    Text('网络')
                        .labelStyle(14,0.8)
                }
                Text(`'减更多'指黑马健康App希望通过软件工具的形式，帮助更多用户实现身材管理`)
                    .labelStyle(10,0.7)
                    .labelStyle(10,0.7)
                Text('浙ICP备0000000号-36D')
                    .labelStyle(10,0.7)
            }
            .margin({
                bottom:30
            })
        }
        .width('100%')
        .height('100%')
        .backgroundColor($r('app.color.primary_color'))
    }
}