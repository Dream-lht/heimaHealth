/*
 * 自定义日历组件
 * 时间范围： 当前月前后两个月
 */

class Day {
    public week:string;
    public year:number;
    public month:number;
    public days:number;

    constructor(week:string,year:number,month:number,days:number) {
        this.week = week;
        this.year = year;
        this.month = month;
        this.days = days;
    }
}

@Extend(Text) function weekLabelStyle() {
    .fontSize(18)
}

@Preview
@Component
struct CustomCalendar {
    // @Link show:boolean
    // 当前时间
    private time:Date = new Date();
    private weeks = ['一','二','三','四','五','六','日']

    private days:Array<Day | null> = [];

    aboutToAppear() {
        // 获取当前年份
        let year = this.time.getFullYear();
        // 获取当前月份
        let  month = this.time.getMonth();
        // 获取当前月1号周几
        let day = new Date(`${year}-${month + 1}-1`).getDay();
        // 获取当前月份总天数
        let totalDays = this.getMonthDays(month);
        console.log(day.toString(),totalDays.toString());

        // 构造日期数据
        for(let i = 1; i < totalDays + day; i++) {
            if(i >= day) {
                this.days.push(new Day(this.weeks[(i - 1) % 7],year,month + 1,i - day + 1));
            } else {
                // 1号之前的日期使用null代替
                this.days.push(null);
            }
        }

        console.log(JSON.stringify(this.days));


    }

    /*
     * 获取月份总天数
     * */
    getMonthDays(month:number):number {
        const date = new Date();
        date.setMonth(month + 1);
        date.setDate(0);
        return date.getDate();
    }

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
                }.width('100%')
                .height(50)
                .justifyContent(FlexAlign.SpaceAround)
                .shadow({
                    offsetX:5,
                    offsetY:5,
                    color:'#ccc',
                    radius:10
                })

                Grid(){
                    ForEach(this.days,(dayItem:Day | null) => {
                        GridItem(){
                            if(dayItem) {
                                Text(dayItem.days.toString())
                            }
                        }
                        .onHover(() => {
                            console.log('888');
                        })

                    })
                }
                .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
                .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
                .width('100%')
                .height(450)

            }
        }
        .width('100%')
        .halfHeight(500)
        .backgroundColor('#fff')
    }
}

export default CustomCalendar;