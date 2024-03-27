import RecordPage from "../../view/recordView/Index";

@Entry
@Component
struct Home {
  @State currentIndex:number = 0;

  @Builder customTabBarBtn(title:string,index:number,activeImage:Resource,defaultImage:Resource) {
    Column() {
      Image(this.imageSelector(index,activeImage,defaultImage))
      .width(20)
      .margin({
        bottom:2
      })
      if(this.currentIndex === index) {
        // 选中状态
        Text(title).fontColor($r('app.color.primary_color'));
      }
      else {
        Text(title).fontColor('#8a8a8a');
      }
    }
  }

  /*
   * 处理tabBar改变
   * */
  handleTabBarChange(index:number) {
    console.log(index.toString());
    this.currentIndex = index;
  }

  /*
   * 图片选择器
   * */
  imageSelector(index:number,activeImage:Resource,defaultImage:Resource):Resource {
    return this.currentIndex === index ? activeImage : defaultImage;
  }

  build() {
    Column() {
      Tabs({barPosition:BarPosition.End}) {
        TabContent(){
          RecordPage();
        }.tabBar(this.customTabBarBtn('记录',0,$r('app.media.record_active'),$r('app.media.record')));
        TabContent(){
          Text('发现');
        }.tabBar(this.customTabBarBtn('发现',1,$r('app.media.discover_active'),$r('app.media.discover')))
        TabContent(){
          Text('我的');
        }.tabBar(this.customTabBarBtn('我的',2,$r('app.media.my_active'),$r('app.media.my')))
      }.onChange(this.handleTabBarChange.bind(this))
    }
    .height('100%')
  }
}