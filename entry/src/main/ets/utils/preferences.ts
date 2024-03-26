import preferences from '@ohos.data.preferences';

class CustomPreferences {
  private preferencesInstance:preferences.Preferences;
  // 创建实例
  createPreferences(context:any) {
    // 获取首选项实例
    preferences.getPreferences(context,'appStore',(err, preferences) => {
      if(err) {
        console.log(err.message);
        return;
      }
      console.log('初始化',JSON.stringify(preferences));
      this.preferencesInstance = preferences;
    })
  }

  // 添加
  add(key:string,value:preferences.ValueType) {
    try{
      this.preferencesInstance.put(key,value)
      // 数据持久化
      this.preferencesInstance.flush();
    }
    catch(err) {
      console.log(JSON.stringify(err));
    }

  }
  // 删除
  delete(key:string) {
    try{
      this.preferencesInstance.delete(key);
    }
    catch (err) {
      console.log(JSON.stringify(err));
    }

  }
  // 查询
  async get(key:string,defaultValue:preferences.ValueType) {
      try{
        let val = await this.preferencesInstance.get(key,defaultValue);
        return val;
      }catch (err){

      }
  }
}

const customPreferences:CustomPreferences = new CustomPreferences();

export  default  customPreferences;